(*
//��������������������������������������������������������������������������ͻ
//� (c) 1993 Novell, Inc.	All rights reserved.                              �
//�																								  �
//� THIS WORK IS SUBJECT TO U.S. AND INTERNATIONAL COPYRIGHT LAWS AND		  �
//� TREATIES.																					  �
//�																								  �
//� NO PART OF THIS WORK MAY BE USED, PRACTICED, PERFORMED, COPIED,			  �
//� DISTRIBUTED, REVISED, MODIFIED, TRANSLATED, ABRIDGED, CONDENSED,         �
//� EXPANDED, COLLECTED, COMPILED, LINKED, RECAST, TRANSFORMED OR ADAPTED	  �
//� WITHOUT THE PRIOR WRITTEN CONSENT OF NOVELL, INC.                        �
//�																								  �
//� ANY USE OR EXPLOITATION OF THIS WORK WITHOUT AUTHORIZATION COULD SUBJECT �
//� THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.								  �
//��������������������������������������������������������������������������͹
//� Source module name: NWPS_ERR.H														  �
//��������������������������������������������������������������������������ͼ
*)

{$IFNDEF NWPS_ERR_INC}

{$DEFINE NWPS_ERR_INC}
(*=============== Print server communication errors =======================*)

{$DEFINE NWPSE_SUCCESSFUL}
Const NWPSE_SUCCESSFUL = NWCCODE($0000);
{$DEFINE NWPSE_NO_AVAILABLE_SPX_CONNECTI}
Const NWPSE_NO_AVAILABLE_SPX_CONNECTI = NWCCODE($0040);
{$DEFINE NWPSE_SPX_NOT_INITIALIZED}
Const NWPSE_SPX_NOT_INITIALIZED = NWCCODE($0041);
{$DEFINE NWPSE_NO_SUCH_PSERVER}
Const NWPSE_NO_SUCH_PSERVER = NWCCODE($0042);
{$DEFINE NWPSE_UNABLE_TO_GET_SERVER_ADDR}
Const NWPSE_UNABLE_TO_GET_SERVER_ADDR = NWCCODE($0043);
{$DEFINE NWPSE_UNABLE_TO_CONNECT_TO_SERV}
Const NWPSE_UNABLE_TO_CONNECT_TO_SERV = NWCCODE($0044);
{$DEFINE NWPSE_NO_AVAILABLE_IPX_SOCKETS}
Const NWPSE_NO_AVAILABLE_IPX_SOCKETS = NWCCODE($0045);
{$DEFINE NWPSE_ALREADY_ATTACH_TO_A_PRINT}
Const NWPSE_ALREADY_ATTACH_TO_A_PRINT = NWCCODE($0046);
{$DEFINE NWPSE_IPX_NOT_INITIALIZED}
Const NWPSE_IPX_NOT_INITIALIZED = NWCCODE($0047);
{$DEFINE NWPSE_CONNECTION_TERMINATED}
Const NWPSE_CONNECTION_TERMINATED = NWCCODE($00ED);

(*=============== Print server error codes ================================*)

