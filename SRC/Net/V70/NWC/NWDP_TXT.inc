(*
//��������������������������������������������������������������������������ͻ
//� (c) 1997 Novell, Inc.  All rights reserved.                              �
//�                                                                          �
//� THIS WORK IS SUBJECT TO U.S. AND INTERNATIONAL COPYRIGHT LAWS AND        �
//� TREATIES.                                                                �
//�                                                                          �
//� NO PART OF THIS WORK MAY BE USED, PRACTICED, PERFORMED, COPIED,          �
//� DISTRIBUTED, REVISED, MODIFIED, TRANSLATED, ABRIDGED, CONDENSED,         �
//� EXPANDED, COLLECTED, COMPILED, LINKED, RECAST, TRANSFORMED OR ADAPTED    �
//� WITHOUT THE PRIOR WRITTEN CONSENT OF NOVELL, INC.                        �
//�                                                                          �
//� ANY USE OR EXPLOITATION OF THIS WORK WITHOUT AUTHORIZATION COULD SUBJECT �
//� THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.                         �
//��������������������������������������������������������������������������͹
//� Source module name: NWDP_TXT.H                                           �
//��������������������������������������������������������������������������͹
//� Library VeRsIoN=1.0.0                                                    �
//��������������������������������������������������������������������������ͼ
*)

(* Inclusion Control *)

{$IFNDEF  NWDP_TXT_H }
    {$DEFINE NWDP_TXT_H}
    (* Standard Library Header Includes *)
    {$IFNDEF  NTYPES_H }
        {$DEFINE N_INC_NO_OLD_CONSTANTS}
        {$DEFINE N_INC_NO_OLD_MACROS}
        {$I ntypes.inc}
        {$UNDEF N_INC_NO_OLD_MACROS}
        {$UNDEF N_INC_NO_OLD_CONSTANTS}
    {$ENDIF}
    (* Header Includes *)
    (* Manifest Constant Definitions *)
    (* Macro Definitions *)
    (* TC #define NWDPTextPtrInitMac ( __textStructPtr , __unicodeStrPtr ) ( ( __textStructPtr ) - > itemPtr = ( pnint8 ) ( __unicodeStrPtr ) , ( __textStructPtr ) - > itemCount = ( nuint ) unisize ( __unicodeStrPtr ) )  *)
    (* TC #define NWDPTextInitMac ( __textStruct , __unicodeStrPtr ) NWDPTextPtrInitMac ( & ( __textStruct ) , __unicodeStrPtr )  *)
    (* Type Definitions *)
    Type
        NWDPText = Record
            itemCount  :   nuint ;
            itemPtr  :   pnint8 ;
        End;
        pNWDPText = ^NWDPText;
    (* Structure Definitions *)
    (* Global Variable Declarations *)
    (* Function Prototype Declarations *)
{$ELSE}
    {$IFDEF  N_DEBUG }
        (* TC error *)
    {$ENDIF}
{$ENDIF}

