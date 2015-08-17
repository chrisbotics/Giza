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

with Giza.Widgets.Text; use Giza.Widgets.Text;

package Giza.Widgets.Button is

   type Gbutton is new Gtext with private;

   overriding
   procedure On_Builtin_Event
     (This : in out Gbutton;
      Evt : Event_Not_Null_Access);

   function Active (This : Gbutton) return Boolean;

   procedure Set_Active (This : in out Gbutton; Active : Boolean);
   procedure Set_Toggle (This : in out Gbutton; Toggle : Boolean);

private
   type Gbutton is new Gtext with record
      Is_Active : Boolean := False;
      Is_Toggle : Boolean := False;
   end record;
end Giza.Widgets.Button;