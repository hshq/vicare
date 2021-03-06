;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare
;;;Contents: tests
;;;Date: Tue Oct 18, 2011
;;;
;;;Abstract
;;;
;;;	Tests from  the file "scheme/tests/case-folding.ss"  file in the
;;;	original Ikarus distribution.
;;;
;;;Copyright (C) 2006-2010 Abdulaziz Ghuloum <aghuloum@cs.indiana.edu>
;;;Modified by Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under the terms of the  GNU General Public License as published by
;;;the Free Software Foundation, either version 3 of the License, or (at
;;;your option) any later version.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received  a copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;

#!ikarus
(import (ikarus)
  (vicare checks))

(define case-fold-mapping
  '((#\x0041 #\x0061)
    (#\x0042 #\x0062)
    (#\x0043 #\x0063)
    (#\x0044 #\x0064)
    (#\x0045 #\x0065)
    (#\x0046 #\x0066)
    (#\x0047 #\x0067)
    (#\x0048 #\x0068)
    (#\x0049 #\x0069)
    (#\x004A #\x006A)
    (#\x004B #\x006B)
    (#\x004C #\x006C)
    (#\x004D #\x006D)
    (#\x004E #\x006E)
    (#\x004F #\x006F)
    (#\x0050 #\x0070)
    (#\x0051 #\x0071)
    (#\x0052 #\x0072)
    (#\x0053 #\x0073)
    (#\x0054 #\x0074)
    (#\x0055 #\x0075)
    (#\x0056 #\x0076)
    (#\x0057 #\x0077)
    (#\x0058 #\x0078)
    (#\x0059 #\x0079)
    (#\x005A #\x007A)
    (#\x00B5 #\x03BC)
    (#\x00C0 #\x00E0)
    (#\x00C1 #\x00E1)
    (#\x00C2 #\x00E2)
    (#\x00C3 #\x00E3)
    (#\x00C4 #\x00E4)
    (#\x00C5 #\x00E5)
    (#\x00C6 #\x00E6)
    (#\x00C7 #\x00E7)
    (#\x00C8 #\x00E8)
    (#\x00C9 #\x00E9)
    (#\x00CA #\x00EA)
    (#\x00CB #\x00EB)
    (#\x00CC #\x00EC)
    (#\x00CD #\x00ED)
    (#\x00CE #\x00EE)
    (#\x00CF #\x00EF)
    (#\x00D0 #\x00F0)
    (#\x00D1 #\x00F1)
    (#\x00D2 #\x00F2)
    (#\x00D3 #\x00F3)
    (#\x00D4 #\x00F4)
    (#\x00D5 #\x00F5)
    (#\x00D6 #\x00F6)
    (#\x00D8 #\x00F8)
    (#\x00D9 #\x00F9)
    (#\x00DA #\x00FA)
    (#\x00DB #\x00FB)
    (#\x00DC #\x00FC)
    (#\x00DD #\x00FD)
    (#\x00DE #\x00FE)
    (#\x00DF #\x0073 #\x0073)
    (#\x0100 #\x0101)
    (#\x0102 #\x0103)
    (#\x0104 #\x0105)
    (#\x0106 #\x0107)
    (#\x0108 #\x0109)
    (#\x010A #\x010B)
    (#\x010C #\x010D)
    (#\x010E #\x010F)
    (#\x0110 #\x0111)
    (#\x0112 #\x0113)
    (#\x0114 #\x0115)
    (#\x0116 #\x0117)
    (#\x0118 #\x0119)
    (#\x011A #\x011B)
    (#\x011C #\x011D)
    (#\x011E #\x011F)
    (#\x0120 #\x0121)
    (#\x0122 #\x0123)
    (#\x0124 #\x0125)
    (#\x0126 #\x0127)
    (#\x0128 #\x0129)
    (#\x012A #\x012B)
    (#\x012C #\x012D)
    (#\x012E #\x012F)
    (#\x0130 #\x0069 #\x0307)
    (#\x0132 #\x0133)
    (#\x0134 #\x0135)
    (#\x0136 #\x0137)
    (#\x0139 #\x013A)
    (#\x013B #\x013C)
    (#\x013D #\x013E)
    (#\x013F #\x0140)
    (#\x0141 #\x0142)
    (#\x0143 #\x0144)
    (#\x0145 #\x0146)
    (#\x0147 #\x0148)
    (#\x0149 #\x02BC #\x006E)
    (#\x014A #\x014B)
    (#\x014C #\x014D)
    (#\x014E #\x014F)
    (#\x0150 #\x0151)
    (#\x0152 #\x0153)
    (#\x0154 #\x0155)
    (#\x0156 #\x0157)
    (#\x0158 #\x0159)
    (#\x015A #\x015B)
    (#\x015C #\x015D)
    (#\x015E #\x015F)
    (#\x0160 #\x0161)
    (#\x0162 #\x0163)
    (#\x0164 #\x0165)
    (#\x0166 #\x0167)
    (#\x0168 #\x0169)
    (#\x016A #\x016B)
    (#\x016C #\x016D)
    (#\x016E #\x016F)
    (#\x0170 #\x0171)
    (#\x0172 #\x0173)
    (#\x0174 #\x0175)
    (#\x0176 #\x0177)
    (#\x0178 #\x00FF)
    (#\x0179 #\x017A)
    (#\x017B #\x017C)
    (#\x017D #\x017E)
    (#\x017F #\x0073)
    (#\x0181 #\x0253)
    (#\x0182 #\x0183)
    (#\x0184 #\x0185)
    (#\x0186 #\x0254)
    (#\x0187 #\x0188)
    (#\x0189 #\x0256)
    (#\x018A #\x0257)
    (#\x018B #\x018C)
    (#\x018E #\x01DD)
    (#\x018F #\x0259)
    (#\x0190 #\x025B)
    (#\x0191 #\x0192)
    (#\x0193 #\x0260)
    (#\x0194 #\x0263)
    (#\x0196 #\x0269)
    (#\x0197 #\x0268)
    (#\x0198 #\x0199)
    (#\x019C #\x026F)
    (#\x019D #\x0272)
    (#\x019F #\x0275)
    (#\x01A0 #\x01A1)
    (#\x01A2 #\x01A3)
    (#\x01A4 #\x01A5)
    (#\x01A6 #\x0280)
    (#\x01A7 #\x01A8)
    (#\x01A9 #\x0283)
    (#\x01AC #\x01AD)
    (#\x01AE #\x0288)
    (#\x01AF #\x01B0)
    (#\x01B1 #\x028A)
    (#\x01B2 #\x028B)
    (#\x01B3 #\x01B4)
    (#\x01B5 #\x01B6)
    (#\x01B7 #\x0292)
    (#\x01B8 #\x01B9)
    (#\x01BC #\x01BD)
    (#\x01C4 #\x01C6)
    (#\x01C5 #\x01C6)
    (#\x01C7 #\x01C9)
    (#\x01C8 #\x01C9)
    (#\x01CA #\x01CC)
    (#\x01CB #\x01CC)
    (#\x01CD #\x01CE)
    (#\x01CF #\x01D0)
    (#\x01D1 #\x01D2)
    (#\x01D3 #\x01D4)
    (#\x01D5 #\x01D6)
    (#\x01D7 #\x01D8)
    (#\x01D9 #\x01DA)
    (#\x01DB #\x01DC)
    (#\x01DE #\x01DF)
    (#\x01E0 #\x01E1)
    (#\x01E2 #\x01E3)
    (#\x01E4 #\x01E5)
    (#\x01E6 #\x01E7)
    (#\x01E8 #\x01E9)
    (#\x01EA #\x01EB)
    (#\x01EC #\x01ED)
    (#\x01EE #\x01EF)
    (#\x01F0 #\x006A #\x030C)
    (#\x01F1 #\x01F3)
    (#\x01F2 #\x01F3)
    (#\x01F4 #\x01F5)
    (#\x01F6 #\x0195)
    (#\x01F7 #\x01BF)
    (#\x01F8 #\x01F9)
    (#\x01FA #\x01FB)
    (#\x01FC #\x01FD)
    (#\x01FE #\x01FF)
    (#\x0200 #\x0201)
    (#\x0202 #\x0203)
    (#\x0204 #\x0205)
    (#\x0206 #\x0207)
    (#\x0208 #\x0209)
    (#\x020A #\x020B)
    (#\x020C #\x020D)
    (#\x020E #\x020F)
    (#\x0210 #\x0211)
    (#\x0212 #\x0213)
    (#\x0214 #\x0215)
    (#\x0216 #\x0217)
    (#\x0218 #\x0219)
    (#\x021A #\x021B)
    (#\x021C #\x021D)
    (#\x021E #\x021F)
    (#\x0220 #\x019E)
    (#\x0222 #\x0223)
    (#\x0224 #\x0225)
    (#\x0226 #\x0227)
    (#\x0228 #\x0229)
    (#\x022A #\x022B)
    (#\x022C #\x022D)
    (#\x022E #\x022F)
    (#\x0230 #\x0231)
    (#\x0232 #\x0233)
    (#\x023A #\x2C65)
    (#\x023B #\x023C)
    (#\x023D #\x019A)
    (#\x023E #\x2C66)
    (#\x0241 #\x0242)
    (#\x0243 #\x0180)
    (#\x0244 #\x0289)
    (#\x0245 #\x028C)
    (#\x0246 #\x0247)
    (#\x0248 #\x0249)
    (#\x024A #\x024B)
    (#\x024C #\x024D)
    (#\x024E #\x024F)
    (#\x0345 #\x03B9)
    (#\x0386 #\x03AC)
    (#\x0388 #\x03AD)
    (#\x0389 #\x03AE)
    (#\x038A #\x03AF)
    (#\x038C #\x03CC)
    (#\x038E #\x03CD)
    (#\x038F #\x03CE)
    (#\x0390 #\x03B9 #\x0308 #\x0301)
    (#\x0391 #\x03B1)
    (#\x0392 #\x03B2)
    (#\x0393 #\x03B3)
    (#\x0394 #\x03B4)
    (#\x0395 #\x03B5)
    (#\x0396 #\x03B6)
    (#\x0397 #\x03B7)
    (#\x0398 #\x03B8)
    (#\x0399 #\x03B9)
    (#\x039A #\x03BA)
    (#\x039B #\x03BB)
    (#\x039C #\x03BC)
    (#\x039D #\x03BD)
    (#\x039E #\x03BE)
    (#\x039F #\x03BF)
    (#\x03A0 #\x03C0)
    (#\x03A1 #\x03C1)
    (#\x03A3 #\x03C3)
    (#\x03A4 #\x03C4)
    (#\x03A5 #\x03C5)
    (#\x03A6 #\x03C6)
    (#\x03A7 #\x03C7)
    (#\x03A8 #\x03C8)
    (#\x03A9 #\x03C9)
    (#\x03AA #\x03CA)
    (#\x03AB #\x03CB)
    (#\x03B0 #\x03C5 #\x0308 #\x0301)
    (#\x03C2 #\x03C3)
    (#\x03D0 #\x03B2)
    (#\x03D1 #\x03B8)
    (#\x03D5 #\x03C6)
    (#\x03D6 #\x03C0)
    (#\x03D8 #\x03D9)
    (#\x03DA #\x03DB)
    (#\x03DC #\x03DD)
    (#\x03DE #\x03DF)
    (#\x03E0 #\x03E1)
    (#\x03E2 #\x03E3)
    (#\x03E4 #\x03E5)
    (#\x03E6 #\x03E7)
    (#\x03E8 #\x03E9)
    (#\x03EA #\x03EB)
    (#\x03EC #\x03ED)
    (#\x03EE #\x03EF)
    (#\x03F0 #\x03BA)
    (#\x03F1 #\x03C1)
    (#\x03F4 #\x03B8)
    (#\x03F5 #\x03B5)
    (#\x03F7 #\x03F8)
    (#\x03F9 #\x03F2)
    (#\x03FA #\x03FB)
    (#\x03FD #\x037B)
    (#\x03FE #\x037C)
    (#\x03FF #\x037D)
    (#\x0400 #\x0450)
    (#\x0401 #\x0451)
    (#\x0402 #\x0452)
    (#\x0403 #\x0453)
    (#\x0404 #\x0454)
    (#\x0405 #\x0455)
    (#\x0406 #\x0456)
    (#\x0407 #\x0457)
    (#\x0408 #\x0458)
    (#\x0409 #\x0459)
    (#\x040A #\x045A)
    (#\x040B #\x045B)
    (#\x040C #\x045C)
    (#\x040D #\x045D)
    (#\x040E #\x045E)
    (#\x040F #\x045F)
    (#\x0410 #\x0430)
    (#\x0411 #\x0431)
    (#\x0412 #\x0432)
    (#\x0413 #\x0433)
    (#\x0414 #\x0434)
    (#\x0415 #\x0435)
    (#\x0416 #\x0436)
    (#\x0417 #\x0437)
    (#\x0418 #\x0438)
    (#\x0419 #\x0439)
    (#\x041A #\x043A)
    (#\x041B #\x043B)
    (#\x041C #\x043C)
    (#\x041D #\x043D)
    (#\x041E #\x043E)
    (#\x041F #\x043F)
    (#\x0420 #\x0440)
    (#\x0421 #\x0441)
    (#\x0422 #\x0442)
    (#\x0423 #\x0443)
    (#\x0424 #\x0444)
    (#\x0425 #\x0445)
    (#\x0426 #\x0446)
    (#\x0427 #\x0447)
    (#\x0428 #\x0448)
    (#\x0429 #\x0449)
    (#\x042A #\x044A)
    (#\x042B #\x044B)
    (#\x042C #\x044C)
    (#\x042D #\x044D)
    (#\x042E #\x044E)
    (#\x042F #\x044F)
    (#\x0460 #\x0461)
    (#\x0462 #\x0463)
    (#\x0464 #\x0465)
    (#\x0466 #\x0467)
    (#\x0468 #\x0469)
    (#\x046A #\x046B)
    (#\x046C #\x046D)
    (#\x046E #\x046F)
    (#\x0470 #\x0471)
    (#\x0472 #\x0473)
    (#\x0474 #\x0475)
    (#\x0476 #\x0477)
    (#\x0478 #\x0479)
    (#\x047A #\x047B)
    (#\x047C #\x047D)
    (#\x047E #\x047F)
    (#\x0480 #\x0481)
    (#\x048A #\x048B)
    (#\x048C #\x048D)
    (#\x048E #\x048F)
    (#\x0490 #\x0491)
    (#\x0492 #\x0493)
    (#\x0494 #\x0495)
    (#\x0496 #\x0497)
    (#\x0498 #\x0499)
    (#\x049A #\x049B)
    (#\x049C #\x049D)
    (#\x049E #\x049F)
    (#\x04A0 #\x04A1)
    (#\x04A2 #\x04A3)
    (#\x04A4 #\x04A5)
    (#\x04A6 #\x04A7)
    (#\x04A8 #\x04A9)
    (#\x04AA #\x04AB)
    (#\x04AC #\x04AD)
    (#\x04AE #\x04AF)
    (#\x04B0 #\x04B1)
    (#\x04B2 #\x04B3)
    (#\x04B4 #\x04B5)
    (#\x04B6 #\x04B7)
    (#\x04B8 #\x04B9)
    (#\x04BA #\x04BB)
    (#\x04BC #\x04BD)
    (#\x04BE #\x04BF)
    (#\x04C0 #\x04CF)
    (#\x04C1 #\x04C2)
    (#\x04C3 #\x04C4)
    (#\x04C5 #\x04C6)
    (#\x04C7 #\x04C8)
    (#\x04C9 #\x04CA)
    (#\x04CB #\x04CC)
    (#\x04CD #\x04CE)
    (#\x04D0 #\x04D1)
    (#\x04D2 #\x04D3)
    (#\x04D4 #\x04D5)
    (#\x04D6 #\x04D7)
    (#\x04D8 #\x04D9)
    (#\x04DA #\x04DB)
    (#\x04DC #\x04DD)
    (#\x04DE #\x04DF)
    (#\x04E0 #\x04E1)
    (#\x04E2 #\x04E3)
    (#\x04E4 #\x04E5)
    (#\x04E6 #\x04E7)
    (#\x04E8 #\x04E9)
    (#\x04EA #\x04EB)
    (#\x04EC #\x04ED)
    (#\x04EE #\x04EF)
    (#\x04F0 #\x04F1)
    (#\x04F2 #\x04F3)
    (#\x04F4 #\x04F5)
    (#\x04F6 #\x04F7)
    (#\x04F8 #\x04F9)
    (#\x04FA #\x04FB)
    (#\x04FC #\x04FD)
    (#\x04FE #\x04FF)
    (#\x0500 #\x0501)
    (#\x0502 #\x0503)
    (#\x0504 #\x0505)
    (#\x0506 #\x0507)
    (#\x0508 #\x0509)
    (#\x050A #\x050B)
    (#\x050C #\x050D)
    (#\x050E #\x050F)
    (#\x0510 #\x0511)
    (#\x0512 #\x0513)
    (#\x0531 #\x0561)
    (#\x0532 #\x0562)
    (#\x0533 #\x0563)
    (#\x0534 #\x0564)
    (#\x0535 #\x0565)
    (#\x0536 #\x0566)
    (#\x0537 #\x0567)
    (#\x0538 #\x0568)
    (#\x0539 #\x0569)
    (#\x053A #\x056A)
    (#\x053B #\x056B)
    (#\x053C #\x056C)
    (#\x053D #\x056D)
    (#\x053E #\x056E)
    (#\x053F #\x056F)
    (#\x0540 #\x0570)
    (#\x0541 #\x0571)
    (#\x0542 #\x0572)
    (#\x0543 #\x0573)
    (#\x0544 #\x0574)
    (#\x0545 #\x0575)
    (#\x0546 #\x0576)
    (#\x0547 #\x0577)
    (#\x0548 #\x0578)
    (#\x0549 #\x0579)
    (#\x054A #\x057A)
    (#\x054B #\x057B)
    (#\x054C #\x057C)
    (#\x054D #\x057D)
    (#\x054E #\x057E)
    (#\x054F #\x057F)
    (#\x0550 #\x0580)
    (#\x0551 #\x0581)
    (#\x0552 #\x0582)
    (#\x0553 #\x0583)
    (#\x0554 #\x0584)
    (#\x0555 #\x0585)
    (#\x0556 #\x0586)
    (#\x0587 #\x0565 #\x0582)
    (#\x10A0 #\x2D00)
    (#\x10A1 #\x2D01)
    (#\x10A2 #\x2D02)
    (#\x10A3 #\x2D03)
    (#\x10A4 #\x2D04)
    (#\x10A5 #\x2D05)
    (#\x10A6 #\x2D06)
    (#\x10A7 #\x2D07)
    (#\x10A8 #\x2D08)
    (#\x10A9 #\x2D09)
    (#\x10AA #\x2D0A)
    (#\x10AB #\x2D0B)
    (#\x10AC #\x2D0C)
    (#\x10AD #\x2D0D)
    (#\x10AE #\x2D0E)
    (#\x10AF #\x2D0F)
    (#\x10B0 #\x2D10)
    (#\x10B1 #\x2D11)
    (#\x10B2 #\x2D12)
    (#\x10B3 #\x2D13)
    (#\x10B4 #\x2D14)
    (#\x10B5 #\x2D15)
    (#\x10B6 #\x2D16)
    (#\x10B7 #\x2D17)
    (#\x10B8 #\x2D18)
    (#\x10B9 #\x2D19)
    (#\x10BA #\x2D1A)
    (#\x10BB #\x2D1B)
    (#\x10BC #\x2D1C)
    (#\x10BD #\x2D1D)
    (#\x10BE #\x2D1E)
    (#\x10BF #\x2D1F)
    (#\x10C0 #\x2D20)
    (#\x10C1 #\x2D21)
    (#\x10C2 #\x2D22)
    (#\x10C3 #\x2D23)
    (#\x10C4 #\x2D24)
    (#\x10C5 #\x2D25)
    (#\x1E00 #\x1E01)
    (#\x1E02 #\x1E03)
    (#\x1E04 #\x1E05)
    (#\x1E06 #\x1E07)
    (#\x1E08 #\x1E09)
    (#\x1E0A #\x1E0B)
    (#\x1E0C #\x1E0D)
    (#\x1E0E #\x1E0F)
    (#\x1E10 #\x1E11)
    (#\x1E12 #\x1E13)
    (#\x1E14 #\x1E15)
    (#\x1E16 #\x1E17)
    (#\x1E18 #\x1E19)
    (#\x1E1A #\x1E1B)
    (#\x1E1C #\x1E1D)
    (#\x1E1E #\x1E1F)
    (#\x1E20 #\x1E21)
    (#\x1E22 #\x1E23)
    (#\x1E24 #\x1E25)
    (#\x1E26 #\x1E27)
    (#\x1E28 #\x1E29)
    (#\x1E2A #\x1E2B)
    (#\x1E2C #\x1E2D)
    (#\x1E2E #\x1E2F)
    (#\x1E30 #\x1E31)
    (#\x1E32 #\x1E33)
    (#\x1E34 #\x1E35)
    (#\x1E36 #\x1E37)
    (#\x1E38 #\x1E39)
    (#\x1E3A #\x1E3B)
    (#\x1E3C #\x1E3D)
    (#\x1E3E #\x1E3F)
    (#\x1E40 #\x1E41)
    (#\x1E42 #\x1E43)
    (#\x1E44 #\x1E45)
    (#\x1E46 #\x1E47)
    (#\x1E48 #\x1E49)
    (#\x1E4A #\x1E4B)
    (#\x1E4C #\x1E4D)
    (#\x1E4E #\x1E4F)
    (#\x1E50 #\x1E51)
    (#\x1E52 #\x1E53)
    (#\x1E54 #\x1E55)
    (#\x1E56 #\x1E57)
    (#\x1E58 #\x1E59)
    (#\x1E5A #\x1E5B)
    (#\x1E5C #\x1E5D)
    (#\x1E5E #\x1E5F)
    (#\x1E60 #\x1E61)
    (#\x1E62 #\x1E63)
    (#\x1E64 #\x1E65)
    (#\x1E66 #\x1E67)
    (#\x1E68 #\x1E69)
    (#\x1E6A #\x1E6B)
    (#\x1E6C #\x1E6D)
    (#\x1E6E #\x1E6F)
    (#\x1E70 #\x1E71)
    (#\x1E72 #\x1E73)
    (#\x1E74 #\x1E75)
    (#\x1E76 #\x1E77)
    (#\x1E78 #\x1E79)
    (#\x1E7A #\x1E7B)
    (#\x1E7C #\x1E7D)
    (#\x1E7E #\x1E7F)
    (#\x1E80 #\x1E81)
    (#\x1E82 #\x1E83)
    (#\x1E84 #\x1E85)
    (#\x1E86 #\x1E87)
    (#\x1E88 #\x1E89)
    (#\x1E8A #\x1E8B)
    (#\x1E8C #\x1E8D)
    (#\x1E8E #\x1E8F)
    (#\x1E90 #\x1E91)
    (#\x1E92 #\x1E93)
    (#\x1E94 #\x1E95)
    (#\x1E96 #\x0068 #\x0331)
    (#\x1E97 #\x0074 #\x0308)
    (#\x1E98 #\x0077 #\x030A)
    (#\x1E99 #\x0079 #\x030A)
    (#\x1E9A #\x0061 #\x02BE)
    (#\x1E9B #\x1E61)
    (#\x1EA0 #\x1EA1)
    (#\x1EA2 #\x1EA3)
    (#\x1EA4 #\x1EA5)
    (#\x1EA6 #\x1EA7)
    (#\x1EA8 #\x1EA9)
    (#\x1EAA #\x1EAB)
    (#\x1EAC #\x1EAD)
    (#\x1EAE #\x1EAF)
    (#\x1EB0 #\x1EB1)
    (#\x1EB2 #\x1EB3)
    (#\x1EB4 #\x1EB5)
    (#\x1EB6 #\x1EB7)
    (#\x1EB8 #\x1EB9)
    (#\x1EBA #\x1EBB)
    (#\x1EBC #\x1EBD)
    (#\x1EBE #\x1EBF)
    (#\x1EC0 #\x1EC1)
    (#\x1EC2 #\x1EC3)
    (#\x1EC4 #\x1EC5)
    (#\x1EC6 #\x1EC7)
    (#\x1EC8 #\x1EC9)
    (#\x1ECA #\x1ECB)
    (#\x1ECC #\x1ECD)
    (#\x1ECE #\x1ECF)
    (#\x1ED0 #\x1ED1)
    (#\x1ED2 #\x1ED3)
    (#\x1ED4 #\x1ED5)
    (#\x1ED6 #\x1ED7)
    (#\x1ED8 #\x1ED9)
    (#\x1EDA #\x1EDB)
    (#\x1EDC #\x1EDD)
    (#\x1EDE #\x1EDF)
    (#\x1EE0 #\x1EE1)
    (#\x1EE2 #\x1EE3)
    (#\x1EE4 #\x1EE5)
    (#\x1EE6 #\x1EE7)
    (#\x1EE8 #\x1EE9)
    (#\x1EEA #\x1EEB)
    (#\x1EEC #\x1EED)
    (#\x1EEE #\x1EEF)
    (#\x1EF0 #\x1EF1)
    (#\x1EF2 #\x1EF3)
    (#\x1EF4 #\x1EF5)
    (#\x1EF6 #\x1EF7)
    (#\x1EF8 #\x1EF9)
    (#\x1F08 #\x1F00)
    (#\x1F09 #\x1F01)
    (#\x1F0A #\x1F02)
    (#\x1F0B #\x1F03)
    (#\x1F0C #\x1F04)
    (#\x1F0D #\x1F05)
    (#\x1F0E #\x1F06)
    (#\x1F0F #\x1F07)
    (#\x1F18 #\x1F10)
    (#\x1F19 #\x1F11)
    (#\x1F1A #\x1F12)
    (#\x1F1B #\x1F13)
    (#\x1F1C #\x1F14)
    (#\x1F1D #\x1F15)
    (#\x1F28 #\x1F20)
    (#\x1F29 #\x1F21)
    (#\x1F2A #\x1F22)
    (#\x1F2B #\x1F23)
    (#\x1F2C #\x1F24)
    (#\x1F2D #\x1F25)
    (#\x1F2E #\x1F26)
    (#\x1F2F #\x1F27)
    (#\x1F38 #\x1F30)
    (#\x1F39 #\x1F31)
    (#\x1F3A #\x1F32)
    (#\x1F3B #\x1F33)
    (#\x1F3C #\x1F34)
    (#\x1F3D #\x1F35)
    (#\x1F3E #\x1F36)
    (#\x1F3F #\x1F37)
    (#\x1F48 #\x1F40)
    (#\x1F49 #\x1F41)
    (#\x1F4A #\x1F42)
    (#\x1F4B #\x1F43)
    (#\x1F4C #\x1F44)
    (#\x1F4D #\x1F45)
    (#\x1F50 #\x03C5 #\x0313)
    (#\x1F52 #\x03C5 #\x0313 #\x0300)
    (#\x1F54 #\x03C5 #\x0313 #\x0301)
    (#\x1F56 #\x03C5 #\x0313 #\x0342)
    (#\x1F59 #\x1F51)
    (#\x1F5B #\x1F53)
    (#\x1F5D #\x1F55)
    (#\x1F5F #\x1F57)
    (#\x1F68 #\x1F60)
    (#\x1F69 #\x1F61)
    (#\x1F6A #\x1F62)
    (#\x1F6B #\x1F63)
    (#\x1F6C #\x1F64)
    (#\x1F6D #\x1F65)
    (#\x1F6E #\x1F66)
    (#\x1F6F #\x1F67)
    (#\x1F80 #\x1F00 #\x03B9)
    (#\x1F81 #\x1F01 #\x03B9)
    (#\x1F82 #\x1F02 #\x03B9)
    (#\x1F83 #\x1F03 #\x03B9)
    (#\x1F84 #\x1F04 #\x03B9)
    (#\x1F85 #\x1F05 #\x03B9)
    (#\x1F86 #\x1F06 #\x03B9)
    (#\x1F87 #\x1F07 #\x03B9)
    (#\x1F88 #\x1F00 #\x03B9)
    (#\x1F89 #\x1F01 #\x03B9)
    (#\x1F8A #\x1F02 #\x03B9)
    (#\x1F8B #\x1F03 #\x03B9)
    (#\x1F8C #\x1F04 #\x03B9)
    (#\x1F8D #\x1F05 #\x03B9)
    (#\x1F8E #\x1F06 #\x03B9)
    (#\x1F8F #\x1F07 #\x03B9)
    (#\x1F90 #\x1F20 #\x03B9)
    (#\x1F91 #\x1F21 #\x03B9)
    (#\x1F92 #\x1F22 #\x03B9)
    (#\x1F93 #\x1F23 #\x03B9)
    (#\x1F94 #\x1F24 #\x03B9)
    (#\x1F95 #\x1F25 #\x03B9)
    (#\x1F96 #\x1F26 #\x03B9)
    (#\x1F97 #\x1F27 #\x03B9)
    (#\x1F98 #\x1F20 #\x03B9)
    (#\x1F99 #\x1F21 #\x03B9)
    (#\x1F9A #\x1F22 #\x03B9)
    (#\x1F9B #\x1F23 #\x03B9)
    (#\x1F9C #\x1F24 #\x03B9)
    (#\x1F9D #\x1F25 #\x03B9)
    (#\x1F9E #\x1F26 #\x03B9)
    (#\x1F9F #\x1F27 #\x03B9)
    (#\x1FA0 #\x1F60 #\x03B9)
    (#\x1FA1 #\x1F61 #\x03B9)
    (#\x1FA2 #\x1F62 #\x03B9)
    (#\x1FA3 #\x1F63 #\x03B9)
    (#\x1FA4 #\x1F64 #\x03B9)
    (#\x1FA5 #\x1F65 #\x03B9)
    (#\x1FA6 #\x1F66 #\x03B9)
    (#\x1FA7 #\x1F67 #\x03B9)
    (#\x1FA8 #\x1F60 #\x03B9)
    (#\x1FA9 #\x1F61 #\x03B9)
    (#\x1FAA #\x1F62 #\x03B9)
    (#\x1FAB #\x1F63 #\x03B9)
    (#\x1FAC #\x1F64 #\x03B9)
    (#\x1FAD #\x1F65 #\x03B9)
    (#\x1FAE #\x1F66 #\x03B9)
    (#\x1FAF #\x1F67 #\x03B9)
    (#\x1FB2 #\x1F70 #\x03B9)
    (#\x1FB3 #\x03B1 #\x03B9)
    (#\x1FB4 #\x03AC #\x03B9)
    (#\x1FB6 #\x03B1 #\x0342)
    (#\x1FB7 #\x03B1 #\x0342 #\x03B9)
    (#\x1FB8 #\x1FB0)
    (#\x1FB9 #\x1FB1)
    (#\x1FBA #\x1F70)
    (#\x1FBB #\x1F71)
    (#\x1FBC #\x03B1 #\x03B9)
    (#\x1FBE #\x03B9)
    (#\x1FC2 #\x1F74 #\x03B9)
    (#\x1FC3 #\x03B7 #\x03B9)
    (#\x1FC4 #\x03AE #\x03B9)
    (#\x1FC6 #\x03B7 #\x0342)
    (#\x1FC7 #\x03B7 #\x0342 #\x03B9)
    (#\x1FC8 #\x1F72)
    (#\x1FC9 #\x1F73)
    (#\x1FCA #\x1F74)
    (#\x1FCB #\x1F75)
    (#\x1FCC #\x03B7 #\x03B9)
    (#\x1FD2 #\x03B9 #\x0308 #\x0300)
    (#\x1FD3 #\x03B9 #\x0308 #\x0301)
    (#\x1FD6 #\x03B9 #\x0342)
    (#\x1FD7 #\x03B9 #\x0308 #\x0342)
    (#\x1FD8 #\x1FD0)
    (#\x1FD9 #\x1FD1)
    (#\x1FDA #\x1F76)
    (#\x1FDB #\x1F77)
    (#\x1FE2 #\x03C5 #\x0308 #\x0300)
    (#\x1FE3 #\x03C5 #\x0308 #\x0301)
    (#\x1FE4 #\x03C1 #\x0313)
    (#\x1FE6 #\x03C5 #\x0342)
    (#\x1FE7 #\x03C5 #\x0308 #\x0342)
    (#\x1FE8 #\x1FE0)
    (#\x1FE9 #\x1FE1)
    (#\x1FEA #\x1F7A)
    (#\x1FEB #\x1F7B)
    (#\x1FEC #\x1FE5)
    (#\x1FF2 #\x1F7C #\x03B9)
    (#\x1FF3 #\x03C9 #\x03B9)
    (#\x1FF4 #\x03CE #\x03B9)
    (#\x1FF6 #\x03C9 #\x0342)
    (#\x1FF7 #\x03C9 #\x0342 #\x03B9)
    (#\x1FF8 #\x1F78)
    (#\x1FF9 #\x1F79)
    (#\x1FFA #\x1F7C)
    (#\x1FFB #\x1F7D)
    (#\x1FFC #\x03C9 #\x03B9)
    (#\x2126 #\x03C9)
    (#\x212A #\x006B)
    (#\x212B #\x00E5)
    (#\x2132 #\x214E)
    (#\x2160 #\x2170)
    (#\x2161 #\x2171)
    (#\x2162 #\x2172)
    (#\x2163 #\x2173)
    (#\x2164 #\x2174)
    (#\x2165 #\x2175)
    (#\x2166 #\x2176)
    (#\x2167 #\x2177)
    (#\x2168 #\x2178)
    (#\x2169 #\x2179)
    (#\x216A #\x217A)
    (#\x216B #\x217B)
    (#\x216C #\x217C)
    (#\x216D #\x217D)
    (#\x216E #\x217E)
    (#\x216F #\x217F)
    (#\x2183 #\x2184)
    (#\x24B6 #\x24D0)
    (#\x24B7 #\x24D1)
    (#\x24B8 #\x24D2)
    (#\x24B9 #\x24D3)
    (#\x24BA #\x24D4)
    (#\x24BB #\x24D5)
    (#\x24BC #\x24D6)
    (#\x24BD #\x24D7)
    (#\x24BE #\x24D8)
    (#\x24BF #\x24D9)
    (#\x24C0 #\x24DA)
    (#\x24C1 #\x24DB)
    (#\x24C2 #\x24DC)
    (#\x24C3 #\x24DD)
    (#\x24C4 #\x24DE)
    (#\x24C5 #\x24DF)
    (#\x24C6 #\x24E0)
    (#\x24C7 #\x24E1)
    (#\x24C8 #\x24E2)
    (#\x24C9 #\x24E3)
    (#\x24CA #\x24E4)
    (#\x24CB #\x24E5)
    (#\x24CC #\x24E6)
    (#\x24CD #\x24E7)
    (#\x24CE #\x24E8)
    (#\x24CF #\x24E9)
    (#\x2C00 #\x2C30)
    (#\x2C01 #\x2C31)
    (#\x2C02 #\x2C32)
    (#\x2C03 #\x2C33)
    (#\x2C04 #\x2C34)
    (#\x2C05 #\x2C35)
    (#\x2C06 #\x2C36)
    (#\x2C07 #\x2C37)
    (#\x2C08 #\x2C38)
    (#\x2C09 #\x2C39)
    (#\x2C0A #\x2C3A)
    (#\x2C0B #\x2C3B)
    (#\x2C0C #\x2C3C)
    (#\x2C0D #\x2C3D)
    (#\x2C0E #\x2C3E)
    (#\x2C0F #\x2C3F)
    (#\x2C10 #\x2C40)
    (#\x2C11 #\x2C41)
    (#\x2C12 #\x2C42)
    (#\x2C13 #\x2C43)
    (#\x2C14 #\x2C44)
    (#\x2C15 #\x2C45)
    (#\x2C16 #\x2C46)
    (#\x2C17 #\x2C47)
    (#\x2C18 #\x2C48)
    (#\x2C19 #\x2C49)
    (#\x2C1A #\x2C4A)
    (#\x2C1B #\x2C4B)
    (#\x2C1C #\x2C4C)
    (#\x2C1D #\x2C4D)
    (#\x2C1E #\x2C4E)
    (#\x2C1F #\x2C4F)
    (#\x2C20 #\x2C50)
    (#\x2C21 #\x2C51)
    (#\x2C22 #\x2C52)
    (#\x2C23 #\x2C53)
    (#\x2C24 #\x2C54)
    (#\x2C25 #\x2C55)
    (#\x2C26 #\x2C56)
    (#\x2C27 #\x2C57)
    (#\x2C28 #\x2C58)
    (#\x2C29 #\x2C59)
    (#\x2C2A #\x2C5A)
    (#\x2C2B #\x2C5B)
    (#\x2C2C #\x2C5C)
    (#\x2C2D #\x2C5D)
    (#\x2C2E #\x2C5E)
    (#\x2C60 #\x2C61)
    (#\x2C62 #\x026B)
    (#\x2C63 #\x1D7D)
    (#\x2C64 #\x027D)
    (#\x2C67 #\x2C68)
    (#\x2C69 #\x2C6A)
    (#\x2C6B #\x2C6C)
    (#\x2C75 #\x2C76)
    (#\x2C80 #\x2C81)
    (#\x2C82 #\x2C83)
    (#\x2C84 #\x2C85)
    (#\x2C86 #\x2C87)
    (#\x2C88 #\x2C89)
    (#\x2C8A #\x2C8B)
    (#\x2C8C #\x2C8D)
    (#\x2C8E #\x2C8F)
    (#\x2C90 #\x2C91)
    (#\x2C92 #\x2C93)
    (#\x2C94 #\x2C95)
    (#\x2C96 #\x2C97)
    (#\x2C98 #\x2C99)
    (#\x2C9A #\x2C9B)
    (#\x2C9C #\x2C9D)
    (#\x2C9E #\x2C9F)
    (#\x2CA0 #\x2CA1)
    (#\x2CA2 #\x2CA3)
    (#\x2CA4 #\x2CA5)
    (#\x2CA6 #\x2CA7)
    (#\x2CA8 #\x2CA9)
    (#\x2CAA #\x2CAB)
    (#\x2CAC #\x2CAD)
    (#\x2CAE #\x2CAF)
    (#\x2CB0 #\x2CB1)
    (#\x2CB2 #\x2CB3)
    (#\x2CB4 #\x2CB5)
    (#\x2CB6 #\x2CB7)
    (#\x2CB8 #\x2CB9)
    (#\x2CBA #\x2CBB)
    (#\x2CBC #\x2CBD)
    (#\x2CBE #\x2CBF)
    (#\x2CC0 #\x2CC1)
    (#\x2CC2 #\x2CC3)
    (#\x2CC4 #\x2CC5)
    (#\x2CC6 #\x2CC7)
    (#\x2CC8 #\x2CC9)
    (#\x2CCA #\x2CCB)
    (#\x2CCC #\x2CCD)
    (#\x2CCE #\x2CCF)
    (#\x2CD0 #\x2CD1)
    (#\x2CD2 #\x2CD3)
    (#\x2CD4 #\x2CD5)
    (#\x2CD6 #\x2CD7)
    (#\x2CD8 #\x2CD9)
    (#\x2CDA #\x2CDB)
    (#\x2CDC #\x2CDD)
    (#\x2CDE #\x2CDF)
    (#\x2CE0 #\x2CE1)
    (#\x2CE2 #\x2CE3)
    (#\xFB00 #\x0066 #\x0066)
    (#\xFB01 #\x0066 #\x0069)
    (#\xFB02 #\x0066 #\x006C)
    (#\xFB03 #\x0066 #\x0066 #\x0069)
    (#\xFB04 #\x0066 #\x0066 #\x006C)
    (#\xFB05 #\x0073 #\x0074)
    (#\xFB06 #\x0073 #\x0074)
    (#\xFB13 #\x0574 #\x0576)
    (#\xFB14 #\x0574 #\x0565)
    (#\xFB15 #\x0574 #\x056B)
    (#\xFB16 #\x057E #\x0576)
    (#\xFB17 #\x0574 #\x056D)
    (#\xFF21 #\xFF41)
    (#\xFF22 #\xFF42)
    (#\xFF23 #\xFF43)
    (#\xFF24 #\xFF44)
    (#\xFF25 #\xFF45)
    (#\xFF26 #\xFF46)
    (#\xFF27 #\xFF47)
    (#\xFF28 #\xFF48)
    (#\xFF29 #\xFF49)
    (#\xFF2A #\xFF4A)
    (#\xFF2B #\xFF4B)
    (#\xFF2C #\xFF4C)
    (#\xFF2D #\xFF4D)
    (#\xFF2E #\xFF4E)
    (#\xFF2F #\xFF4F)
    (#\xFF30 #\xFF50)
    (#\xFF31 #\xFF51)
    (#\xFF32 #\xFF52)
    (#\xFF33 #\xFF53)
    (#\xFF34 #\xFF54)
    (#\xFF35 #\xFF55)
    (#\xFF36 #\xFF56)
    (#\xFF37 #\xFF57)
    (#\xFF38 #\xFF58)
    (#\xFF39 #\xFF59)
    (#\xFF3A #\xFF5A)
    (#\x10400 #\x10428)
    (#\x10401 #\x10429)
    (#\x10402 #\x1042A)
    (#\x10403 #\x1042B)
    (#\x10404 #\x1042C)
    (#\x10405 #\x1042D)
    (#\x10406 #\x1042E)
    (#\x10407 #\x1042F)
    (#\x10408 #\x10430)
    (#\x10409 #\x10431)
    (#\x1040A #\x10432)
    (#\x1040B #\x10433)
    (#\x1040C #\x10434)
    (#\x1040D #\x10435)
    (#\x1040E #\x10436)
    (#\x1040F #\x10437)
    (#\x10410 #\x10438)
    (#\x10411 #\x10439)
    (#\x10412 #\x1043A)
    (#\x10413 #\x1043B)
    (#\x10414 #\x1043C)
    (#\x10415 #\x1043D)
    (#\x10416 #\x1043E)
    (#\x10417 #\x1043F)
    (#\x10418 #\x10440)
    (#\x10419 #\x10441)
    (#\x1041A #\x10442)
    (#\x1041B #\x10443)
    (#\x1041C #\x10444)
    (#\x1041D #\x10445)
    (#\x1041E #\x10446)
    (#\x1041F #\x10447)
    (#\x10420 #\x10448)
    (#\x10421 #\x10449)
    (#\x10422 #\x1044A)
    (#\x10423 #\x1044B)
    (#\x10424 #\x1044C)
    (#\x10425 #\x1044D)
    (#\x10426 #\x1044E)
    (#\x10427 #\x1044F)))

(define (test-strings fr to)
  (when #f	;this prints A LOT of output
    (printf "test case-fold ~s ~s\n" fr to))
  (assert (string=? (string-foldcase fr) to))
  (assert (string-ci=? fr to))
  (assert (string=? (string-foldcase to) to)))

(define (test-char-by-char)
  (for-each
      (lambda (x)
        (test-strings (string (car x)) (list->string (cdr x))))
    case-fold-mapping))

(define (run-tests)
  (test-char-by-char)
  (test-strings
   (list->string (map car case-fold-mapping))
   (list->string (apply append (map cdr case-fold-mapping)))))

(set-port-buffer-mode! (current-output-port) (buffer-mode none))
(check-display "*** testing Ikarus case folding\n")
(run-tests)
(check-display "; *** done\n")

;;; end of file
