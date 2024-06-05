unit LUNWC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CalWin32, ClxWin32, NetWin32, NWCErrTxt;

type
   TListCommand = (lcList,lcExtSyncList,lcExtSyncRead,lcListByClassAndName);
   TReadCommand = (rcRead,rcGetObjectHostServerAddress,rcListAttrsEffectiveRights);

type
  TLUNWC = class(TComponent)
  private
    { Private declarations }
    FListNames: TStringList;
    {}
    FErrorCode: NWDSCCODE;
    FErrorString: string;
    {}
    FContextHandle: NWDSContextHandle;
    FlConvInfo: LCONV;
  protected
    { Protected declarations }
    procedure LUNWCallsInit;
    procedure LUNWCallsTerm;
    { Buffer }
    function  LUNWDSAllocBuf
       (Size: size_t): pBuf_T;
    procedure LUNWDSInitBuf
       (Buffer: pBuf_T; Operation: nuint32);
    procedure LUNWDSFreeBuf
       (Buffer: pBuf_T);
    { Context }
    procedure LUNWDSCreateContextHandle;
    procedure LUNWDSFreeContext;
    procedure LUNWDSGetContext
       (Key: nint; Value: nptr);
    procedure LUNWDSSetContext
       (Key: nint; Value: nptr);
    { Unicode }
    procedure LUNWLLocaleConv;
    procedure LUNWInitUnicodeTables;
    procedure LUNWFreeUnicodeTables;
    { }
    procedure LUNWDSWhoAmI(UserNameBuffer: pnstr8);
    { Login }
    function  LUNWIsDSAuthenticated: NWCCode;
    procedure LUNWDSLogin
       (UserName, Password: string);
    procedure LUNWDSReadNDSInfo
       (RequestedFields: nflag32; Buffer: pBuf_T);
    procedure LUNWDSGetNDSInfo
       (RequestedFields: nflag32; Buffer: pBuf_T; Value: nptr);
    procedure LUNWDSCanonicalizeName
       (ObjectName: string; CanonName: pnstr8);
    procedure LUNWDSChangeObjectPassword
       (Flag: nFlag32; ObjectName, OldPassword, NewPassword: string);
    function  LUNWDSCIStringsMatch(String1, String2: string): Integer;
    { Attribute }
    procedure LUNWDSGetAttrName
       (Buffer: pBuf_T; AttrName: pnstr8; var AttrValCount, SyntaxID : nuint32);
    procedure LUNWDSPutAttrName
       (Buffer: pBuf_T; AttrName: string);
    function  LUNWDSGetAttrCount
       (Buffer: pBuf_T): nuint32;
    procedure LUNWDSGetAttrVal
       (Buffer: pBuf_T; SyntaxID : nuint32; Value: nptr);
    procedure LUNWDSPutAttrVal
       (Buffer: pBuf_T; SyntaxID : nuint32; Value: nptr);
    procedure LUNWDSGetAttrValFlags
       (Buffer: pBuf_T; Flags: nuint32);
    function  LUNWDSComputeAttrValSize
       (Buffer: pBuf_T; SyntaxID : nuint32): nuint32;
    procedure LUNWDSReadAttrDef
       (InfoType: nuint32; AllAttrs: nbool8; var IterationHandle: nint32; INBuffer: pBuf_T; OUTBuffer: pBuf_T);
    procedure LUNWDSGetAttrDef
       (Buffer: pBuf_T; AttrName: pnstr8; AttrInfo: PAttr_Info_T);
    procedure LUNWDSReadSyntaxes
       (InfoType: nuint32; AllSyntaxes: nbool8; var IterationHandle: nint32; INBuffer: pBuf_T; OUTBuffer: pBuf_T);
    procedure LUNWDSGetSyntaxDef
       (Buffer: pBuf_T; SyntaxName: pnstr8; SyntaxInfo: PSyntax_Info_T);
    procedure LUNWDSGetSyntaxID
       (AttrName: string; var SyntaxID: nuint32);
    function  LUNWDSGetSyntaxCount
       (Buffer: pBuf_T): nuint32;
    function  LUNWDSCompare
       (ObjectName: string; Buffer: pBuf_T): Boolean;
    { Object }
    function  LUNWDSGetObjectCount
       (Buffer: pBuf_T): nuint32;
    procedure LUNWDSGetObjectName
       (Buffer: pBuf_T; ObjectName: pnstr8; var AttrCount: nuint32; var ObjectInfo: Object_Info_T);
    procedure LUNWDSGetObjectNameAndInfo
       (Buffer: pBuf_T; ObjectName: pnstr8; var AttrCount: nuint32; var ObjectInfo: ppnstr8);
    procedure LUNWDSGetObjectHostServerAddress
       (ObjectName: string; Buffer: pBuf_T; ServerName: pnstr8);
    { Rights }
    procedure LUNWDSListAttrsEffectiveRights
       (ObjectName, SubjectName: string; AllAttrs: nbool8; var IterationHandle: nint32; INBuffer: pBuf_T; OUTBuffer: pBuf_T);
    { Class }
    procedure LUNWDSListContainableClasses
       ( ObjectName: string; var IterationHandle: nint32; Buffer: pBuf_T);
    procedure LUNWDSListByClassAndName
       (ObjectName,ClassName,SubOrdinateName: string; var IterationHandle: nint32; Buffer: pBuf_T);
    function  LUNWDSGetClassItemCount
       (Buffer: pBuf_T): nuint32;
    procedure LUNWDSGetClassItem
       (Buffer: pBuf_T; ItemName: pnstr8);
    function  LUNWDSGetClassDefCount
       (Buffer: pBuf_T): nuint32;
    procedure LUNWDSReadClassDef
       (InfoType: nuint32; AllClasses: nbool8; var IterationHandle: nint32; INBuffer: pBuf_T; OUTBuffer: pBuf_T);
    procedure LUNWDSGetClassDef
       (Buffer: pBuf_T; AClassName: pnstr8; AClassInfo: PClass_Info_T);
    { Iteration }
    procedure LUNWDSRead
       (ObjectName: string; InfoType: nuint32; AllAttrs: nbool8; var IterationHandle: nint32; INBuffer: pBuf_T; OUTBuffer: pBuf_T);
    procedure LUNWDSList
       (ObjectName: string; var IterationHandle: nint32; OUTBuffer: pBuf_T);
    procedure LUNWDSExtSyncList
       (ObjectName,ClassName,SubordinateName: string; var IterationHandle: nint32; OUTBuffer: pBuf_T);
    procedure LUNWDSCloseIteration
       (Operation: nuint32; IterationHandle: nuint32);
    procedure LUNWDSExtSyncRead
       (ObjectName: string; InfoType: nuint32; AllAttrs: nbool8;
       var IterationHandle: nint32; TimeStamp: TimeStamp_T; INBuffer: pBuf_T; OUTBuffer: pBuf_T);
    { }
  public
    { Public declarations }
    constructor Create (Owner: TComponent); override;
    destructor Destroy; override;
    procedure CallsInit;
    procedure CallsTerm;
    function  WhoAmI: string;
    function  CanonName (ObjectName: string): string;
    function  IsDSAuthenticated: Boolean;
    procedure SetContextName(ContextName: string);
    function  GetContextName: string;
    function  GetTreeName: string;
    procedure SetFlags(Flags: nuint32);
    function  GetFlags: nuint32;
    procedure Login(UserName, Password: string);
    procedure ChangeNTObjectPassword (ObjectName, OldPassword, NewPassword: string);
    procedure ChangeNDSObjectPassword (ObjectName, OldPassword, NewPassword: string);

    function  GetNameClasses(ObjectName: string): TStringList;
    function  GetClassesDef: TStringList;
    function  GetAttrsDef: TStringList;
    function  GetSyntaxesDef: TStringList;
    procedure ReadNDSInfo;
    function  GetExtSyncList(ObjectName, ClassName, SubordinateName: string): TStringList;
    function  GetExtSyncRead(ObjectName: string): TStringList;
    function  GetSyntaxID(AttrName: string): nuint32;
    { }
    function  GetListNames(Command: TListCommand; const Names: array of string): TStringList;
    function  GetReadNames(Command: TReadCommand;
         const Names: array of string; const AttrNames: array of string): TStringList;
    function StringsMatch(String1, String2: string): Integer;
    function Compare(ObjectName: string;
             const AttrNames: array of string; const AttrValues: array of string): Boolean;
    { property }
    property ErrorString: string read FErrorString;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('LUIS Net', [TLUNWC]);