{$DEFINE NWPSE_TOO_MANY_NW_SERVERS}
Const NWPSE_TOO_MANY_NW_SERVERS = NWCCODE($0101);
{$DEFINE NWPSE_UNKNOWN_NW_SERVER}
Const NWPSE_UNKNOWN_NW_SERVER = NWCCODE($0102);
{$DEFINE NWPSE_BINDERY_LOCKED}
Const NWPSE_BINDERY_LOCKED = NWCCODE($0103);
{$DEFINE NWPSE_NW_SERVER_MAXED_OUT}
Const NWPSE_NW_SERVER_MAXED_OUT = NWCCODE($0104);
{$DEFINE NWPSE_NO_RESPONSE}
Const NWPSE_NO_RESPONSE = NWCCODE($0105);
{$DEFINE NWPSE_ALREADY_ATTACHED}
Const NWPSE_ALREADY_ATTACHED = NWCCODE($0106);
{$DEFINE NWPSE_CANT_ATTACH}
Const NWPSE_CANT_ATTACH = NWCCODE($0107);
{$DEFINE NWPSE_NO_ACCOUNT_BALANCE}
Const NWPSE_NO_ACCOUNT_BALANCE = NWCCODE($0108);
{$DEFINE NWPSE_NO_CREDIT_LEFT}
Const NWPSE_NO_CREDIT_LEFT = NWCCODE($0109);
{$DEFINE NWPSE_INTRUDER_DETECTION_LOCK}
Const NWPSE_INTRUDER_DETECTION_LOCK = NWCCODE($010A);
{$DEFINE NWPSE_TOO_MANY_CONNECTIONS}
Const NWPSE_TOO_MANY_CONNECTIONS = NWCCODE($010B);
{$DEFINE NWPSE_ACCOUNT_DISABLED}
Const NWPSE_ACCOUNT_DISABLED = NWCCODE($010C);
{$DEFINE NWPSE_UNAUTHORIZED_TIME}
Const NWPSE_UNAUTHORIZED_TIME = NWCCODE($010D);
{$DEFINE NWPSE_UNAUTHORIZED_STATION}
Const NWPSE_UNAUTHORIZED_STATION = NWCCODE($010E);
{$DEFINE NWPSE_NO_MORE_GRACE}
Const NWPSE_NO_MORE_GRACE = NWCCODE($010F);
{$DEFINE NWPSE_LOGIN_DISABLED}
Const NWPSE_LOGIN_DISABLED = NWCCODE($0110);
{$DEFINE NWPSE_ILLEGAL_ACCT_NAME}
Const NWPSE_ILLEGAL_ACCT_NAME = NWCCODE($0111);
{$DEFINE NWPSE_PASSWORD_HAS_EXPIRED}
Const NWPSE_PASSWORD_HAS_EXPIRED = NWCCODE($0112);
{$DEFINE NWPSE_ACCESS_DENIED}
Const NWPSE_ACCESS_DENIED = NWCCODE($0113);
{$DEFINE NWPSE_CANT_LOGIN}
Const NWPSE_CANT_LOGIN = NWCCODE($0114);
{$DEFINE NWPSE_PRINTER_ALREADY_INSTALLED}
Const NWPSE_PRINTER_ALREADY_INSTALLED = NWCCODE($0115);
{$DEFINE NWPSE_CANT_OPEN_CONFIG_FILE}
Const NWPSE_CANT_OPEN_CONFIG_FILE = NWCCODE($0116);
{$DEFINE NWPSE_CANT_READ_CONFIG_FILE}
Const NWPSE_CANT_READ_CONFIG_FILE = NWCCODE($0117);
{$DEFINE NWPSE_UNKNOWN_PRINTER_TYPE}
Const NWPSE_UNKNOWN_PRINTER_TYPE = NWCCODE($0118);
{$DEFINE NWPSE_MAX_FORMS_EXCEDED}
Const NWPSE_MAX_FORMS_EXCEDED = NWCCODE($0119);
{$DEFINE NWPSE_NO_SUCH_JOB}
Const NWPSE_NO_SUCH_JOB = NWCCODE($011A);
{$DEFINE NWPSE_UNKNOWN_PRINTER_ERROR}
Const NWPSE_UNKNOWN_PRINTER_ERROR = NWCCODE($011B);
{$DEFINE NWPSE_COMMUNICATIONS_ERROR}
Const NWPSE_COMMUNICATIONS_ERROR = NWCCODE($011C);
{$DEFINE NWPSE_MODE_NOT_SUPPORTED}
Const NWPSE_MODE_NOT_SUPPORTED = NWCCODE($011D);

(*================= Print server error codes ==============================*)

{$DEFINE NWPSE_NO_SUCH_QUEUE}
Const NWPSE_NO_SUCH_QUEUE = NWCCODE($0200);
{$DEFINE NWPSE_NOT_AUTHORIZED_FOR_QUEUE}
Const NWPSE_NOT_AUTHORIZED_FOR_QUEUE = NWCCODE($0201);
{$DEFINE NWPSE_QUEUE_HALTED}
Const NWPSE_QUEUE_HALTED = NWCCODE($0202);
{$DEFINE NWPSE_UNABLE_TO_ATTACH_TO_QUEUE}
Const NWPSE_UNABLE_TO_ATTACH_TO_QUEUE = NWCCODE($0203);
{$DEFINE NWPSE_TOO_MANY_QUEUE_SERVERS}
Const NWPSE_TOO_MANY_QUEUE_SERVERS = NWCCODE($0204);

(*================= Print server error codes ==============================*)

