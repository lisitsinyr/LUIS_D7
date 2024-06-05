unit PrintDialogEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtDlgs, extctrls, stdctrls, CommDlg, Dlgs;

type
 { TPrintDialogEx }
  TPrintDialogEx = class(TPrintDialog)
  private
    FExtendedPanel: TPanel;
    FComboBox: TComboBox;
    FComboBoxVisible: Boolean;
    FComboBoxEnabled: Boolean;
    FComboBoxItem: TStringlist;
    FComboBoxIndex: Integer;
    procedure FComboBoxChange(Sender: TObject);
    procedure SetComboBoxItem(const Value: TStringList);
  protected
    procedure DoShow; override;
    function GetStaticRect: TRect;
    function TaskModalDialog(DialogFunc: Pointer; var DialogData): Bool; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ComboBoxIndex: Integer read FComboBoxIndex;
  published
    property ComboBoxVisible: Boolean read FComboBoxVisible write FComboBoxVisible;
    property ComboBoxEnabled: Boolean read FComboBoxEnabled write FComboBoxEnabled;
    property ComboBoxItem: TStringlist read FComboBoxItem write SetComboBoxItem;
  end;

procedure Register;

implementation

constructor TPrintDialogEx.Create(AOwner: TComponent);
begin
  inherited;
  FComboBoxVisible := True;
  FComboBoxEnabled := True;
  FComboBoxItem := TStringlist.Create;
  FComboBoxItem.Add('All Pages');
  FComboBoxItem.Add('Odd Pages');
  FComboBoxItem.Add('Even Pages');
  FExtendedPanel := TPanel.Create(self);
  with fExtendedPanel do
  begin
    Name := 'ExtendedPanel';
    Caption := '';
    SetBounds(0, 0, 169, 200);  // (204, 5, 169, 200);
    BevelOuter := bvNone;
    BorderWidth := 6;
    TabOrder := 1;
    FComboBox := TComboBox.Create(self);
    with FComboBox do
    begin
      Name := 'ComboBox1';
      Text := '';
      SetBounds( 2, 7, 180, 28 );
      Style := csDropDownList;
      Parent := FExtendedPanel;
    end;
  end;
  FComboBoxIndex := 0;
end;

destructor TPrintDialogEx.Destroy;
begin
  FComboBoxItem.Free;
  FExtendedPanel.Free;
  inherited;
end;

procedure TPrintDialogEx.DoShow;
var
  PreviewRect, StaticRect: TRect;
begin
  { Set preview area to entire dialog }
  GetClientRect(Handle, PreviewRect);
  StaticRect := GetStaticRect;
  { Move extended area to right of static area }
  PreviewRect.Left := StaticRect.Left;
  PreviewRect.Top  := StaticRect.Bottom;
  Inc(PreviewRect.Top, 4);
  fExtendedPanel.BoundsRect := PreviewRect;
  fExtendedPanel.ParentWindow := Handle;
  FComboBox.Items.Assign(FComboBoxItem);
  with FComboBox do begin
    Enabled := FComboBoxEnabled;
    Visible := FComboBoxVisible;
    try
      ItemIndex := FComboBoxIndex;
    except on Exception do
      ItemIndex := 0;
    end;    
    OnChange := FComboBoxChange;
  end;  
  inherited DoShow;
end;

procedure TPrintDialogEx.FComboBoxChange(Sender: TObject);
begin
  FComboBoxIndex := FComboBox.ItemIndex;
end;

function TPrintDialogEx.GetStaticRect: TRect;
begin
  if Handle <> 0 then
  begin
      GetWindowRect(GetDlgItem(Handle, grp1), Result); // print range group box
      MapWindowPoints(0, Handle, Result, 2);
  end
  else Result := Rect(0,0,0,0)
end;

procedure TPrintDialogEx.SetComboBoxItem(const Value: TStringList);
begin
  if Assigned(FComboBoxItem)
    then FComboBoxItem.Assign(Value)
    else FComboBoxItem := Value;
end;

function TPrintDialogEx.TaskModalDialog(DialogFunc: Pointer;
  var DialogData): Bool;
begin
  TPrintDlg(DialogData).Flags := TPrintDlg(DialogData).Flags or
PD_ENABLESETUPTEMPLATE;
  TPrintDlg(DialogData).lpSetupTemplateName := Template;
  result := inherited TaskModalDialog(DialogFunc, DialogData);
end;

procedure Register;
begin
  RegisterComponents('LS', [TPrintDialogEx]);
end;
 { TPrintDialogEx }

end.
