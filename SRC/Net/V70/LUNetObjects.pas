unit LUNetObjects;

interface

uses Classes, SysUtils;

(* Novell Netware
00 +    Unknown
           AttrName: pnstr8
           SyntaxID: nuint32
           ValueLen: nuint32
           Value: nptr
01      Distinguished Name
02      Case Exact String
03      Case Ignore String
           s: pnstr8
04      Printable String
05      Numeric String
06 +    Case Ignore List
           Next: pCI_List_T
           s: pnstr8
07      Boolean
08      Integer
09 +    Octet String
           Length: nuint32
           Data: pnuint8
10 +    Telephone Number
           TelephonNumber: pnstr8
           Parameters: Bit_string_t
              NumOfBits: nuint32
              Data: pnuint32
11 +    Facsimile Telephone Number
           TelephonNumber: pnstr8
           Parameters: Bit_string_t
              NumOfBits: nuint32
              Data: pnuint8
12 +    Net Address
           AddressType: nuint32
           AddressLength: nuint32
           Address: pnuint8
13 +    Octet List
           Next: POctet_List_T
           Length: nuint32
           Data: pnuint8
14 +    EMail Address
           Type: nuint32
           Address: pnstr8
15 +    Path
           NameSpaceType: nuint32
           Volumename: pnstr8
           Path: pnstr8
16 +    Replica Pointer
           ServerName: pnstr8
           ReplicaType: nint32
           ReplicaNumber: nint32
           Count: nuint32
           ReplicaAddressHint: array[0...0] of Net_address_T
17 +    Attribute ACL
           ProtectedAttrName: pnstr8
           SubjectName: pnstr8
           Privileges: nuint32
18      Postal Address
19 +    Timestamp
           WholeSeconds: nuint32
           EventID: nuint32
20      Class Name
21      Stream
22      Counter
23 +    Back Link
           RemoteID: nuint32
           ObjectName: pnstr8
24      Time
25 +    Typed Name
           ObjectName: pnstr8
           Level: nuint32
           Interval: nuint32
26 +    Hold
           ObjectName: pnstr8
           Amount: nuint32
27      Interval
*)


type
   TCustomAttribute = class(TCollectionItem)
   private
      FSyntax : Integer;
      FAttributeName : PChar;
      FData : Pointer;
      FDataSize : Integer;
      function GetAttributeName: string;
      procedure SetAttributeName(Value: string);
   public
      constructor Create(Collection: TCollection); override;
      destructor Destroy; override;
      property Syntax : Integer read FSyntax write FSyntax;
      property AttributeName : string read GetAttributeName write SetAttributeName;
      property Data: Pointer read FData write FData;
      property DataSize : Integer read FDataSize write FDataSize;
   end;

implementation

{ TCustomAttribute }

constructor TCustomAttribute.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   FSyntax := -1;
   AttributeName := '';
   Data := nil;
end;

destructor TCustomAttribute.Destroy;
begin
   if FAttributeName <> nil then StrDispose(FAttributeName);
   if FData <> nil then FreeMem(FData);
   inherited Destroy;
end;

function TCustomAttribute.GetAttributeName: string;
begin
   Result := StrPas(FAttributeName);
end;

procedure TCustomAttribute.SetAttributeName(Value: string);
begin
   if FAttributeName <> nil then StrDispose(FAttributeName);
   FAttributeName := StrAlloc(Length(Value)+1);
   StrPCopy(FAttributeName, Value);
end;

end.