{$DEFINE NWPSE_INVALID_REQUEST}
Const NWPSE_INVALID_REQUEST = NWCCODE($0300);
{$DEFINE NWPSE_NOT_ENOUGH_MEMORY}
Const NWPSE_NOT_ENOUGH_MEMORY = NWCCODE($0301);
{$DEFINE NWPSE_NO_SUCH_PRINTER}
Const NWPSE_NO_SUCH_PRINTER = NWCCODE($0302);
{$DEFINE NWPSE_INVALID_PARAMETER}
Const NWPSE_INVALID_PARAMETER = NWCCODE($0303);
{$DEFINE NWPSE_PRINTER_BUSY}
Const NWPSE_PRINTER_BUSY = NWCCODE($0304);
{$DEFINE NWPSE_CANT_DETACH_PRIMARY_SERVE}
Const NWPSE_CANT_DETACH_PRIMARY_SERVE = NWCCODE($0305);
{$DEFINE NWPSE_GOING_DOWN}
Const NWPSE_GOING_DOWN = NWCCODE($0306);
{$DEFINE NWPSE_NOT_CONNECTED}
Const NWPSE_NOT_CONNECTED = NWCCODE($0307);
{$DEFINE NWPSE_ALREADY_IN_USE}
Const NWPSE_ALREADY_IN_USE = NWCCODE($0308);
{$DEFINE NWPSE_NO_JOB_ACTIVE}
Const NWPSE_NO_JOB_ACTIVE = NWCCODE($0309);
{$DEFINE NWPSE_NOT_ATTACHED_TO_SERVER}
Const NWPSE_NOT_ATTACHED_TO_SERVER = NWCCODE($030A);
{$DEFINE NWPSE_ALREADY_IN_LIST}
Const NWPSE_ALREADY_IN_LIST = NWCCODE($030B);
{$DEFINE NWPSE_DOWN}
Const NWPSE_DOWN = NWCCODE($030C);
{$DEFINE NWPSE_NOT_IN_LIST}
Const NWPSE_NOT_IN_LIST = NWCCODE($030D);
{$DEFINE NWPSE_NO_RIGHTS}
Const NWPSE_NO_RIGHTS = NWCCODE($030E);
{$DEFINE NWPSE_CMD_NOT_SUPPORTED}
Const NWPSE_CMD_NOT_SUPPORTED = NWCCODE($030F);
{$DEFINE NWPSE_PASSWORD_UNAVAILABLE}
Const NWPSE_PASSWORD_UNAVAILABLE = NWCCODE($0310);
{$DEFINE NWPSE_ILLEGAL_NOTIFY_OBJECT}
Const NWPSE_ILLEGAL_NOTIFY_OBJECT = NWCCODE($0311);

(*================= Print server error codes ==============================*)

{$DEFINE NWPSE_UNABLE_TO_VERIFY_IDENTITY}
Const NWPSE_UNABLE_TO_VERIFY_IDENTITY = NWCCODE($0400);
{$DEFINE NWPSE_NOT_REMOTE_PRINTER}
Const NWPSE_NOT_REMOTE_PRINTER = NWCCODE($0401);
{$DEFINE NWPSE_UNAUTHORIZED_PRINTER}
Const NWPSE_UNAUTHORIZED_PRINTER = NWCCODE($0402);

(*================= XNP error codes =======================================*)

{$DEFINE NWPSE_NOT_READY}
Const NWPSE_NOT_READY = NWCCODE($0500);
{$DEFINE NWPSE_INVALID_PROCESS}
Const NWPSE_INVALID_PROCESS = NWCCODE($0501);
{$DEFINE NWPSE_INVALID_JOB_ID}
Const NWPSE_INVALID_JOB_ID = NWCCODE($0502);
{$DEFINE NWPSE_NO_MSG_FILE}
Const NWPSE_NO_MSG_FILE = NWCCODE($0503);
{$DEFINE NWPSE_JOB_REQUEST_ACTIVE}
Const NWPSE_JOB_REQUEST_ACTIVE = NWCCODE($0504);

(*========= Cfg Scan and Cfg GetFirst/GetNext error codes =================*)

{$DEFINE NWPSE_END_OF_LIST}
Const NWPSE_END_OF_LIST = NWCCODE($7760);
{$DEFINE NWPSE_NO_SUCH_LIST_ENTRY}
Const NWPSE_NO_SUCH_LIST_ENTRY = NWCCODE($7761);
{$DEFINE NWPSE_END_OF_ATTR_LIST}
Const NWPSE_END_OF_ATTR_LIST = NWCCODE($7762);
(*
// D.S. only; you get this when NWPSCfgVerifyxxxx finds the Common Name, 
// but the Class does not match what you were looking for. 
*)

{$DEFINE NWPSE_WRONG_CLASS_LIST_ENTRY}
Const NWPSE_WRONG_CLASS_LIST_ENTRY = NWCCODE($7763);
{$DEFINE NWPSE_NO_SUCH_PRINT_SERVER}
Const NWPSE_NO_SUCH_PRINT_SERVER = NWCCODE($7764);

(*================= Job Configuration error codes =========================*)

