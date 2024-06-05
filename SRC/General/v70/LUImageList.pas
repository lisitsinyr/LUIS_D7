unit LUImageList;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ShellAPI, Graphics,
  ImgList;

type
  TShellImageList = class(TImageList)
  private
    { Private declarations }
    procedure   LinkToShell(ImgType : DWORD);
  protected
    { Protected declarations }
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent); override;
    constructor CreateLargeList;
    constructor CreateSmallList;
  published
    { Published declarations }
  end;

function  GetFileIcon(const FileName : string; LargeIcon : boolean) : Integer;

//procedure Register;

implementation

(*
procedure Register;
begin
  RegisterComponents('Luis', [TLUImageList]);
end;

constructor TLUImageList.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   ShareImages := True;
   Handle := ShellGetSystemImageList(ptsizLarge);
end;
*)
{
   �������� �������� ��������� : � ������� ���������� ���������, ���, �� �������
   ���� ��� Win95, ������������� ����� ����� �� �����������. ����� ��������
   GetFileIcon('NonExistFileName.txt', False) � ����������� �������� ������,
   ��������������� � ��������� ������ 8-)
}
function  GetFileIcon(const FileName : string; LargeIcon : boolean) : Integer;
var
   fext, aName : string;
   sfi: TSHFileInfo;
   flags: integer;
   shFlags: integer;
begin
   aName := ExtractFileName(FileName);
   Flags := FILE_ATTRIBUTE_NORMAL;
   shFlags := SHGFI_USEFILEATTRIBUTES;
   if aName ='' then begin                        // it's a folder or a drive
      Flags := Flags or FILE_ATTRIBUTE_DIRECTORY;
      fext  := '$FOLDER';
      aName := '$FOLDER$';  // bogus name
      if (Length(FileName) = 3) and (Pos(':\', FileName) = 2) then begin
         //it's a drive
         fext := FileName;   aName := FileName;
         shFlags := 0;
      end;
      end
   else
      fext := ExtractFileExt(FileName);
   SHGetFileInfo(PChar(aName), Flags, sfi, sizeof(sfi),
                 SHGFI_DISPLAYNAME or SHGFI_ICON or SHGFI_TYPENAME
                 or SHGFI_SYSICONINDEX or SHGFI_DISPLAYNAME or shFlags);
   (*
   Result := TIcon.Create;
   if LagreIcon then LargeShellImageList.GetIcon(sfi.iIcon, Result)
                else SmallShellImageList.GetIcon(sfi.iIcon, Result);
   *)
   Result := sfi.iIcon
end;

procedure TShellImageList.LinkToShell(ImgType : DWORD);
var
   sfi   : TSHFileInfo;
begin
   Handle := SHGetFileInfo('', 0, sfi, SizeOf(TSHFileInfo),
                                      SHGFI_SYSICONINDEX or ImgType);
   ShareImages  := TRUE;
   BlendColor   := clHighlight;
   DrawingStyle := dsTransparent;
end;

constructor TShellImageList.CreateLargeList;
begin
   inherited CreateSize(32, 32);
   ShareImages := True;
   LinkToShell(SHGFI_LARGEICON);
end;

constructor TShellImageList.CreateSmallList;
begin
   inherited CreateSize(16, 16);
   ShareImages := True;
   LinkToShell(SHGFI_SMALLICON);
end;

end.
