/* Copyright 2017 Rafał Jopek ( rafaljopek at hotmail com ) */

/* Screensaver */

#include "setcurs.ch"

PROCEDURE Main()

   LOCAL nOldCursor := SetCursor( SC_NONE )
   LOCAL aScreensaver := ss_new()
   LOCAL nSeconds := Seconds()

   DO WHILE .T.

      DispBegin()

      IF Seconds() - nSeconds > 10
         hb_Scroll()
         nSeconds := Seconds()
      ENDIF

      ss_show( aScreenSaver )

      DispEnd()

      IF Inkey( 0.1 ) != 0
         EXIT
      ENDIF
   ENDDO

   SetCursor( nOldCursor )

   RETURN

STATIC FUNCTION ss_new()

   LOCAL a := Array( 100 ), e

   FOR EACH e IN a
      e := { hb_randInt( 0, MaxRow() ), hb_randInt( 0, MaxCol() ), hb_randInt( 1, 15 ) }
   NEXT

   RETURN a

STATIC PROCEDURE ss_show( a )

   LOCAL s := "☺☻♥♦♣♠•◘○◙♂♀♪♫☼►◄↕‼¶§▬↨↑↓→←∟↔▲▼!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~⌂ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥₧ƒáíóúñÑªº¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■" + hb_UChar( 34 )
   LOCAL e

   hb_AIns( a, 1, { 0, hb_randInt( 0, MaxCol() ), hb_randInt( 1, 15 ) }, .T. )

   FOR EACH e IN a
      hb_DispOutAtBox( e[ 1 ], e[ 2 ], hb_UTF8ToStr( hb_USubStr( s, hb_randInt( 1, hb_ULen( s ) ), 1 ) ), e[ 3 ] )
      hb_Scroll( e[ 1 ] - 20, e[ 2 ], e[ 1 ] - 20, e[ 2 ] )
      ++e[ 1 ]
   NEXT

   hb_ADel( a, Len( a ), .T. )

   RETURN