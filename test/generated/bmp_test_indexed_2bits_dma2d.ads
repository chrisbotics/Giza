--  This file was generated by bmp2ada
with Giza.Image;
with Giza.Image.DMA2D;
use Giza.Image.DMA2D;

package bmp_test_indexed_2bits_dma2d is
   pragma Style_Checks (Off);

   CLUT : aliased constant L4_CLUT_T := (
(R => 4, G => 13, B => 0),
(R => 238, G => 40, B => 16),
(R => 106, G => 61, B => 227),
(R => 92, G => 249, B => 42), others => (0, 0, 0));

   Data : aliased constant L4_Data_T := (
 17, 17, 17, 17, 17, 17, 17, 17, 51, 51, 51, 51, 51, 51, 51, 51, 51, 35, 34, 34, 34, 34, 34, 34, 34, 17, 17, 17, 17, 17, 17, 17, 17, 51, 51, 51, 51, 51, 51, 51, 51, 51, 35, 34, 34, 34, 34, 34, 34, 34,
 17, 17, 17, 17, 17, 17, 17, 17, 51, 51, 51, 51, 51, 51, 51, 51, 51, 35, 34, 34, 34, 34, 34, 34, 34, 17, 0, 0, 0, 0, 17, 17, 17, 51, 51, 51, 3, 0, 0, 48, 51, 51, 35, 0, 0, 0, 0, 32, 34, 34,
 17, 0, 0, 0, 0, 0, 17, 17, 51, 51, 0, 0, 0, 0, 0, 0, 51, 35, 0, 0, 0, 0, 0, 32, 34, 17, 0, 17, 17, 17, 0, 17, 17, 51, 3, 0, 51, 51, 51, 3, 0, 51, 35, 0, 34, 34, 34, 2, 0, 34,
 17, 0, 17, 17, 17, 1, 16, 17, 51, 0, 48, 51, 51, 51, 51, 3, 51, 35, 0, 34, 34, 34, 34, 0, 34, 17, 0, 17, 17, 17, 1, 16, 17, 51, 0, 51, 51, 51, 51, 51, 51, 51, 35, 0, 34, 34, 34, 34, 0, 34,
 17, 0, 17, 17, 17, 1, 16, 17, 51, 48, 51, 51, 51, 51, 51, 51, 51, 35, 0, 34, 34, 34, 34, 32, 34, 17, 0, 17, 17, 17, 1, 17, 17, 3, 48, 51, 51, 51, 51, 51, 51, 51, 35, 0, 34, 34, 34, 2, 32, 34,
 17, 0, 17, 17, 17, 0, 17, 17, 3, 48, 51, 51, 51, 51, 51, 51, 51, 35, 0, 0, 0, 0, 0, 34, 34, 17, 0, 0, 0, 0, 16, 17, 17, 3, 48, 51, 51, 3, 0, 0, 0, 51, 35, 0, 0, 0, 0, 0, 32, 34,
 17, 0, 0, 0, 0, 17, 17, 17, 3, 48, 51, 51, 3, 0, 0, 0, 51, 35, 0, 34, 34, 34, 34, 0, 34, 17, 0, 17, 17, 0, 17, 17, 17, 3, 48, 51, 51, 51, 51, 51, 0, 51, 35, 0, 34, 34, 34, 34, 2, 32,
 17, 0, 17, 17, 1, 16, 17, 17, 51, 0, 51, 51, 51, 51, 51, 0, 51, 35, 0, 34, 34, 34, 34, 2, 32, 17, 0, 17, 17, 17, 0, 17, 17, 51, 0, 51, 51, 51, 51, 51, 0, 51, 35, 0, 34, 34, 34, 34, 2, 32,
 17, 0, 17, 17, 17, 1, 16, 17, 51, 0, 48, 51, 51, 51, 51, 0, 51, 35, 0, 34, 34, 34, 34, 2, 32, 17, 0, 17, 17, 17, 17, 0, 17, 51, 3, 0, 48, 51, 51, 3, 0, 51, 35, 0, 34, 34, 34, 34, 0, 34,
 17, 0, 17, 17, 17, 17, 0, 16, 51, 51, 0, 0, 0, 0, 0, 0, 51, 35, 0, 0, 0, 0, 0, 32, 34, 17, 0, 17, 17, 17, 17, 1, 16, 51, 51, 51, 3, 0, 0, 48, 51, 51, 35, 0, 0, 0, 0, 32, 34, 34,
 17, 17, 17, 17, 17, 17, 17, 17, 51, 51, 51, 51, 51, 51, 51, 51, 51, 35, 34, 34, 34, 34, 34, 34, 34, 17, 17, 17, 17, 17, 17, 17, 17, 51, 51, 51, 51, 51, 51, 51, 51, 51, 35, 34, 34, 34, 34, 34, 34, 34,
 17, 17, 17, 0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 48, 51, 51, 51, 51, 51, 51, 51, 51, 17, 17, 17, 0, 0, 34, 34, 34, 2, 0, 0, 34, 34, 34, 34, 0, 0, 0, 0, 0, 48, 51, 51, 51, 51,
 17, 17, 17, 0, 0, 34, 34, 0, 0, 0, 0, 0, 34, 34, 2, 0, 0, 0, 0, 0, 0, 48, 51, 51, 51, 17, 17, 17, 34, 34, 34, 34, 0, 0, 0, 0, 0, 32, 34, 2, 0, 0, 0, 0, 0, 0, 0, 51, 51, 51,
 17, 17, 33, 34, 34, 34, 34, 0, 34, 34, 2, 0, 0, 34, 0, 0, 0, 51, 51, 3, 0, 0, 51, 51, 51, 17, 17, 33, 0, 0, 34, 34, 32, 34, 34, 34, 0, 0, 34, 0, 0, 0, 51, 51, 51, 0, 0, 51, 51, 51,
 17, 17, 34, 0, 0, 34, 34, 34, 34, 34, 34, 0, 0, 2, 0, 0, 0, 51, 51, 51, 0, 0, 51, 51, 51, 17, 33, 34, 0, 0, 34, 34, 34, 34, 34, 34, 0, 0, 2, 48, 0, 0, 51, 51, 3, 0, 48, 51, 51, 51,
 17, 33, 34, 0, 0, 34, 34, 34, 34, 34, 2, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 51, 51, 51, 51, 17, 34, 34, 0, 0, 34, 34, 34, 34, 34, 2, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 48, 51, 51, 51,
 17, 34, 34, 0, 0, 34, 34, 34, 34, 34, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 0, 51, 51, 51, 33, 34, 34, 0, 0, 34, 34, 34, 34, 2, 0, 0, 0, 48, 51, 0, 0, 51, 51, 51, 0, 0, 48, 51, 51,
 33, 34, 34, 0, 0, 34, 34, 34, 34, 0, 0, 32, 0, 48, 51, 0, 0, 51, 51, 51, 3, 0, 48, 51, 51, 34, 34, 34, 0, 0, 34, 34, 34, 2, 0, 0, 2, 0, 51, 51, 0, 0, 51, 51, 51, 3, 0, 48, 51, 51,
 34, 34, 34, 0, 0, 34, 34, 2, 0, 0, 34, 2, 48, 51, 51, 0, 0, 51, 51, 51, 0, 0, 48, 51, 19, 34, 34, 34, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 48, 51, 0, 0, 0, 0, 0, 0, 0, 51, 51, 19,
 34, 34, 34, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 48, 51, 0, 0, 0, 0, 0, 0, 48, 51, 51, 17, 34, 34, 34, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 48, 51, 0, 0, 0, 0, 0, 48, 51, 51, 51, 17,
 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 48, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 19, 17, 34, 0, 0, 32, 34, 34, 0, 34, 34, 2, 0, 48, 3, 0, 51, 51, 3, 0, 0, 51, 3, 0, 0, 16, 17,
 34, 0, 34, 2, 32, 34, 0, 34, 34, 0, 0, 51, 3, 0, 51, 51, 0, 51, 3, 48, 3, 48, 19, 0, 17, 34, 0, 34, 34, 32, 34, 32, 32, 34, 0, 48, 51, 0, 0, 48, 51, 51, 51, 3, 48, 3, 48, 51, 1, 16,
 34, 0, 34, 34, 0, 34, 32, 0, 2, 0, 48, 51, 0, 3, 48, 51, 51, 51, 3, 48, 3, 48, 19, 1, 16, 34, 0, 34, 34, 0, 34, 32, 0, 0, 0, 48, 51, 0, 3, 48, 51, 51, 51, 0, 51, 3, 48, 17, 1, 16,
 34, 0, 34, 34, 0, 34, 32, 0, 0, 0, 48, 3, 0, 3, 48, 51, 51, 3, 48, 51, 3, 48, 17, 1, 16, 34, 0, 34, 34, 32, 34, 32, 2, 0, 0, 48, 3, 0, 0, 0, 51, 51, 0, 51, 51, 3, 16, 17, 1, 17,
 34, 0, 34, 2, 32, 34, 32, 34, 0, 0, 48, 3, 48, 51, 0, 51, 3, 48, 51, 51, 3, 16, 17, 0, 17, 34, 0, 0, 32, 34, 34, 32, 2, 0, 3, 48, 3, 48, 51, 0, 51, 0, 0, 0, 48, 3, 0, 0, 17, 17
);
   Image : constant Giza.Image.Ref :=     new Giza.Image.DMA2D.Instance'
     (Mode => L4, W => 50, H => 50, Length => 1250, L4_CLUT => CLUT'Access, L4_Data => Data'Access);
   pragma Style_Checks (On);
end bmp_test_indexed_2bits_dma2d;