end;

{ Private}

function AllocMemNameObject: Pointer;
begin
   Result := AllocMem(MAX_DN_CHARS+1);
end;

{ TLUNWC }

constructor TLUNWC.Create (Owner: TComponent);
var
   Flags: nuint32;
begin
   inherited Create (Owner);
   FListNames := TStringList.Create;
   CallsInit;
   Flags := GetFlags;
   Flags := (Flags and (not DCV_CANONICALIZE_NAMES)); { Clear }
   Flags := Flags or DCV_TYPELESS_NAMES;              { Set   }
   SetFlags(Flags);
end;

destructor TLUNWC.Destroy;
begin
   CallsTerm;
   FListNames.Free;
   inherited Destroy;
end;

{ Init }

procedure TLUNWC.LUNWCallsInit;
begin
   FErrorCode := NWCallsInit(nil, nil);
   FErrorString := CheckNWCError('NWCallsInit',FErrorCode);
end;

procedure TLUNWC.LUNWCallsTerm;
begin
   FErrorCode := NWCallsTerm(nil);
   FErrorString := CheckNWCError('NWCallsTerm',FErrorCode);
end;

{ Unicode }

procedure TLUNWC.LUNWLLocaleConv;
begin
   NWLLocaleConv(FlConvInfo);
end;

procedure TLUNWC.LUNWInitUnicodeTables;
begin
   FErrorCode := NWInitUnicodeTables(FlConvInfo.country_id, FlConvInfo.code_page);
   FErrorString := CheckNWCError('NWInitUnicodeTables',FErrorCode);
end;

procedure TLUNWC.LUNWFreeUnicodeTables;
begin
   NWFreeUnicodeTables;
end;

{ Login}

function TLUNWC.LUNWIsDSAuthenticated: NWCCode;
{NWCC_AUTHENT_STATE_NDS}
begin
   Result := NWIsDSAuthenticated;
end;

procedure TLUNWC.LUNWDSLogin(UserName, Password: string);
begin
   FErrorCode := NWDSLogin(FContextHandle,
                           0, PNstr8(UserName), PNstr8(Password), 0);
   FErrorString := CheckNWCError('NWDSLogin',FErrorCode);
end;

