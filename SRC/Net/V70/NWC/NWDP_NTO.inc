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
//� Source module name: NWDP_NTO.H                                           �
//��������������������������������������������������������������������������͹
//� Library VeRsIoN=1.0.0                                                    �
//��������������������������������������������������������������������������ͼ
*)

(* Inclusion Control *)

{$IFNDEF  NWDP_NTO_H }
    {$DEFINE NWDP_NTO_H}
    (* Standard Library Header Includes *)
    {$IFNDEF  NTYPES_H }
        {$DEFINE N_INC_NO_OLD_CONSTANTS}
        {$DEFINE N_INC_NO_OLD_MACROS}
        {$I ntypes.inc}
        {$UNDEF N_INC_NO_OLD_MACROS}
        {$UNDEF N_INC_NO_OLD_CONSTANTS}
    {$ENDIF}
    {$IFNDEF  NWDP_ATT_H }
        {$I nwdp_att.inc}
    {$ENDIF}
    (* Header Includes *)
    (* Manifest Constant Definitions *)
    (* Macro Definitions *)
    (* Type Definitions *)
    Type
        NWDPRestrictionInfo = Record
            restrictedBool  :   nbool ;
            min  :   nint32 ;
            max  :   nint32 ;
        End;
        pNWDPRestrictionInfo = ^NWDPRestrictionInfo;
    Type
        NWDPDeliveryAddrItem = Record
            designator  :   NWDPAddressItemTypeEnum ;
            userRestrict  :   NWDPRestrictionInfo ;  (* union statement *)
        End;
        pNWDPDeliveryAddrItem = ^NWDPDeliveryAddrItem;
    Type
        NWDPEventReport = Record
            supplierId  :   NWDPOctetString ;
            eventType  :   nuint32 ;
            containingClassOid  :   NWDPObjectIdentifier ;
            containingObjectId  :   NWDPObjectIdentification ;
            filterClassOid  :   NWDPObjectIdentifier ;
            objectClassOid  :   NWDPObjectIdentifier ;
            objectId  :   NWDPObjectIdentification ;
            eventOid  :   NWDPObjectIdentifier ;
            eventAttr  :   NWDPAttribute ;
            message  :   NWDPText ;
            time  :   nuint32 ;
            accountOption  :   NWDPQualifiedName ;
        End;
        pNWDPEventReport = ^NWDPEventReport;
{$ELSE}
    {$IFDEF  N_DEBUG }
        (* TC error *)
    {$ENDIF}
{$ENDIF}