{$DEFINE NWPSE_BAD_VERSION}
Const NWPSE_BAD_VERSION = NWCCODE($7770);
{$DEFINE NWPSE_END_SCAN}
Const NWPSE_END_SCAN = NWCCODE($7771);
{$DEFINE NWPSE_ERROR_EXPANDING_DB}
Const NWPSE_ERROR_EXPANDING_DB = NWCCODE($7772);
{$DEFINE NWPSE_ERROR_GETTING_DEFAULT}
Const NWPSE_ERROR_GETTING_DEFAULT = NWCCODE($7773);
{$DEFINE NWPSE_ERROR_OPENING_DB}
Const NWPSE_ERROR_OPENING_DB = NWCCODE($7774);
{$DEFINE NWPSE_ERROR_READING_DB}
Const NWPSE_ERROR_READING_DB = NWCCODE($7775);
{$DEFINE NWPSE_PRINTCON_DB_FULL}
Const NWPSE_PRINTCON_DB_FULL = NWCCODE($7776);
{$DEFINE NWPSE_ERROR_WRITING_DB}
Const NWPSE_ERROR_WRITING_DB = NWCCODE($7777);

{$DEFINE NWPSE_INTERNAL_ERROR}
Const NWPSE_INTERNAL_ERROR = NWCCODE($7779);
{$DEFINE NWPSE_JOB_NOT_FOUND}
Const NWPSE_JOB_NOT_FOUND = NWCCODE($777A);
{$DEFINE NWPSE_NO_DEFAULT_SPECIFIED}
Const NWPSE_NO_DEFAULT_SPECIFIED = NWCCODE($777B);
{$DEFINE NWPSE_OUT_OF_MEMORY}
Const NWPSE_OUT_OF_MEMORY = NWCCODE($777C);
{$DEFINE NWPSE_ERROR_SEEKING_DB}
Const NWPSE_ERROR_SEEKING_DB = NWCCODE($777D);
{$DEFINE NWPSE_NO_ACCESS_RIGHTS_DB}
Const NWPSE_NO_ACCESS_RIGHTS_DB = NWCCODE($777E);
{$DEFINE NWPSE_UNICODE_TBL_NOT_LOADED}
Const NWPSE_UNICODE_TBL_NOT_LOADED = NWCCODE($777F);

(*========== Print Def error codes for import/export files ================*)

{$DEFINE NWPSE_ERROR_OPENING_IMP}
Const NWPSE_ERROR_OPENING_IMP = NWCCODE($7790);
{$DEFINE NWPSE_ERROR_READING_IMP}
Const NWPSE_ERROR_READING_IMP = NWCCODE($7791);
{$DEFINE NWPSE_ERROR_WRITING_IMP}
Const NWPSE_ERROR_WRITING_IMP = NWCCODE($7792);
{$DEFINE NWPSE_NO_ACCESS_RIGHTS_IMP}
Const NWPSE_NO_ACCESS_RIGHTS_IMP = NWCCODE($7793);
{$DEFINE NWPSE_FILE_ALREADY_EXISTS}
Const NWPSE_FILE_ALREADY_EXISTS = NWCCODE($7794);

(*==================== Print Def error codes ==============================*)

{$DEFINE NWPSE_CONTEXT_CANNOT_BE_ROOT}
Const NWPSE_CONTEXT_CANNOT_BE_ROOT = NWCCODE($77A0);
{$DEFINE NWPSE_CONTEXT_CONTAINS_NO_ORGS}
Const NWPSE_CONTEXT_CONTAINS_NO_ORGS = NWCCODE($77A1);
{$DEFINE NWPSE_HASHED_STRING_NOT_FOUND}
Const NWPSE_HASHED_STRING_NOT_FOUND = NWCCODE($77A2);
(*
// The "(Re-initialize)" mode, NWPS_RESET_MODE, is required to remain.	
// The error below is returned if the delete of the mode or change of 
// the name is attempted.
*)

{$DEFINE NWPSE_CANT_CHANGE_MODE}
Const NWPSE_CANT_CHANGE_MODE = NWCCODE($77A3);


(*==================== NLM error codes ====================================*)

(* This is returned by NWPSRegisterLibraryClient									*)

{$DEFINE NWPSE_UNABLE_TO_GET_SOCKET_RTAG}
Const NWPSE_UNABLE_TO_GET_SOCKET_RTAG = NWCCODE($77B0);
{$DEFINE NWPSE_DUPLICATE_THREAD_REG}
Const NWPSE_DUPLICATE_THREAD_REG = NWCCODE($77B1);
(* This is returned by NWPSDeRegisterLibraryClient                         *)

{$DEFINE NWPSE_UNREGISTERED_THREAD}
Const NWPSE_UNREGISTERED_THREAD = NWCCODE($77B2);
{$DEFINE NWPSE_UNREGISTERED_NLM}
Const NWPSE_UNREGISTERED_NLM = NWCCODE($77B3);
{$ENDIF}

