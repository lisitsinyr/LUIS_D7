(*++

Copyright (c) 1998-1999  Microsoft Corporation

Module Name:

    netsetup.h

Abstract:

    Definitions and prototypes for the Net setup apis, for joining/unjoinging
    domains and promoting/demoting servers

Environment:

    User Mode - Win32
    Portable to any flat, 32-bit environment.  (Uses Win32 typedefs.)
    Requires ANSI C extensions: slash-slash comments, long external names.

Notes:

--*)

unit LMJoin;

interface

uses Windows, LMCons;

//
// Types of name that can be validated
//
type
   PNETSETUPNAMETYPE = ^TNETSETUPNAMETYPE;
   _NETSETUP_NAME_TYPE = (
       NetSetupUnknown,
       NetSetupMachine,
       NetSetupWorkgroup,
       NetSetupDomain,
       NetSetupNonExistentDomain,
//#if(_WIN32_WINNT >= = $0500)
       NetSetupDnsMachine
//#endif
   );
   TNETSETUPNAMETYPE = _NETSETUP_NAME_TYPE;
   {$EXTERNALSYM NETSETUP_NAME_TYPE}
   NETSETUP_NAME_TYPE = _NETSETUP_NAME_TYPE;

//
// Status of a workstation
//
   PNETSETUPJOINSTATUS = ^TNETSETUPJOINSTATUS;
   _NETSETUP_JOIN_STATUS = (
       NetSetupUnknownStatus,
       NetSetupUnjoined,
       NetSetupWorkgroupName,
       NetSetupDomainName
   );
   TNETSETUPJOINSTATUS = _NETSETUP_JOIN_STATUS;
   {$EXTERNALSYM  NETSETUP_JOIN_STATUS}
   NETSETUP_JOIN_STATUS = _NETSETUP_JOIN_STATUS;

//
// Flags to determine the behavior of the join/unjoin APIs
//
const
   NETSETUP_JOIN_DOMAIN    = $00000001;      // If not present, workgroup is joined
   NETSETUP_ACCT_CREATE    = $00000002;      // Do the server side account creation/rename
   NETSETUP_ACCT_DELETE    = $00000004;      // Delete the account when a domain is left
   NETSETUP_WIN9X_UPGRADE  = $00000010;      // Invoked during upgrade of Windows 9x to Windows NT
   NETSETUP_DOMAIN_JOIN_IF_JOINED  = $00000020;  // Allow the client to join a new domain
                                                // even if it is already joined to a domain
   NETSETUP_JOIN_UNSECURE  = $00000040;      // Performs an unsecure join
   NETSETUP_INSTALL_INVOCATION = $00040000;  // The APIs were invoked during install

//
// = $80000000 is reserved for internal use only
//

//
// Joins a machine to the domain.
//
function NetJoinDomain(
   lpServer: PWideChar;  // IN OPTIONAL,
   lpDomain: PWideChar;      // IN
   lpAccountOU: PWideChar; // IN OPTIONAL
   lpAccount: PWideChar; // IN OPTIONAL,
   lpPassword: PWideChar; // IN OPTIONAL,
   fJoinOptions: DWord    // IN
   ): NET_API_STATUS; stdcall;

function NetUnjoinDomain(
   lpServer: PWideChar; // IN OPTIONAL,
   lpAccount: PWideChar; // IN OPTIONAL,
   lpPassword: PWideChar; // IN OPTIONAL,
   fUnjoinOptions: DWord // IN
   ): NET_API_STATUS; stdcall;

function NetRenameMachineInDomain(
   lpServer: PWideChar; // IN OPTIONAL,
   lpNewMachineName: PWideChar; // IN OPTIONAL,
   lpAccount: PWideChar; // IN OPTIONAL,
   lpPassword: PWideChar; // IN OPTIONAL,
   fRenameOptions: DWord // IN
   ): NET_API_STATUS; stdcall;

//
// Determine the validity of a name
//
function NetValidateName(
   lpServer: PWideChar; // IN OPTIONAL,
   lpName: PWideChar;  // IN
   lpAccount: PWideChar; // IN OPTIONAL,
   lpPassword: PWideChar; // IN OPTIONAL,
   NameType: NETSETUP_NAME_TYPE // IN
   ): NET_API_STATUS; stdcall;

//
// Determines whether a workstation is joined to a domain or not
//
function NetGetJoinInformation(
   lpServer: PWideChar; // IN OPTIONAL,
   var lpNameBuffer: PWideChar; // var,
   var BufferType: PNETSETUPJOINSTATUS   // var
   ): NET_API_STATUS; stdcall;

//
// Determines the list of OUs that the client can create a machine account in
//
function NetGetJoinableOUs(
   lpServer: PWideChar; // IN OPTIONAL,
   lpDomain: PWideChar; // IN
   lpAccount: PWideChar; // IN OPTIONAL,
   lpPassword: PWideChar; // IN OPTIONAL,
   var OUCount: DWord;
   var OUs: Pointer
   ): NET_API_STATUS; stdcall;

implementation

function NetJoinDomain; external netapi32;
function NetUnjoinDomain; external netapi32;
function NetRenameMachineInDomain; external netapi32;
function NetValidateName; external netapi32;
function NetGetJoinInformation; external netapi32;
function NetGetJoinableOUs; external netapi32;

end.
