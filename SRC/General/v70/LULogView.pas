{=======================================================}
{ Project:                                              }
{         Delphi VCL Extensions (LU)                    }
{         Copyright (c) 2000 Central Bank Of Russia     }
{ Subject:                                              }
{         Просмотр журнала                              }
{ Author:                                               }
{         Lisitsin Y.R.                                 }
{=======================================================}

unit LULogView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,
  LULog;

type
  TFormLog = class(TForm)
    MemoLog: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(const Filename: string; APPLog: TFileMemoLog) : Integer;
  end;

var
  FormLog: TFormLog;

procedure ViewLogFile(APPLog: TFileMemoLog; const InitDir: string; Filter: string);
procedure ViewFile(APPLog: TFileMemoLog; const Path: string);
function ExecViewLog(const Filename: string; APPLog: TFileMemoLog) : Integer;

implementation

{$R *.DFM}

function ExecViewLog(const Filename: string; APPLog: TFileMemoLog) : Integer;
begin
   Application.CreateForm(TFormLog, FormLog);
   Result := FormLog.Execute(Filename, APPLog);
   FormLog.Free;
end;

procedure ViewLogFile(APPLog: TFileMemoLog; const InitDir: string; Filter: string);
begin
   ViewFile(AppLog,IncludeTrailingBackslash(InitDir)+Filter{'*.log'});
end;

procedure ViewFile(APPLog: TFileMemoLog; const Path: string);
var
   LOpenLogFile: TOpenDialog;
begin
   LOpenLogFile := TOpenDialog.Create(nil);
   LOpenLogFile.Filter := 'File('+ExtractFileName(Path)+')|'+ExtractFileName(Path)+'|';
   LOpenLogFile.FilterIndex := 1;
   LOpenLogFile.DefaultExt := ExtractFileExt(Path);
   LOpenLogFile.InitialDir := ExtractFileDir(Path);
   if LOpenLogFile.Execute then begin
      ExecViewLog(LOpenLogFile.FileName, APPLog);
   end;
   LOpenLogFile.Free;
end;

function TFormLog.Execute(const Filename: string; APPLog: TFileMemoLog) : Integer;
begin
   with MemoLog do begin
      ReadOnly := True;
      TabStop := False;
      WantReturns := False;
      WantTabs := False;
      WordWrap := False;
      ParentColor := True;
      ScrollBars := ssVertical;
      ScrollBars := ssBoth;
      Lines.Clear;
   end;
   Caption := 'Журнал '+ ExtractFilename(FileName);
   if Assigned(APPLog) then
      MemoLog.Lines.Assign(APPLog.LogSave[Filename])
   else begin
      try
         MemoLog.Lines.LoadFromFile(Filename);
      except
      end;
   end;
   Result := ShowModal;
end;

procedure TFormLog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=Vk_Escape then Self.close;
end;

end.
