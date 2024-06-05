unit LULM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMServer, LMAccess, {LMJoin,} LMWksta, LMErrText, LMAPIBuf, LMCons, LMMsg, LUSI;

type
   TLUServer = class
   private
      { 101 }
      FPlatform_ID: DWord;
      FSName: string;
      FVersionMajor: DWord;
      FVersionMinor: DWord;
      FSType: DWord;
      FComment: string;
      { 102 }
      FUsers: DWord;
      FDisc: Longint;
      FHidden: Longint;
      FAnnonce: DWord;
      FAnndelta: DWord;
      FLicenses: DWord;
      FUserPath: string;
      function GetPlatform_IDS: string;
      function GetSTypeS: string;
      procedure Clear;
   public
      constructor Create;
      property Platform_ID: DWord read FPlatform_ID write FPlatform_ID;
      property Platform_IDS: string read GetPlatform_IDS;
      property SName : string read FSName write FSName;
      property VersionMajor: DWord read FVersionMajor write FVersionMajor;
      property VersionMinor: DWord read FVersionMinor write FVersionMinor;
      property SType: DWord read FSType write FSType;
      property STypeS: string read GetSTypeS;
      property Comment : string read FComment write FComment;
      property Users: DWord read FUsers write FUsers;
      property Disc: Longint read FDisc write FDisc;
      property Hidden: Longint read FHidden write FHidden;
      property Annonce: DWord read FAnnonce write FAnnonce;
      property Anndelta: DWord read FAnndelta write FAnndelta;
      property Licenses: DWord read FLicenses write FLicenses;
      property UserPath: string read FUserPath write FUserPath;
   end;

   TLUServerItem = class(TCollectionItem)
   private
      FServer: TLUServer;
   public
      property Server: TLUServer read FServer write FServer;
   end;

   TLUServers = class(TCollection)
   private
     function GetItem(Index: Integer): TLUServerItem;
     procedure SetItem(Index: Integer; Value: TLUServerItem);
   protected
   public
     function Add: TLUServerItem;
     property Items[Index: Integer]: TLUServerItem read GetItem write SetItem; default;
   end;

   { TLUWKSTA_USER_INFO_1 }

   TLUWKSTA_USER_INFO_1 = class
      { Level = 1 }
      Fwkui1_username: string;
      Fwkui1_logon_domain: string;
      Fwkui1_oth_domains: string;
      Fwkui1_logon_server: string;
      procedure Clear;
   public
      constructor Create;
      property wkui1_username     : string read Fwkui1_username     write Fwkui1_username;
      property wkui1_logon_domain : string read Fwkui1_logon_domain write Fwkui1_logon_domain;
      property wkui1_oth_domains  : string read Fwkui1_oth_domains  write Fwkui1_oth_domains;
      property wkui1_logon_server : string read Fwkui1_logon_server write Fwkui1_logon_server;
   end;

   TLUGroup = class
   private
      { 101 }
      FGName: string;
      FComment: string;
      FGroup_ID: DWord;
      FAttributes: DWord;
      procedure Clear;
   public
      constructor Create;
      property Group_ID: DWord read FGroup_ID write FGroup_ID;
      property GName: string read FGName write FGName;
      property Comment : string read FComment write FComment;
      property Attributes: DWord read FAttributes write FAttributes;
   end;

   TLUGroupItem = class(TCollectionItem)
   private
      FGroup: TLUGroup;
   public
      property Group: TLUGroup read FGroup write FGroup;
   end;

   TLUGroups = class(TCollection)
   private
     function GetItem(Index: Integer): TLUGroupItem;
     procedure SetItem(Index: Integer; Value: TLUGroupItem);
   protected
   public
     function Add: TLUGroupItem;
     property Items[Index: Integer]: TLUGroupItem read GetItem write SetItem; default;
   end;

   TSID = array [0..5] of Byte;
   TLULocalGroupMember = class
   private
      { 101 }
      FSID: TSID;
      FSIDusage: DWord;
      FDomainAndName: string;
      procedure Clear;
   public
      constructor Create;
      property SID : TSID read FSID write FSID;
      property SIDusage : DWord read FSIDusage write FSIDusage;
      property DomainAndName : string read FDomainAndName write FDomainAndName;
   end;

   TLULocalGroupMemberItem = class(TCollectionItem)
   private
      FLocalGroupMember: TLULocalGroupMember;
   public
      property LocalGroupMember: TLULocalGroupMember read FLocalGroupMember write FLocalGroupMember;
   end;

   TLULocalGroupMembers = class(TCollection)
   private
     function GetItem(Index: Integer): TLULocalGroupMemberItem;
     procedure SetItem(Index: Integer; Value: TLULocalGroupMemberItem);
   protected
   public
     function Add: TLULocalGroupMemberItem;
     property Items[Index: Integer]: TLULocalGroupMemberItem read GetItem write SetItem; default;
   end;

   { TLUUser }

   TLUUser = class
   private
      { 0 }
      FUName: string;
      { 1 }
      FPassword: string;
      FPasswordAge: DWord;
      FPriv: DWord;
      FHomeDir: string;
      FComment: string;
      FFlags: DWord;
      FScriptPath: string;
      { 2 }
      FAuthFlags: DWord;
      FFullName: string;
      FUsrComment: string;
      FParms: string;
      FWorkStations: string;
      FLastLogon: DWord;
      FLastLogoff: DWord;
      FAcctExpires: DWord;
      FMaxStorage: DWord;
      FUnitsPerWeek: DWord;
      FLogonHours: PByte;
      FBadPwCount: DWord;
      FNumLogons: DWord;
      FLogonServer: string;
      FCountryCode: DWord;
      FCodePage: DWord;
      { 3 }
      FUserID: DWord;
      FPrimaryGroupID: DWord;
      FProfile: string;
      FHomeDirDrive: string;
      FPasswordExpired: DWord;
      procedure Clear;
   public
      constructor Create;
      { 0 }
      property UName: string read FUName write FUName;
      { 1 }
      property Password: string read FPassword write FPassword;
      property PasswordAge: DWord read FPasswordAge write FPasswordAge;
      property Priv: DWord read FPriv write FPriv;
      property HomeDir: string read FHomeDir write FHomeDir;
      property Comment: string read FComment write FComment;
      property Flags: DWord read FFlags write FFlags;
      property ScriptPath: string read FScriptPath write FScriptPath;
      { 2 }
      property AuthFlags: DWord read FAuthFlags write FAuthFlags;
      property FullName: string read FFullName write FFullName;
      property UsrComment: string read FUsrComment write FUsrComment;
      property Parms: string read FParms write FParms;
      property WorkStations: string read FWorkStations write FWorkStations;
      property LastLogon: DWord read FLastLogon write FLastLogon;
      property LastLogoff: DWord read FLastLogoff write FLastLogoff;
      property AcctExpires: DWord read FAcctExpires write FAcctExpires;
      property MaxStorage: DWord read FMaxStorage write FMaxStorage;
      property UnitsPerWeek: DWord read FUnitsPerWeek write FUnitsPerWeek;
      property LogonHours: PByte read FLogonHours write FLogonHours;
      property BadPwCount: DWord read FBadPwCount write FBadPwCount;
      property NumLogons: DWord read FNumLogons write FNumLogons;
      property LogonServer: string read FLogonServer write FLogonServer;
      property CountryCode: DWord read FCountryCode write FCountryCode;
      property CodePage: DWord read FCodePage write FCodePage;
      { 3 }
      property UserID: DWord read FUserID write FUserID;
      property PrimaryGroupID: DWord read FPrimaryGroupID write FPrimaryGroupID;
      property Profile: string read FProfile write FProfile;
      property HomeDirDrive: string read FHomeDirDrive write FHomeDirDrive;
      property PasswordExpired: DWord read FPasswordExpired write FPasswordExpired;
   end;

   TLUUserItem = class(TCollectionItem)
   private
      FUser: TLUUser;
   public
      property User: TLUUser read FUser write FUser;
   end;

   TLUUsers = class(TCollection)
   private
     function GetItem(Index: Integer): TLUUserItem;
     procedure SetItem(Index: Integer; Value: TLUUserItem);
     function GetUser(Login: string): TLUUser;
     function GetLogin(FullName: string): string;
   protected
   public
     function Add: TLUUserItem;
     property Items[Index: Integer]: TLUUserItem read GetItem write SetItem; default;
     property User[Login: string]: TLUUser read GetUser;
     property Login[FullName: string]: string read GetLogin;
   end;

   TLUUserModals = class
   private
      { 0 }
      FMinPasswdLen: DWord;
      FMaxPasswdAge: DWord;
      FMinPasswdAge: DWord;
      FForceLogoff: DWord;
      FpasswordHistLen: DWord;
      { 1 }
      FRole: DWord;
      FPrimary: string;
      { 2 }
      FDomainName: string;
      FDomainID: TSid;
      { 3 }
      FLockoutDuration: DWord;
      FLockoutObservationWindow: DWord;
      FLockoutThreshold: DWord;
      procedure Clear;
   public
      constructor Create;
      { 0 }
      property MinPasswdLen: DWord read FMinPasswdLen write FMinPasswdLen;
      property MaxPasswdAge: DWord read FMaxPasswdAge write FMaxPasswdAge;
      property MinPasswdAge: DWord read FMinPasswdAge write FMinPasswdAge;
      property ForceLogoff: DWord read FForceLogoff write FForceLogoff;
      property PasswordHistLen: DWord read FPasswordHistLen write FPasswordHistLen;
      { 1 }
      property Role: DWord read FRole write FRole;
      property Primary: string read FPrimary write FPrimary;
      { 2 }
      property DomainName: string read FDomainName write FDomainName;
      property DomainID: TSid read FDomainID write FDomainID;
      { 3 }
      property LockoutDuration: DWord read FLockoutDuration write FLockoutDuration;
      property LockoutObservationWindow: DWord read FLockoutObservationWindow write FLockoutObservationWindow;
      property LockoutThreshold: DWord read FLockoutThreshold write FLockoutThreshold;
   end;

   TLULM = class(TComponent)
   private
     { Private declarations }
     FSystemInfo: TLUSystemInfo;
     { all }
     FFlags : DWord;
     FListNames: TStringList;
     FBufPtr: Pointer;
     FPrefMaxLen: Dword;
     FEntriesRead: DWord;
     FTotalEntries: DWord;
     FResume_Handle: DWord;
     FErrorString: string;
     FErrorCode: DWord;
     { Server }
     FInfoServer: TLUServer;
     FInfoServers: TLUServers;
     FNameServers: TLUServers;
     { WorkStation }
     FLUWKSTA_USER_INFO_1: TLUWKSTA_USER_INFO_1;
     { Group }
     FInfoGroup: TLUGroup;
     FInfoGroups: TLUGroups;
     FNameGroups: TLUGroups;
     FNameLocalGroupMembers: TLULocalGroupMembers;
     { User }
     FInfoUser: TLUUser;
     FInfoUsers: TLUUsers;
     FNameUsers: TLUUsers;
     FInfoUserModals: TLUUserModals;
   protected
     { Protected declarations }

     { Alert Functions }
     // NetAlertRaise
     // NetAlertRaiseEx

     { API Buffer Functions }
     // NetApiBufferAllocate
     // NetApiBufferFree
     // NetApiBufferReallocate
     // NetApiBufferSize

     { Directory Service Functions }
     procedure LUNetGetJoinableOUs(ServerName: string; DomainName: string;
                                   AccountName: string; Password: string);
     // NetGetJoinInformation
     // NetJoinDomain
     // NetRegisterDomainNameChangeNotification
     // NetRenameMachineInDomain
     // NetUnjoinDomain
     // NetUnregisterDomainNameChangeNotification
     // NetValidateName

     { Distributed File System (Dfs) Functions }
     // NetDfsAdd
     // NetDfsAddFtRoot
     // NetDfsAddStdRoot
     // NetDfsAddStdRootForced
     // NetDfsEnum
     // NetDfsGetClientInfo
     // NetDfsGetInfo
     // NetDfsManagerInitialize
     // NetDfsRemove
     // NetDfsRemoveFtRoot
     // NetDfsRemoveFtRootForced
     // NetDfsRemoveStdRoot
     // NetDfsSetClientInfo
     // NetDfsSetInfo

     { Get Functions }
     procedure LUNetGetAnyDCName(ServerName: string; DomainName: string);
     procedure LUNetGetDCName(ServerName: string; DomainName: string);
     // NetGetDisplayInformationIndex
     procedure LUNetQueryDisplayInformation(Level: DWord; ServerName: string);

     { Group Functions }
     // NetGroupAdd
     // NetGroupAddUser
     // NetGroupDel
     // NetGroupDelUser
     procedure LUNetGroupEnum(ServerName: string);
     procedure LUNetGroupGetInfo(ServerName: string; GroupName: string);
     procedure LUNetGroupGetUsers(ServerName: string; GroupName: string);
     // NetGroupSetInfo
     // NetGroupSetUsers

     { Local Group Functions }
     // NetLocalGroupAdd
     // NetLocalGroupAddMembers
     // NetLocalGroupDel
     // NetLocalGroupDelMembers
     procedure LUNetLocalGroupEnum(ServerName: string);
     procedure LUNetLocalGroupGetInfo(ServerName: string; LocalGroupName: string);
     procedure LUNetLocalGroupGetMembers(ServerName: string; LocalGroupName: string);
     // NetLocalGroupSetInfo
     // NetLocalGroupSetMembers

     { Message Functions }
     procedure LUNetMessageBufferSend(ServerName,MsgName,FromName,Text: string);
     procedure LUNetMessageNameAdd(ServerName,MsgName: string);
     procedure LUNetMessageNameDel(ServerName,MsgName: string);
     // NetMessageNameEnum
     // NetMessageNameGetInfo

     { NetFile Functions }
     // NetFileClose
     // NetFileClose2
     // NetFileEnum
     // NetFileGetInfo

     { Remote Utility Functions }
     // NetRemoteComputerSupports
     // NetRemoteTOD

     { Replicator Functions }
     // NetReplExportDirAdd
     // NetReplExportDirDel
     // NetReplExportDirEnum
     // NetReplExportDirGetInfo
     // NetReplExportDirLock
     // NetReplExportDirSetInfo
     // NetReplExportDirUnlock
     // NetReplGetInfo
     // NetReplImportDirAdd
     // NetReplImportDirDel
     // NetReplImportDirEnum
     // NetReplImportDirGetInfo
     // NetReplImportDirLock
     // NetReplImportDirUnlock
     // NetReplSetInfo

     { Schedule Functions }
     // NetScheduleJobAdd
     // NetScheduleJobDel
     // NetScheduleJobEnum
     // NetScheduleJobGetInfo

     { Server Functions }
     procedure LUNetServerDiskEnum(ServerName: string);
     procedure LUNetServerEnum(Level: DWord; ServerType: DWord; DomainName: string);
     procedure LUNetServerGetInfo(Level: DWord; ServerName: string);
     // NetServerSetInfo

     { Server and Workstation Transport Functions }
     // NetServerComputerNameAdd
     // NetServerComputerNameDel
     // NetServerTransportAdd
     // NetServerTransportAddEx
     // NetServerTransportDel
     // NetServerTransportEnum
     // NetWkstaTransportAdd
     // NetWkstaTransportDel
     // NetWkstaTransportEnum

     { Session Functions }
     // NetSessionDel
     // NetSessionEnum
     // NetSessionGetInfo

     { Share Functions }
     // NetConnectionEnum
     // NetShareAdd
     // NetShareCheck
     // NetShareDel
     // NetShareEnum
     // NetShareGetInfo
     // NetShareSetInfo

     { Statistics Function }
     // NetStatisticsGet

     { Use Functions }
     // NetUseAdd
     // NetUseDel
     // NetUseEnum
     // NetUseGetInfo

     { User Functions }
     // NetUserAdd
     // NetUserChangePassword
     // NetUserDel
     procedure LUNetUserEnum(Level: DWord; Filter: DWord; ServerName: string);
     procedure LUNetUserGetGroups(ServerName: string; UserName: string);
     procedure LUNetUserGetInfo(Level: DWord; ServerName: string; UserName: string);
     procedure LUNetUserGetLocalGroups(ServerName: string; UserName: string);
     // NetUserSetGroups
     // NetUserSetInfo

     { User Modals Functions }
     procedure LUNetUserModalsGet(Level: DWord; ServerName: string);
     // NetUserModalsSet

     { Workstation and Workstation User Functions }
     // NetWkstaGetInfo
     // NetWkstaSetInfo
     procedure LUNetWkstaUserGetInfo(Level: DWord);
     // NetWkstaUserSetInfo
     // NetWkstaUserEnum

     { Access and Security Functions (Windows 95/98 only) }
     // NetAccessAdd
     // NetAccessCheck
     // NetAccessDel
     // procedure LUNetAccessEnum(Level: DWord; ServerName,BasePath: string); for 95/98/me
     // NetAccessGetInfo
     // NetAccessGetUserPerms
     // NetAccessSetInfo
     // NetSecurityGetInfo
     { Access and Security Functions (Windows 2000/XP }
     {
     GetFileSecurity (lpFileName: PChar,
         RequestedInformation: SECURITY_INFORMATION,
         pSecurityDescriptor: PSECURITY_DESCRIPTOR,
         nLength: DWORD, lpnLengthNeeded: LPDWORD
     }

     { Obsolete Functions }
     // NetAuditClear
     // NetAuditRead
     // NetAuditWrite
     // NetConfigGet
     // NetConfigGetAll
     // NetConfigSet
     // NetErrorLogClear
     // NetErrorLogRead
     // NetErrorLogWrite
     // NetLocalGroupAddMember
     // NetLocalGroupDelMember
     // NetServiceControl
     // NetServiceEnum
     // NetServiceGetInfo
     // NetServiceInstall

   public
     { Public declarations }
     constructor Create (Owner: TComponent); override;
     destructor Destroy; override;
 //    property NameServers[ServerType: DWord; DomainName: string]: TLUServers read GetNameServers;
 //    property InfoServers[ServerType: DWord; DomainName: string]: TLUServers read GetInfoServers;
 //    property InfoServer [ServerName: string]: TLUServer read GetInfoServer;
 //    property DisksServer [ServerName: string]: TStringList read GetDisksServer;
 //    property OUs [ServerName: string; DomainName: string; AccountName: string; Password: string]: TStringList read GetOUs;
     { Server }
     function GetNameServers(ServerType: DWord; DomainName: string): TLUServers;
     function GetInfoServers(ServerType: DWord; DomainName: string): TLUServers;
     function GetInfoServer(ServerName: string): TLUServer;
     function GetDisksServer(ServerName: string): TStringList;
     { WorkStation }
     function GetNetWkstaUserGetInfo(Level: DWord): TLUWKSTA_USER_INFO_1;
     { Group }
     function GetNameGroups(ServerName: string): TLUGroups;
     function GetInfoGroups(ServerName: string): TLUGroups;
     function GetInfoGroup(ServerName: string; GroupName: string): TLUGroup;
     function GetGroupUsers(ServerName: string; GroupName: string): TStringList;
     { LocalGroup }
     function GetNameLocalGroups(ServerName: string): TLUGroups;
     function GetInfoLocalGroups(ServerName: string): TLUGroups;
     function GetInfoLocalGroup(ServerName: string; LocalGroupName: string): TLUGroup;
     function GetLocalGroupMembers(ServerName: string; LocalGroupName: string): TLULocalGroupMembers;
     { OU }
     function GetOUs (ServerName: string; DomainName: string; AccountName: string; Password: string): TStringList;
     { User }
     function GetNameUsers(Filter: DWord; ServerName: string): TLUUsers;
     function GetInfoUsers(Filter: DWord; ServerName: string): TLUUsers;
     function GetInfoUser(ServerName: string; UserName: string): TLUUser;
     function GetUserGroups(ServerName: string; UserName: string): TStringList;
     function GetUserLocalGroups(ServerName: string; UserName: string): TStringList;
     function GetInfoUserModals(ServerName: string): TLUUserModals;
     { Query }
     function GetQueryGroups(ServerName: string): TLUGroups;
     function GetQueryUsers(ServerName: string): TLUUsers;
     function GetQueryMachines(ServerName: string): TLUUsers;
     { DCName }
     function GetDCName (ServerName: string; DomainName: string): string;
     function GetAnyDCName (ServerName: string; DomainName: string): string;
     { Message }
     procedure SendMessage(ToServerName: string; Text: string);
     { NetAccessEnum }
     //function GetNetAccessEnum(ServerName,BasePath: string): TStringList; for 95/98/me
     {}
     property InfoServer[ServerName: string]: TLUServer read GetInfoServer;
     property SystemInfo: TLUSystemInfo read FSystemInfo;
   published
     { Published declarations }
   end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('LUIS Net', [TLULM]);
end;

{ --TLUServer-- }

constructor TLUServer.Create;
begin
   Clear;
end;

procedure TLUServer.Clear;
begin
   { 101 }
   FPlatform_ID := 0;
   FSName := '';
   FVersionMajor := 0;
   FVersionMinor := 0;
   FSType := 0;
   FComment := '';
   { 102 }
   FUsers := 0;
   FDisc := 0;
   FHidden := 0;
   FAnnonce := 0;
   FAnndelta := 0;
   FLicenses := 0;
   FUserPath := '';
end;

function TLUServer.GetPlatform_IDS: string;
begin
   Result := GetPlatform_IDString(Platform_ID);
end;

function TLUServer.GetSTypeS: string;
begin
   Result := GetSTypeString(SType);
end;

{ --TLUServers-- }

function TLUServers.GetItem(Index: Integer): TLUServerItem;
begin
   Result := TLUServerItem(inherited GetItem(Index));
end;

procedure TLUServers.SetItem(Index: Integer; Value: TLUServerItem);
begin
   inherited SetItem(Index, Value);
end;

function TLUServers.Add: TLUServerItem;
begin
   Result := TLUServerItem(inherited Add);
end;

{ --TLUWKSTA_USER_INFO_1-- }

constructor TLUWKSTA_USER_INFO_1.Create;
begin
   Clear;
end;

procedure TLUWKSTA_USER_INFO_1.Clear;
begin
   wkui1_username := '';
   wkui1_logon_domain := '';
   wkui1_oth_domains := '';
   wkui1_logon_server := '';
end;

{ --TLUGroup-- }

constructor TLUGroup.Create;
begin
   Clear;
end;

procedure TLUGroup.Clear;
begin
   FGroup_ID := 0;
   FGName := '';
   FAttributes := 0;
   FComment := '';
end;

{ --TLUGroups-- }

function TLUGroups.GetItem(Index: Integer): TLUGroupItem;
begin
   Result := TLUGroupItem(inherited GetItem(Index));
end;

procedure TLUGroups.SetItem(Index: Integer; Value: TLUGroupItem);
begin
   inherited SetItem(Index, Value);
end;

function TLUGroups.Add: TLUGroupItem;
begin
   Result := TLUGroupItem(inherited Add);
end;

{ --TLULocalGroupMember-- }

constructor TLULocalGroupMember.Create;
begin
   Clear;
end;

procedure TLULocalGroupMember.Clear;
begin
   FillChar(FSID, SizeOf(FSID), $0);
   FSIDusage := 0;
   FDomainAndName := '';
end;

{ --TLULocalGroupMembers-- }

function TLULocalGroupMembers.GetItem(Index: Integer): TLULocalGroupMemberItem;
begin
   Result := TLULocalGroupMemberItem(inherited GetItem(Index));
end;

procedure TLULocalGroupMembers.SetItem(Index: Integer; Value: TLULocalGroupMemberItem);
begin
   inherited SetItem(Index, Value);
end;

function TLULocalGroupMembers.Add: TLULocalGroupMemberItem;
begin
   Result := TLULocalGroupMemberItem(inherited Add);
end;

{ --TLUUser-- }

constructor TLUUser.Create;
begin
   CLear;
end;

procedure TLUUser.CLear;
begin
   { 0 }
   FUName := '';
   { 1 }
   FPassword := '';
   FPasswordAge := 0;
   FPriv := 0;
   FHomeDir := '';
   FComment := '';
   FFlags := 0;
   FScriptPath := '';
   { 2 }
   FAuthFlags := 0;
   FFullName := '';
   FUsrComment := '';
   FParms := '';
   FWorkStations := '';
   FLastLogon := 0;
   FLastLogoff := 0;
   FAcctExpires := 0;
   FMaxStorage := 0;
   FUnitsPerWeek := 0;
   FLogonHours :=  nil;
   FBadPwCount := 0;
   FNumLogons := 0;
   FLogonServer := '';
   FCountryCode := 0;
   FCodePage := 0;
   { 3 }
   FUserID := 0;
   FPrimaryGroupID := 0;
   FProfile := '';
   FHomeDirDrive := '';
   FPasswordExpired := 0;
end;

{ --TLUUsers-- }

function TLUUsers.GetItem(Index: Integer): TLUUserItem;
begin
   Result := TLUUserItem(inherited GetItem(Index));
end;

procedure TLUUsers.SetItem(Index: Integer; Value: TLUUserItem);
begin
   inherited SetItem(Index, Value);
end;

function TLUUsers.Add: TLUUserItem;
begin
   Result := TLUUserItem(inherited Add);
end;

function TLUUsers.GetUser(Login: string): TLUUser;
var
   i: Integer;
begin
   Result := nil;
   for i:=0 to Count-1 do begin
      if (Items[i].User.UName = Login) then begin
         Result := Items[i].User;
         Break;
      end;
   end;
end;

function TLUUsers.GetLogin(FullName: string): string;
var
   i: Integer;
begin
   Result := '';
   for i:=0 to Count-1 do begin
      if (AnsiUpperCase(Items[i].User.FullName) = AnsiUpperCase(FullName)) then begin
         Result := Items[i].User.UName;
         Break;
      end;
   end;
end;

{ --TLUUserModal-- }

constructor TLUUserModals.Create;
begin
   CLear;
end;

procedure TLUUserModals.CLear;
begin
   { 0 }
   FMinPasswdLen := 0;
   FMaxPasswdAge := 0;
   FMinPasswdAge := 0;
   FForceLogoff := 0;
   FpasswordHistLen := 0;
   { 1 }
   FRole := 0;
   FPrimary := '';
   { 2 }
   FDomainName := '';
   FillChar(FDomainID, SizeOf(TSid), $0);
   { 3 }
   FLockoutDuration := 0;
   FLockoutObservationWindow := 0;
   FLockoutThreshold := 0;
end;

{ --TLULM-- }

constructor TLULM.Create (Owner: TComponent);
begin
   inherited Create (Owner);
   FSystemInfo := TLUSystemInfo.Create(Self);
   { Server }
   FInfoServer := TLUServer.Create;
   FInfoServers := TLUServers.Create(TLUServerItem);
   FNameServers := TLUServers.Create(TLUServerItem);
   { WorkStation }
   FLUWKSTA_USER_INFO_1 := TLUWKSTA_USER_INFO_1.Create;
   { Group }
   FInfoGroup := TLUGroup.Create;
   FInfoGroups := TLUGroups.Create(TLUGroupItem);
   FNameGroups := TLUGroups.Create(TLUGroupItem);
   FNameLocalGroupMembers := TLULocalGroupMembers.Create(TLULocalGroupMemberItem);
   { All }
   FListNames := TStringList.Create;
   { User }
   FInfoUser := TLUUser.Create;
   FInfoUsers := TLUUsers.Create(TLUUserItem);
   FNameUsers := TLUUsers.Create(TLUUserItem);
   FInfoUserModals := TLUUserModals.Create;
end;

destructor TLULM.Destroy;
begin
   { Server }
   FInfoServer.Free;
   FInfoServers.Free;
   FNameServers.Free;
   { WorkStation}
   FLUWKSTA_USER_INFO_1.Free;
   { Group }
   FInfoGroup.Free;
   FInfoGroups.Free;
   FNameGroups.Free;
   FNameLocalGroupMembers.Free;
   { All }
   FListNames.Free;
   { User }
   FInfoUser.Free;
   FInfoUsers.Free;
   FNameUsers.Free;
   FInfoUserModals.Free;
   inherited Destroy;
end;

{ Private }

{ Message }

procedure TLULM.LUNetMessageNameAdd(ServerName,MsgName: string);
var
   WSServerName : WideString;
   WSMsgName : WideString;
begin
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSMsgName, Length(MsgName)*2+1);
   StringToWideChar(MsgName, PWideChar(WSMsgName), Length(MsgName)*2+1);
   FErrorCode := NetMessageNameAdd(PWideChar(WSServerName), PWideChar(WSMsgName));
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetMessageNameDel(ServerName,MsgName: string);
var
   WSServerName : WideString;
   WSMsgName : WideString;
begin
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSMsgName, Length(MsgName)*2+1);
   StringToWideChar(Name, PWideChar(WSMsgName), Length(MsgName)*2+1);
   FErrorCode := NetMessageNameDel(PWideChar(WSServerName), PWideChar(WSMsgName));
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetMessageBufferSend(ServerName,MsgName,FromName,Text: string);
var
   WSServerName : WideString;
   WSFromName : WideString;
   WSMsgName : WideString;
   WSText : WideString;
   L: Integer;
