-------------------------------------------------------------------------------
--                                                                           --
--                                   Giza                                    --
--                                                                           --
--         Copyright (C) 2015 Fabien Chouteau (chouteau@adacore.com)         --
--                                                                           --
--                                                                           --
--    Giza is free software: you can redistribute it and/or modify it        --
--    under the terms of the GNU General Public License as published by      --
--    the Free Software Foundation, either version 3 of the License, or      --
--    (at your option) any later version.                                    --
--                                                                           --
--    Giza is distributed in the hope that it will be useful, but WITHOUT    --
--    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY     --
--    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public        --
--    License for more details.                                              --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with Giza. If not, see <http://www.gnu.org/licenses/>.           --
--                                                                           --
-------------------------------------------------------------------------------

package body Giza.Widgets.Button is

   ----------------------
   -- On_Builtin_Event --
   ----------------------

   overriding procedure On_Builtin_Event
     (This : in out Gbutton;
      Evt : Event_Not_Null_Access)
   is
   begin
      if Evt.all in Click_Event then
         declare
            Click : constant Click_Event_Access := Click_Event_Access (Evt);
         begin
            if Click.CType = Click_Press
              or else
                (Click.CType = Click_Release and then not This.Is_Toggle)
            then
               This.Is_Active := not This.Is_Active;
               This.Invert_Colors;
               This.Set_Dirty (True);
            end if;
         end;
      end if;
   end On_Builtin_Event;

   ------------
   -- Active --
   ------------

   function Active (This : Gbutton) return Boolean is (This.Is_Active);

   ----------------
   -- Set_Active --
   ----------------

   procedure Set_Active (This : in out Gbutton; Active : Boolean) is
   begin
      This.Is_Active := Active;
   end Set_Active;

   ----------------
   -- Set_Toggle --
   ----------------

   procedure Set_Toggle (This : in out Gbutton; Toggle : Boolean) is
   begin
      This.Is_Toggle := Toggle;
   end Set_Toggle;

end Giza.Widgets.Button;