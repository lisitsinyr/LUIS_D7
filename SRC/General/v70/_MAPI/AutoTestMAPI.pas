unit AutoTestMAPI;

interface

uses LUExcel, LUMAPICDO, LUDialogs, LUSplash, Controls, SysUtils, FileCtrl, Forms;

type
   TAutoTestMAPI = class
      FExcel: TExcel;
      FMAPISession: TCDOSession;
      FInfoStores: TCDOInfoStores;
      FFolders: TCDOFolders;
      FInputMessages: TCDOMessages;
      FArchiveMessages: TCDOMessages;
      FOutputMessages: TCDOMessages;
      FArcFolderID: string;
      FArcStoreID: string;
      FOpenFolderExchange: TOpenFolderExchange;
   private
      procedure WorkFileXLS(const FileName: string);
      procedure WorkMessage(CDOMessages: TCDOMessages; const P: string);
      procedure ReadInputFolder(const p: string);
      procedure ReadAnybodyFolder(const p: string);
   public
      Splash: TSplash;
      constructor Create;
      destructor Destroy; override;
      procedure Main(const Arg: array of string);
   end;

implementation

constructor TAutoTestMAPI.Create;
begin
   inherited Create;
   FMAPISession := TCDOSession.Create(nil);
   FMAPISession.CaseProfile := False;
   FMAPISession.Active := True;
   {}
   FInfoStores := TCDOInfoStores.Create(nil);
   FFolders := TCDOFolders.Create(nil);
   {}
   FInputMessages := TCDOMessages.Create(nil);
   FArchiveMessages := TCDOMessages.Create(nil);
   FOutputMessages := TCDOMessages.Create(nil);
   FExcel := TExcel.Create(nil);
   {}
   Splash := TSplash.Create(nil);
   Splash.Align := alClient;
   //Splash.Height := Panel.Height;
   //Splash.Width := Panel.Width;
   Splash.SplashProgressBarStep[0,0] := 1;
end;

destructor TAutoTestMAPI.Destroy;
begin
   FExcel.Free;
   FMAPISession.Free;
   FInfoStores.Free;
   FFolders.Free;
   FInputMessages.Free;
   FArchiveMessages.Free;
   FOutputMessages.Free;
   Splash.Free;
   inherited Destroy;
end;

procedure TAutoTestMAPI.WorkFileXLS(const FileName: string);
var
   LWorkBook: OleVariant;
begin
   with FExcel do begin
      LWorkBook := OpenWorkBook (FileName);
      { ... }
      LWorkBook.Close;
   end;
end;

procedure TAutoTestMAPI.WorkMessage(CDOMessages: TCDOMessages; const P: string);
var
   i: Integer;
   s: string;
begin
    with CDOMessages do begin
       for i:=0 to CDOMessage.FileNames.Count-1 do begin
          ExtractFile(p, CDOMessage.FileNames[i]);
          s := IncludeTrailingBackslash(p)+CDOMessage.FileNames[i];
          if UpperCase(ExtractFileExt(s)) = '.XLS' then WorkFileXLS(s);
          SysUtils.DeleteFile(s);
       end;
    end;
end;

procedure TAutoTestMAPI.ReadInputFolder(const p: string);
begin
   with FInputMessages do begin
      objFolder := FMAPISession.GetobjFolder(tfInbox);
      GetFirst;
      Splash.SplashProgressBarStep[0,Count] := 1;
      while not EOF do begin
         Splash.StepIt;
         WorkMessage(FInputMessages, p);
         GetNext;
      end;
      Splash.HideSplash;
   end;
end;

procedure TAutoTestMAPI.ReadAnybodyFolder(const p: string);
begin
   FOpenFolderExchange := TOpenFolderExchange.Create(nil);
   FOpenFolderExchange.CDOFolders := FFolders;
   FOpenFolderExchange.CDOInfoStores := FInfoStores;
   FOpenFolderExchange.CDOSession := FMAPISession;
   FOpenFolderExchange.FolderID := '';
   FOpenFolderExchange.StoreID := '';
   if (FOpenFolderExchange.Execute = mrOk) then begin
      FExcel.StartExcel(False);
      //EditFolderArchive.Text := OpenFolderExchange.FolderName;
      FArcFolderID := FOpenFolderExchange.FolderID;
      FArcStoreID := FOpenFolderExchange.StoreID;
      with FArchiveMessages do begin
         objFolder := FMAPISession.GetobjFolder(FArcFolderID, FArcStoreID);
         GetFirst;
         Splash.SplashProgressBarStep[0,Count] := 1;
         while not EOF do begin
            Splash.StepIt;
            Application.ProcessMessages;
            WorkMessage(FArchiveMessages, p);
            GetNext;
         end;
         Splash.HideSplash;
      end;
      FExcel.StopExcel;
   end;
end;

procedure TAutoTestMAPI.Main(const Arg: array of string);
begin
   if DirectoryExists(Arg[0]) then begin
      ReadAnyBodyFolder(Arg[0]);
   end;
end;

end.