begin
   try
      LUNetMessageNameAdd(ServerName,MsgName);
   except
   end;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSMsgName, Length(MsgName)*2+1);
   StringToWideChar(MsgName, PWideChar(WSMsgName), Length(MsgName)*2+1);
   SetLength(WSFromName, Length(FromName)*2+1);
   StringToWideChar(FromName, PWideChar(WSFromName), Length(FromName)*2+1);
   SetLength(WSText, Length(Text)*2+1);
   StringToWideChar(Text, PWideChar(WSText), Length(Text)*2+1);
   L := Length(WSText);
   if FromName = '' then
      FErrorCode := NetMessageBufferSend(PWideChar(WSServerName),PWideChar(WSMsgName),
                    nil,
                    PWideChar(WSText),
                    //Pointer(FBufPtr),
                    L)
   else
      FErrorCode := NetMessageBufferSend(PWideChar(WSServerName),
                    PWideChar(WSMsgName),
                    PWideChar(WSFromName),
                    PWideChar(WSText), L);
   try
      FErrorString := CheckNetError(FErrorCode);
   except
   end;
   try
      LUNetMessageNameDel(ServerName,Name);
   except
   end;
end;

{ Server }

procedure TLULM.LUNetServerEnum(Level: DWord; ServerType: DWord; DomainName: string);
var
   WSDomainName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSDomainName, Length(DomainName)*2+1);
   StringToWideChar(DomainName, PWideChar(WSDomainName), Length(DomainName)*2+1);
   FErrorCode := NetServerEnum(nil, Level, FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 ServerType, PWideChar(WSDomainName), FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetServerGetInfo(Level: DWord; ServerName: string);
var
   WSServerName : WideString;
begin
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetServerGetInfo(PWideChar(WSServerName), Level, FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetServerDiskEnum(ServerName: string);
var
   WSServerName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetServerDiskEnum(PWideChar(WSServerName), 0, FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

{ Group }

procedure TLULM.LUNetGroupEnum(ServerName: string);
var
   WSServerName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetGroupEnum(PWideChar(WSServerName), 2, FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetGroupGetInfo(ServerName: string; GroupName: string);
var
   WSServerName : WideString;
   WSGroupName : WideString;
begin
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSGroupName, Length(GroupName)*2+1);
   StringToWideChar(GroupName, PWideChar(WSGroupName), Length(GroupName)*2+1);
   FErrorCode := NetGroupGetInfo(PWideChar(WSServerName), PWideChar(WSGroupName), 2, FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetGroupGetUsers(ServerName: string; GroupName: string);
var
   WSServerName : WideString;
   WSGroupName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSGroupName, Length(GroupName)*2+1);
   StringToWideChar(GroupName, PWideChar(WSGroupName), Length(GroupName)*2+1);
   FErrorCode := NetGroupGetUsers(PWideChar(WSServerName), PWideChar(WSGroupName),
                                 0, FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetLocalGroupEnum(ServerName: string);
var
   WSServerName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetLocalGroupEnum(PWideChar(WSServerName), 1, FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetLocalGroupGetInfo(ServerName: string; LocalGroupName: string);
var
   WSServerName : WideString;
   WSLocalGroupName : WideString;
begin
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSLocalGroupName, Length(LocalGroupName)*2+1);
   StringToWideChar(LocalGroupName, PWideChar(WSLocalGroupName), Length(LocalGroupName)*2+1);
   FErrorCode := NetLocalGroupGetInfo(PWideChar(WSServerName), PWideChar(WSLocalGroupName), 1, FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetLocalGroupGetMembers(ServerName: string; LocalGroupName: string);
var
   WSServerName : WideString;
   WSLocalGroupName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSLocalGroupName, Length(LocalGroupName)*2+1);
   StringToWideChar(LocalGroupName, PWideChar(WSLocalGroupName), Length(LocalGroupName)*2+1);
   FErrorCode := NetLocalGroupGetMembers(PWideChar(WSServerName), PWideChar(WSLocalGroupName),
                                 2, FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

{ Join }

procedure TLULM.LUNetGetJoinableOUs(ServerName: string; DomainName: string;
                              AccountName: string; Password: string);
var
   WSServerName : WideString;
   WSDomainName : WideString;
   WSAccountName : WideString;
   WSPassword : WideString;
begin
   FEntriesRead := 0;
   FTotalEntries := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSDomainName, Length(DomainName)*2+1);
   StringToWideChar(DomainName, PWideChar(WSDomainName), Length(DomainName)*2+1);
   SetLength(WSAccountName, Length(AccountName)*2+1);
   StringToWideChar(AccountName, PWideChar(WSAccountName), Length(AccountName)*2+1);
   SetLength(WSPassword, Length(Password)*2+1);
   StringToWideChar(Password, PWideChar(WSPassword), Length(Password)*2+1);
//   FErrorCode := NetGetJoinableOUs(PWideChar(WSServerName),
//      PWideChar(WSDomainName),PWideChar(WSAccountName), PWideChar(WSPassword),
//      FEntriesRead, FBufPtr);
//   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetUserEnum(Level: DWord; Filter: DWord; ServerName: string);
var
   WSServerName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetUserEnum(PWideChar(WSServerName), Level, Filter,
                                 FBufPtr,
                                 FPrefMaxLen, FEntriesRead, FTotalEntries,
                                 FResume_Handle);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetUserGetInfo(Level: DWord; ServerName: string; UserName: string);
var
   WSServerName : WideString;
   WSUserName : WideString;
begin
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSUserName, Length(UserName)*2+1);
   StringToWideChar(UserName, PWideChar(WSUserName), Length(UserName)*2+1);
   FErrorCode := NetUserGetInfo(PWideChar(WSServerName),
      PWideChar(WSUserName), Level, FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetUserGetGroups(ServerName: string; UserName: string);
var
   WSServerName : WideString;
   WSUserName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSUserName, Length(UserName)*2+1);
   StringToWideChar(UserName, PWideChar(WSUserName), Length(UserName)*2+1);
   FErrorCode := NetUserGetGroups(PWideChar(WSServerName),
      PWideChar(WSUserName), 0, FBufPtr,
      FPrefMaxLen, FEntriesRead, FTotalEntries);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetUserGetLocalGroups(ServerName: string; UserName: string);
var
   WSServerName : WideString;
   WSUserName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FResume_Handle := 0;
   FBufPtr := nil;
   FFlags := LG_INCLUDE_INDIRECT;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSUserName, Length(UserName)*2+1);
   StringToWideChar(UserName, PWideChar(WSUserName), Length(UserName)*2+1);
   FErrorCode := NetUserGetLocalGroups(PWideChar(WSServerName),
      PWideChar(WSUserName), 0, FFlags, FBufPtr,
      FPrefMaxLen, FEntriesRead, FTotalEntries);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetUserModalsGet(Level: DWord; ServerName: string);
var
   WSServerName : WideString;
begin
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetUserModalsGet(PWideChar(WSServerName), Level, FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetWkstaUserGetInfo(Level: DWord);
begin
   FBufPtr := nil;
   FErrorCode := NetWkstaUserGetInfo(nil, Level, @FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetQueryDisplayInformation(Level: DWord; ServerName: string);
var
   WSServerName : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   FErrorCode := NetQueryDisplayInformation(PWideChar(WSServerName), Level,
      0, 1000, FPrefMaxLen, FEntriesRead, FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetGetDCName(ServerName: string; DomainName: string);
var
   WSServerName : WideString;
   WSDomainName : WideString;
begin
   FEntriesRead := 0;
   FTotalEntries := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSDomainName, Length(DomainName)*2+1);
   StringToWideChar(DomainName, PWideChar(WSDomainName), Length(DomainName)*2+1);
   FErrorCode := NetGetDCName(PWideChar(WSServerName),
      PWideChar(WSDomainName), FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

procedure TLULM.LUNetGetAnyDCName(ServerName: string; DomainName: string);
var
   WSServerName : WideString;
   WSDomainName : WideString;
begin
   FEntriesRead := 0;
   FTotalEntries := 0;
   FBufPtr := nil;
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   SetLength(WSDomainName, Length(DomainName)*2+1);
   StringToWideChar(DomainName, PWideChar(WSDomainName), Length(DomainName)*2+1);
   FErrorCode := NetGetAnyDCName(PWideChar(WSServerName),
      PWideChar(WSDomainName), FBufPtr);
   FErrorString := CheckNetError(FErrorCode);
end;

{ Public }

{ Server }

function TLULM.GetNameServers(ServerType: DWord; DomainName: string): TLUServers;
var
   i: Integer;
   PData : PServerInfo101;
begin
   FBufPtr := nil;
   FNameServers.Clear;
   try
      LUNetServerEnum(101, ServerType, DomainName);
      if FBufPtr <> nil then begin
         PData := PServerInfo101(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameServers.Add do begin
               Server := TLUServer.Create;
               Server.Platform_ID := PData^.sv101_Platform_id;
               Server.SName := WideCharToString(PData^.sv101_name);
               Server.VersionMajor := PData^.sv101_Version_Major;
               Server.VersionMinor := PData^.sv101_Version_Minor;
               Server.SType := PData^.sv101_type;
               Server.Comment := WideCharToString(PData^.sv101_Comment);
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameServers;
end;

function TLULM.GetInfoServers(ServerType: DWord; DomainName: string): TLUServers;
var
   i: Integer;
   NS : TLUServers;
   ServerInfo: TLUServer;
begin
   FInfoServers.Clear;
   NS := GetNameServers(ServerType, DomainName);
   for i:=0 to NS.Count-1  do begin
      ServerInfo := GetInfoServer(NS.Items[i].Server.SName);
      if ServerInfo.Platform_ID = PLATFORM_ID_NT then begin
         with FInfoServers.Add do begin
            Server := TLUServer.Create;
            Server.Platform_ID := ServerInfo.Platform_id;
            Server.SName := ServerInfo.SName;
            Server.VersionMajor := ServerInfo.VersionMajor;
            Server.VersionMinor := ServerInfo.VersionMinor;
            Server.SType := ServerInfo.Stype;
            Server.Comment := ServerInfo.Comment;
            { 102 }
            Server.Users := ServerInfo.Users;
            Server.Disc := ServerInfo.Disc;
            Server.Hidden := ServerInfo.Hidden;
            Server.Annonce := ServerInfo.Annonce;
            Server.Anndelta := ServerInfo.Anndelta;
            Server.Licenses := ServerInfo.Licenses;
            Server.UserPath := ServerInfo.UserPath;
         end;
      end;
   end;
   Result := FInfoServers;
end;

function TLULM.GetInfoServer(ServerName: string): TLUServer;
var
   PData : PServerInfo102;
begin
   FBufPtr := nil;
   FInfoServer.Clear;
   FInfoServer.SName := ServerName;
   try
      LUNetServerGetInfo(102, ServerName);
      if FBufPtr <> nil then begin
         PData := PServerInfo102(FBufPtr);
         FInfoServer.Platform_ID := PData^.sv102_Platform_ID;
         FInfoServer.SName := WideCharToString(PData^.sv102_name);
         FInfoServer.VersionMajor := PData^.sv102_Version_Major;
         FInfoServer.VersionMinor := PData^.sv102_Version_Minor;
         FInfoServer.SType := PData^.sv102_type;
         FInfoServer.Comment := WideCharToString(PData^.sv102_Comment);
         { 102 }
         FInfoServer.Users := PData^.sv102_users;
         FInfoServer.Disc := PData^.sv102_disc;
         FInfoServer.Hidden := PData^.sv102_hidden;
         FInfoServer.Annonce := PData^.sv102_announce;
         FInfoServer.Anndelta := PData^.sv102_anndelta;
         FInfoServer.Licenses := PData^.sv102_licenses;
         FInfoServer.UserPath := WideCharToString(PData^.sv102_userpath);
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FInfoServer;
end;

function TLULM.GetDisksServer(ServerName: string): TStringList;
var
   PData : PServerDisk;
   i : Integer;
begin
   FBufPtr := nil;
   FListNames.Clear;
   try
      LUNetServerDiskEnum(ServerName);
      if FBufPtr <> nil then begin
         PData := PServerDisk(FBufPtr);
         for i:=1 to FEntriesRead do begin
            FListNames.Add (WideCharToString(PData^));
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FListNames;
end;

{ Join }

function TLULM.GetOUs (ServerName: string; DomainName: string; AccountName: string; Password: string): TStringList;
var
   PData : PWideChar;
   i : Integer;
begin
   FBufPtr := nil;
   FListNames.Clear;
   try
      LUNetGetJoinableOUs(ServerName,DomainName,AccountName,Password);
      if FBufPtr <> nil then begin
         PData := PWideChar(FBufPtr);
         for i:=1 to FEntriesRead do begin
            FListNames.Add (WideCharToString(PData));
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FListNames;
end;

{ Group }

function TLULM.GetNameGroups(ServerName: string): TLUGroups;
var
   i: Integer;
   PData : PGroupInfo2;
begin
   FBufPtr := nil;
   FNameGroups.Clear;
   try
      LUNetGroupEnum(ServerName);
      if FBufPtr <> nil then begin
         PData := PGroupInfo2(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameGroups.Add do begin
               Group := TLUGroup.Create;
               Group.Group_ID := PData^.grpi2_Group_id;
               Group.GName := WideCharToString(PData^.grpi2_name);
               Group.Attributes := PData^.grpi2_Attributes;
               Group.Comment := WideCharToString(PData^.grpi2_Comment);
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameGroups;
end;

function TLULM.GetInfoGroups(ServerName: string): TLUGroups;
var
   i: Integer;
   NS : TLUGroups;
   GroupInfo: TLUGroup;
begin
   FInfoGroups.Clear;
   NS := GetNameGroups(ServerName);
   for i:=0 to NS.Count-1  do begin
      GroupInfo := GetInfoGroup(ServerName, NS.Items[i].Group.GName);
      with FInfoGroups.Add do begin
         Group := TLUGroup.Create;
         Group.Group_ID := GroupInfo.Group_id;
         Group.GName := GroupInfo.GName;
         Group.Attributes := GroupInfo.Attributes;
         Group.Comment := GroupInfo.Comment;
      end;
   end;
   Result := FInfoGroups;
end;

function TLULM.GetInfoGroup(ServerName: string; GroupName: string): TLUGroup;
var
   PData : PGroupInfo2;
begin
   FBufPtr := nil;
   FInfoGroup.Clear;
   FInfoGroup.GName := GroupName;
   try
      LUNetGroupGetInfo(ServerName, GroupName);
      if FBufPtr <> nil then begin
         PData := PGroupInfo2(FBufPtr);
         FInfoGroup.Group_ID := PData^.grpi2_Group_ID;
         FInfoGroup.GName := WideCharToString(PData^.grpi2_name);
         FInfoGroup.Attributes := PData^.grpi2_attributes;
         FInfoGroup.Comment := WideCharToString(PData^.grpi2_Comment);
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FInfoGroup;
end;

function TLULM.GetGroupUsers(ServerName: string; GroupName: string): TStringList;
var
   PData : PGroupUsersInfo0;
   i : Integer;
begin
   FBufPtr := nil;
   FListNames.Clear;
   try
      LUNetGroupGetUsers(ServerName, GroupName);
      if FBufPtr <> nil then begin
         PData := PGroupUsersInfo0(FBufPtr);
         for i:=1 to FEntriesRead do begin
            FListNames.Add (WideCharToString(PData^.grui0_name));
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FListNames;
end;

function TLULM.GetNameLocalGroups(ServerName: string): TLUGroups;
var
   i: Integer;
   PData : PLocalGroupInfo1;
begin
   FBufPtr := nil;
   FNameGroups.Clear;
   try
      LUNetLocalGroupEnum(ServerName);
      if FBufPtr <> nil then begin
         PData := PLocalGroupInfo1(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameGroups.Add do begin
               Group := TLUGroup.Create;
               Group.Group_ID := 0;
               Group.GName := WideCharToString(PData^.lgrpi1_name);
               Group.Attributes := 0;
               Group.Comment := WideCharToString(TLocalGroupInfo1(PData^).lgrpi1_Comment);
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameGroups;
end;

function TLULM.GetInfoLocalGroups(ServerName: string): TLUGroups;
var
   i: Integer;
   NS : TLUGroups;
   LocalGroupInfo: TLUGroup;
begin
   FInfoGroups.Clear;
   NS := GetNameLocalGroups(ServerName);
   for i:=0 to NS.Count-1  do begin
      LocalGroupInfo := GetInfoLocalGroup(ServerName, NS.Items[i].Group.GName);
      with FInfoGroups.Add do begin
         Group := TLUGroup.Create;
         Group.Group_ID := LocalGroupInfo.Group_id;
         Group.GName := LocalGroupInfo.GName;
         Group.Attributes := LocalGroupInfo.Attributes;
         Group.Comment := LocalGroupInfo.Comment;
      end;
   end;
   Result := FInfoGroups;
end;

function TLULM.GetInfoLocalGroup(ServerName: string; LocalGroupName: string): TLUGroup;
var
   PData : PLocalGroupInfo1;
begin
   FBufPtr := nil;
   FInfoGroup.Clear;
   FInfoGroup.GName := LocalGroupName;
   try
      LUNetLocalGroupGetInfo(ServerName, LocalGroupName);
      FInfoGroup.Comment := FErrorString;
      if FBufPtr <> nil then begin
         PData := PLocalGroupInfo1(FBufPtr);
         FInfoGroup.Group_ID := 0;
         FInfoGroup.GName := WideCharToString(PData^.lgrpi1_name);
         FInfoGroup.Attributes := 0;
         FInfoGroup.Comment := WideCharToString(PData^.lgrpi1_Comment);
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FInfoGroup;
end;

function TLULM.GetLocalGroupMembers(ServerName: string; LocalGroupName: string): TLULocalGroupMembers;
var
   PData : PLocalGroupMembersInfo2;
   i : Integer;
begin
   FBufPtr := nil;
   FNameLocalGroupMembers.Clear;
   try
      LUNetLocalGroupGetMembers(ServerName, LocalGroupName);
      if FBufPtr <> nil then begin
         PData := PLocalGroupMembersInfo2(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameLocalGroupMembers.Add do begin
               LocalGroupMember := TLULocalGroupMember.Create;
               LocalGroupMember.SID := TSID(PData^.lgrmi2_sid^);
               LocalGroupMember.SIDusage := PData^.lgrmi2_sidusage;
               LocalGroupMember.DomainAndName := WideCharToString(PData^.lgrmi2_domainandname);
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameLocalGroupMembers;
end;

{ User }

function TLULM.GetNameUsers(Filter: DWord; ServerName: string): TLUUsers;
var
   i: Integer;
   PData : PUserInfo3;
begin
   FBufPtr := nil;
   FNameUsers.Clear;
   try
      LUNetUserEnum(3, Filter, ServerName);
      if FBufPtr <> nil then begin
         PData := PUserInfo3(FBufPtr);
         for i:=1 to FEntriesRead do begin
            Application.ProcessMessages;
            with FNameUsers.Add do begin
               User := TLUUser.Create;
               { 0 }
               User.UName := WideCharToString(PData^.usri3_name);
               { 1 }
               try
                  User.Password := WideCharToString(PData^.usri3_password);
               except
               end;
               User.PasswordAge := PData^.usri3_Password_Age;
               User.Priv := PData^.usri3_priv;
               User.HomeDir := WideCharToString(PData^.usri3_home_dir);
               User.Comment := WideCharToString(PData^.usri3_comment);
               User.Flags := PData^.usri3_flags;
               User.ScriptPath := WideCharToString(PData^.usri3_Script_Path);
               { 2 }
               User.AuthFlags := PData^.usri3_Auth_Flags;
               User.FullName := WideCharToString(PData^.usri3_full_name);
               User.UsrComment := WideCharToString(PData^.usri3_usr_comment);
               User.Parms := WideCharToString(PData^.usri3_parms);
               User.WorkStations := WideCharToString(PData^.usri3_workstations);
               User.LastLogon := PData^.usri3_last_logon;
               User.LastLogoff := PData^.usri3_last_logoff;
               User.AcctExpires := PData^.usri3_Acct_Expires;
               User.MaxStorage := PData^.usri3_Max_Storage;
               User.UnitsPerWeek := PData^.usri3_Units_Per_Week;
               User.LogonHours :=  nil;
               User.BadPwCount := PData^.usri3_Bad_Pw_Count;
               User.NumLogons := PData^.usri3_num_logons;
               User.LogonServer := WideCharToString(PData^.usri3_logon_server);
               User.CountryCode := PData^.usri3_Country_Code;
               User.CodePage := PData^.usri3_code_page;
               { 3 }
               User.UserID := PData^.usri3_user_id;
               User.PrimaryGroupID := PData^.usri3_Primary_Group_ID;
               User.Profile := WideCharToString(PData^.usri3_profile);
               User.HomeDirDrive := WideCharToString(PData^.usri3_Home_Dir_Drive);
               User.PasswordExpired := PData^.usri3_Password_Expired;
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameUsers;
end;

function TLULM.GetInfoUsers(Filter: DWord; ServerName: string): TLUUsers;
var
   i: Integer;
   NS : TLUUsers;
   UserInfo: TLUUser;
begin
   FInfoUsers.Clear;
   NS := GetNameUsers(Filter, ServerName);
   for i:=0 to NS.Count-1  do begin
      Application.ProcessMessages;
      UserInfo := GetInfoUser(ServerName, NS.Items[i].User.UName);
      with FInfoUsers.Add do begin
         User := TLUUser.Create;
         { 0 }
         User.UName := UserInfo.UName;
         { 1 }
         User.Password := UserInfo.Password;
         User.PasswordAge := UserInfo.PasswordAge;
         User.Priv := UserInfo.Priv;
         User.HomeDir := UserInfo.HomeDir;
         User.Comment := UserInfo.Comment;
         User.Flags := UserInfo.Flags;
         User.ScriptPath := UserInfo.ScriptPath;
         { 2 }
         User.AuthFlags := UserInfo.AuthFlags;
         User.FullName := UserInfo.FullName;
         User.UsrComment := UserInfo.UsrComment;
         User.Parms := UserInfo.Parms;
         User.WorkStations := UserInfo.WorkStations;
         User.LastLogon := UserInfo.LastLogon;
         User.LastLogoff := UserInfo.LastLogoff;
         User.AcctExpires := UserInfo.AcctExpires;
         User.MaxStorage := UserInfo.MaxStorage;
         User.UnitsPerWeek := UserInfo.UnitsPerWeek;
         User.LogonHours :=  nil;
         User.BadPwCount := UserInfo.BadPwCount;
         User.NumLogons := UserInfo.NumLogons;
         User.LogonServer := UserInfo.LogonServer;
         User.CountryCode := UserInfo.CountryCode;
         User.CodePage := UserInfo.CodePage;
         { 3 }
         User.UserID := UserInfo.UserID;
         User.PrimaryGroupID := UserInfo.PrimaryGroupID;
         User.Profile := UserInfo.Profile;
         User.HomeDirDrive := UserInfo.HomeDirDrive;
         User.PasswordExpired := UserInfo.PasswordExpired;
      end;
   end;
   Result := FInfoUsers;
end;

function TLULM.GetInfoUser(ServerName: string; UserName: string): TLUUser;
var
   PData : PUserInfo3;
begin
   FBufPtr := nil;
   
   FInfoUser.Clear;
   FInfoUser.UName := UserName;
   try
      LUNetUserGetInfo(3, ServerName, UserName);
      FInfoUser.Comment := FErrorString;
      if FBufPtr <> nil then begin
         PData := PUserInfo3(FBufPtr);
         { 0 }
         FInfoUser.UName := WideCharToString(PData^.usri3_name);
         { 1 }
         try
         FInfoUser.Password := WideCharToString(PData^.usri3_password);
         except
         end;
         FInfoUser.PasswordAge := PData^.usri3_Password_Age;
         FInfoUser.Priv := PData^.usri3_priv;
         FInfoUser.HomeDir := WideCharToString(PData^.usri3_home_dir);
         FInfoUser.Comment := WideCharToString(PData^.usri3_comment);
         FInfoUser.Flags := PData^.usri3_flags;
         FInfoUser.ScriptPath := WideCharToString(PData^.usri3_Script_Path);
         { 2 }
         FInfoUser.AuthFlags := PData^.usri3_Auth_Flags;
         FInfoUser.FullName := WideCharToString(PData^.usri3_full_name);
         FInfoUser.UsrComment := WideCharToString(PData^.usri3_usr_comment);
         FInfoUser.Parms := WideCharToString(PData^.usri3_parms);
         FInfoUser.WorkStations := WideCharToString(PData^.usri3_workstations);
         FInfoUser.LastLogon := PData^.usri3_last_logon;
         FInfoUser.LastLogoff := PData^.usri3_last_logoff;
         FInfoUser.AcctExpires := PData^.usri3_Acct_Expires;
         FInfoUser.MaxStorage := PData^.usri3_Max_Storage;
         FInfoUser.UnitsPerWeek := PData^.usri3_Units_Per_Week;
         FInfoUser.LogonHours :=  nil;
         FInfoUser.BadPwCount := PData^.usri3_Bad_Pw_Count;
         FInfoUser.NumLogons := PData^.usri3_num_logons;
         FInfoUser.LogonServer := WideCharToString(PData^.usri3_logon_server);
         FInfoUser.CountryCode := PData^.usri3_Country_Code;
         FInfoUser.CodePage := PData^.usri3_code_page;
         { 3 }
         FInfoUser.UserID := PData^.usri3_user_id;
         FInfoUser.PrimaryGroupID := PData^.usri3_Primary_Group_ID;
         FInfoUser.Profile := WideCharToString(PData^.usri3_profile);
         FInfoUser.HomeDirDrive := WideCharToString(PData^.usri3_Home_Dir_Drive);
         FInfoUser.PasswordExpired := PData^.usri3_Password_Expired;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FInfoUser;
end;

function TLULM.GetUserGroups(ServerName: string; UserName: string): TStringList;
var
   i: Integer;
   PData : PGroupUsersInfo0;
begin
   FListNames.Clear;
   FBufPtr := nil;
   try
      LUNetUserGetGroups(ServerName, UserName);
      if FBufPtr <> nil then begin
         PData := PGroupUsersInfo0(FBufPtr);
         for i:=1 to FEntriesRead do begin
            FListNames.Add (WideCharToString(PData^.grui0_name));
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FListNames;
end;

function TLULM.GetUserLocalGroups(ServerName: string; UserName: string): TStringList;
var
   i: Integer;
   PData : PGroupUsersInfo0;
begin
   FListNames.Clear;
   FBufPtr := nil;
   try
      LUNetUserGetLocalGroups(ServerName, UserName);
      if FBufPtr <> nil then begin
         PData := PGroupUsersInfo0(FBufPtr);
         for i:=1 to FEntriesRead do begin
            FListNames.Add (WideCharToString(PData^.grui0_name));
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FListNames;
end;

function TLULM.GetInfoUserModals(ServerName: string): TLUUserModals;
var
   PData0 : PUserModalsInfo0;
   PData1 : PUserModalsInfo1;
   PData2 : PUserModalsInfo2;
   PData3 : PUserModalsInfo3;
begin
   FInfoUserModals.Clear;
   LUNetUserModalsGet(0, ServerName);
   if FBufPtr <> nil then begin
      PData0 := PUserModalsInfo0(FBufPtr);
      { 0 }
      FInfoUserModals.MinPasswdLen := PData0^.usrmod0_Min_Passwd_Len;
      FInfoUserModals.MaxPasswdAge := PData0^.usrmod0_Max_Passwd_Age;
      FInfoUserModals.MinPasswdAge := PData0^.usrmod0_Min_Passwd_Age;
      FInfoUserModals.ForceLogoff := PData0^.usrmod0_Force_Logoff;
      FInfoUserModals.passwordHistLen := PData0^.usrmod0_password_Hist_Len;
      NetApiBufferFree(FBufPtr);
   end;
   LUNetUserModalsGet(1, ServerName);
   if FBufPtr <> nil then begin
      PData1 := PUserModalsInfo1(FBufPtr);
      { 1 }
      FInfoUserModals.Role := PData1^.usrmod1_Role;
      FInfoUserModals.Primary := WideCharToString(PData1^.usrmod1_Primary);
      NetApiBufferFree(FBufPtr);
   end;
   LUNetUserModalsGet(2, ServerName);
   if FBufPtr <> nil then begin
      PData2 := PUserModalsInfo2(FBufPtr);
      { 2 }
      FInfoUserModals.DomainName := WideCharToString(PData2^.usrmod2_Domain_Name);
//      FInfoUserModals.DomainID := PData2^.usrmod2_ TSid;
      NetApiBufferFree(FBufPtr);
   end;
   LUNetUserModalsGet(3, ServerName);
   if FBufPtr <> nil then begin
      PData3 := PUserModalsInfo3(FBufPtr);
      { 3 }
      FInfoUserModals.LockoutDuration := PData3^.usrmod3_Lockout_Duration;
      FInfoUserModals.LockoutObservationWindow := PData3^.usrmod3_Lockout_Observation_Window;
      FInfoUserModals.LockoutThreshold := PData3^.usrmod3_Lockout_Threshold;
      NetApiBufferFree(FBufPtr);
   end;
   Result := FInfoUserModals;
end;

function TLULM.GetQueryGroups(ServerName: string): TLUGroups;
var
   i: Integer;
   PData : PNetDisplayGroup;
begin
   FNameGroups.Clear;
   FBufPtr := nil;
   try
      LUNetQueryDisplayInformation(3, ServerName);
      if FBufPtr <> nil then begin
         PData := PNetDisplayGroup(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameGroups.Add do begin
               Group := TLUGroup.Create;
               Group.GName := WideCharToString(PData^.grpi3_name);
               Group.Comment := WideCharToString(PData^.grpi3_Comment);
               Group.Group_ID := PData^.grpi3_Group_id;
               Group.Attributes := PData^.grpi3_Attributes;
   //            Group.NextIndex := PData^.grpi3_Next_Index;
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameGroups;
end;

function TLULM.GetQueryUsers(ServerName: string): TLUUsers;
var
   i: Integer;
   PData : PNetDisplayUser;
begin
   FNameUsers.Clear;
   FBufPtr := nil;
   try
      LUNetQueryDisplayInformation(1, ServerName);
      if FBufPtr <> nil then begin
         PData := PNetDisplayUser(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameUsers.Add do begin
               User := TLUUser.Create;
               { 0 }
               User.UName := WideCharToString(PData^.usri1_name);
               { 1 }
               User.Comment := WideCharToString(PData^.usri1_comment);
               User.Flags := PData^.usri1_flags;
               { 2 }
               User.FullName := WideCharToString(PData^.usri1_full_name);
               { 3 }
               User.UserID := PData^.usri1_user_id;
               { }
   //            User.NextIndex := PData^.usri1_next_index;
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameUsers;
end;

function TLULM.GetQueryMachines(ServerName: string): TLUUsers;
var
   i: Integer;
   PData : PNetDisplayMachine;
begin
   FNameUsers.Clear;
   FBufPtr := nil;
   try
      LUNetQueryDisplayInformation(2, ServerName);
      if FBufPtr <> nil then begin
         PData := PNetDisplayMachine(FBufPtr);
         for i:=1 to FEntriesRead do begin
            with FNameUsers.Add do begin
               User := TLUUser.Create;
               { 0 }
               User.UName := WideCharToString(PData^.usri2_name);
               { 1 }
               User.Comment := WideCharToString(PData^.usri2_comment);
               User.Flags := PData^.usri2_flags;
               { 2 }
               { 3 }
               User.UserID := PData^.usri2_user_id;
               { }
   //            User.NextIndex := PData^.usri1_next_index;
            end;
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FNameUsers;
end;

function TLULM.GetDCName (ServerName: string; DomainName: string): string;
var
   PData : PWideChar;
begin
   Result := '';
   FBufPtr := nil;
   try
      LUNetGetDCName(ServerName,DomainName);
      if FBufPtr <> nil then begin
         PData := PWideChar(FBufPtr);
         Result := WideCharToString(PData);
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
end;

function TLULM.GetAnyDCName (ServerName: string; DomainName: string): string;
var
   PData : PWideChar;
begin
   Result := '';
   FBufPtr := nil;
   try
      LUNetGetAnyDCName(ServerName,DomainName);
      if FBufPtr <> nil then begin
         PData := PWideChar(FBufPtr);
         Result := WideCharToString(PData);
         NetApiBufferFree(FBufPtr);
         end
      else begin
         Result := FErrorString;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
end;

procedure TLULM.SendMessage(ToServerName: string; Text: string);
begin
   FBufPtr := nil;
   try
      LUNetMessageBufferSend(FSystemInfo.ComputerName,ToServerName,'',Text);
   finally
   end;
end;

function TLULM.GetNetWkstaUserGetInfo(Level: DWord): TLUWKSTA_USER_INFO_1;
var
   PData: PWKSTA_USER_INFO_1;
begin
   FBufPtr := nil;
   try
      LUNetWkstaUserGetInfo(Level);
      if FBufPtr <> nil then begin
         PData := PWKSTA_USER_INFO_1(FBufPtr);
         FLUWKSTA_USER_INFO_1.wkui1_username := WideCharToString(PData^.wkui1_username);
         FLUWKSTA_USER_INFO_1.wkui1_logon_domain := WideCharToString(PData^.wkui1_logon_domain);
         FLUWKSTA_USER_INFO_1.wkui1_oth_domains  := WideCharToString(PData^.wkui1_oth_domains);
         FLUWKSTA_USER_INFO_1.wkui1_logon_server := WideCharToString(PData^.wkui1_logon_server);
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FLUWKSTA_USER_INFO_1;
end;

(* Windows 95/98/Me
{ LUNetAccessEnum }

procedure TLULM.LUNetAccessEnum(Level: DWord; ServerName,BasePath: string);
var
   WSServerName : WideString;
   WSBasePath : WideString;
begin
   FPrefMaxLen := MAX_PREFERRED_LENGTH;
   FEntriesRead := 0;
   FTotalEntries := 0;
   { Buffer }
   FBufPtr := nil;
   { ServerName }
   SetLength(WSServerName, Length(ServerName)*2+1);
   StringToWideChar(ServerName, PWideChar(WSServerName), Length(ServerName)*2+1);
   { BasePath }
   SetLength(WSBasePath, Length(BasePath)*2+1);
   StringToWideChar(BasePath, PWideChar(WSBasePath), Length(BasePath)*2+1);

   FErrorCode := NetAccessEnum(PWideChar(WSServerName),PWideChar(WSBasePath),
                 0, Level, FBufPtr, FPrefMaxLen, FTotalEntries, FTotalEntries, FResume_Handle);

   FErrorString := CheckNetError(FErrorCode);
end;

function TLULM.GetNetAccessEnum(ServerName,BasePath: string): TStringList;
var
   i: Integer;
   PData : PACCESSINFO1;
begin
   FListNames.Clear;
   FBufPtr := nil;
   try
      LUNetAccessEnum(1, ServerName, BasePath);
      if FBufPtr <> nil then begin
         PData := PACCESSINFO1(FBufPtr);
         for i:=1 to FEntriesRead do begin
            //FListNames.Add (WideCharToString(PData^.grui0_name));
            Inc(PData);
         end;
      end;
   finally
      if Assigned(FBufPtr) then NetApiBufferFree(FBufPtr);
   end;
   Result := FListNames;
end;
*)

end.
