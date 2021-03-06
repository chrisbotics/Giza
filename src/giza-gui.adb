------------------------------------------------------------------------------
--                                                                          --
--                                   Giza                                   --
--                                                                          --
--         Copyright (C) 2015 Fabien Chouteau (chouteau@adacore.com)        --
--                                                                          --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Unchecked_Deallocation;
with System;

package body Giza.GUI is

   Buffer_Capacity : constant Natural := 100;
   type Event_Buffer is array (1 .. Buffer_Capacity) of Event_Ref;

   type Wrapper;
   type Wrapper_Ref is access all Wrapper;

   type Wrapper is record
      Win  : not null Giza.Window.Ref;
      Next : Wrapper_Ref := null;
   end record;

   procedure Free is new Ada.Unchecked_Deallocation (Wrapper, Wrapper_Ref);
   procedure Redraw;

   Drawing_Context : Context.Ref := null;
   Drawing_Backend : Backend.Ref := null;

   --  Window stack
   Stack : Wrapper_Ref := null;

   ------------
   -- Redraw --
   ------------

   procedure Redraw is
      Swap : Boolean;
   begin
      if Drawing_Backend /= null then
         Swap := Drawing_Backend.Has_Double_Buffring;
         Stack.Win.Draw (Drawing_Context.all, Force => Swap);
         Drawing_Context.Reset;
         if Swap then
            Drawing_Backend.Swap_Buffers;
         end if;
      end if;
   end Redraw;

   ----------
   -- Push --
   ----------

   procedure Push (Win : not null Giza.Window.Ref) is
   begin

      if Stack /= null then
         Stack.Win.On_Hidden;
      end if;

      Stack := new Wrapper'(Win => Win,
                            Next => Stack);

      Win.Set_Size (Drawing_Backend.Size);

      Win.Set_Dirty;

      Win.On_Pushed;

      if Drawing_Context /= null then
         Redraw;
      end if;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop is
      Tmp : Wrapper_Ref := Stack;
   begin
      if Tmp /= null then
         Tmp.Win.On_Hidden;
         Stack := Tmp.Next;
         Free (Tmp);

         if Stack /= null then
            Stack.Win.On_Displayed;
            Stack.Win.Set_Dirty;
         end if;
      end if;
   end Pop;

   -----------------
   -- Set_Context --
   -----------------

   procedure Set_Context (Ctx : Context.Ref) is
   begin
      Drawing_Context := Ctx;
      if Drawing_Context /= null then
         Drawing_Context.Set_Backend (Drawing_Backend);
      end if;
   end Set_Context;

   -----------------
   -- Set_Backend --
   -----------------

   procedure Set_Backend (Bck : Backend.Ref) is

   begin
      Drawing_Backend := Bck;
      if Drawing_Context /= null then
         Drawing_Context.Set_Backend (Bck);
      end if;
   end Set_Backend;

   ----------------
   -- Event_Sync --
   ----------------

   protected Event_Sync is
      pragma Priority (System.Interrupt_Priority'Last);

      entry Wait_For_Event (Evt : out Event_Ref);
      procedure Emit (Evt : Event_Not_Null_Ref);
   private
      Has_Event : Boolean := False;
      Buffer    : Event_Buffer;
      Next_In   : Positive := 1;
      Next_Out  : Positive := 1;
      Count     : Natural  := 0;
   end Event_Sync;

   ----------------
   -- Event_Sync --
   ----------------

   protected body Event_Sync is

      --------------------
      -- Wait_For_Event --
      --------------------

      entry Wait_For_Event (Evt : out Event_Ref) when Has_Event is
      begin
         Evt :=  Buffer (Next_Out);
         Next_Out := (Next_Out mod Buffer_Capacity) + 1;
         Count := Count - 1;
         Has_Event := Count /= 0;
      end Wait_For_Event;

      ----------
      -- Emit --
      ----------

      procedure Emit (Evt : Event_Not_Null_Ref) is
      begin
         if Count < Buffer_Capacity then
            Buffer (Next_In) := Event_Ref (Evt);
            Next_In := (Next_In mod Buffer_Capacity) + 1;
            Count := Count + 1;
            Has_Event := True;
         else
            --  For the moment, events are just discarded when the buffer is
            --  full.
            null;
         end if;
      end Emit;
   end Event_Sync;

   ----------
   -- Emit --
   ----------

   procedure Emit (Evt : Event_Not_Null_Ref) is
   begin
      Event_Sync.Emit (Evt);
   end Emit;

   ----------------
   -- Event_Loop --
   ----------------

   procedure Event_Loop is
      Event : Event_Ref;
      Event_Handled : Boolean;
   begin
      loop
         Event_Sync.Wait_For_Event (Event);
         if Event /= null and then Stack /= null then
            if Event.all in Timer_Event'Class then
               Event_Handled :=
                 Timer_Event'Class (Event.all).Triggered;
            elsif Event.all in Position_Event'Class then
               declare
                  P_Evt : constant Position_Event_Ref :=
                    Position_Event_Ref (Event);
               begin
                  Event_Handled :=
                    Stack.Win.On_Position_Event (P_Evt, P_Evt.Pos);
               end;
            elsif Event.all in Redraw_Event'Class then
               Event_Handled := True;
            else
               Event_Handled :=
                 Stack.Win.On_Event (Event_Not_Null_Ref (Event));
            end if;
         end if;

         if Stack /= null
           and then
            Drawing_Context /= null
           and then
            Event_Handled
         then
            Redraw;
         end if;
      end loop;
   end Event_Loop;
end Giza.GUI;
