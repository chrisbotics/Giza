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

package body Giza.Widgets.Background is

   ----------
   -- Draw --
   ----------

   overriding procedure Draw
     (This : in out Gbackground;
      Ctx : in out Context'Class;
      Force : Boolean := True)
   is
   begin
      if This.Is_Dirty or else Force then
         Ctx.Set_Color (This.BG);
         Ctx.Fill_Rectangle (((0, 0), This.Get_Size));
         This.Set_Dirty (False);
      end if;
   end Draw;

   --------------------
   -- Set_Background --
   --------------------

   procedure Set_Background (This : in out Gbackground; BG : Color) is
   begin
      This.BG := BG;
   end Set_Background;

   ----------------
   -- Background --
   ----------------

   function Background (This : Gbackground) return Color is (This.BG);

end Giza.Widgets.Background;