procedure TLUNWC.LUNWDSReadNDSInfo(RequestedFields: nflag32; Buffer: pBuf_T);
begin
   FErrorCode := NWDSReadNDSInfo(FContextHandle,
                                 RequestedFields, Buffer);
   FErrorString := CheckNWCError('NWDSReadNDSInfo',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetNDSInfo(RequestedFields: nflag32;
                                 Buffer: pBuf_T; Value: nptr);
begin
   FErrorCode := NWDSGetNDSInfo(FContextHandle,
                                Buffer, RequestedFields, Value);
   FErrorString := CheckNWCError('NWDSGetNDSInfo',FErrorCode);
end;

procedure TLUNWC.LUNWDSCanonicalizeName (ObjectName: string; CanonName: pnstr8);
begin
   FErrorCode := NWDSCanonicalizeName(FContextHandle, PNstr8(ObjectName), CanonName);
   FErrorString := CheckNWCError('NWDSCanonicalizeName',FErrorCode);
end;

procedure TLUNWC.LUNWDSChangeObjectPassword
       (Flag: nFlag32; ObjectName, OldPassword, NewPassword: string);
begin
   FErrorCode := NWDSChangeObjectPassword(FContextHandle,
      Flag, PNstr8(ObjectName), PNstr8(OldPassword), PNstr8(NewPassword));
   FErrorString := CheckNWCError('NWDSChangeObjectPassword',FErrorCode);
end;

function TLUNWC.LUNWDSCIStringsMatch(String1, String2: string): Integer;
begin
   FErrorCode := NWDSCIStringsMatch(FContextHandle, PNstr8(String1), PNstr8(String1), @Result);
   FErrorString := CheckNWCError('NWDSCIStringsMatch',FErrorCode);
end;

{ Context }

procedure TLUNWC.LUNWDSCreateContextHandle;
begin
   FErrorCode := NWDSCreateContextHandle(FContextHandle);
   FErrorString := CheckNWCError('NWDSCreateContextHandle',FErrorCode);
end;

procedure TLUNWC.LUNWDSFreeContext;
begin
   FErrorCode := NWDSFreeContext(FContextHandle);
   FErrorString := CheckNWCError('NWDSFreeContext',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetContext(Key: nint; Value: nptr);
begin
   FErrorCode := NWDSGetContext(FContextHandle, Key, Value);
   FErrorString := CheckNWCError('NWDSGetContext',FErrorCode);
end;

procedure TLUNWC.LUNWDSSetContext(Key: nint; Value: nptr);
begin
   FErrorCode := NWDSSetContext(FContextHandle, Key, Value);
   FErrorString := CheckNWCError('NWDSSetContext',FErrorCode);
end;

{ Buffer }

function TLUNWC.LUNWDSAllocBuf(Size: size_t): pBuf_T;
begin
   FErrorCode := NWDSAllocBuf(Size, @Result);
   FErrorString := CheckNWCError('NWDSAllocBuf',FErrorCode);
end;

procedure TLUNWC.LUNWDSInitBuf(Buffer: pBuf_T; Operation: nuint32);
begin
   FErrorCode := NWDSInitBuf(FContextHandle, Operation, Buffer);
   FErrorString := CheckNWCError('NWDSInitBuf',FErrorCode);
end;

procedure TLUNWC.LUNWDSFreeBuf(Buffer: pBuf_T);
begin
   FErrorCode := NWDSFreeBuf(Buffer);
   FErrorString := CheckNWCError('NWDSFreeBuf',FErrorCode);
end;

{ Attribute }

procedure TLUNWC.LUNWDSPutAttrName(Buffer: pBuf_T; AttrName: string);
begin
   FErrorCode := NWDSPutAttrName(FContextHandle, Buffer, pnstr8(AttrName));
   FErrorString := CheckNWCError('NWDSPutAttrName',FErrorCode);
end;

function TLUNWC.LUNWDSGetAttrCount(Buffer: pBuf_T): nuint32;
begin
   FErrorCode := NWDSGetAttrCount(FContextHandle, Buffer, @Result);
   FErrorString := CheckNWCError('NWDSGetAttrCount',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetAttrName(Buffer: pBuf_T; AttrName: pnstr8;
                                   var AttrValCount, SyntaxID : nuint32);
begin
   FErrorCode := NWDSGetAttrName(FContextHandle,
                                 Buffer, AttrName, @AttrValCount, @SyntaxID);
   FErrorString := CheckNWCError('NWDSGetAttrName',FErrorCode);
end;

function TLUNWC.LUNWDSComputeAttrValSize(Buffer: pBuf_T; SyntaxID : nuint32): nuint32;
begin
   FErrorCode := NWDSComputeAttrValSize(FContextHandle,
                                        Buffer, SyntaxID, @Result);
   FErrorString := CheckNWCError('NWDSComputeAttrValSize',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetAttrVal(Buffer: pBuf_T; SyntaxID : nuint32; Value: nptr);
begin
   FErrorCode := NWDSGetAttrVal(FContextHandle, Buffer, SyntaxID, Value);
   FErrorString := CheckNWCError('NWDSGetAttrVal',FErrorCode);
end;

procedure TLUNWC.LUNWDSPutAttrVal(Buffer: pBuf_T; SyntaxID : nuint32; Value: nptr);
begin
   FErrorCode := NWDSPutAttrVal(FContextHandle, Buffer, SyntaxID, Value);
   FErrorString := CheckNWCError('NWDSPutAttrVal',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetAttrValFlags(Buffer: pBuf_T; Flags: nuint32);
begin
//   FErrorCode := NWDSGetAttrValFlags(FContextHandle, Buffer, @Flags);
//   FErrorString := CheckNWCError('NWDSGetAttrValFlags',FErrorCode);
end;

procedure TLUNWC.LUNWDSReadAttrDef(InfoType: nuint32;
                     AllAttrs: nbool8;
                     var IterationHandle: nint32;
                     INBuffer: pBuf_T; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSReadAttrDef(FContextHandle,
                                 InfoType, AllAttrs, InBuffer,
                                 @IterationHandle, OutBuffer);
   FErrorString := CheckNWCError('NWDSReadAttrDef',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetAttrDef(Buffer: pBuf_T; AttrName: pnstr8; AttrInfo: PAttr_Info_T);
begin
   FErrorCode := NWDSGetAttrDef(FContextHandle,
                                Buffer, AttrName, AttrInfo);
   FErrorString := CheckNWCError('NWDSGetAttrDef',FErrorCode);
end;

procedure TLUNWC.LUNWDSReadSyntaxes(InfoType: nuint32; AllSyntaxes: nbool8;
                     var IterationHandle: nint32;
                     INBuffer: pBuf_T; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSReadSyntaxes(FContextHandle,
                                  InfoType, AllSyntaxes, InBuffer,
                                  @IterationHandle, OutBuffer);
   FErrorString := CheckNWCError('NWDSReadSyntaxes',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetSyntaxDef(Buffer: pBuf_T; SyntaxName: pnstr8; SyntaxInfo: PSyntax_Info_T);
begin
   FErrorCode := NWDSGetSyntaxDef(FContextHandle,
                                  Buffer, SyntaxName, SyntaxInfo);
   FErrorString := CheckNWCError('NWDSGetSyntaxDef',FErrorCode);
end;

function  TLUNWC.LUNWDSGetSyntaxCount(Buffer: pBuf_T): nuint32;
begin
   FErrorCode := NWDSGetSyntaxCount(FContextHandle, Buffer, @Result);
   FErrorString := CheckNWCError('NWDSGetSyntaxCount',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetSyntaxID(AttrName: string; var SyntaxID: nuint32);
begin
   FErrorCode := NWDSGetSyntaxID(FContextHandle, PNstr8(AttrName), @SyntaxID);
   FErrorString := CheckNWCError('NWDSGetSyntaxID',FErrorCode);
end;

function TLUNWC.LUNWDSCompare (ObjectName: string; Buffer: pBuf_T): Boolean;
var
   Matched : nbool8;
begin
   Matched := 1;
   FErrorCode := NWDSCompare(FContextHandle, PNstr8(ObjectName), Buffer, @Matched);
   FErrorString := CheckNWCError('NWDSCompare',FErrorCode);
   if Matched = 0 then Result := True
                  else Result := False;
end;

{ Object }

procedure TLUNWC.LUNWDSGetObjectName(Buffer: pBuf_T; ObjectName: pnstr8;
                                   var AttrCount: nuint32; var ObjectInfo: Object_Info_T);
begin
   FErrorCode := NWDSGetObjectName(FContextHandle,
                                   Buffer, ObjectName, @AttrCount, @ObjectInfo);
   FErrorString := CheckNWCError('NWDSGetObjectName',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetObjectNameAndInfo(Buffer: pBuf_T; ObjectName: pnstr8;
                               var AttrCount: nuint32; var ObjectInfo: ppnstr8);
begin
(*
   FErrorCode := NWDSGetObjectNameAndInfo(FContextHandle,
                                   Buffer, ObjectName, @AttrCount, @ObjectInfo);
   FErrorString := CheckNWCError('NWDSGetObjectNameAndInfo',FErrorCode);
*)
end;

function TLUNWC.LUNWDSGetObjectCount(Buffer: pBuf_T): nuint32;
begin
   FErrorCode := NWDSGetObjectCount(FContextHandle, Buffer, @Result);
   FErrorString := CheckNWCError('NWDSGetObjectCount',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetObjectHostServerAddress(ObjectName: string; Buffer: pBuf_T; ServerName: pnstr8);
begin
   FErrorCode := NWDSGetObjectHostServerAddress(FContextHandle,
                                   PNstr8(ObjectName), ServerName, Buffer);
   FErrorString := CheckNWCError('NWDSGetObjectNameHostServerAddress',FErrorCode);
end;

procedure TLUNWC.LUNWDSListAttrsEffectiveRights(ObjectName, SubjectName: string; AllAttrs: nbool8;
                     var IterationHandle: nint32;
                     INBuffer: pBuf_T; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSListAttrsEffectiveRights(FContextHandle,
                                 PNstr8(ObjectName), PNstr8(SubjectName),
                                 AllAttrs, InBuffer,
                                 @IterationHandle, OutBuffer);
   FErrorString := CheckNWCError('NWDSListAttrsEffectiveRights',FErrorCode);
end;

{ Classes }

procedure TLUNWC.LUNWDSListContainableClasses(ObjectName: string;
                                  var IterationHandle: nint32; Buffer: pBuf_T);
begin
   FErrorCode := NWDSListContainableClasses(FContextHandle,
                                            pnstr8(ObjectName),
                                            @IterationHandle,  Buffer);
   FErrorString := CheckNWCError('NWDSListContainableClasses',FErrorCode);
end;

procedure TLUNWC.LUNWDSListByClassAndName(ObjectName,ClassName,SubOrdinateName: string;
                              var IterationHandle: nint32; Buffer: pBuf_T);
begin
   FErrorCode := NWDSListByClassAndName(FContextHandle,
                                        pnstr8(ObjectName),pnstr8(ClassName),pnstr8(SubOrdinateName),
                                        @IterationHandle,  Buffer);
   FErrorString := CheckNWCError('NWDSListByClassAndName',FErrorCode);
end;

function TLUNWC.LUNWDSGetClassItemCount(Buffer: pBuf_T): nuint32;
begin
   FErrorCode := NWDSGetClassItemCount(FContextHandle, Buffer, @Result);
   FErrorString := CheckNWCError('NWDSGetClassItemCount',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetClassItem(Buffer: pBuf_T; ItemName: pnstr8);
begin
   FErrorCode := NWDSGetClassItem(FContextHandle, Buffer, ItemName);
   FErrorString := CheckNWCError('NWDSGetClassItem',FErrorCode);
end;

function TLUNWC.LUNWDSGetClassDefCount(Buffer: pBuf_T): nuint32;
begin
   FErrorCode := NWDSGetClassDefCount(FContextHandle, Buffer, @Result);
   FErrorString := CheckNWCError('NWDSGetClassDefCount',FErrorCode);
end;

procedure TLUNWC.LUNWDSReadClassDef(InfoType: nuint32; AllClasses: nbool8;
                         var IterationHandle: nint32;
                         INBuffer: pBuf_T; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSReadClassDef(FContextHandle,
                                  InfoType, AllClasses, InBuffer,
                                  @IterationHandle, OutBuffer);
   FErrorString := CheckNWCError('NWDSReadClassDef',FErrorCode);
end;

procedure TLUNWC.LUNWDSGetClassDef(Buffer: pBuf_T; AClassName: pnstr8; AClassInfo: PClass_Info_T);
begin
   FErrorCode := NWDSGetClassDef(FContextHandle, Buffer, AClassName, AClassInfo);
   FErrorString := CheckNWCError('NWDSGetClassDef',FErrorCode);
end;

{ }

procedure TLUNWC.LUNWDSRead(ObjectName: string; InfoType: nuint32; AllAttrs: nbool8;
                            var IterationHandle: nint32;
                            INBuffer: pBuf_T; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSRead(FContextHandle,
                          pnstr8(ObjectName), InfoType,
                          AllAttrs, InBuffer,
                          @IterationHandle, OutBuffer);
   FErrorString := CheckNWCError('NWDSRead',FErrorCode);
end;

procedure TLUNWC.LUNWDSList(ObjectName: string;
                            var IterationHandle: nint32; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSList(FContextHandle, pnstr8(ObjectName), @IterationHandle, OutBuffer);
   FErrorString := CheckNWCError('NWDSList',FErrorCode);
end;

procedure TLUNWC.LUNWDSExtSyncList(ObjectName,ClassName,SubordinateName: string;
                         var IterationHandle: nint32; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSExtSyncList(FContextHandle,
                                 pnstr8(ObjectName),pnstr8(ClassName),pnstr8(SubordinateName),
                                 @IterationHandle, nil, FALSE, OutBuffer);
   FErrorString := CheckNWCError('NWDSExtSyncList',FErrorCode);
end;

procedure TLUNWC.LUNWDSExtSyncRead(ObjectName: string; InfoType: nuint32; AllAttrs: nbool8;
                            var IterationHandle: nint32; TimeStamp: TimeStamp_T;
                            INBuffer: pBuf_T; OUTBuffer: pBuf_T);
begin
   FErrorCode := NWDSExtSyncRead(FContextHandle,
                                 pnstr8(ObjectName), InfoType, AllAttrs, InBuffer,
                                 @IterationHandle, @TimeStamp, OutBuffer);
   FErrorString := CheckNWCError('NWDSExtSyncRead',FErrorCode);
end;

procedure TLUNWC.LUNWDSCloseIteration( Operation: nuint32; IterationHandle: nuint32);
begin
   FErrorCode := NWDSCloseIteration(FContextHandle, IterationHandle, Operation);
   FErrorString := CheckNWCError('NWDSCloseIteration',FErrorCode);
end;

{ }

procedure TLUNWC.LUNWDSWhoAmI(UserNameBuffer: pnstr8);
begin
   FErrorCode := NWDSWhoAmI(FContextHandle, UserNameBuffer);
   FErrorString := CheckNWCError('NWDSWhoAmI',FErrorCode);
end;

{ Public}

procedure TLUNWC.CallsInit;
begin
   LUNWCallsInit;
   LUNWLlocaleconv;
   LUNWInitUnicodeTables;
   LUNWDSCreateContextHandle;
end;

procedure TLUNWC.CallsTerm;
begin
   LUNWFreeUnicodeTables;
   LUNWDSFreeContext;
   LUNWCallsTerm;
end;

function TLUNWC.WhoAmI: string;
var
   Data: pnstr8;
begin
   Result := '';
   Data := nil;
   try
      Data := AllocMem(MAX_DN_BYTES+1);
      LUNWDSWhoAmI (Data);
      Result := StrPas(PChar(Data));
   finally
      if Assigned(Data) then FreeMem (Data);
   end;
end;

(*
function TLUNWC.IsDSAuthenticated: NWCCode;
begin
   Result := LUNWIsDSAuthenticated;
end;
*)
procedure TLUNWC.Login(UserName, Password: string);
begin
   LUNWDSLogin(UserName, Password);
end;

procedure TLUNWC.SetContextName(ContextName: string);
begin
   LUNWDSSetContext(DCK_NAME_CONTEXT, PChar(ContextName));
end;

function TLUNWC.GetContextName: string;
var
   Data: PChar;
begin
   { ContextName }
   Data := nil;
   Result := '';
   try
      Data := StrAlloc(MAX_DN_CHARS+1);
      LUNWDSGetContext(DCK_NAME_CONTEXT, Data);
      Result := StrPas(Data);
   finally
      if Assigned(Data) then StrDispose(Data);
   end;
end;

function TLUNWC.GetTreeName: string;
var
   Data: PChar;
begin
   { TreeName }
   Data := nil;
   Result := '';
   try
      Data := StrAlloc(MAX_DN_CHARS+1);
      LUNWDSGetContext(DCK_TREE_NAME, Data);
      Result := StrPas(Data);
   finally
      if Assigned(Data) then StrDispose(Data);
   end;
end;

function TLUNWC.GetFlags: nuint32;
begin
   { Flags }
   LUNWDSGetContext(DCK_FLAGS, @Result);
end;

procedure TLUNWC.SetFlags(Flags: nuint32);
begin
   LUNWDSSetContext(DCK_FLAGS, @Flags);
end;

procedure TLUNWC.ReadNDSInfo;
var
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   Data: PChar;
//   Data : nptr;
begin
   OutBuffer := nil;
   Data := nil;
   try
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      LUNWDSReadNDSInfo(DSPING_SUPPORTED_FIELDS or DSPING_OS_NAME, OutBuffer);
      Data := StrAlloc(MAX_DN_CHARS+1);
//      Data := AllocMem (SizeOf(nuint32));
      LUNWDSGetNDSInfo(DSPING_OS_NAME, OutBuffer, Data);
   finally
      if Assigned(Data) then StrDispose (Data);
//      if Assigned(Data) then FreeMem (Data);
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
   end;
end;

function TLUNWC.IsDSAuthenticated: Boolean;
begin
   Result := False;
   if LUNWIsDSAuthenticated = NWCC_AUTHENT_STATE_BIND then Result := True;
end;

function TLUNWC.GetNameClasses(ObjectName: string): TStringList;
var
   j: nuint32;
   AttrCount : nuint32;
   AttrName: pnstr8;
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   IterationHandle: nint32;
begin
   FListNames.Clear;
   OutBuffer := nil;
   AttrName := nil;
   try
      AttrName := AllocMemNameObject;
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         LUNWDSListContainableClasses(ObjectName, IterationHandle, OutBuffer);
         AttrCount := LUNWDSGetClassItemCount(OutBuffer);
         for j := 1 to AttrCount do begin
            LUNWDSGetClassItem(OutBuffer, AttrName);
            FListNames.Add (StrPas(PChar(AttrName)));
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(AttrName) then FreeMem (AttrName);
   end;
   Result := FListNames;
end;

function TLUNWC.GetClassesDef: TStringList;
var
   j: nuint32;
   AttrCount : nuint32;
   AttrName: pnstr8;
   InBuffer: pBuf_T;
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   IterationHandle: nint32;
   ClassInfo: Class_Info_T;
begin
   FListNames.Clear;
   InBuffer := nil;
   OutBuffer := nil;
   AttrName := nil;
   try
      AttrName := AllocMemNameObject;
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         LUNWDSReadClassDef(DS_CLASS_DEF_NAMES, N_TRUE, IterationHandle, InBuffer, OutBuffer);
         AttrCount := LUNWDSGetClassDEfCount(OutBuffer);
         for j := 1 to AttrCount do begin
            LUNWDSGetClassDef(OutBuffer, AttrName, @ClassInfo);
            FListNames.Add (StrPas(PChar(AttrName)));
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(AttrName) then FreeMem (AttrName);
   end;
   Result := FListNames;
end;

function TLUNWC.GetAttrsDef: TStringList;
var
   i,j: nuint32;
   AttrCount : nuint32;
   AttrName: pnstr8;
   InBuffer: pBuf_T;
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   IterationHandle: nint32;
   AttrInfo: Attr_Info_T;
   AttrValCount: nuint32;
   AttrVal: nptr;
   AttrValSize: nuint32;
   SyntaxID: nuint32;
begin
   FListNames.Clear;
   InBuffer := nil;
   OutBuffer := nil;
   AttrName := nil;
   try
      AttrName := AllocMemNameObject;
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         LUNWDSReadAttrDef(DS_ATTR_DEFS, N_TRUE, IterationHandle, InBuffer, OutBuffer);
         AttrCount := LUNWDSGetAttrCount(OutBuffer);
         for j := 1 to AttrCount do begin
            LUNWDSGetAttrDef(OutBuffer, AttrName, @AttrInfo);
            FListNames.Add (StrPas(PChar(AttrName)));
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(AttrName) then FreeMem (AttrName);
   end;
   Result := FListNames;
end;

function TLUNWC.GetSyntaxesDef: TStringList;
var
   j: nuint32;
   AttrCount : nuint32;
   AttrName: pnstr8;
   InBuffer: pBuf_T;
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   IterationHandle: nint32;
   SyntaxInfo: Syntax_Info_T;
begin
   FListNames.Clear;
   InBuffer := nil;
   OutBuffer := nil;
   AttrName := nil;
   try
      AttrName := AllocMemNameObject;
   //   { IN  buffer }
   //   InBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
   //   LUNWDSInitBuf(InBuffer, DSV_READ);
   //   LUNWDSPutAttrName(InBuffer, 'Group Membership');
      { OUT buffer }
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         LUNWDSReadSyntaxes(DS_SYNTAX_DEFS, N_TRUE, IterationHandle, InBuffer, OutBuffer);
         AttrCount := LUNWDSGetSyntaxCount(OutBuffer);
         for j := 1 to AttrCount do begin
            LUNWDSGetSyntaxDef(OutBuffer, AttrName, @SyntaxInfo);
            FListNames.Add (StrPas(PChar(AttrName)));
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(AttrName) then FreeMem (AttrName);
   end;
   Result := FListNames;
end;

function TLUNWC.GetExtSyncList(ObjectName, ClassName, SubordinateName: string): TStringList;
var
   j: nuint32;
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   IterationHandle: nint32;
   ObjectCount: nuint32;
   ObjectName1: pnstr8;
   ObjectInfo: Object_Info_T;
   ObjectValCount: nuint32;
begin
   FListNames.Clear;
   OutBuffer := nil;
   ObjectName1 := nil;
   try
      ObjectName1 := AllocMemNameObject;
      { OUT buffer }
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         LUNWDSExtSyncList(ObjectName, ClassName, SubordinateName, IterationHandle, OutBuffer);
         ObjectCount := LUNWDSGetObjectCount(OutBuffer);
         for j := 1 to ObjectCount do begin
            LUNWDSGetObjectName(OutBuffer, ObjectName1, ObjectValCount, ObjectInfo);
            FListNames.Add (StrPas(PChar(ObjectName1)));
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(ObjectName1) then FreeMem (ObjectName1);
   end;
   Result := FListNames;
end;

function TLUNWC.GetExtSyncRead(ObjectName: string): TStringList;
var
   j: nuint32;
   i: nuint32;
   AttrCount : nuint32;
   AttrValCount: nuint32;
   AttrVal: nptr;
   AttrValSize: nuint32;
   AttrName: pnstr8;
   InBuffer: pBuf_T;                     // "Input" (Request) buffer
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   SyntaxID: nuint32;
   IterationHandle: nint32;
   TimeStamp: TimeStamp_T;
begin
   FListNames.Clear;
   OutBuffer := nil;
   InBuffer := nil;
   AttrName := nil;
   AttrVal := nil;
   try
      AttrName := AllocMemNameObject;
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
//      InBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
//      LUNWDSInitBuf (InBuffer, DSV_READ);
//      LUNWDSPutAttrName (InBuffer, 'Group Membership');
      IterationHandle := NO_MORE_ITERATIONS;
      with TimeStamp do begin
         eventID := 0;
         replicaNum := 0;
         wholeSeconds := 0;
      end;
      repeat
         LUNWDSExtSyncRead (ObjectName, DS_ATTRIBUTE_VALUES, N_TRUE, IterationHandle, TimeStamp, InBuffer, OutBuffer);
         AttrCount := LUNWDSGetObjectCount (OutBuffer);
         for j := 1 to AttrCount do begin
            LUNWDSGetAttrName(OutBuffer, AttrName, AttrValCount, SyntaxID);
            for i := 1 to AttrValCount do begin
               AttrValSize := LUNWDSComputeAttrValSize(OutBuffer, SyntaxID);
               AttrVal := AllocMem (AttrValSize);
               LUNWDSGetAttrVal (OutBuffer, SyntaxID, AttrVal);
               FListNames.Add (StrPas(PChar(AttrName))+'='+StrPas(AttrVal));
               FreeMem (AttrVal);
               AttrVal := nil;
            end;
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(InBuffer) then LUNWDSFreeBuf (InBuffer);
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(AttrName) then FreeMem (AttrName);
      if Assigned(AttrVal) then FreeMem (AttrVal);
   end;
   Result := FListNames;
end;


function TLUNWC.GetSyntaxID(AttrName: string): nuint32;
begin
   LUNWDSGetSyntaxID (AttrName, Result);
end;

function  TLUNWC.GetListNames(Command: TListCommand; const Names: array of string): TStringList;
var
   i,j: nuint32;
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   IterationHandle: nint32;
   ObjectCount: nuint32;
   ObjectName: pnstr8;
   ObjectInfo: Object_Info_T;
   ObjectValCount: nuint32;
begin
   FListNames.Clear;
   OutBuffer := nil;
   ObjectName := nil;
   try
      ObjectName := AllocMemNameObject;
      { OUT buffer }
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         case Command of
            lcList: begin
               LUNWDSList(Names[0],IterationHandle,OutBuffer);
            end;
            lcExtSyncList: begin
               LUNWDSExtSyncList(Names[0],Names[1],Names[2],IterationHandle,OutBuffer);
            end;
            lcListByClassAndName: begin
               LUNWDSListByClassAndName(Names[0],Names[1],Names[2],IterationHandle,OutBuffer);
            end;
         end;
         ObjectCount := LUNWDSGetObjectCount(OutBuffer);
         for j:=1 to ObjectCount do begin
            LUNWDSGetObjectName(OutBuffer, ObjectName, ObjectValCount, ObjectInfo);
            FListNames.Add (StrPas(PChar(ObjectName)));
            for i:=1 to ObjectValCount do begin
               FListNames.Add (IntToStr(i));
            end;
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(ObjectName) then FreeMem (ObjectName);
   end;
   Result := FListNames;
end;

function TLUNWC.GetReadNames(Command: TReadCommand;
         const Names: array of string; const AttrNames: array of string): TStringList;
var
   j: nuint32;
   i: nuint32;
   AttrCount : nuint32;
   AttrValCount: nuint32;
   AttrVal: nptr;
   AttrValSize: nuint32;
   AttrName: pnstr8;
   ServerName: pnstr8;
   AllAttrs: nbool8;
   InBuffer: pBuf_T;                     // "Input" (Request) buffer
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   SyntaxID: nuint32;
   IterationHandle: nint32;
   TimeStamp: TimeStamp_T;
begin
   FListNames.Clear;
   OutBuffer := nil;
   InBuffer := nil;
   AttrName := nil;
   AttrVal := nil;
   try
      AttrName := AllocMemNameObject;
      ServerName := AllocMemNameObject;
      OutBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      InBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      LUNWDSInitBuf (InBuffer, DSV_READ);
      AllAttrs := N_TRUE;
      for i:=Low(AttrNames) to High(AttrNames) do begin
         if Trim(AttrNames[i]) <> '' then begin
            LUNWDSPutAttrName (InBuffer, Trim(AttrNames[i]));
            AllAttrs := N_FALSE;
         end;
      end;
      IterationHandle := NO_MORE_ITERATIONS;
      repeat
         case Command of
            rcRead: begin
               LUNWDSRead (Names[0], DS_ATTRIBUTE_VALUES, AllAttrs, IterationHandle, InBuffer, OutBuffer);
            end;
            rcGetObjectHostServerAddress: begin
               LUNWDSGetObjectHostServerAddress (Names[0], OutBuffer, ServerName);
            end;
            rcListAttrsEffectiveRights: begin
               LUNWDSListAttrsEffectiveRights (Names[0],Names[1], AllAttrs, IterationHandle, InBuffer, OutBuffer);
            end;
         end;
         AttrCount := LUNWDSGetAttrCount (OutBuffer);
         for j := 1 to AttrCount do begin
            {}
            LUNWDSGetAttrName(OutBuffer, AttrName, AttrValCount, SyntaxID);
            for i := 1 to AttrValCount do begin
               AttrValSize := LUNWDSComputeAttrValSize(OutBuffer, SyntaxID);
               AttrVal := AllocMem (AttrValSize);
               LUNWDSGetAttrVal (OutBuffer, SyntaxID, AttrVal);
               FListNames.Add (StrPas(PChar(AttrName))+'='+StrPas(AttrVal));
               FreeMem (AttrVal);
               AttrVal := nil;
            end;
         end;
      until (IterationHandle = nint32(NO_MORE_ITERATIONS));
   finally
      if Assigned(InBuffer) then LUNWDSFreeBuf (InBuffer);
      if Assigned(OutBuffer) then LUNWDSFreeBuf (OutBuffer);
      if Assigned(AttrName) then FreeMem (AttrName);
      if Assigned(ServerName) then FreeMem (ServerName);
      if Assigned(AttrVal) then FreeMem (AttrVal);
   end;
   Result := FListNames;
end;

function TLUNWC.CanonName (ObjectName: string): string;
var
   CName: pnstr8;
begin
   Result := '';
   try
      CName := AllocMemNameObject;
      LUNWDSCanonicalizeName(ObjectName, CName);
   finally
      Result := StrPas(PChar(CName));
      if Assigned(CName) then FreeMem (CName);
   end;
end;

procedure TLUNWC.ChangeNTObjectPassword
       (ObjectName, OldPassword, NewPassword: string);
begin
   LUNWDSChangeObjectPassword(NT_PASSWORD, ObjectName, OldPassword, NewPassword);
end;

procedure TLUNWC.ChangeNDSObjectPassword
       (ObjectName, OldPassword, NewPassword: string);
begin
   LUNWDSChangeObjectPassword(NDS_PASSWORD, ObjectName, OldPassword, NewPassword);
end;

function TLUNWC.StringsMatch(String1, String2: string): Integer;
begin
   Result := LUNWDSCIStringsMatch(String1, String2);
end;

function TLUNWC.Compare(ObjectName: string;
         const AttrNames: array of string; const AttrValues: array of string): Boolean;
var
   j: nuint32;
   i: nuint32;
   AttrCount : nuint32;
   AttrValCount: nuint32;
   AttrVal: nptr;
   AttrValSize: nuint32;
   AttrName: pnstr8;
   ServerName: pnstr8;
   AllAttrs: nbool8;
   InBuffer: pBuf_T;                     // "Input" (Request) buffer
   OutBuffer: pBuf_T;                    // "Output" (Results) buffer
   SyntaxID: nuint32;
   IterationHandle: nint32;
   TimeStamp: TimeStamp_T;
begin
(*
   InBuffer := nil;
   try
      InBuffer := LUNWDSAllocBuf(DEFAULT_MESSAGE_LEN);
      LUNWDSInitBuf (InBuffer, DSV_COMPARE);
      for i:=Low(AttrNames) to High(AttrNames) do begin
         if Trim(AttrNames[i]) <> '' then begin
            LUNWDSPutAttrName (InBuffer, Trim(AttrNames[i]));

            AttrValSize := LUNWDSComputeAttrValSize(OutBuffer, SyntaxID);
            AttrVal := AllocMem (AttrValSize);
            LUNWDSPutAttrVal  (InBuffer, SyntaxID, Trim(AttrValues[i]));
         end;
      end;
      Result := LUNWDSCompare (ObjectName, InBuffer);
   finally
      if Assigned(InBuffer) then LUNWDSFreeBuf (InBuffer);
   end;
*)   
end;

end.
