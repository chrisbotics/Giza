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

package body Giza.Widgets.Scrolling is

   ---------------
   -- Set_Dirty --
   ---------------

   procedure Set_Dirty (This : in out Gscroll;
                        Dirty : Boolean := True)
   is
   begin
      This.Up.Set_Dirty (Dirty);
      This.Down.Set_Dirty (Dirty);
      if This.Child /= null then
         This.Child.Set_Dirty (Dirty);
      end if;
   end Set_Dirty;

   ----------
   -- Draw --
   ----------

   procedure Draw (This : in out Gscroll;
                   Ctx : in out Context'Class;
                   Force : Boolean := True)
   is
   begin
      if not This.Dirty and then not Force then
         return;
      end if;

      if This.Child /= null then
         Ctx.Save;
         Ctx.Translate (This.Child_Pos);
         This.Child.Draw (Ctx);
         Ctx.Restore;

         if This.Child_Pos.Y < 0 then
            Ctx.Save;
            This.Up.Draw (Ctx, True);
            Ctx.Restore;
         end if;

         if This.Child_Pos.Y > -(This.Child.Size.H - This.Get_Size.H) then
            Ctx.Save;
            Ctx.Translate ((0, This.Get_Size.H - This.Down.Get_Size.H));
            This.Down.Draw (Ctx, True);
            Ctx.Restore;
         end if;
      end if;
   end Draw;

   --------------
   -- On_Click --
   --------------

   function On_Click
     (This  : in out Gscroll;
      Pos   : Point_T;
      CType : Click_Type) return Boolean
   is
   begin
      if This.Child /= null then
         if This.Child_Pos.Y < 0
           and then
            Pos.Y < This.Up.Get_Size.H
         then
            if This.Up.On_Click (Pos, CType) and then This.Up.Active then
               This.Child_Pos := This.Child_Pos + (0, 5);
               return True;
            end if;

         elsif This.Child_Pos.Y > -(This.Child.Size.H - This.Get_Size.H)
           and then
            Pos.Y > This.Get_Size.H - This.Up.Get_Size.H
         then
            if This.Down.On_Click
              (Pos - (0, This.Get_Size.H - This.Up.Get_Size.H), CType) and then
              This.Down.Active
            then
               This.Child_Pos := This.Child_Pos - (0, 5);
               return True;
            end if;
         else
            return This.Child.On_Click (Pos + This.Child_Pos, CType);
         end if;
      end if;
      return False;
   end On_Click;

   ---------------
   -- Set_Child --
   ---------------

   procedure Set_Child (This : in out Gscroll; Child : not null Widget_Ref) is
   begin
      This.Child := Child;

      This.Up.Set_Size ((This.Get_Size.W, This.Get_Size.H / 10));
      This.Down.Set_Size ((This.Get_Size.W, This.Get_Size.H / 10));
   end Set_Child;

end Giza.Widgets.Scrolling;