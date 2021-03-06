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

package Giza.Colors is

   type RGB_Component is new Natural range 0 .. 255;

   type Color is record
      R, G, B : RGB_Component := 0;
   end record with Pack;

   function Dark_Red            return Color is ((139, 000, 000));
   function Brown               return Color is ((165, 042, 042));
   function Firebrick           return Color is ((178, 034, 034));
   function Crimson             return Color is ((220, 020, 060));
   function Red                 return Color is ((255, 000, 000));
   function Tomato              return Color is ((255, 099, 071));
   function Coral               return Color is ((255, 127, 080));
   function Indian_Red          return Color is ((205, 092, 092));
   function Light_Coral         return Color is ((240, 128, 128));
   function Dark_Salmon         return Color is ((233, 150, 122));
   function Salmon              return Color is ((250, 128, 114));
   function Light_Salmon        return Color is ((255, 160, 122));
   function Orange_Red          return Color is ((255, 069, 000));
   function Dark_Orange         return Color is ((255, 140, 000));
   function Orange              return Color is ((255, 165, 000));
   function Gold                return Color is ((255, 215, 000));
   function Dark_Golden_Rod     return Color is ((184, 134, 011));
   function Golden_Rod          return Color is ((218, 165, 032));
   function Pale_Golden_Rod     return Color is ((238, 232, 170));
   function Dark_Khaki          return Color is ((189, 183, 107));
   function Khaki               return Color is ((240, 230, 140));
   function Olive               return Color is ((128, 128, 000));
   function Yellow              return Color is ((255, 255, 000));
   function Yellow_Green        return Color is ((154, 205, 050));
   function Dark_Olive_Green    return Color is ((085, 107, 047));
   function Olive_Drab          return Color is ((107, 142, 035));
   function Lawn_Green          return Color is ((124, 252, 000));
   function Chart_Reuse         return Color is ((127, 255, 000));
   function Green_Yellow        return Color is ((173, 255, 047));
   function Dark_Green          return Color is ((000, 100, 000));
   function Green               return Color is ((000, 128, 000));
   function Maroon              return Color is ((128, 000, 000));
   function Forest_Green        return Color is ((034, 139, 034));
   function Lime                return Color is ((000, 255, 000));
   function Lime_Green          return Color is ((050, 205, 050));
   function Light_Green         return Color is ((144, 238, 144));
   function Pale_Green          return Color is ((152, 251, 152));
   function Dark_Sea_Green      return Color is ((143, 188, 143));
   function Medium_Spring_Green return Color is ((000, 250, 154));
   function Spring_Green        return Color is ((000, 255, 127));
   function Sea_Green           return Color is ((046, 139, 087));
   function Medium_Aqua_Marine  return Color is ((102, 205, 170));
   function Medium_Sea_Green    return Color is ((060, 179, 113));
   function Light_Sea_Green     return Color is ((032, 178, 170));
   function Dark_Slate_Gray     return Color is ((047, 079, 079));
   function Teal                return Color is ((000, 128, 128));
   function Dark_Cyan           return Color is ((000, 139, 139));
   function Aqua                return Color is ((000, 255, 255));
   function Cyan                return Color is ((000, 255, 255));
   function Light_Cyan          return Color is ((224, 255, 255));
   function Dark_Turquoise      return Color is ((000, 206, 209));
   function Turquoise           return Color is ((064, 224, 208));
   function Medium_Turquoise    return Color is ((072, 209, 204));
   function Pale_Turquoise      return Color is ((175, 238, 238));
   function Aqua_Marine         return Color is ((127, 255, 212));
   function Powder_Blue         return Color is ((176, 224, 230));
   function Cadet_Blue          return Color is ((095, 158, 160));
   function Steel_Blue          return Color is ((070, 130, 180));
   function Corn_Flower_Blue    return Color is ((100, 149, 237));
   function Deep_Sky_Blue       return Color is ((000, 191, 255));
   function Dodger_Blue         return Color is ((030, 144, 255));
   function Light_Blue          return Color is ((173, 216, 230));
   function Sky_Blue            return Color is ((135, 206, 235));
   function Light_Sky_Blue      return Color is ((135, 206, 250));
   function Midnight_Blue       return Color is ((025, 025, 112));
   function Navy                return Color is ((000, 000, 128));
   function Dark_Blue           return Color is ((000, 000, 139));
   function Medium_Blue         return Color is ((000, 000, 205));
   function Blue                return Color is ((000, 000, 255));
   function Royal_Blue          return Color is ((065, 105, 225));
   function Blue_Violet         return Color is ((138, 043, 226));
   function Indigo              return Color is ((075, 000, 130));
   function Dark_Slate_Blue     return Color is ((072, 061, 139));
   function Slate_Blue          return Color is ((106, 090, 205));
   function Medium_Slate_Blue   return Color is ((123, 104, 238));
   function Medium_Purple       return Color is ((147, 112, 219));
   function Dark_Magenta        return Color is ((139, 000, 139));
   function Dark_Violet         return Color is ((148, 000, 211));
   function Dark_Orchid         return Color is ((153, 050, 204));
   function Medium_Orchid       return Color is ((186, 085, 211));
   function Purple              return Color is ((128, 000, 128));
   function Thistle             return Color is ((216, 191, 216));
   function Plum                return Color is ((221, 160, 221));
   function Violet              return Color is ((238, 130, 238));
   function Magenta             return Color is ((255, 000, 255));
   function Orchid              return Color is ((218, 112, 214));
   function Medium_Violet_Red   return Color is ((199, 021, 133));
   function Pale_Violet_Red     return Color is ((219, 112, 147));
   function Deep_Pink           return Color is ((255, 020, 147));
   function Hot_Pink            return Color is ((255, 105, 180));
   function Light_Pink          return Color is ((255, 182, 193));
   function Pink                return Color is ((255, 192, 203));
   function Antique_White       return Color is ((250, 235, 215));
   function Beige               return Color is ((245, 245, 220));
   function Bisque              return Color is ((255, 228, 196));
   function Blanched_Almond     return Color is ((255, 235, 205));
   function Wheat               return Color is ((245, 222, 179));
   function Corn_Silk           return Color is ((255, 248, 220));
   function Lemon_Chiffon       return Color is ((255, 250, 205));
   function Light_Yellow        return Color is ((255, 255, 224));
   function Saddle_Brown        return Color is ((139, 069, 019));
   function Sienna              return Color is ((160, 082, 045));
   function Chocolate           return Color is ((210, 105, 030));
   function Peru                return Color is ((205, 133, 063));
   function Sandy_Brown         return Color is ((244, 164, 096));
   function Burly_Wood          return Color is ((222, 184, 135));
   function Tan                 return Color is ((210, 180, 140));
   function Rosy_Brown          return Color is ((188, 143, 143));
   function Moccasin            return Color is ((255, 228, 181));
   function Navajo_White        return Color is ((255, 222, 173));
   function Peach_Puff          return Color is ((255, 218, 185));
   function Misty_Rose          return Color is ((255, 228, 225));
   function Lavender_Blush      return Color is ((255, 240, 245));
   function Linen               return Color is ((250, 240, 230));
   function Old_Lace            return Color is ((253, 245, 230));
   function Papaya_Whip         return Color is ((255, 239, 213));
   function Sea_Shell           return Color is ((255, 245, 238));
   function Mint_Cream          return Color is ((245, 255, 250));
   function Slate_Gray          return Color is ((112, 128, 144));
   function Light_Slate_Gray    return Color is ((119, 136, 153));
   function Light_Steel_Blue    return Color is ((176, 196, 222));
   function Lavender            return Color is ((230, 230, 250));
   function Floral_White        return Color is ((255, 250, 240));
   function Alice_Blue          return Color is ((240, 248, 255));
   function Ghost_White         return Color is ((248, 248, 255));
   function Honeydew            return Color is ((240, 255, 240));
   function Ivory               return Color is ((255, 255, 240));
   function Azure               return Color is ((240, 255, 255));
   function Snow                return Color is ((255, 250, 250));
   function Black               return Color is ((000, 000, 000));
   function Dim_Grey            return Color is ((105, 105, 105));
   function Grey                return Color is ((128, 128, 128));
   function Dark_Grey           return Color is ((169, 169, 169));
   function Silver              return Color is ((192, 192, 192));
   function Light_Grey          return Color is ((211, 211, 211));
   function Gainsboro           return Color is ((220, 220, 220));
   function White_Smoke         return Color is ((245, 245, 245));
   function White               return Color is ((255, 255, 255));
end Giza.Colors;
