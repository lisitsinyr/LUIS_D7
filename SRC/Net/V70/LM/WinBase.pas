(************************************************************************
*                                                                       *
*   winbase.h -- This module defines the 32-Bit Windows Base APIs       *
*                                                                       *
*   Copyright (c) Microsoft Corp. All rights reserved.                  *
*                                                                       *
************************************************************************)

//
// Define API decoration for direct importing of DLL references.
//

unit WinBase;

interface

uses
   Windows, LMCons;

(* Compatibility macros *)

   DefineHandleTable(w)            ((w),TRUE)
   LimitEmsPages(dw)
   SetSwapAreaSize(w)              (w)
   LockSegment(w)                  GlobalFix((HANDLE)(w))
   UnlockSegment(w)                GlobalUnfix((HANDLE)(w))
   GetCurrentTime()                GetTickCount()

   Yield()

const
   INVALID_HANDLE_VALUE = -1;
   INVALID_FILE_SIZE  = $FFFFFFFF;
   INVALID_SET_FILE_POINTER = -1;
   INVALID_FILE_ATTRIBUTES = -1;

const
   FILE_BEGIN           = 0;
   FILE_CURRENT         = 1;
   FILE_END             = 2;

   TIME_ZONE_ID_INVALID = $FFFFFFFF;

   WAIT_FAILED = $FFFFFFFF;
   (*
   WAIT_OBJECT_0       ((STATUS_WAIT_0 ) + 0 )

   WAIT_ABANDONED         ((STATUS_ABANDONED_WAIT_0 ) + 0 )
   WAIT_ABANDONED_0       ((STATUS_ABANDONED_WAIT_0 ) + 0 )

   WAIT_IO_COMPLETION                  STATUS_USER_APC
   STILL_ACTIVE                        STATUS_PENDING
   EXCEPTION_ACCESS_VIOLATION          STATUS_ACCESS_VIOLATION
   EXCEPTION_DATATYPE_MISALIGNMENT     STATUS_DATATYPE_MISALIGNMENT
   EXCEPTION_BREAKPOINT                STATUS_BREAKPOINT
   EXCEPTION_SINGLE_STEP               STATUS_SINGLE_STEP
   EXCEPTION_ARRAY_BOUNDS_EXCEEDED     STATUS_ARRAY_BOUNDS_EXCEEDED
   EXCEPTION_FLT_DENORMAL_OPERAND      STATUS_FLOAT_DENORMAL_OPERAND
   EXCEPTION_FLT_DIVIDE_BY_ZERO        STATUS_FLOAT_DIVIDE_BY_ZERO
   EXCEPTION_FLT_INEXACT_RESULT        STATUS_FLOAT_INEXACT_RESULT
   EXCEPTION_FLT_INVALID_OPERATION     STATUS_FLOAT_INVALID_OPERATION
   EXCEPTION_FLT_OVERFLOW              STATUS_FLOAT_OVERFLOW
   EXCEPTION_FLT_STACK_CHECK           STATUS_FLOAT_STACK_CHECK
   EXCEPTION_FLT_UNDERFLOW             STATUS_FLOAT_UNDERFLOW
   EXCEPTION_INT_DIVIDE_BY_ZERO        STATUS_INTEGER_DIVIDE_BY_ZERO
   EXCEPTION_INT_OVERFLOW              STATUS_INTEGER_OVERFLOW
   EXCEPTION_PRIV_INSTRUCTION          STATUS_PRIVILEGED_INSTRUCTION
   EXCEPTION_IN_PAGE_ERROR             STATUS_IN_PAGE_ERROR
   EXCEPTION_ILLEGAL_INSTRUCTION       STATUS_ILLEGAL_INSTRUCTION
   EXCEPTION_NONCONTINUABLE_EXCEPTION  STATUS_NONCONTINUABLE_EXCEPTION
   EXCEPTION_STACK_OVERFLOW            STATUS_STACK_OVERFLOW
   EXCEPTION_INVALID_DISPOSITION       STATUS_INVALID_DISPOSITION
   EXCEPTION_GUARD_PAGE                STATUS_GUARD_PAGE_VIOLATION
   EXCEPTION_INVALID_HANDLE            STATUS_INVALID_HANDLE
   CONTROL_C_EXIT                      STATUS_CONTROL_C_EXIT
   MoveMemory RtlMoveMemory
   CopyMemory RtlCopyMemory
   FillMemory RtlFillMemory
   ZeroMemory RtlZeroMemory
*)
//
// File creation flags must start at the high end since they
// are combined with the attributes
//
const
   FILE_FLAG_WRITE_THROUGH         = $80000000;
   FILE_FLAG_OVERLAPPED            = $40000000;
   FILE_FLAG_NO_BUFFERING          = $20000000;
   FILE_FLAG_RANDOM_ACCESS         = $10000000;
   FILE_FLAG_SEQUENTIAL_SCAN       = $08000000;
   FILE_FLAG_DELETE_ON_CLOSE       = $04000000;
   FILE_FLAG_BACKUP_SEMANTICS      = $02000000;
   FILE_FLAG_POSIX_SEMANTICS       = $01000000;
   FILE_FLAG_OPEN_REPARSE_POINT    = $00200000;
   FILE_FLAG_OPEN_NO_RECALL        = $00100000;
   FILE_FLAG_FIRST_PIPE_INSTANCE   = $00080000;

   CREATE_NEW          = 1;
   CREATE_ALWAYS       = 2;
   OPEN_EXISTING       = 3;
   OPEN_ALWAYS         = 4;
   TRUNCATE_EXISTING   = 5;

//#if(_WIN32_WINNT >= $0400)
const
//
// Define possible return codes from the CopyFileEx callback routine
//
   PROGRESS_CONTINUE   = 0;
   PROGRESS_CANCEL     = 1;
   PROGRESS_STOP       = 2;
   PROGRESS_QUIET      = 3;
//
// Define CopyFileEx callback routine state change values
//
   CALLBACK_CHUNK_FINISHED         = $00000000;
   CALLBACK_STREAM_SWITCH          = $00000001;
//
// Define CopyFileEx option flags
//
   COPY_FILE_FAIL_IF_EXISTS              = $00000001;
   COPY_FILE_RESTARTABLE                 = $00000002;
   COPY_FILE_OPEN_SOURCE_FOR_WRITE       = $00000004;
   COPY_FILE_ALLOW_DECRYPTED_DESTINATION = $00000008;
//#endif (* _WIN32_WINNT >= = $0400 *)

//#if (_WIN32_WINNT >= = $0500)
const
//
// Define ReplaceFile option flags
//
   REPLACEFILE_WRITE_THROUGH       = $00000001;
   REPLACEFILE_IGNORE_MERGE_ERRORS = $00000002;
//#endif // #if (_WIN32_WINNT >= = $0500)

//
// Define the NamedPipe definitions
//
const
//
// Define the dwOpenMode values for CreateNamedPipe
//
   PIPE_ACCESS_INBOUND         = $00000001;
   PIPE_ACCESS_OUTBOUND        = $00000002;
   PIPE_ACCESS_DUPLEX          = $00000003;
//
// Define the Named Pipe End flags for GetNamedPipeInfo
//
   PIPE_CLIENT_END             = $00000000;
   PIPE_SERVER_END             = $00000001;
//
// Define the dwPipeMode values for CreateNamedPipe
//
   PIPE_WAIT                   = $00000000;
   PIPE_NOWAIT                 = $00000001;
   PIPE_READMODE_BYTE          = $00000000;
   PIPE_READMODE_MESSAGE       = $00000002;
   PIPE_TYPE_BYTE              = $00000000;
   PIPE_TYPE_MESSAGE           = $00000004;
//
// Define the well known values for CreateNamedPipe nMaxInstances
//
   PIPE_UNLIMITED_INSTANCES    = 255;
//
// Define the Security Quality of Service bits to be passed
// into CreateFile
//
   SECURITY_ANONYMOUS          ( SecurityAnonymous      << 16 )
   SECURITY_IDENTIFICATION     ( SecurityIdentification << 16 )
   SECURITY_IMPERSONATION      ( SecurityImpersonation  << 16 )
   SECURITY_DELEGATION         ( SecurityDelegation     << 16 )

   SECURITY_CONTEXT_TRACKING  = $00040000;
   SECURITY_EFFECTIVE_ONLY    = $00080000;

   SECURITY_SQOS_PRESENT      = $00100000;
   SECURITY_VALID_SQOS_FLAGS  = $001F0000;

//
//  File structures
//

type struct _OVERLAPPED {
    ULONG_PTR Internal;
    ULONG_PTR InternalHigh;
    union {
        struct {
            DWORD Offset;
            DWORD OffsetHigh;
        };

        PVOID Pointer;
    };

    HANDLE  hEvent;
} OVERLAPPED, *LPOVERLAPPED;

type struct _SECURITY_ATTRIBUTES {
    DWORD nLength;
    LPVOID lpSecurityDescriptor;
    BOOL bInheritHandle;
} SECURITY_ATTRIBUTES, *PSECURITY_ATTRIBUTES, *LPSECURITY_ATTRIBUTES;

type struct _PROCESS_INFORMATION {
    HANDLE hProcess;
    HANDLE hThread;
    DWORD dwProcessId;
    DWORD dwThreadId;
} PROCESS_INFORMATION, *PPROCESS_INFORMATION, *LPPROCESS_INFORMATION;

//
//  File System time stamps are represented with the following structure:
//


type struct _FILETIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
} FILETIME, *PFILETIME, *LPFILETIME;

//
// System time is represented with the following structure:
//


type struct _SYSTEMTIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
} SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;


type DWORD (WINAPI *PTHREAD_START_ROUTINE)(
    LPVOID lpThreadParameter
    );
type PTHREAD_START_ROUTINE LPTHREAD_START_ROUTINE;

#if(_WIN32_WINNT >= = $0400)
type VOID (WINAPI *PFIBER_START_ROUTINE)(
    LPVOID lpFiberParameter
    );
type PFIBER_START_ROUTINE LPFIBER_START_ROUTINE;
#endif (* _WIN32_WINNT >= = $0400 *)

type RTL_CRITICAL_SECTION CRITICAL_SECTION;
type PRTL_CRITICAL_SECTION PCRITICAL_SECTION;
type PRTL_CRITICAL_SECTION LPCRITICAL_SECTION;

type RTL_CRITICAL_SECTION_DEBUG CRITICAL_SECTION_DEBUG;
type PRTL_CRITICAL_SECTION_DEBUG PCRITICAL_SECTION_DEBUG;
type PRTL_CRITICAL_SECTION_DEBUG LPCRITICAL_SECTION_DEBUG;

#if defined(_X86_)
type PLDT_ENTRY LPLDT_ENTRY;
#else
type LPVOID LPLDT_ENTRY;
#endif

   MUTEX_MODIFY_STATE MUTANT_QUERY_STATE
   MUTEX_ALL_ACCESS MUTANT_ALL_ACCESS

//
// Serial provider type.
//

   SP_SERIALCOMM    ((DWORD)= $00000001)

//
// Provider SubTypes
//

   PST_UNSPECIFIED      ((DWORD)= $00000000)
   PST_RS232            ((DWORD)= $00000001)
   PST_PARALLELPORT     ((DWORD)= $00000002)
   PST_RS422            ((DWORD)= $00000003)
   PST_RS423            ((DWORD)= $00000004)
   PST_RS449            ((DWORD)= $00000005)
   PST_MODEM            ((DWORD)= $00000006)
   PST_FAX              ((DWORD)= $00000021)
   PST_SCANNER          ((DWORD)= $00000022)
   PST_NETWORK_BRIDGE   ((DWORD)= $00000100)
   PST_LAT              ((DWORD)= $00000101)
   PST_TCPIP_TELNET     ((DWORD)= $00000102)
   PST_X25              ((DWORD)= $00000103)


//
// Provider capabilities flags.
//

   PCF_DTRDSR        ((DWORD)= $0001)
   PCF_RTSCTS        ((DWORD)= $0002)
   PCF_RLSD          ((DWORD)= $0004)
   PCF_PARITY_CHECK  ((DWORD)= $0008)
   PCF_XONXOFF       ((DWORD)= $0010)
   PCF_SETXCHAR      ((DWORD)= $0020)
   PCF_TOTALTIMEOUTS ((DWORD)= $0040)
   PCF_INTTIMEOUTS   ((DWORD)= $0080)
   PCF_SPECIALCHARS  ((DWORD)= $0100)
   PCF_16BITMODE     ((DWORD)= $0200)

//
// Comm provider settable parameters.
//

   SP_PARITY         ((DWORD)= $0001)
   SP_BAUD           ((DWORD)= $0002)
   SP_DATABITS       ((DWORD)= $0004)
   SP_STOPBITS       ((DWORD)= $0008)
   SP_HANDSHAKING    ((DWORD)= $0010)
   SP_PARITY_CHECK   ((DWORD)= $0020)
   SP_RLSD           ((DWORD)= $0040)

//
// Settable baud rates in the provider.
//

   BAUD_075          ((DWORD)= $00000001)
   BAUD_110          ((DWORD)= $00000002)
   BAUD_134_5        ((DWORD)= $00000004)
   BAUD_150          ((DWORD)= $00000008)
   BAUD_300          ((DWORD)= $00000010)
   BAUD_600          ((DWORD)= $00000020)
   BAUD_1200         ((DWORD)= $00000040)
   BAUD_1800         ((DWORD)= $00000080)
   BAUD_2400         ((DWORD)= $00000100)
   BAUD_4800         ((DWORD)= $00000200)
   BAUD_7200         ((DWORD)= $00000400)
   BAUD_9600         ((DWORD)= $00000800)
   BAUD_14400        ((DWORD)= $00001000)
   BAUD_19200        ((DWORD)= $00002000)
   BAUD_38400        ((DWORD)= $00004000)
   BAUD_56K          ((DWORD)= $00008000)
   BAUD_128K         ((DWORD)= $00010000)
   BAUD_115200       ((DWORD)= $00020000)
   BAUD_57600        ((DWORD)= $00040000)
   BAUD_USER         ((DWORD)= $10000000)

//
// Settable Data Bits
//

   DATABITS_5        ((WORD)= $0001)
   DATABITS_6        ((WORD)= $0002)
   DATABITS_7        ((WORD)= $0004)
   DATABITS_8        ((WORD)= $0008)
   DATABITS_16       ((WORD)= $0010)
   DATABITS_16X      ((WORD)= $0020)

//
// Settable Stop and Parity bits.
//

   STOPBITS_10       ((WORD)= $0001)
   STOPBITS_15       ((WORD)= $0002)
   STOPBITS_20       ((WORD)= $0004)
   PARITY_NONE       ((WORD)= $0100)
   PARITY_ODD        ((WORD)= $0200)
   PARITY_EVEN       ((WORD)= $0400)
   PARITY_MARK       ((WORD)= $0800)
   PARITY_SPACE      ((WORD)= $1000)

type struct _COMMPROP {
    WORD wPacketLength;
    WORD wPacketVersion;
    DWORD dwServiceMask;
    DWORD dwReserved1;
    DWORD dwMaxTxQueue;
    DWORD dwMaxRxQueue;
    DWORD dwMaxBaud;
    DWORD dwProvSubType;
    DWORD dwProvCapabilities;
    DWORD dwSettableParams;
    DWORD dwSettableBaud;
    WORD wSettableData;
    WORD wSettableStopParity;
    DWORD dwCurrentTxQueue;
    DWORD dwCurrentRxQueue;
    DWORD dwProvSpec1;
    DWORD dwProvSpec2;
    WCHAR wcProvChar[1];
} COMMPROP,*LPCOMMPROP;

//
// Set dwProvSpec1 to COMMPROP_INITIALIZED to indicate that wPacketLength
// is valid before a call to GetCommProperties().
//
   COMMPROP_INITIALIZED ((DWORD)= $E73CF52E)

type struct _COMSTAT {
    DWORD fCtsHold : 1;
    DWORD fDsrHold : 1;
    DWORD fRlsdHold : 1;
    DWORD fXoffHold : 1;
    DWORD fXoffSent : 1;
    DWORD fEof : 1;
    DWORD fTxim : 1;
    DWORD fReserved : 25;
    DWORD cbInQue;
    DWORD cbOutQue;
} COMSTAT, *LPCOMSTAT;

//
// DTR Control Flow Values.
//
   DTR_CONTROL_DISABLE    = $00
   DTR_CONTROL_ENABLE     = $01
   DTR_CONTROL_HANDSHAKE  = $02

//
// RTS Control Flow Values
//
   RTS_CONTROL_DISABLE    = $00
   RTS_CONTROL_ENABLE     = $01
   RTS_CONTROL_HANDSHAKE  = $02
   RTS_CONTROL_TOGGLE     = $03

type struct _DCB {
    DWORD DCBlength;      (* sizeof(DCB)                     *)
    DWORD BaudRate;       (* Baudrate at which running       *)
    DWORD fBinary: 1;     (* Binary Mode (skip EOF check)    *)
    DWORD fParity: 1;     (* Enable parity checking          *)
    DWORD fOutxCtsFlow:1; (* CTS handshaking on output       *)
    DWORD fOutxDsrFlow:1; (* DSR handshaking on output       *)
    DWORD fDtrControl:2;  (* DTR Flow control                *)
    DWORD fDsrSensitivity:1; (* DSR Sensitivity              *)
    DWORD fTXContinueOnXoff: 1; (* Continue TX when Xoff sent *)
    DWORD fOutX: 1;       (* Enable output X-ON/X-OFF        *)
    DWORD fInX: 1;        (* Enable input X-ON/X-OFF         *)
    DWORD fErrorChar: 1;  (* Enable Err Replacement          *)
    DWORD fNull: 1;       (* Enable Null stripping           *)
    DWORD fRtsControl:2;  (* Rts Flow control                *)
    DWORD fAbortOnError:1; (* Abort all reads and writes on Error *)
    DWORD fDummy2:17;     (* Reserved                        *)
    WORD wReserved;       (* Not currently used              *)
    WORD XonLim;          (* Transmit X-ON threshold         *)
    WORD XoffLim;         (* Transmit X-OFF threshold        *)
    BYTE ByteSize;        (* Number of bits/byte, 4-8        *)
    BYTE Parity;          (* 0-4=None,Odd,Even,Mark,Space    *)
    BYTE StopBits;        (* 0,1,2 = 1, 1.5, 2               *)
    char XonChar;         (* Tx and Rx X-ON character        *)
    char XoffChar;        (* Tx and Rx X-OFF character       *)
    char ErrorChar;       (* Error replacement char          *)
    char EofChar;         (* End of Input character          *)
    char EvtChar;         (* Received Event character        *)
    WORD wReserved1;      (* Fill for now.                   *)
} DCB, *LPDCB;

type struct _COMMTIMEOUTS {
    DWORD ReadIntervalTimeout;          (* Maximum time between read chars. *)
    DWORD ReadTotalTimeoutMultiplier;   (* Multiplier of characters.        *)
    DWORD ReadTotalTimeoutConstant;     (* Constant in milliseconds.        *)
    DWORD WriteTotalTimeoutMultiplier;  (* Multiplier of characters.        *)
    DWORD WriteTotalTimeoutConstant;    (* Constant in milliseconds.        *)
} COMMTIMEOUTS,*LPCOMMTIMEOUTS;

type struct _COMMCONFIG {
    DWORD dwSize;               (* Size of the entire struct *)
    WORD wVersion;              (* version of the structure *)
    WORD wReserved;             (* alignment *)
    DCB dcb;                    (* device control block *)
    DWORD dwProviderSubType;    (* ordinal value for identifying
                                   provider-defined data structure format*)
    DWORD dwProviderOffset;     (* Specifies the offset of provider specific
                                   data field in bytes from the start *)
    DWORD dwProviderSize;       (* size of the provider-specific data field *)
    WCHAR wcProviderData[1];    (* provider-specific data *)
} COMMCONFIG,*LPCOMMCONFIG;

type struct _SYSTEM_INFO {
    union {
        DWORD dwOemId;          // Obsolete field...do not use
        struct {
            WORD wProcessorArchitecture;
            WORD wReserved;
        };
    };
    DWORD dwPageSize;
    LPVOID lpMinimumApplicationAddress;
    LPVOID lpMaximumApplicationAddress;
    DWORD_PTR dwActiveProcessorMask;
    DWORD dwNumberOfProcessors;
    DWORD dwProcessorType;
    DWORD dwAllocationGranularity;
    WORD wProcessorLevel;
    WORD wProcessorRevision;
} SYSTEM_INFO, *LPSYSTEM_INFO;

//
//


   FreeModule(hLibModule) FreeLibrary((hLibModule))
   MakeProcInstance(lpProc,hInstance) (lpProc)
   FreeProcInstance(lpProc) (lpProc)

(* Global Memory Flags *)
   GMEM_FIXED          = $0000
   GMEM_MOVEABLE       = $0002
   GMEM_NOCOMPACT      = $0010
   GMEM_NODISCARD      = $0020
   GMEM_ZEROINIT       = $0040
   GMEM_MODIFY         = $0080
   GMEM_DISCARDABLE    = $0100
   GMEM_NOT_BANKED     = $1000
   GMEM_SHARE          = $2000
   GMEM_DDESHARE       = $2000
   GMEM_NOTIFY         = $4000
   GMEM_LOWER          GMEM_NOT_BANKED
   GMEM_VALID_FLAGS    = $7F72
   GMEM_INVALID_HANDLE = $8000

   GHND                (GMEM_MOVEABLE | GMEM_ZEROINIT)
   GPTR                (GMEM_FIXED | GMEM_ZEROINIT)

   GlobalLRUNewest( h )    ((HANDLE)(h))
   GlobalLRUOldest( h )    ((HANDLE)(h))
   GlobalDiscard( h )      GlobalReAlloc( (h), 0, GMEM_MOVEABLE )

(* Flags returned by GlobalFlags (in addition to GMEM_DISCARDABLE) *)
   GMEM_DISCARDED      = $4000
   GMEM_LOCKCOUNT      = $00FF

type struct _MEMORYSTATUS {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    SIZE_T dwTotalPhys;
    SIZE_T dwAvailPhys;
    SIZE_T dwTotalPageFile;
    SIZE_T dwAvailPageFile;
    SIZE_T dwTotalVirtual;
    SIZE_T dwAvailVirtual;
} MEMORYSTATUS, *LPMEMORYSTATUS;

(* Local Memory Flags *)
   LMEM_FIXED          = $0000
   LMEM_MOVEABLE       = $0002
   LMEM_NOCOMPACT      = $0010
   LMEM_NODISCARD      = $0020
   LMEM_ZEROINIT       = $0040
   LMEM_MODIFY         = $0080
   LMEM_DISCARDABLE    = $0F00
   LMEM_VALID_FLAGS    = $0F72
   LMEM_INVALID_HANDLE = $8000

   LHND                (LMEM_MOVEABLE | LMEM_ZEROINIT)
   LPTR                (LMEM_FIXED | LMEM_ZEROINIT)

   NONZEROLHND         (LMEM_MOVEABLE)
   NONZEROLPTR         (LMEM_FIXED)

   LocalDiscard( h )   LocalReAlloc( (h), 0, LMEM_MOVEABLE )

(* Flags returned by LocalFlags (in addition to LMEM_DISCARDABLE) *)
   LMEM_DISCARDED      = $4000
   LMEM_LOCKCOUNT      = $00FF

//
// dwCreationFlag values
//

   DEBUG_PROCESS                     = $00000001
   DEBUG_ONLY_THIS_PROCESS           = $00000002

   CREATE_SUSPENDED                  = $00000004

   DETACHED_PROCESS                  = $00000008

   CREATE_NEW_CONSOLE                = $00000010

   NORMAL_PRIORITY_CLASS             = $00000020
   IDLE_PRIORITY_CLASS               = $00000040
   HIGH_PRIORITY_CLASS               = $00000080
   REALTIME_PRIORITY_CLASS           = $00000100

   CREATE_NEW_PROCESS_GROUP          = $00000200
   CREATE_UNICODE_ENVIRONMENT        = $00000400

   CREATE_SEPARATE_WOW_VDM           = $00000800
   CREATE_SHARED_WOW_VDM             = $00001000
   CREATE_FORCEDOS                   = $00002000

   BELOW_NORMAL_PRIORITY_CLASS       = $00004000
   ABOVE_NORMAL_PRIORITY_CLASS       = $00008000
   STACK_SIZE_PARAM_IS_A_RESERVATION = $00010000

   CREATE_BREAKAWAY_FROM_JOB         = $01000000
   CREATE_PRESERVE_CODE_AUTHZ_LEVEL  = $02000000

   CREATE_DEFAULT_ERROR_MODE         = $04000000
   CREATE_NO_WINDOW                  = $08000000

   PROFILE_USER                      = $10000000
   PROFILE_KERNEL                    = $20000000
   PROFILE_SERVER                    = $40000000

   CREATE_IGNORE_SYSTEM_DEFAULT      = $80000000

   THREAD_PRIORITY_LOWEST          THREAD_BASE_PRIORITY_MIN
   THREAD_PRIORITY_BELOW_NORMAL    (THREAD_PRIORITY_LOWEST+1)
   THREAD_PRIORITY_NORMAL          0
   THREAD_PRIORITY_HIGHEST         THREAD_BASE_PRIORITY_MAX
   THREAD_PRIORITY_ABOVE_NORMAL    (THREAD_PRIORITY_HIGHEST-1)
   THREAD_PRIORITY_ERROR_RETURN    (MAXLONG)

   THREAD_PRIORITY_TIME_CRITICAL   THREAD_BASE_PRIORITY_LOWRT
   THREAD_PRIORITY_IDLE            THREAD_BASE_PRIORITY_IDLE

//
// Debug APIs
//
   EXCEPTION_DEBUG_EVENT       1
   CREATE_THREAD_DEBUG_EVENT   2
   CREATE_PROCESS_DEBUG_EVENT  3
   EXIT_THREAD_DEBUG_EVENT     4
   EXIT_PROCESS_DEBUG_EVENT    5
   LOAD_DLL_DEBUG_EVENT        6
   UNLOAD_DLL_DEBUG_EVENT      7
   OUTPUT_DEBUG_STRING_EVENT   8
   RIP_EVENT                   9

type struct _EXCEPTION_DEBUG_INFO {
    EXCEPTION_RECORD ExceptionRecord;
    DWORD dwFirstChance;
} EXCEPTION_DEBUG_INFO, *LPEXCEPTION_DEBUG_INFO;

type struct _CREATE_THREAD_DEBUG_INFO {
    HANDLE hThread;
    LPVOID lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
} CREATE_THREAD_DEBUG_INFO, *LPCREATE_THREAD_DEBUG_INFO;

type struct _CREATE_PROCESS_DEBUG_INFO {
    HANDLE hFile;
    HANDLE hProcess;
    HANDLE hThread;
    LPVOID lpBaseOfImage;
    DWORD dwDebugInfoFileOffset;
    DWORD nDebugInfoSize;
    LPVOID lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
    LPVOID lpImageName;
    WORD fUnicode;
} CREATE_PROCESS_DEBUG_INFO, *LPCREATE_PROCESS_DEBUG_INFO;

type struct _EXIT_THREAD_DEBUG_INFO {
    DWORD dwExitCode;
} EXIT_THREAD_DEBUG_INFO, *LPEXIT_THREAD_DEBUG_INFO;

type struct _EXIT_PROCESS_DEBUG_INFO {
    DWORD dwExitCode;
} EXIT_PROCESS_DEBUG_INFO, *LPEXIT_PROCESS_DEBUG_INFO;

type struct _LOAD_DLL_DEBUG_INFO {
    HANDLE hFile;
    LPVOID lpBaseOfDll;
    DWORD dwDebugInfoFileOffset;
    DWORD nDebugInfoSize;
    LPVOID lpImageName;
    WORD fUnicode;
} LOAD_DLL_DEBUG_INFO, *LPLOAD_DLL_DEBUG_INFO;

type struct _UNLOAD_DLL_DEBUG_INFO {
    LPVOID lpBaseOfDll;
} UNLOAD_DLL_DEBUG_INFO, *LPUNLOAD_DLL_DEBUG_INFO;

type struct _OUTPUT_DEBUG_STRING_INFO {
    LPSTR lpDebugStringData;
    WORD fUnicode;
    WORD nDebugStringLength;
} OUTPUT_DEBUG_STRING_INFO, *LPOUTPUT_DEBUG_STRING_INFO;

type struct _RIP_INFO {
    DWORD dwError;
    DWORD dwType;
} RIP_INFO, *LPRIP_INFO;


type struct _DEBUG_EVENT {
    DWORD dwDebugEventCode;
    DWORD dwProcessId;
    DWORD dwThreadId;
    union {
        EXCEPTION_DEBUG_INFO Exception;
        CREATE_THREAD_DEBUG_INFO CreateThread;
        CREATE_PROCESS_DEBUG_INFO CreateProcessInfo;
        EXIT_THREAD_DEBUG_INFO ExitThread;
        EXIT_PROCESS_DEBUG_INFO ExitProcess;
        LOAD_DLL_DEBUG_INFO LoadDll;
        UNLOAD_DLL_DEBUG_INFO UnloadDll;
        OUTPUT_DEBUG_STRING_INFO DebugString;
        RIP_INFO RipInfo;
    } u;
} DEBUG_EVENT, *LPDEBUG_EVENT;

#if !defined(MIDL_PASS)
type PCONTEXT LPCONTEXT;
type PEXCEPTION_RECORD LPEXCEPTION_RECORD;
type PEXCEPTION_POINTERS LPEXCEPTION_POINTERS;
#endif

   DRIVE_UNKNOWN     0
   DRIVE_NO_ROOT_DIR 1
   DRIVE_REMOVABLE   2
   DRIVE_FIXED       3
   DRIVE_REMOTE      4
   DRIVE_CDROM       5
   DRIVE_RAMDISK     6


#ifndef _MAC
   GetFreeSpace(w)                 (= $100000L)
#else
WINBASEAPI DWORD WINAPI GetFreeSpace(UINT);
#endif


   FILE_TYPE_UNKNOWN   = $0000
   FILE_TYPE_DISK      = $0001
   FILE_TYPE_CHAR      = $0002
   FILE_TYPE_PIPE      = $0003
   FILE_TYPE_REMOTE    = $8000


   STD_INPUT_HANDLE    ((DWORD)-10)
   STD_OUTPUT_HANDLE   ((DWORD)-11)
   STD_ERROR_HANDLE    ((DWORD)-12)

   NOPARITY            0
   ODDPARITY           1
   EVENPARITY          2
   MARKPARITY          3
   SPACEPARITY         4

   ONESTOPBIT          0
   ONE5STOPBITS        1
   TWOSTOPBITS         2

   IGNORE              0       // Ignore signal
   INFINITE            = $FFFFFFFF  // Infinite timeout

//
// Baud rates at which the communication device operates
//

   CBR_110             110
   CBR_300             300
   CBR_600             600
   CBR_1200            1200
   CBR_2400            2400
   CBR_4800            4800
   CBR_9600            9600
   CBR_14400           14400
   CBR_19200           19200
   CBR_38400           38400
   CBR_56000           56000
   CBR_57600           57600
   CBR_115200          115200
   CBR_128000          128000
   CBR_256000          256000

//
// Error Flags
//

   CE_RXOVER           = $0001  // Receive Queue overflow
   CE_OVERRUN          = $0002  // Receive Overrun Error
   CE_RXPARITY         = $0004  // Receive Parity Error
   CE_FRAME            = $0008  // Receive Framing error
   CE_BREAK            = $0010  // Break Detected
   CE_TXFULL           = $0100  // TX Queue is full
   CE_PTO              = $0200  // LPTx Timeout
   CE_IOE              = $0400  // LPTx I/O Error
   CE_DNS              = $0800  // LPTx Device not selected
   CE_OOP              = $1000  // LPTx Out-Of-Paper
   CE_MODE             = $8000  // Requested mode unsupported

   IE_BADID            (-1)    // Invalid or unsupported id
   IE_OPEN             (-2)    // Device Already Open
   IE_NOPEN            (-3)    // Device Not Open
   IE_MEMORY           (-4)    // Unable to allocate queues
   IE_DEFAULT          (-5)    // Error in default parameters
   IE_HARDWARE         (-10)   // Hardware Not Present
   IE_BYTESIZE         (-11)   // Illegal Byte Size
   IE_BAUDRATE         (-12)   // Unsupported BaudRate

//
// Events
//

   EV_RXCHAR           = $0001  // Any Character received
   EV_RXFLAG           = $0002  // Received certain character
   EV_TXEMPTY          = $0004  // Transmitt Queue Empty
   EV_CTS              = $0008  // CTS changed state
   EV_DSR              = $0010  // DSR changed state
   EV_RLSD             = $0020  // RLSD changed state
   EV_BREAK            = $0040  // BREAK received
   EV_ERR              = $0080  // Line status error occurred
   EV_RING             = $0100  // Ring signal detected
   EV_PERR             = $0200  // Printer error occured
   EV_RX80FULL         = $0400  // Receive buffer is 80 percent full
   EV_EVENT1           = $0800  // Provider specific event 1
   EV_EVENT2           = $1000  // Provider specific event 2

//
// Escape Functions
//

   SETXOFF             1       // Simulate XOFF received
   SETXON              2       // Simulate XON received
   SETRTS              3       // Set RTS high
   CLRRTS              4       // Set RTS low
   SETDTR              5       // Set DTR high
   CLRDTR              6       // Set DTR low
   RESETDEV            7       // Reset device if possible
   SETBREAK            8       // Set the device break line.
   CLRBREAK            9       // Clear the device break line.

//
// PURGE function flags.
//
   PURGE_TXABORT       = $0001  // Kill the pending/current writes to the comm port.
   PURGE_RXABORT       = $0002  // Kill the pending/current reads to the comm port.
   PURGE_TXCLEAR       = $0004  // Kill the transmit queue if there.
   PURGE_RXCLEAR       = $0008  // Kill the typeahead buffer if there.

   LPTx                = $80    // Set if ID is for LPT device

//
// Modem Status Flags
//
   MS_CTS_ON           ((DWORD)= $0010)
   MS_DSR_ON           ((DWORD)= $0020)
   MS_RING_ON          ((DWORD)= $0040)
   MS_RLSD_ON          ((DWORD)= $0080)

//
// WaitSoundState() Constants
//

   S_QUEUEEMPTY        0
   S_THRESHOLD         1
   S_ALLTHRESHOLD      2

//
// Accent Modes
//

   S_NORMAL      0
   S_LEGATO      1
   S_STACCATO    2

//
// SetSoundNoise() Sources
//

   S_PERIOD512   0     // Freq = N/512 high pitch, less coarse hiss
   S_PERIOD1024  1     // Freq = N/1024
   S_PERIOD2048  2     // Freq = N/2048 low pitch, more coarse hiss
   S_PERIODVOICE 3     // Source is frequency from voice channel (3)
   S_WHITE512    4     // Freq = N/512 high pitch, less coarse hiss
   S_WHITE1024   5     // Freq = N/1024
   S_WHITE2048   6     // Freq = N/2048 low pitch, more coarse hiss
   S_WHITEVOICE  7     // Source is frequency from voice channel (3)

   S_SERDVNA     (-1)  // Device not available
   S_SEROFM      (-2)  // Out of memory
   S_SERMACT     (-3)  // Music active
   S_SERQFUL     (-4)  // Queue full
   S_SERBDNT     (-5)  // Invalid note
   S_SERDLN      (-6)  // Invalid note length
   S_SERDCC      (-7)  // Invalid note count
   S_SERDTP      (-8)  // Invalid tempo
   S_SERDVL      (-9)  // Invalid volume
   S_SERDMD      (-10) // Invalid mode
   S_SERDSH      (-11) // Invalid shape
   S_SERDPT      (-12) // Invalid pitch
   S_SERDFQ      (-13) // Invalid frequency
   S_SERDDR      (-14) // Invalid duration
   S_SERDSR      (-15) // Invalid source
   S_SERDST      (-16) // Invalid state

   NMPWAIT_WAIT_FOREVER            = $ffffffff
   NMPWAIT_NOWAIT                  = $00000001
   NMPWAIT_USE_DEFAULT_WAIT        = $00000000

   FS_CASE_IS_PRESERVED            FILE_CASE_PRESERVED_NAMES
   FS_CASE_SENSITIVE               FILE_CASE_SENSITIVE_SEARCH
   FS_UNICODE_STORED_ON_DISK       FILE_UNICODE_ON_DISK
   FS_PERSISTENT_ACLS              FILE_PERSISTENT_ACLS
   FS_VOL_IS_COMPRESSED            FILE_VOLUME_IS_COMPRESSED
   FS_FILE_COMPRESSION             FILE_FILE_COMPRESSION
   FS_FILE_ENCRYPTION              FILE_SUPPORTS_ENCRYPTION






   FILE_MAP_COPY       SECTION_QUERY
   FILE_MAP_WRITE      SECTION_MAP_WRITE
   FILE_MAP_READ       SECTION_MAP_READ
   FILE_MAP_ALL_ACCESS SECTION_ALL_ACCESS

   OF_READ             = $00000000
   OF_WRITE            = $00000001
   OF_READWRITE        = $00000002
   OF_SHARE_COMPAT     = $00000000
   OF_SHARE_EXCLUSIVE  = $00000010
   OF_SHARE_DENY_WRITE = $00000020
   OF_SHARE_DENY_READ  = $00000030
   OF_SHARE_DENY_NONE  = $00000040
   OF_PARSE            = $00000100
   OF_DELETE           = $00000200
   OF_VERIFY           = $00000400
   OF_CANCEL           = $00000800
   OF_CREATE           = $00001000
   OF_PROMPT           = $00002000
   OF_EXIST            = $00004000
   OF_REOPEN           = $00008000

   OFS_MAXPATHNAME 128
type struct _OFSTRUCT {
    BYTE cBytes;
    BYTE fFixedDisk;
    WORD nErrCode;
    WORD Reserved1;
    WORD Reserved2;
    CHAR szPathName[OFS_MAXPATHNAME];
} OFSTRUCT, *LPOFSTRUCT, *POFSTRUCT;

//
// The Risc compilers support intrinsic functions for interlocked
// increment, decrement, and exchange.
//

#ifndef NOWINBASEINTERLOCK

#ifndef _NTOS_

#if defined(_M_IA64) && !defined(RC_INVOKED)

   InterlockedIncrement _InterlockedIncrement
   InterlockedDecrement _InterlockedDecrement
   InterlockedExchange _InterlockedExchange
   InterlockedExchangeAdd _InterlockedExchangeAdd
   InterlockedCompareExchange _InterlockedCompareExchange
   InterlockedExchangePointer _InterlockedExchangePointer
   InterlockedCompareExchangePointer _InterlockedCompareExchangePointer

LONG
__cdecl
InterlockedIncrement(
    IN OUT LONG volatile *lpAddend
    );

LONG
__cdecl
InterlockedDecrement(
    IN OUT LONG volatile *lpAddend
    );

LONG
__cdecl
InterlockedExchange(
    IN OUT LONG volatile *Target,
    IN LONG Value
    );

LONG
__cdecl
InterlockedExchangeAdd(
    IN OUT LONG volatile *Addend,
    IN LONG Value
    );

LONG
__cdecl
InterlockedCompareExchange (
    IN OUT LONG volatile *Destination,
    IN LONG ExChange,
    IN LONG Comperand
    );

PVOID
__cdecl
InterlockedExchangePointer(
    IN OUT PVOID volatile *Target,
    IN PVOID Value
    );

PVOID
__cdecl
InterlockedCompareExchangePointer (
    IN OUT PVOID volatile *Destination,
    IN PVOID ExChange,
    IN PVOID Comperand
    );

#pragma intrinsic(_InterlockedIncrement)
#pragma intrinsic(_InterlockedDecrement)
#pragma intrinsic(_InterlockedExchange)
#pragma intrinsic(_InterlockedExchangeAdd)
#pragma intrinsic(_InterlockedCompareExchange)
#pragma intrinsic(_InterlockedExchangePointer)
#pragma intrinsic(_InterlockedCompareExchangePointer)

#elif defined(_M_AMD64) && !defined(RC_INVOKED)

   InterlockedIncrement _InterlockedIncrement
   InterlockedDecrement _InterlockedDecrement
   InterlockedExchange _InterlockedExchange
   InterlockedExchangeAdd _InterlockedExchangeAdd
   InterlockedCompareExchange _InterlockedCompareExchange
   InterlockedExchangePointer _InterlockedExchangePointer
   InterlockedCompareExchangePointer _InterlockedCompareExchangePointer

LONG
InterlockedIncrement(
    IN OUT LONG volatile *Addend
    );

LONG
InterlockedDecrement(
    IN OUT LONG volatile *Addend
    );

LONG
InterlockedExchange(
    IN OUT LONG volatile *Target,
    IN LONG Value
    );

LONG
InterlockedExchangeAdd(
    IN OUT LONG volatile *Addend,
    IN LONG Value
    );

LONG
InterlockedCompareExchange (
    IN OUT LONG volatile *Destination,
    IN LONG ExChange,
    IN LONG Comperand
    );

PVOID
InterlockedCompareExchangePointer (
    IN OUT PVOID volatile *Destination,
    IN PVOID Exchange,
    IN PVOID Comperand
    );

PVOID
InterlockedExchangePointer(
    IN OUT PVOID volatile *Target,
    IN PVOID Value
    );

#pragma intrinsic(_InterlockedIncrement)
#pragma intrinsic(_InterlockedDecrement)
#pragma intrinsic(_InterlockedExchange)
#pragma intrinsic(_InterlockedExchangeAdd)
#pragma intrinsic(_InterlockedCompareExchange)
#pragma intrinsic(_InterlockedExchangePointer)
#pragma intrinsic(_InterlockedCompareExchangePointer)

#else           // X86 interlocked definitions

WINBASEAPI
LONG
WINAPI
InterlockedIncrement(
    IN OUT LONG volatile *lpAddend
    );

WINBASEAPI
LONG
WINAPI
InterlockedDecrement(
    IN OUT LONG volatile *lpAddend
    );

WINBASEAPI
LONG
WINAPI
InterlockedExchange(
    IN OUT LONG volatile *Target,
    IN LONG Value
    );

   InterlockedExchangePointer(Target, Value) \
    (PVOID)InterlockedExchange((PLONG)(Target), (LONG)(Value))

WINBASEAPI
LONG
WINAPI
InterlockedExchangeAdd(
    IN OUT LONG volatile *Addend,
    IN LONG Value
    );

WINBASEAPI
LONG
WINAPI
InterlockedCompareExchange (
    IN OUT LONG volatile *Destination,
    IN LONG Exchange,
    IN LONG Comperand
    );

//
// Use a function for C++ so X86 will generate the same errors as RISC.
//

#ifdef __cplusplus

FORCEINLINE
PVOID
__cdecl
__InlineInterlockedCompareExchangePointer (
    IN OUT PVOID volatile *Destination,
    IN PVOID ExChange,
    IN PVOID Comperand
    )
{
    return((PVOID)(LONG_PTR)InterlockedCompareExchange((LONG volatile *)Destination, (LONG)(LONG_PTR)ExChange, (LONG)(LONG_PTR)Comperand));
}

   InterlockedCompareExchangePointer __InlineInterlockedCompareExchangePointer

#else

   InterlockedCompareExchangePointer(Destination, ExChange, Comperand) \
    (PVOID)(LONG_PTR)InterlockedCompareExchange((LONG volatile *)(Destination), (LONG)(LONG_PTR)(ExChange), (LONG)(LONG_PTR)(Comperand))

#endif (* __cplusplus *)

#endif (* X86 | IA64 *)

#if defined(_SLIST_HEADER_) && !defined(_NTOSP_)

WINBASEAPI
VOID
WINAPI
InitializeSListHead (
    IN PSLIST_HEADER ListHead
    );

WINBASEAPI
PSINGLE_LIST_ENTRY
WINAPI
InterlockedPopEntrySList (
    IN PSLIST_HEADER ListHead
    );

WINBASEAPI
PSINGLE_LIST_ENTRY
WINAPI
InterlockedPushEntrySList (
    IN PSLIST_HEADER ListHead,
    IN PSINGLE_LIST_ENTRY ListEntry
    );

WINBASEAPI
PSINGLE_LIST_ENTRY
WINAPI
InterlockedFlushSList (
    IN PSLIST_HEADER ListHead
    );

WINBASEAPI
USHORT
WINAPI
QueryDepthSList (
    IN PSLIST_HEADER ListHead
    );

#endif (* _SLIST_HEADER_ *)
#endif (* _NTOS_ *)

#endif (* NOWINBASEINTERLOCK *)

WINBASEAPI
BOOL
WINAPI
FreeResource(
        IN HGLOBAL hResData
        );

WINBASEAPI
LPVOID
WINAPI
LockResource(
        IN HGLOBAL hResData
        );

   UnlockResource(hResData) ((hResData), 0)
   MAXINTATOM = $C000
   MAKEINTATOM(i)  (LPTSTR)((ULONG_PTR)((WORD)(i)))
   INVALID_ATOM ((ATOM)0)

#ifndef _MAC
int
WINAPI
#else
int
CALLBACK
#endif
WinMain(
    IN HINSTANCE hInstance,
    IN HINSTANCE hPrevInstance,
    IN LPSTR lpCmdLine,
    IN int nShowCmd
    );

WINBASEAPI
BOOL
WINAPI
FreeLibrary(
    IN OUT HMODULE hLibModule
    );


WINBASEAPI
DECLSPEC_NORETURN
VOID
WINAPI
FreeLibraryAndExitThread(
    IN HMODULE hLibModule,
    IN DWORD dwExitCode
    );

WINBASEAPI
BOOL
WINAPI
DisableThreadLibraryCalls(
    IN HMODULE hLibModule
    );

WINBASEAPI
FARPROC
WINAPI
GetProcAddress(
    IN HMODULE hModule,
    IN LPCSTR lpProcName
    );

WINBASEAPI
DWORD
WINAPI
GetVersion( VOID );

WINBASEAPI
HGLOBAL
WINAPI
GlobalAlloc(
    IN UINT uFlags,
    IN SIZE_T dwBytes
    );

WINBASEAPI
HGLOBAL
WINAPI
GlobalReAlloc(
    IN HGLOBAL hMem,
    IN SIZE_T dwBytes,
    IN UINT uFlags
    );

WINBASEAPI
SIZE_T
WINAPI
GlobalSize(
    IN HGLOBAL hMem
    );

WINBASEAPI
UINT
WINAPI
GlobalFlags(
    IN HGLOBAL hMem
    );


WINBASEAPI
LPVOID
WINAPI
GlobalLock(
    IN HGLOBAL hMem
    );

//!!!MWH My version  win31 = DWORD WINAPI GlobalHandle(UINT)
WINBASEAPI
HGLOBAL
WINAPI
GlobalHandle(
    IN LPCVOID pMem
    );


WINBASEAPI
BOOL
WINAPI
GlobalUnlock(
    IN HGLOBAL hMem
    );


WINBASEAPI
HGLOBAL
WINAPI
GlobalFree(
    IN HGLOBAL hMem
    );

WINBASEAPI
SIZE_T
WINAPI
GlobalCompact(
    IN DWORD dwMinFree
    );

WINBASEAPI
VOID
WINAPI
GlobalFix(
    IN HGLOBAL hMem
    );

WINBASEAPI
VOID
WINAPI
GlobalUnfix(
    IN HGLOBAL hMem
    );

WINBASEAPI
LPVOID
WINAPI
GlobalWire(
    IN HGLOBAL hMem
    );

WINBASEAPI
BOOL
WINAPI
GlobalUnWire(
    IN HGLOBAL hMem
    );

WINBASEAPI
VOID
WINAPI
GlobalMemoryStatus(
    IN OUT LPMEMORYSTATUS lpBuffer
    );

type struct _MEMORYSTATUSEX {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    DWORDLONG ullTotalPhys;
    DWORDLONG ullAvailPhys;
    DWORDLONG ullTotalPageFile;
    DWORDLONG ullAvailPageFile;
    DWORDLONG ullTotalVirtual;
    DWORDLONG ullAvailVirtual;
    DWORDLONG ullAvailExtendedVirtual;
} MEMORYSTATUSEX, *LPMEMORYSTATUSEX;

WINBASEAPI
BOOL
WINAPI
GlobalMemoryStatusEx(
    IN OUT LPMEMORYSTATUSEX lpBuffer
    );

WINBASEAPI
HLOCAL
WINAPI
LocalAlloc(
    IN UINT uFlags,
    IN SIZE_T uBytes
    );

WINBASEAPI
HLOCAL
WINAPI
LocalReAlloc(
    IN HLOCAL hMem,
    IN SIZE_T uBytes,
    IN UINT uFlags
    );

WINBASEAPI
LPVOID
WINAPI
LocalLock(
    IN HLOCAL hMem
    );

WINBASEAPI
HLOCAL
WINAPI
LocalHandle(
    IN LPCVOID pMem
    );

WINBASEAPI
BOOL
WINAPI
LocalUnlock(
    IN HLOCAL hMem
    );

WINBASEAPI
SIZE_T
WINAPI
LocalSize(
    IN HLOCAL hMem
    );

WINBASEAPI
UINT
WINAPI
LocalFlags(
    IN HLOCAL hMem
    );

WINBASEAPI
HLOCAL
WINAPI
LocalFree(
    IN HLOCAL hMem
    );

WINBASEAPI
SIZE_T
WINAPI
LocalShrink(
    IN HLOCAL hMem,
    IN UINT cbNewSize
    );

WINBASEAPI
SIZE_T
WINAPI
LocalCompact(
    IN UINT uMinFree
    );

WINBASEAPI
BOOL
WINAPI
FlushInstructionCache(
    IN HANDLE hProcess,
    IN LPCVOID lpBaseAddress,
    IN SIZE_T dwSize
    );

WINBASEAPI
LPVOID
WINAPI
VirtualAlloc(
    IN LPVOID lpAddress,
    IN SIZE_T dwSize,
    IN DWORD flAllocationType,
    IN DWORD flProtect
    );

WINBASEAPI
BOOL
WINAPI
VirtualFree(
    IN LPVOID lpAddress,
    IN SIZE_T dwSize,
    IN DWORD dwFreeType
    );

WINBASEAPI
BOOL
WINAPI
VirtualProtect(
    IN  LPVOID lpAddress,
    IN  SIZE_T dwSize,
    IN  DWORD flNewProtect,
    OUT PDWORD lpflOldProtect
    );

WINBASEAPI
SIZE_T
WINAPI
VirtualQuery(
    IN LPCVOID lpAddress,
    OUT PMEMORY_BASIC_INFORMATION lpBuffer,
    IN SIZE_T dwLength
    );

WINBASEAPI
LPVOID
WINAPI
VirtualAllocEx(
    IN HANDLE hProcess,
    IN LPVOID lpAddress,
    IN SIZE_T dwSize,
    IN DWORD flAllocationType,
    IN DWORD flProtect
    );

WINBASEAPI
UINT
WINAPI
GetWriteWatch(
    IN DWORD  dwFlags,
    IN PVOID  lpBaseAddress,
    IN SIZE_T dwRegionSize,
    IN OUT PVOID *lpAddresses,
    IN OUT PULONG_PTR lpdwCount,
    OUT PULONG lpdwGranularity
    );

WINBASEAPI
UINT
WINAPI
ResetWriteWatch(
    IN LPVOID lpBaseAddress,
    IN SIZE_T dwRegionSize
    );

WINBASEAPI
BOOL
WINAPI
VirtualFreeEx(
    IN HANDLE hProcess,
    IN LPVOID lpAddress,
    IN SIZE_T dwSize,
    IN DWORD dwFreeType
    );

WINBASEAPI
BOOL
WINAPI
VirtualProtectEx(
    IN  HANDLE hProcess,
    IN  LPVOID lpAddress,
    IN  SIZE_T dwSize,
    IN  DWORD flNewProtect,
    OUT PDWORD lpflOldProtect
    );

WINBASEAPI
SIZE_T
WINAPI
VirtualQueryEx(
    IN HANDLE hProcess,
    IN LPCVOID lpAddress,
    OUT PMEMORY_BASIC_INFORMATION lpBuffer,
    IN SIZE_T dwLength
    );

WINBASEAPI
HANDLE
WINAPI
HeapCreate(
    IN DWORD flOptions,
    IN SIZE_T dwInitialSize,
    IN SIZE_T dwMaximumSize
    );

WINBASEAPI
BOOL
WINAPI
HeapDestroy(
    IN OUT HANDLE hHeap
    );


WINBASEAPI
LPVOID
WINAPI
HeapAlloc(
    IN HANDLE hHeap,
    IN DWORD dwFlags,
    IN SIZE_T dwBytes
    );

WINBASEAPI
LPVOID
WINAPI
HeapReAlloc(
    IN HANDLE hHeap,
    IN DWORD dwFlags,
    IN LPVOID lpMem,
    IN SIZE_T dwBytes
    );

WINBASEAPI
BOOL
WINAPI
HeapFree(
    IN HANDLE hHeap,
    IN DWORD dwFlags,
    IN LPVOID lpMem
    );

WINBASEAPI
SIZE_T
WINAPI
HeapSize(
    IN HANDLE hHeap,
    IN DWORD dwFlags,
    IN LPCVOID lpMem
    );

WINBASEAPI
BOOL
WINAPI
HeapValidate(
    IN HANDLE hHeap,
    IN DWORD dwFlags,
    IN LPCVOID lpMem
    );

WINBASEAPI
SIZE_T
WINAPI
HeapCompact(
    IN HANDLE hHeap,
    IN DWORD dwFlags
    );

WINBASEAPI
HANDLE
WINAPI
GetProcessHeap( VOID );

WINBASEAPI
DWORD
WINAPI
GetProcessHeaps(
    IN DWORD NumberOfHeaps,
    OUT PHANDLE ProcessHeaps
    );

type struct _PROCESS_HEAP_ENTRY {
    PVOID lpData;
    DWORD cbData;
    BYTE cbOverhead;
    BYTE iRegionIndex;
    WORD wFlags;
    union {
        struct {
            HANDLE hMem;
            DWORD dwReserved[ 3 ];
        } Block;
        struct {
            DWORD dwCommittedSize;
            DWORD dwUnCommittedSize;
            LPVOID lpFirstBlock;
            LPVOID lpLastBlock;
        } Region;
    };
} PROCESS_HEAP_ENTRY, *LPPROCESS_HEAP_ENTRY, *PPROCESS_HEAP_ENTRY;

   PROCESS_HEAP_REGION             = $0001
   PROCESS_HEAP_UNCOMMITTED_RANGE  = $0002
   PROCESS_HEAP_ENTRY_BUSY         = $0004
   PROCESS_HEAP_ENTRY_MOVEABLE     = $0010
   PROCESS_HEAP_ENTRY_DDESHARE     = $0020

WINBASEAPI
BOOL
WINAPI
HeapLock(
    IN HANDLE hHeap
    );

WINBASEAPI
BOOL
WINAPI
HeapUnlock(
    IN HANDLE hHeap
    );


WINBASEAPI
BOOL
WINAPI
HeapWalk(
    IN HANDLE hHeap,
    IN OUT LPPROCESS_HEAP_ENTRY lpEntry
    );


WINBASEAPI
BOOL
WINAPI
HeapSetInformation (
    IN PVOID HeapHandle, 
    IN HEAP_INFORMATION_CLASS HeapInformationClass,
    IN PVOID HeapInformation OPTIONAL,
    IN SIZE_T HeapInformationLength OPTIONAL
    );

WINBASEAPI
BOOL
WINAPI
HeapQueryInformation (
    IN PVOID HeapHandle, 
    IN HEAP_INFORMATION_CLASS HeapInformationClass,
    OUT PVOID HeapInformation OPTIONAL,
    IN SIZE_T HeapInformationLength OPTIONAL,
    OUT PSIZE_T ReturnLength OPTIONAL
    );

// GetBinaryType return values.

   SCS_32BIT_BINARY    0
   SCS_DOS_BINARY      1
   SCS_WOW_BINARY      2
   SCS_PIF_BINARY      3
   SCS_POSIX_BINARY    4
   SCS_OS216_BINARY    5
   SCS_64BIT_BINARY    6

#if defined(_WIN64)
# define SCS_THIS_PLATFORM_BINARY SCS_64BIT_BINARY
#else
# define SCS_THIS_PLATFORM_BINARY SCS_32BIT_BINARY
#endif

WINBASEAPI
BOOL
WINAPI
GetBinaryTypeA(
    IN LPCSTR lpApplicationName,
    OUT LPDWORD lpBinaryType
    );
WINBASEAPI
BOOL
WINAPI
GetBinaryTypeW(
    IN LPCWSTR lpApplicationName,
    OUT LPDWORD lpBinaryType
    );
#ifdef UNICODE
   GetBinaryType  GetBinaryTypeW
#else
   GetBinaryType  GetBinaryTypeA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetShortPathNameA(
    IN LPCSTR lpszLongPath,
    OUT LPSTR  lpszShortPath,
    IN DWORD    cchBuffer
    );
WINBASEAPI
DWORD
WINAPI
GetShortPathNameW(
    IN LPCWSTR lpszLongPath,
    OUT LPWSTR  lpszShortPath,
    IN DWORD    cchBuffer
    );
#ifdef UNICODE
   GetShortPathName  GetShortPathNameW
#else
   GetShortPathName  GetShortPathNameA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetLongPathNameA(
    IN LPCSTR lpszShortPath,
    OUT LPSTR  lpszLongPath,
    IN DWORD    cchBuffer
    );
WINBASEAPI
DWORD
WINAPI
GetLongPathNameW(
    IN LPCWSTR lpszShortPath,
    OUT LPWSTR  lpszLongPath,
    IN DWORD    cchBuffer
    );
#ifdef UNICODE
   GetLongPathName  GetLongPathNameW
#else
   GetLongPathName  GetLongPathNameA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetProcessAffinityMask(
    IN HANDLE hProcess,
    OUT PDWORD_PTR lpProcessAffinityMask,
    OUT PDWORD_PTR lpSystemAffinityMask
    );

WINBASEAPI
BOOL
WINAPI
SetProcessAffinityMask(
    IN HANDLE hProcess,
    IN DWORD_PTR dwProcessAffinityMask
    );


WINBASEAPI
BOOL
WINAPI
GetProcessTimes(
    IN HANDLE hProcess,
    OUT LPFILETIME lpCreationTime,
    OUT LPFILETIME lpExitTime,
    OUT LPFILETIME lpKernelTime,
    OUT LPFILETIME lpUserTime
    );

WINBASEAPI
BOOL
WINAPI
GetProcessIoCounters(
    IN HANDLE hProcess,
    OUT PIO_COUNTERS lpIoCounters
    );

WINBASEAPI
BOOL
WINAPI
GetProcessWorkingSetSize(
    IN HANDLE hProcess,
    OUT PSIZE_T lpMinimumWorkingSetSize,
    OUT PSIZE_T lpMaximumWorkingSetSize
    );

WINBASEAPI
BOOL
WINAPI
SetProcessWorkingSetSize(
    IN HANDLE hProcess,
    IN SIZE_T dwMinimumWorkingSetSize,
    IN SIZE_T dwMaximumWorkingSetSize
    );

WINBASEAPI
HANDLE
WINAPI
OpenProcess(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN DWORD dwProcessId
    );

WINBASEAPI
HANDLE
WINAPI
GetCurrentProcess(
    VOID
    );

WINBASEAPI
DWORD
WINAPI
GetCurrentProcessId(
    VOID
    );

WINBASEAPI
DECLSPEC_NORETURN
VOID
WINAPI
ExitProcess(
    IN UINT uExitCode
    );

WINBASEAPI
BOOL
WINAPI
TerminateProcess(
    IN HANDLE hProcess,
    IN UINT uExitCode
    );

WINBASEAPI
BOOL
WINAPI
GetExitCodeProcess(
    IN HANDLE hProcess,
    OUT LPDWORD lpExitCode
    );


WINBASEAPI
VOID
WINAPI
FatalExit(
    IN int ExitCode
    );

WINBASEAPI
LPSTR
WINAPI
GetEnvironmentStrings(
    VOID
    );

WINBASEAPI
LPWSTR
WINAPI
GetEnvironmentStringsW(
    VOID
    );

#ifdef UNICODE
   GetEnvironmentStrings  GetEnvironmentStringsW
#else
   GetEnvironmentStringsA  GetEnvironmentStrings
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FreeEnvironmentStringsA(
    IN LPSTR
    );
WINBASEAPI
BOOL
WINAPI
FreeEnvironmentStringsW(
    IN LPWSTR
    );
#ifdef UNICODE
   FreeEnvironmentStrings  FreeEnvironmentStringsW
#else
   FreeEnvironmentStrings  FreeEnvironmentStringsA
#endif // !UNICODE

WINBASEAPI
VOID
WINAPI
RaiseException(
    IN DWORD dwExceptionCode,
    IN DWORD dwExceptionFlags,
    IN DWORD nNumberOfArguments,
    IN CONST ULONG_PTR *lpArguments
    );

WINBASEAPI
LONG
WINAPI
UnhandledExceptionFilter(
    IN struct _EXCEPTION_POINTERS *ExceptionInfo
    );

type LONG (WINAPI *PTOP_LEVEL_EXCEPTION_FILTER)(
    struct _EXCEPTION_POINTERS *ExceptionInfo
    );
type PTOP_LEVEL_EXCEPTION_FILTER LPTOP_LEVEL_EXCEPTION_FILTER;

WINBASEAPI
LPTOP_LEVEL_EXCEPTION_FILTER
WINAPI
SetUnhandledExceptionFilter(
    IN LPTOP_LEVEL_EXCEPTION_FILTER lpTopLevelExceptionFilter
    );

#if(_WIN32_WINNT >= = $0400)

WINBASEAPI
LPVOID
WINAPI
CreateFiber(
    IN SIZE_T dwStackSize,
    IN LPFIBER_START_ROUTINE lpStartAddress,
    IN LPVOID lpParameter
    );

WINBASEAPI
LPVOID
WINAPI
CreateFiberEx(
    SIZE_T dwStackCommitSize,
    SIZE_T dwStackReserveSize,
    DWORD dwFlags,
    LPFIBER_START_ROUTINE lpStartAddress,
    LPVOID lpParameter
    );

WINBASEAPI
VOID
WINAPI
DeleteFiber(
    IN LPVOID lpFiber
    );

WINBASEAPI
LPVOID
WINAPI
ConvertThreadToFiber(
    IN LPVOID lpParameter
    );

WINBASEAPI
BOOL
WINAPI
ConvertFiberToThread(
    VOID
    );

WINBASEAPI
VOID
WINAPI
SwitchToFiber(
    IN LPVOID lpFiber
    );

WINBASEAPI
BOOL
WINAPI
SwitchToThread(
    VOID
    );
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
HANDLE
WINAPI
CreateThread(
    IN LPSECURITY_ATTRIBUTES lpThreadAttributes,
    IN SIZE_T dwStackSize,
    IN LPTHREAD_START_ROUTINE lpStartAddress,
    IN LPVOID lpParameter,
    IN DWORD dwCreationFlags,
    OUT LPDWORD lpThreadId
    );

WINBASEAPI
HANDLE
WINAPI
CreateRemoteThread(
    IN HANDLE hProcess,
    IN LPSECURITY_ATTRIBUTES lpThreadAttributes,
    IN SIZE_T dwStackSize,
    IN LPTHREAD_START_ROUTINE lpStartAddress,
    IN LPVOID lpParameter,
    IN DWORD dwCreationFlags,
    OUT LPDWORD lpThreadId
    );

WINBASEAPI
HANDLE
WINAPI
GetCurrentThread(
    VOID
    );

WINBASEAPI
DWORD
WINAPI
GetCurrentThreadId(
    VOID
    );

WINBASEAPI
DWORD_PTR
WINAPI
SetThreadAffinityMask(
    IN HANDLE hThread,
    IN DWORD_PTR dwThreadAffinityMask
    );

#if(_WIN32_WINNT >= = $0400)
WINBASEAPI
DWORD
WINAPI
SetThreadIdealProcessor(
    IN HANDLE hThread,
    IN DWORD dwIdealProcessor
    );
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
BOOL
WINAPI
SetProcessPriorityBoost(
    IN HANDLE hProcess,
    IN BOOL bDisablePriorityBoost
    );

WINBASEAPI
BOOL
WINAPI
GetProcessPriorityBoost(
    IN HANDLE hProcess,
    OUT PBOOL pDisablePriorityBoost
    );

WINBASEAPI
BOOL
WINAPI
RequestWakeupLatency(
    IN LATENCY_TIME latency
    );

WINBASEAPI
BOOL
WINAPI
IsSystemResumeAutomatic(
    VOID
    );

WINBASEAPI
HANDLE
WINAPI
OpenThread(
    DWORD dwDesiredAccess,
    BOOL bInheritHandle,
    DWORD dwThreadId
    );

WINBASEAPI
BOOL
WINAPI
SetThreadPriority(
    IN HANDLE hThread,
    IN int nPriority
    );

WINBASEAPI
BOOL
WINAPI
SetThreadPriorityBoost(
    IN HANDLE hThread,
    IN BOOL bDisablePriorityBoost
    );

WINBASEAPI
BOOL
WINAPI
GetThreadPriorityBoost(
    IN HANDLE hThread,
    OUT PBOOL pDisablePriorityBoost
    );

WINBASEAPI
int
WINAPI
GetThreadPriority(
    IN HANDLE hThread
    );

WINBASEAPI
BOOL
WINAPI
GetThreadTimes(
    IN HANDLE hThread,
    OUT LPFILETIME lpCreationTime,
    OUT LPFILETIME lpExitTime,
    OUT LPFILETIME lpKernelTime,
    OUT LPFILETIME lpUserTime
    );

WINBASEAPI
DECLSPEC_NORETURN
VOID
WINAPI
ExitThread(
    IN DWORD dwExitCode
    );

WINBASEAPI
BOOL
WINAPI
TerminateThread(
    IN OUT HANDLE hThread,
    IN DWORD dwExitCode
    );

WINBASEAPI
BOOL
WINAPI
GetExitCodeThread(
    IN HANDLE hThread,
    OUT LPDWORD lpExitCode
    );

WINBASEAPI
BOOL
WINAPI
GetThreadSelectorEntry(
    IN HANDLE hThread,
    IN DWORD dwSelector,
    OUT LPLDT_ENTRY lpSelectorEntry
    );

WINBASEAPI
EXECUTION_STATE
WINAPI
SetThreadExecutionState(
    IN EXECUTION_STATE esFlags
    );

WINBASEAPI
DWORD
WINAPI
GetLastError(
    VOID
    );

WINBASEAPI
VOID
WINAPI
SetLastError(
    IN DWORD dwErrCode
    );

#if !defined(RC_INVOKED) // RC warns because "WINBASE_DECLARE_RESTORE_LAST_ERROR" is a bit long.
//#if _WIN32_WINNT >= = $0501 || defined(WINBASE_DECLARE_RESTORE_LAST_ERROR)
#if defined(WINBASE_DECLARE_RESTORE_LAST_ERROR)

WINBASEAPI
VOID
WINAPI
RestoreLastError(
    IN DWORD dwErrCode
    );

type VOID (WINAPI* PRESTORE_LAST_ERROR)(DWORD);
   RESTORE_LAST_ERROR_NAME_A      "RestoreLastError"
   RESTORE_LAST_ERROR_NAME_W     L"RestoreLastError"
   RESTORE_LAST_ERROR_NAME   TEXT("RestoreLastError")

#endif
#endif

   HasOverlappedIoCompleted(lpOverlapped) ((lpOverlapped)->Internal != STATUS_PENDING)

WINBASEAPI
BOOL
WINAPI
GetOverlappedResult(
    IN HANDLE hFile,
    IN LPOVERLAPPED lpOverlapped,
    OUT LPDWORD lpNumberOfBytesTransferred,
    IN BOOL bWait
    );

WINBASEAPI
HANDLE
WINAPI
CreateIoCompletionPort(
    IN HANDLE FileHandle,
    IN HANDLE ExistingCompletionPort,
    IN ULONG_PTR CompletionKey,
    IN DWORD NumberOfConcurrentThreads
    );

WINBASEAPI
BOOL
WINAPI
GetQueuedCompletionStatus(
    IN  HANDLE CompletionPort,
    OUT LPDWORD lpNumberOfBytesTransferred,
    OUT PULONG_PTR lpCompletionKey,
    OUT LPOVERLAPPED *lpOverlapped,
    IN  DWORD dwMilliseconds
    );

WINBASEAPI
BOOL
WINAPI
PostQueuedCompletionStatus(
    IN HANDLE CompletionPort,
    IN DWORD dwNumberOfBytesTransferred,
    IN ULONG_PTR dwCompletionKey,
    IN LPOVERLAPPED lpOverlapped
    );

   SEM_FAILCRITICALERRORS      = $0001
   SEM_NOGPFAULTERRORBOX       = $0002
   SEM_NOALIGNMENTFAULTEXCEPT  = $0004
   SEM_NOOPENFILEERRORBOX      = $8000

WINBASEAPI
UINT
WINAPI
SetErrorMode(
    IN UINT uMode
    );

WINBASEAPI
BOOL
WINAPI
ReadProcessMemory(
    IN HANDLE hProcess,
    IN LPCVOID lpBaseAddress,
    OUT LPVOID lpBuffer,
    IN SIZE_T nSize,
    OUT SIZE_T * lpNumberOfBytesRead
    );

WINBASEAPI
BOOL
WINAPI
WriteProcessMemory(
    IN HANDLE hProcess,
    IN LPVOID lpBaseAddress,
    IN LPCVOID lpBuffer,
    IN SIZE_T nSize,
    OUT SIZE_T * lpNumberOfBytesWritten
    );

#if !defined(MIDL_PASS)
WINBASEAPI
BOOL
WINAPI
GetThreadContext(
    IN HANDLE hThread,
    IN OUT LPCONTEXT lpContext
    );

WINBASEAPI
BOOL
WINAPI
SetThreadContext(
    IN HANDLE hThread,
    IN CONST CONTEXT *lpContext
    );
#endif

WINBASEAPI
DWORD
WINAPI
SuspendThread(
    IN HANDLE hThread
    );

WINBASEAPI
DWORD
WINAPI
ResumeThread(
    IN HANDLE hThread
    );


#if(_WIN32_WINNT >= = $0400) || (_WIN32_WINDOWS > = $0400)

type
VOID
(APIENTRY *PAPCFUNC)(
    ULONG_PTR dwParam
    );

WINBASEAPI
DWORD
WINAPI
QueueUserAPC(
    IN PAPCFUNC pfnAPC,
    IN HANDLE hThread,
    IN ULONG_PTR dwData
    );

#endif (* _WIN32_WINNT >= = $0400 || _WIN32_WINDOWS > = $0400 *)

#if (_WIN32_WINNT >= = $0400) || (_WIN32_WINDOWS > = $0400)
WINBASEAPI
BOOL
WINAPI
IsDebuggerPresent(
    VOID
    );
#endif

WINBASEAPI
VOID
WINAPI
DebugBreak(
    VOID
    );

WINBASEAPI
BOOL
WINAPI
WaitForDebugEvent(
    IN LPDEBUG_EVENT lpDebugEvent,
    IN DWORD dwMilliseconds
    );

WINBASEAPI
BOOL
WINAPI
ContinueDebugEvent(
    IN DWORD dwProcessId,
    IN DWORD dwThreadId,
    IN DWORD dwContinueStatus
    );

WINBASEAPI
BOOL
WINAPI
DebugActiveProcess(
    IN DWORD dwProcessId
    );

WINBASEAPI
BOOL
WINAPI
DebugActiveProcessStop(
    IN DWORD dwProcessId
    );

WINBASEAPI
BOOL
WINAPI
DebugSetProcessKillOnExit(
    IN BOOL KillOnExit
    );

WINBASEAPI
BOOL
WINAPI
DebugBreakProcess (
    IN HANDLE Process
    );

WINBASEAPI
VOID
WINAPI
InitializeCriticalSection(
    OUT LPCRITICAL_SECTION lpCriticalSection
    );

WINBASEAPI
VOID
WINAPI
EnterCriticalSection(
    IN OUT LPCRITICAL_SECTION lpCriticalSection
    );

WINBASEAPI
VOID
WINAPI
LeaveCriticalSection(
    IN OUT LPCRITICAL_SECTION lpCriticalSection
    );

#if (_WIN32_WINNT >= = $0403)
WINBASEAPI
BOOL
WINAPI
InitializeCriticalSectionAndSpinCount(
    IN OUT LPCRITICAL_SECTION lpCriticalSection,
    IN DWORD dwSpinCount
    );

WINBASEAPI
DWORD
WINAPI
SetCriticalSectionSpinCount(
    IN OUT LPCRITICAL_SECTION lpCriticalSection,
    IN DWORD dwSpinCount
    );
#endif

#if(_WIN32_WINNT >= = $0400)
WINBASEAPI
BOOL
WINAPI
TryEnterCriticalSection(
    IN OUT LPCRITICAL_SECTION lpCriticalSection
    );
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
VOID
WINAPI
DeleteCriticalSection(
    IN OUT LPCRITICAL_SECTION lpCriticalSection
    );

WINBASEAPI
BOOL
WINAPI
SetEvent(
    IN HANDLE hEvent
    );

WINBASEAPI
BOOL
WINAPI
ResetEvent(
    IN HANDLE hEvent
    );

WINBASEAPI
BOOL
WINAPI
PulseEvent(
    IN HANDLE hEvent
    );

WINBASEAPI
BOOL
WINAPI
ReleaseSemaphore(
    IN HANDLE hSemaphore,
    IN LONG lReleaseCount,
    OUT LPLONG lpPreviousCount
    );

WINBASEAPI
BOOL
WINAPI
ReleaseMutex(
    IN HANDLE hMutex
    );

WINBASEAPI
DWORD
WINAPI
WaitForSingleObject(
    IN HANDLE hHandle,
    IN DWORD dwMilliseconds
    );

WINBASEAPI
DWORD
WINAPI
WaitForMultipleObjects(
    IN DWORD nCount,
    IN CONST HANDLE *lpHandles,
    IN BOOL bWaitAll,
    IN DWORD dwMilliseconds
    );

WINBASEAPI
VOID
WINAPI
Sleep(
    IN DWORD dwMilliseconds
    );

WINBASEAPI
HGLOBAL
WINAPI
LoadResource(
    IN HMODULE hModule,
    IN HRSRC hResInfo
    );

WINBASEAPI
DWORD
WINAPI
SizeofResource(
    IN HMODULE hModule,
    IN HRSRC hResInfo
    );


WINBASEAPI
ATOM
WINAPI
GlobalDeleteAtom(
    IN ATOM nAtom
    );

WINBASEAPI
BOOL
WINAPI
InitAtomTable(
    IN DWORD nSize
    );

WINBASEAPI
ATOM
WINAPI
DeleteAtom(
    IN ATOM nAtom
    );

WINBASEAPI
UINT
WINAPI
SetHandleCount(
    IN UINT uNumber
    );

WINBASEAPI
DWORD
WINAPI
GetLogicalDrives(
    VOID
    );

WINBASEAPI
BOOL
WINAPI
LockFile(
    IN HANDLE hFile,
    IN DWORD dwFileOffsetLow,
    IN DWORD dwFileOffsetHigh,
    IN DWORD nNumberOfBytesToLockLow,
    IN DWORD nNumberOfBytesToLockHigh
    );

WINBASEAPI
BOOL
WINAPI
UnlockFile(
    IN HANDLE hFile,
    IN DWORD dwFileOffsetLow,
    IN DWORD dwFileOffsetHigh,
    IN DWORD nNumberOfBytesToUnlockLow,
    IN DWORD nNumberOfBytesToUnlockHigh
    );

WINBASEAPI
BOOL
WINAPI
LockFileEx(
    IN HANDLE hFile,
    IN DWORD dwFlags,
    IN DWORD dwReserved,
    IN DWORD nNumberOfBytesToLockLow,
    IN DWORD nNumberOfBytesToLockHigh,
    IN LPOVERLAPPED lpOverlapped
    );

   LOCKFILE_FAIL_IMMEDIATELY   = $00000001
   LOCKFILE_EXCLUSIVE_LOCK     = $00000002

WINBASEAPI
BOOL
WINAPI
UnlockFileEx(
    IN HANDLE hFile,
    IN DWORD dwReserved,
    IN DWORD nNumberOfBytesToUnlockLow,
    IN DWORD nNumberOfBytesToUnlockHigh,
    IN LPOVERLAPPED lpOverlapped
    );

type struct _BY_HANDLE_FILE_INFORMATION {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD dwVolumeSerialNumber;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD nNumberOfLinks;
    DWORD nFileIndexHigh;
    DWORD nFileIndexLow;
} BY_HANDLE_FILE_INFORMATION, *PBY_HANDLE_FILE_INFORMATION, *LPBY_HANDLE_FILE_INFORMATION;

WINBASEAPI
BOOL
WINAPI
GetFileInformationByHandle(
    IN HANDLE hFile,
    OUT LPBY_HANDLE_FILE_INFORMATION lpFileInformation
    );

WINBASEAPI
DWORD
WINAPI
GetFileType(
    IN HANDLE hFile
    );

WINBASEAPI
DWORD
WINAPI
GetFileSize(
    IN HANDLE hFile,
    OUT LPDWORD lpFileSizeHigh
    );

WINBASEAPI
BOOL
WINAPI
GetFileSizeEx(
    HANDLE hFile,
    PLARGE_INTEGER lpFileSize
    );


WINBASEAPI
HANDLE
WINAPI
GetStdHandle(
    IN DWORD nStdHandle
    );

WINBASEAPI
BOOL
WINAPI
SetStdHandle(
    IN DWORD nStdHandle,
    IN HANDLE hHandle
    );

WINBASEAPI
BOOL
WINAPI
WriteFile(
    IN HANDLE hFile,
    IN LPCVOID lpBuffer,
    IN DWORD nNumberOfBytesToWrite,
    OUT LPDWORD lpNumberOfBytesWritten,
    IN LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
BOOL
WINAPI
ReadFile(
    IN HANDLE hFile,
    OUT LPVOID lpBuffer,
    IN DWORD nNumberOfBytesToRead,
    OUT LPDWORD lpNumberOfBytesRead,
    IN LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
BOOL
WINAPI
FlushFileBuffers(
    IN HANDLE hFile
    );

WINBASEAPI
BOOL
WINAPI
DeviceIoControl(
    IN HANDLE hDevice,
    IN DWORD dwIoControlCode,
    IN LPVOID lpInBuffer,
    IN DWORD nInBufferSize,
    OUT LPVOID lpOutBuffer,
    IN DWORD nOutBufferSize,
    OUT LPDWORD lpBytesReturned,
    IN LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
BOOL
WINAPI
RequestDeviceWakeup(
    IN HANDLE hDevice
    );

WINBASEAPI
BOOL
WINAPI
CancelDeviceWakeupRequest(
    IN HANDLE hDevice
    );

WINBASEAPI
BOOL
WINAPI
GetDevicePowerState(
    IN HANDLE hDevice,
    OUT BOOL *pfOn
    );

WINBASEAPI
BOOL
WINAPI
SetMessageWaitingIndicator(
    IN HANDLE hMsgIndicator,
    IN ULONG ulMsgCount
    );

WINBASEAPI
BOOL
WINAPI
SetEndOfFile(
    IN HANDLE hFile
    );

WINBASEAPI
DWORD
WINAPI
SetFilePointer(
    IN HANDLE hFile,
    IN LONG lDistanceToMove,
    IN PLONG lpDistanceToMoveHigh,
    IN DWORD dwMoveMethod
    );

WINBASEAPI
BOOL
WINAPI
SetFilePointerEx(
    HANDLE hFile,
    LARGE_INTEGER liDistanceToMove,
    PLARGE_INTEGER lpNewFilePointer,
    DWORD dwMoveMethod
    );

WINBASEAPI
BOOL
WINAPI
FindClose(
    IN OUT HANDLE hFindFile
    );

WINBASEAPI
BOOL
WINAPI
GetFileTime(
    IN HANDLE hFile,
    OUT LPFILETIME lpCreationTime,
    OUT LPFILETIME lpLastAccessTime,
    OUT LPFILETIME lpLastWriteTime
    );

WINBASEAPI
BOOL
WINAPI
SetFileTime(
    IN HANDLE hFile,
    IN CONST FILETIME *lpCreationTime,
    IN CONST FILETIME *lpLastAccessTime,
    IN CONST FILETIME *lpLastWriteTime
    );

WINBASEAPI
BOOL
WINAPI
SetFileValidData(
    IN HANDLE hFile,
    IN LONGLONG ValidDataLength
    );

WINBASEAPI
BOOL
WINAPI
SetFileShortNameA(
    IN HANDLE hFile,
    IN LPCSTR lpShortName
    );
WINBASEAPI
BOOL
WINAPI
SetFileShortNameW(
    IN HANDLE hFile,
    IN LPCWSTR lpShortName
    );
#ifdef UNICODE
   SetFileShortName  SetFileShortNameW
#else
   SetFileShortName  SetFileShortNameA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CloseHandle(
    IN OUT HANDLE hObject
    );

WINBASEAPI
BOOL
WINAPI
DuplicateHandle(
    IN HANDLE hSourceProcessHandle,
    IN HANDLE hSourceHandle,
    IN HANDLE hTargetProcessHandle,
    OUT LPHANDLE lpTargetHandle,
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN DWORD dwOptions
    );

WINBASEAPI
BOOL
WINAPI
GetHandleInformation(
    IN HANDLE hObject,
    OUT LPDWORD lpdwFlags
    );

WINBASEAPI
BOOL
WINAPI
SetHandleInformation(
    IN HANDLE hObject,
    IN DWORD dwMask,
    IN DWORD dwFlags
    );

   HANDLE_FLAG_INHERIT             = $00000001
   HANDLE_FLAG_PROTECT_FROM_CLOSE  = $00000002

   HINSTANCE_ERROR 32

WINBASEAPI
DWORD
WINAPI
LoadModule(
    IN LPCSTR lpModuleName,
    IN LPVOID lpParameterBlock
    );

WINBASEAPI
UINT
WINAPI
WinExec(
    IN LPCSTR lpCmdLine,
    IN UINT uCmdShow
    );

WINBASEAPI
BOOL
WINAPI
ClearCommBreak(
    IN HANDLE hFile
    );

WINBASEAPI
BOOL
WINAPI
ClearCommError(
    IN HANDLE hFile,
    OUT LPDWORD lpErrors,
    OUT LPCOMSTAT lpStat
    );

WINBASEAPI
BOOL
WINAPI
SetupComm(
    IN HANDLE hFile,
    IN DWORD dwInQueue,
    IN DWORD dwOutQueue
    );

WINBASEAPI
BOOL
WINAPI
EscapeCommFunction(
    IN HANDLE hFile,
    IN DWORD dwFunc
    );

WINBASEAPI
BOOL
WINAPI
GetCommConfig(
    IN HANDLE hCommDev,
    OUT LPCOMMCONFIG lpCC,
    IN OUT LPDWORD lpdwSize
    );

WINBASEAPI
BOOL
WINAPI
GetCommMask(
    IN HANDLE hFile,
    OUT LPDWORD lpEvtMask
    );

WINBASEAPI
BOOL
WINAPI
GetCommProperties(
    IN HANDLE hFile,
    OUT LPCOMMPROP lpCommProp
    );

WINBASEAPI
BOOL
WINAPI
GetCommModemStatus(
    IN HANDLE hFile,
    OUT LPDWORD lpModemStat
    );

WINBASEAPI
BOOL
WINAPI
GetCommState(
    IN HANDLE hFile,
    OUT LPDCB lpDCB
    );

WINBASEAPI
BOOL
WINAPI
GetCommTimeouts(
    IN HANDLE hFile,
    OUT LPCOMMTIMEOUTS lpCommTimeouts
    );

WINBASEAPI
BOOL
WINAPI
PurgeComm(
    IN HANDLE hFile,
    IN DWORD dwFlags
    );

WINBASEAPI
BOOL
WINAPI
SetCommBreak(
    IN HANDLE hFile
    );

WINBASEAPI
BOOL
WINAPI
SetCommConfig(
    IN HANDLE hCommDev,
    IN LPCOMMCONFIG lpCC,
    IN DWORD dwSize
    );

WINBASEAPI
BOOL
WINAPI
SetCommMask(
    IN HANDLE hFile,
    IN DWORD dwEvtMask
    );

WINBASEAPI
BOOL
WINAPI
SetCommState(
    IN HANDLE hFile,
    IN LPDCB lpDCB
    );

WINBASEAPI
BOOL
WINAPI
SetCommTimeouts(
    IN HANDLE hFile,
    IN LPCOMMTIMEOUTS lpCommTimeouts
    );

WINBASEAPI
BOOL
WINAPI
TransmitCommChar(
    IN HANDLE hFile,
    IN char cChar
    );

WINBASEAPI
BOOL
WINAPI
WaitCommEvent(
    IN HANDLE hFile,
    OUT LPDWORD lpEvtMask,
    IN LPOVERLAPPED lpOverlapped
    );


WINBASEAPI
DWORD
WINAPI
SetTapePosition(
    IN HANDLE hDevice,
    IN DWORD dwPositionMethod,
    IN DWORD dwPartition,
    IN DWORD dwOffsetLow,
    IN DWORD dwOffsetHigh,
    IN BOOL bImmediate
    );

WINBASEAPI
DWORD
WINAPI
GetTapePosition(
    IN HANDLE hDevice,
    IN DWORD dwPositionType,
    OUT LPDWORD lpdwPartition,
    OUT LPDWORD lpdwOffsetLow,
    OUT LPDWORD lpdwOffsetHigh
    );

WINBASEAPI
DWORD
WINAPI
PrepareTape(
    IN HANDLE hDevice,
    IN DWORD dwOperation,
    IN BOOL bImmediate
    );

WINBASEAPI
DWORD
WINAPI
EraseTape(
    IN HANDLE hDevice,
    IN DWORD dwEraseType,
    IN BOOL bImmediate
    );

WINBASEAPI
DWORD
WINAPI
CreateTapePartition(
    IN HANDLE hDevice,
    IN DWORD dwPartitionMethod,
    IN DWORD dwCount,
    IN DWORD dwSize
    );

WINBASEAPI
DWORD
WINAPI
WriteTapemark(
    IN HANDLE hDevice,
    IN DWORD dwTapemarkType,
    IN DWORD dwTapemarkCount,
    IN BOOL bImmediate
    );

WINBASEAPI
DWORD
WINAPI
GetTapeStatus(
    IN HANDLE hDevice
    );

WINBASEAPI
DWORD
WINAPI
GetTapeParameters(
    IN HANDLE hDevice,
    IN DWORD dwOperation,
    OUT LPDWORD lpdwSize,
    OUT LPVOID lpTapeInformation
    );

   GET_TAPE_MEDIA_INFORMATION 0
   GET_TAPE_DRIVE_INFORMATION 1

WINBASEAPI
DWORD
WINAPI
SetTapeParameters(
    IN HANDLE hDevice,
    IN DWORD dwOperation,
    IN LPVOID lpTapeInformation
    );

   SET_TAPE_MEDIA_INFORMATION 0
   SET_TAPE_DRIVE_INFORMATION 1

WINBASEAPI
BOOL
WINAPI
Beep(
    IN DWORD dwFreq,
    IN DWORD dwDuration
    );

WINBASEAPI
int
WINAPI
MulDiv(
    IN int nNumber,
    IN int nNumerator,
    IN int nDenominator
    );

WINBASEAPI
VOID
WINAPI
GetSystemTime(
    OUT LPSYSTEMTIME lpSystemTime
    );

WINBASEAPI
VOID
WINAPI
GetSystemTimeAsFileTime(
    OUT LPFILETIME lpSystemTimeAsFileTime
    );

WINBASEAPI
BOOL
WINAPI
SetSystemTime(
    IN CONST SYSTEMTIME *lpSystemTime
    );

WINBASEAPI
VOID
WINAPI
GetLocalTime(
    OUT LPSYSTEMTIME lpSystemTime
    );

WINBASEAPI
BOOL
WINAPI
SetLocalTime(
    IN CONST SYSTEMTIME *lpSystemTime
    );

WINBASEAPI
VOID
WINAPI
GetSystemInfo(
    OUT LPSYSTEM_INFO lpSystemInfo
    );


#if _WIN32_WINNT >= = $0501
WINBASEAPI
VOID
WINAPI
GetNativeSystemInfo(
    OUT LPSYSTEM_INFO lpSystemInfo
    );
#endif

WINBASEAPI
BOOL
WINAPI
IsProcessorFeaturePresent(
    IN DWORD ProcessorFeature
    );

type struct _TIME_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName[ 32 ];
    SYSTEMTIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName[ 32 ];
    SYSTEMTIME DaylightDate;
    LONG DaylightBias;
} TIME_ZONE_INFORMATION, *PTIME_ZONE_INFORMATION, *LPTIME_ZONE_INFORMATION;

WINBASEAPI
BOOL
WINAPI
SystemTimeToTzSpecificLocalTime(
    IN LPTIME_ZONE_INFORMATION lpTimeZoneInformation,
    IN LPSYSTEMTIME lpUniversalTime,
    OUT LPSYSTEMTIME lpLocalTime
    );

WINBASEAPI
BOOL
WINAPI
TzSpecificLocalTimeToSystemTime(
    IN LPTIME_ZONE_INFORMATION lpTimeZoneInformation,
    IN LPSYSTEMTIME lpLocalTime,
    OUT LPSYSTEMTIME lpUniversalTime
    );

WINBASEAPI
DWORD
WINAPI
GetTimeZoneInformation(
    OUT LPTIME_ZONE_INFORMATION lpTimeZoneInformation
    );

WINBASEAPI
BOOL
WINAPI
SetTimeZoneInformation(
    IN CONST TIME_ZONE_INFORMATION *lpTimeZoneInformation
    );


//
// Routines to convert back and forth between system time and file time
//

WINBASEAPI
BOOL
WINAPI
SystemTimeToFileTime(
    IN CONST SYSTEMTIME *lpSystemTime,
    OUT LPFILETIME lpFileTime
    );

WINBASEAPI
BOOL
WINAPI
FileTimeToLocalFileTime(
    IN CONST FILETIME *lpFileTime,
    OUT LPFILETIME lpLocalFileTime
    );

WINBASEAPI
BOOL
WINAPI
LocalFileTimeToFileTime(
    IN CONST FILETIME *lpLocalFileTime,
    OUT LPFILETIME lpFileTime
    );

WINBASEAPI
BOOL
WINAPI
FileTimeToSystemTime(
    IN CONST FILETIME *lpFileTime,
    OUT LPSYSTEMTIME lpSystemTime
    );

WINBASEAPI
LONG
WINAPI
CompareFileTime(
    IN CONST FILETIME *lpFileTime1,
    IN CONST FILETIME *lpFileTime2
    );

WINBASEAPI
BOOL
WINAPI
FileTimeToDosDateTime(
    IN CONST FILETIME *lpFileTime,
    OUT LPWORD lpFatDate,
    OUT LPWORD lpFatTime
    );

WINBASEAPI
BOOL
WINAPI
DosDateTimeToFileTime(
    IN WORD wFatDate,
    IN WORD wFatTime,
    OUT LPFILETIME lpFileTime
    );

WINBASEAPI
DWORD
WINAPI
GetTickCount(
    VOID
    );

WINBASEAPI
BOOL
WINAPI
SetSystemTimeAdjustment(
    IN DWORD dwTimeAdjustment,
    IN BOOL  bTimeAdjustmentDisabled
    );

WINBASEAPI
BOOL
WINAPI
GetSystemTimeAdjustment(
    OUT PDWORD lpTimeAdjustment,
    OUT PDWORD lpTimeIncrement,
    OUT PBOOL  lpTimeAdjustmentDisabled
    );

#if !defined(MIDL_PASS)
WINBASEAPI
DWORD
WINAPI
FormatMessageA(
    IN DWORD dwFlags,
    IN LPCVOID lpSource,
    IN DWORD dwMessageId,
    IN DWORD dwLanguageId,
    OUT LPSTR lpBuffer,
    IN DWORD nSize,
    IN va_list *Arguments
    );
WINBASEAPI
DWORD
WINAPI
FormatMessageW(
    IN DWORD dwFlags,
    IN LPCVOID lpSource,
    IN DWORD dwMessageId,
    IN DWORD dwLanguageId,
    OUT LPWSTR lpBuffer,
    IN DWORD nSize,
    IN va_list *Arguments
    );
#ifdef UNICODE
   FormatMessage  FormatMessageW
#else
   FormatMessage  FormatMessageA
#endif // !UNICODE
#endif

   FORMAT_MESSAGE_ALLOCATE_BUFFER = $00000100
   FORMAT_MESSAGE_IGNORE_INSERTS  = $00000200
   FORMAT_MESSAGE_FROM_STRING     = $00000400
   FORMAT_MESSAGE_FROM_HMODULE    = $00000800
   FORMAT_MESSAGE_FROM_SYSTEM     = $00001000
   FORMAT_MESSAGE_ARGUMENT_ARRAY  = $00002000
   FORMAT_MESSAGE_MAX_WIDTH_MASK  = $000000FF


WINBASEAPI
BOOL
WINAPI
CreatePipe(
    OUT PHANDLE hReadPipe,
    OUT PHANDLE hWritePipe,
    IN LPSECURITY_ATTRIBUTES lpPipeAttributes,
    IN DWORD nSize
    );

WINBASEAPI
BOOL
WINAPI
ConnectNamedPipe(
    IN HANDLE hNamedPipe,
    IN LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
BOOL
WINAPI
DisconnectNamedPipe(
    IN HANDLE hNamedPipe
    );

WINBASEAPI
BOOL
WINAPI
SetNamedPipeHandleState(
    IN HANDLE hNamedPipe,
    IN LPDWORD lpMode,
    IN LPDWORD lpMaxCollectionCount,
    IN LPDWORD lpCollectDataTimeout
    );

WINBASEAPI
BOOL
WINAPI
GetNamedPipeInfo(
    IN HANDLE hNamedPipe,
    IN LPDWORD lpFlags,
    OUT LPDWORD lpOutBufferSize,
    OUT LPDWORD lpInBufferSize,
    OUT LPDWORD lpMaxInstances
    );

WINBASEAPI
BOOL
WINAPI
PeekNamedPipe(
    IN HANDLE hNamedPipe,
    OUT LPVOID lpBuffer,
    IN DWORD nBufferSize,
    OUT LPDWORD lpBytesRead,
    OUT LPDWORD lpTotalBytesAvail,
    OUT LPDWORD lpBytesLeftThisMessage
    );

WINBASEAPI
BOOL
WINAPI
TransactNamedPipe(
    IN HANDLE hNamedPipe,
    IN LPVOID lpInBuffer,
    IN DWORD nInBufferSize,
    OUT LPVOID lpOutBuffer,
    IN DWORD nOutBufferSize,
    OUT LPDWORD lpBytesRead,
    IN LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
HANDLE
WINAPI
CreateMailslotA(
    IN LPCSTR lpName,
    IN DWORD nMaxMessageSize,
    IN DWORD lReadTimeout,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
WINBASEAPI
HANDLE
WINAPI
CreateMailslotW(
    IN LPCWSTR lpName,
    IN DWORD nMaxMessageSize,
    IN DWORD lReadTimeout,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
#ifdef UNICODE
   CreateMailslot  CreateMailslotW
#else
   CreateMailslot  CreateMailslotA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetMailslotInfo(
    IN HANDLE hMailslot,
    IN LPDWORD lpMaxMessageSize,
    IN LPDWORD lpNextSize,
    IN LPDWORD lpMessageCount,
    IN LPDWORD lpReadTimeout
    );

WINBASEAPI
BOOL
WINAPI
SetMailslotInfo(
    IN HANDLE hMailslot,
    IN DWORD lReadTimeout
    );

WINBASEAPI
LPVOID
WINAPI
MapViewOfFile(
    IN HANDLE hFileMappingObject,
    IN DWORD dwDesiredAccess,
    IN DWORD dwFileOffsetHigh,
    IN DWORD dwFileOffsetLow,
    IN SIZE_T dwNumberOfBytesToMap
    );

WINBASEAPI
BOOL
WINAPI
FlushViewOfFile(
    IN LPCVOID lpBaseAddress,
    IN SIZE_T dwNumberOfBytesToFlush
    );

WINBASEAPI
BOOL
WINAPI
UnmapViewOfFile(
    IN LPCVOID lpBaseAddress
    );

//
// File Encryption API
//

WINADVAPI
BOOL
WINAPI
EncryptFileA(
    IN LPCSTR lpFileName
    );
WINADVAPI
BOOL
WINAPI
EncryptFileW(
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   EncryptFile  EncryptFileW
#else
   EncryptFile  EncryptFileA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
DecryptFileA(
    IN LPCSTR lpFileName,
    IN DWORD    dwReserved
    );
WINADVAPI
BOOL
WINAPI
DecryptFileW(
    IN LPCWSTR lpFileName,
    IN DWORD    dwReserved
    );
#ifdef UNICODE
   DecryptFile  DecryptFileW
#else
   DecryptFile  DecryptFileA
#endif // !UNICODE

//
//  Encryption Status Value
//

   FILE_ENCRYPTABLE                0
   FILE_IS_ENCRYPTED               1
   FILE_SYSTEM_ATTR                2
   FILE_ROOT_DIR                   3
   FILE_SYSTEM_DIR                 4
   FILE_UNKNOWN                    5
   FILE_SYSTEM_NOT_SUPPORT         6
   FILE_USER_DISALLOWED            7
   FILE_READ_ONLY                  8
   FILE_DIR_DISALLOWED             9

WINADVAPI
BOOL
WINAPI
FileEncryptionStatusA(
    LPCSTR lpFileName,
    LPDWORD  lpStatus
    );
WINADVAPI
BOOL
WINAPI
FileEncryptionStatusW(
    LPCWSTR lpFileName,
    LPDWORD  lpStatus
    );
#ifdef UNICODE
   FileEncryptionStatus  FileEncryptionStatusW
#else
   FileEncryptionStatus  FileEncryptionStatusA
#endif // !UNICODE

//
// Currently defined recovery flags
//

   EFS_USE_RECOVERY_KEYS  (= $1)

type
DWORD
(WINAPI *PFE_EXPORT_FUNC)(
    PBYTE pbData,
    PVOID pvCallbackContext,
    ULONG ulLength
    );

type
DWORD
(WINAPI *PFE_IMPORT_FUNC)(
    PBYTE pbData,
    PVOID pvCallbackContext,
    PULONG ulLength
    );


//
//  OpenRaw flag values
//

   CREATE_FOR_IMPORT  (1)
   CREATE_FOR_DIR     (2)
   OVERWRITE_HIDDEN   (4)


WINADVAPI
DWORD
WINAPI
OpenEncryptedFileRawA(
    IN LPCSTR        lpFileName,
    IN ULONG           ulFlags,
    IN PVOID *         pvContext
    );
WINADVAPI
DWORD
WINAPI
OpenEncryptedFileRawW(
    IN LPCWSTR        lpFileName,
    IN ULONG           ulFlags,
    IN PVOID *         pvContext
    );
#ifdef UNICODE
   OpenEncryptedFileRaw  OpenEncryptedFileRawW
#else
   OpenEncryptedFileRaw  OpenEncryptedFileRawA
#endif // !UNICODE

WINADVAPI
DWORD
WINAPI
ReadEncryptedFileRaw(
    IN PFE_EXPORT_FUNC pfExportCallback,
    IN PVOID           pvCallbackContext,
    IN PVOID           pvContext
    );

WINADVAPI
DWORD
WINAPI
WriteEncryptedFileRaw(
    IN PFE_IMPORT_FUNC pfImportCallback,
    IN PVOID           pvCallbackContext,
    IN PVOID           pvContext
    );

WINADVAPI
VOID
WINAPI
CloseEncryptedFileRaw(
    IN PVOID           pvContext
    );

//
// _l Compat Functions
//

WINBASEAPI
int
WINAPI
lstrcmpA(
    IN LPCSTR lpString1,
    IN LPCSTR lpString2
    );
WINBASEAPI
int
WINAPI
lstrcmpW(
    IN LPCWSTR lpString1,
    IN LPCWSTR lpString2
    );
#ifdef UNICODE
   lstrcmp  lstrcmpW
#else
   lstrcmp  lstrcmpA
#endif // !UNICODE

WINBASEAPI
int
WINAPI
lstrcmpiA(
    IN LPCSTR lpString1,
    IN LPCSTR lpString2
    );
WINBASEAPI
int
WINAPI
lstrcmpiW(
    IN LPCWSTR lpString1,
    IN LPCWSTR lpString2
    );
#ifdef UNICODE
   lstrcmpi  lstrcmpiW
#else
   lstrcmpi  lstrcmpiA
#endif // !UNICODE

WINBASEAPI
LPSTR
WINAPI
lstrcpynA(
    OUT LPSTR lpString1,
    IN LPCSTR lpString2,
    IN int iMaxLength
    );
WINBASEAPI
LPWSTR
WINAPI
lstrcpynW(
    OUT LPWSTR lpString1,
    IN LPCWSTR lpString2,
    IN int iMaxLength
    );
#ifdef UNICODE
   lstrcpyn  lstrcpynW
#else
   lstrcpyn  lstrcpynA
#endif // !UNICODE

WINBASEAPI
LPSTR
WINAPI
lstrcpyA(
    OUT LPSTR lpString1,
    IN LPCSTR lpString2
    );
WINBASEAPI
LPWSTR
WINAPI
lstrcpyW(
    OUT LPWSTR lpString1,
    IN LPCWSTR lpString2
    );
#ifdef UNICODE
   lstrcpy  lstrcpyW
#else
   lstrcpy  lstrcpyA
#endif // !UNICODE

WINBASEAPI
LPSTR
WINAPI
lstrcatA(
    IN OUT LPSTR lpString1,
    IN LPCSTR lpString2
    );
WINBASEAPI
LPWSTR
WINAPI
lstrcatW(
    IN OUT LPWSTR lpString1,
    IN LPCWSTR lpString2
    );
#ifdef UNICODE
   lstrcat  lstrcatW
#else
   lstrcat  lstrcatA
#endif // !UNICODE

WINBASEAPI
int
WINAPI
lstrlenA(
    IN LPCSTR lpString
    );
WINBASEAPI
int
WINAPI
lstrlenW(
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   lstrlen  lstrlenW
#else
   lstrlen  lstrlenA
#endif // !UNICODE

WINBASEAPI
HFILE
WINAPI
OpenFile(
    IN LPCSTR lpFileName,
    OUT LPOFSTRUCT lpReOpenBuff,
    IN UINT uStyle
    );

WINBASEAPI
HFILE
WINAPI
_lopen(
    IN LPCSTR lpPathName,
    IN int iReadWrite
    );

WINBASEAPI
HFILE
WINAPI
_lcreat(
    IN LPCSTR lpPathName,
    IN int  iAttribute
    );

WINBASEAPI
UINT
WINAPI
_lread(
    IN HFILE hFile,
    OUT LPVOID lpBuffer,
    IN UINT uBytes
    );

WINBASEAPI
UINT
WINAPI
_lwrite(
    IN HFILE hFile,
    IN LPCSTR lpBuffer,
    IN UINT uBytes
    );

WINBASEAPI
long
WINAPI
_hread(
    IN HFILE hFile,
    OUT LPVOID lpBuffer,
    IN long lBytes
    );

WINBASEAPI
long
WINAPI
_hwrite(
    IN HFILE hFile,
    IN LPCSTR lpBuffer,
    IN long lBytes
    );

WINBASEAPI
HFILE
WINAPI
_lclose(
    IN OUT HFILE hFile
    );

WINBASEAPI
LONG
WINAPI
_llseek(
    IN HFILE hFile,
    IN LONG lOffset,
    IN int iOrigin
    );

WINADVAPI
BOOL
WINAPI
IsTextUnicode(
    IN CONST VOID* lpBuffer,
    IN int cb,
    IN OUT LPINT lpi
    );

WINBASEAPI
DWORD
WINAPI
TlsAlloc(
    VOID
    );

   TLS_OUT_OF_INDEXES ((DWORD)= $FFFFFFFF)

WINBASEAPI
LPVOID
WINAPI
TlsGetValue(
    IN DWORD dwTlsIndex
    );

WINBASEAPI
BOOL
WINAPI
TlsSetValue(
    IN DWORD dwTlsIndex,
    IN LPVOID lpTlsValue
    );

WINBASEAPI
BOOL
WINAPI
TlsFree(
    IN DWORD dwTlsIndex
    );

type
VOID
(WINAPI *LPOVERLAPPED_COMPLETION_ROUTINE)(
    DWORD dwErrorCode,
    DWORD dwNumberOfBytesTransfered,
    LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
DWORD
WINAPI
SleepEx(
    IN DWORD dwMilliseconds,
    IN BOOL bAlertable
    );

WINBASEAPI
DWORD
WINAPI
WaitForSingleObjectEx(
    IN HANDLE hHandle,
    IN DWORD dwMilliseconds,
    IN BOOL bAlertable
    );

WINBASEAPI
DWORD
WINAPI
WaitForMultipleObjectsEx(
    IN DWORD nCount,
    IN CONST HANDLE *lpHandles,
    IN BOOL bWaitAll,
    IN DWORD dwMilliseconds,
    IN BOOL bAlertable
    );

#if(_WIN32_WINNT >= = $0400)
WINBASEAPI
DWORD
WINAPI
SignalObjectAndWait(
    IN HANDLE hObjectToSignal,
    IN HANDLE hObjectToWaitOn,
    IN DWORD dwMilliseconds,
    IN BOOL bAlertable
    );
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
BOOL
WINAPI
ReadFileEx(
    IN HANDLE hFile,
    OUT LPVOID lpBuffer,
    IN DWORD nNumberOfBytesToRead,
    IN LPOVERLAPPED lpOverlapped,
    IN LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    );

WINBASEAPI
BOOL
WINAPI
WriteFileEx(
    IN HANDLE hFile,
    IN LPCVOID lpBuffer,
    IN DWORD nNumberOfBytesToWrite,
    IN LPOVERLAPPED lpOverlapped,
    IN LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    );

WINBASEAPI
BOOL
WINAPI
BackupRead(
    IN HANDLE hFile,
    OUT LPBYTE lpBuffer,
    IN DWORD nNumberOfBytesToRead,
    OUT LPDWORD lpNumberOfBytesRead,
    IN BOOL bAbort,
    IN BOOL bProcessSecurity,
    OUT LPVOID *lpContext
    );

WINBASEAPI
BOOL
WINAPI
BackupSeek(
    IN HANDLE hFile,
    IN DWORD  dwLowBytesToSeek,
    IN DWORD  dwHighBytesToSeek,
    OUT LPDWORD lpdwLowByteSeeked,
    OUT LPDWORD lpdwHighByteSeeked,
    IN LPVOID *lpContext
    );

WINBASEAPI
BOOL
WINAPI
BackupWrite(
    IN HANDLE hFile,
    IN LPBYTE lpBuffer,
    IN DWORD nNumberOfBytesToWrite,
    OUT LPDWORD lpNumberOfBytesWritten,
    IN BOOL bAbort,
    IN BOOL bProcessSecurity,
    OUT LPVOID *lpContext
    );

//
//  Stream id structure
//
type struct _WIN32_STREAM_ID {
        DWORD          dwStreamId ;
        DWORD          dwStreamAttributes ;
        LARGE_INTEGER  Size ;
        DWORD          dwStreamNameSize ;
        WCHAR          cStreamName[ ANYSIZE_ARRAY ] ;
} WIN32_STREAM_ID, *LPWIN32_STREAM_ID ;

//
//  Stream Ids
//

   BACKUP_INVALID          = $00000000
   BACKUP_DATA             = $00000001
   BACKUP_EA_DATA          = $00000002
   BACKUP_SECURITY_DATA    = $00000003
   BACKUP_ALTERNATE_DATA   = $00000004
   BACKUP_LINK             = $00000005
   BACKUP_PROPERTY_DATA    = $00000006
   BACKUP_OBJECT_ID        = $00000007
   BACKUP_REPARSE_DATA     = $00000008
   BACKUP_SPARSE_BLOCK     = $00000009


//
//  Stream Attributes
//

   STREAM_NORMAL_ATTRIBUTE         = $00000000
   STREAM_MODIFIED_WHEN_READ       = $00000001
   STREAM_CONTAINS_SECURITY        = $00000002
   STREAM_CONTAINS_PROPERTIES      = $00000004
   STREAM_SPARSE_ATTRIBUTE         = $00000008

WINBASEAPI
BOOL
WINAPI
ReadFileScatter(
    IN HANDLE hFile,
    IN FILE_SEGMENT_ELEMENT aSegmentArray[],
    IN DWORD nNumberOfBytesToRead,
    IN LPDWORD lpReserved,
    IN LPOVERLAPPED lpOverlapped
    );

WINBASEAPI
BOOL
WINAPI
WriteFileGather(
    IN HANDLE hFile,
    OUT FILE_SEGMENT_ELEMENT aSegmentArray[],
    IN DWORD nNumberOfBytesToWrite,
    IN LPDWORD lpReserved,
    IN LPOVERLAPPED lpOverlapped
    );

//
// Dual Mode API below this line. Dual Mode Structures also included.
//

   STARTF_USESHOWWINDOW    = $00000001
   STARTF_USESIZE          = $00000002
   STARTF_USEPOSITION      = $00000004
   STARTF_USECOUNTCHARS    = $00000008
   STARTF_USEFILLATTRIBUTE = $00000010
   STARTF_RUNFULLSCREEN    = $00000020  // ignored for non-x86 platforms
   STARTF_FORCEONFEEDBACK  = $00000040
   STARTF_FORCEOFFFEEDBACK = $00000080
   STARTF_USESTDHANDLES    = $00000100

#if(WINVER >= = $0400)

   STARTF_USEHOTKEY        = $00000200
#endif (* WINVER >= = $0400 *)

type struct _STARTUPINFOA {
    DWORD   cb;
    LPSTR   lpReserved;
    LPSTR   lpDesktop;
    LPSTR   lpTitle;
    DWORD   dwX;
    DWORD   dwY;
    DWORD   dwXSize;
    DWORD   dwYSize;
    DWORD   dwXCountChars;
    DWORD   dwYCountChars;
    DWORD   dwFillAttribute;
    DWORD   dwFlags;
    WORD    wShowWindow;
    WORD    cbReserved2;
    LPBYTE  lpReserved2;
    HANDLE  hStdInput;
    HANDLE  hStdOutput;
    HANDLE  hStdError;
} STARTUPINFOA, *LPSTARTUPINFOA;
type struct _STARTUPINFOW {
    DWORD   cb;
    LPWSTR  lpReserved;
    LPWSTR  lpDesktop;
    LPWSTR  lpTitle;
    DWORD   dwX;
    DWORD   dwY;
    DWORD   dwXSize;
    DWORD   dwYSize;
    DWORD   dwXCountChars;
    DWORD   dwYCountChars;
    DWORD   dwFillAttribute;
    DWORD   dwFlags;
    WORD    wShowWindow;
    WORD    cbReserved2;
    LPBYTE  lpReserved2;
    HANDLE  hStdInput;
    HANDLE  hStdOutput;
    HANDLE  hStdError;
} STARTUPINFOW, *LPSTARTUPINFOW;
#ifdef UNICODE
type STARTUPINFOW STARTUPINFO;
type LPSTARTUPINFOW LPSTARTUPINFO;
#else
type STARTUPINFOA STARTUPINFO;
type LPSTARTUPINFOA LPSTARTUPINFO;
#endif // UNICODE

   SHUTDOWN_NORETRY                = $00000001

type struct _WIN32_FIND_DATAA {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD dwReserved0;
    DWORD dwReserved1;
    CHAR   cFileName[ MAX_PATH ];
    CHAR   cAlternateFileName[ 14 ];
#ifdef _MAC
    DWORD dwFileType;
    DWORD dwCreatorType;
    WORD  wFinderFlags;
#endif
} WIN32_FIND_DATAA, *PWIN32_FIND_DATAA, *LPWIN32_FIND_DATAA;
type struct _WIN32_FIND_DATAW {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD dwReserved0;
    DWORD dwReserved1;
    WCHAR  cFileName[ MAX_PATH ];
    WCHAR  cAlternateFileName[ 14 ];
#ifdef _MAC
    DWORD dwFileType;
    DWORD dwCreatorType;
    WORD  wFinderFlags;
#endif
} WIN32_FIND_DATAW, *PWIN32_FIND_DATAW, *LPWIN32_FIND_DATAW;
#ifdef UNICODE
type WIN32_FIND_DATAW WIN32_FIND_DATA;
type PWIN32_FIND_DATAW PWIN32_FIND_DATA;
type LPWIN32_FIND_DATAW LPWIN32_FIND_DATA;
#else
type WIN32_FIND_DATAA WIN32_FIND_DATA;
type PWIN32_FIND_DATAA PWIN32_FIND_DATA;
type LPWIN32_FIND_DATAA LPWIN32_FIND_DATA;
#endif // UNICODE

type struct _WIN32_FILE_ATTRIBUTE_DATA {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
} WIN32_FILE_ATTRIBUTE_DATA, *LPWIN32_FILE_ATTRIBUTE_DATA;

WINBASEAPI
HANDLE
WINAPI
CreateMutexA(
    IN LPSECURITY_ATTRIBUTES lpMutexAttributes,
    IN BOOL bInitialOwner,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
CreateMutexW(
    IN LPSECURITY_ATTRIBUTES lpMutexAttributes,
    IN BOOL bInitialOwner,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   CreateMutex  CreateMutexW
#else
   CreateMutex  CreateMutexA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
OpenMutexA(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
OpenMutexW(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   OpenMutex  OpenMutexW
#else
   OpenMutex  OpenMutexA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
CreateEventA(
    IN LPSECURITY_ATTRIBUTES lpEventAttributes,
    IN BOOL bManualReset,
    IN BOOL bInitialState,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
CreateEventW(
    IN LPSECURITY_ATTRIBUTES lpEventAttributes,
    IN BOOL bManualReset,
    IN BOOL bInitialState,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   CreateEvent  CreateEventW
#else
   CreateEvent  CreateEventA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
OpenEventA(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
OpenEventW(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   OpenEvent  OpenEventW
#else
   OpenEvent  OpenEventA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
CreateSemaphoreA(
    IN LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
    IN LONG lInitialCount,
    IN LONG lMaximumCount,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
CreateSemaphoreW(
    IN LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
    IN LONG lInitialCount,
    IN LONG lMaximumCount,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   CreateSemaphore  CreateSemaphoreW
#else
   CreateSemaphore  CreateSemaphoreA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
OpenSemaphoreA(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
OpenSemaphoreW(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   OpenSemaphore  OpenSemaphoreW
#else
   OpenSemaphore  OpenSemaphoreA
#endif // !UNICODE

#if (_WIN32_WINNT >= = $0400) || (_WIN32_WINDOWS > = $0400)
type
VOID
(APIENTRY *PTIMERAPCROUTINE)(
    LPVOID lpArgToCompletionRoutine,
    DWORD dwTimerLowValue,
    DWORD dwTimerHighValue
    );

WINBASEAPI
HANDLE
WINAPI
CreateWaitableTimerA(
    IN LPSECURITY_ATTRIBUTES lpTimerAttributes,
    IN BOOL bManualReset,
    IN LPCSTR lpTimerName
    );
WINBASEAPI
HANDLE
WINAPI
CreateWaitableTimerW(
    IN LPSECURITY_ATTRIBUTES lpTimerAttributes,
    IN BOOL bManualReset,
    IN LPCWSTR lpTimerName
    );
#ifdef UNICODE
   CreateWaitableTimer  CreateWaitableTimerW
#else
   CreateWaitableTimer  CreateWaitableTimerA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
OpenWaitableTimerA(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCSTR lpTimerName
    );
WINBASEAPI
HANDLE
WINAPI
OpenWaitableTimerW(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCWSTR lpTimerName
    );
#ifdef UNICODE
   OpenWaitableTimer  OpenWaitableTimerW
#else
   OpenWaitableTimer  OpenWaitableTimerA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetWaitableTimer(
    IN HANDLE hTimer,
    IN const LARGE_INTEGER *lpDueTime,
    IN LONG lPeriod,
    IN PTIMERAPCROUTINE pfnCompletionRoutine,
    IN LPVOID lpArgToCompletionRoutine,
    IN BOOL fResume
    );

WINBASEAPI
BOOL
WINAPI
CancelWaitableTimer(
    IN HANDLE hTimer
    );
#endif (* (_WIN32_WINNT >= = $0400) || (_WIN32_WINDOWS > = $0400) *)

WINBASEAPI
HANDLE
WINAPI
CreateFileMappingA(
    IN HANDLE hFile,
    IN LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
    IN DWORD flProtect,
    IN DWORD dwMaximumSizeHigh,
    IN DWORD dwMaximumSizeLow,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
CreateFileMappingW(
    IN HANDLE hFile,
    IN LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
    IN DWORD flProtect,
    IN DWORD dwMaximumSizeHigh,
    IN DWORD dwMaximumSizeLow,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   CreateFileMapping  CreateFileMappingW
#else
   CreateFileMapping  CreateFileMappingA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
OpenFileMappingA(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
OpenFileMappingW(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   OpenFileMapping  OpenFileMappingW
#else
   OpenFileMapping  OpenFileMappingA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetLogicalDriveStringsA(
    IN DWORD nBufferLength,
    OUT LPSTR lpBuffer
    );
WINBASEAPI
DWORD
WINAPI
GetLogicalDriveStringsW(
    IN DWORD nBufferLength,
    OUT LPWSTR lpBuffer
    );
#ifdef UNICODE
   GetLogicalDriveStrings  GetLogicalDriveStringsW
#else
   GetLogicalDriveStrings  GetLogicalDriveStringsA
#endif // !UNICODE

#if _WIN32_WINNT >= = $0501

type enum _MEMORY_RESOURCE_NOTIFICATION_TYPE {
    LowMemoryResourceNotification,
    HighMemoryResourceNotification
} MEMORY_RESOURCE_NOTIFICATION_TYPE;

WINBASEAPI
HANDLE
WINAPI
CreateMemoryResourceNotification(
    IN MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType
    );

WINBASEAPI
BOOL
WINAPI
QueryMemoryResourceNotification(
    IN  HANDLE ResourceNotificationHandle,
    OUT PBOOL  ResourceState
    );

#endif // _WIN32_WINNT >= = $0501



WINBASEAPI
HMODULE
WINAPI
LoadLibraryA(
    IN LPCSTR lpLibFileName
    );
WINBASEAPI
HMODULE
WINAPI
LoadLibraryW(
    IN LPCWSTR lpLibFileName
    );
#ifdef UNICODE
   LoadLibrary  LoadLibraryW
#else
   LoadLibrary  LoadLibraryA
#endif // !UNICODE

WINBASEAPI
HMODULE
WINAPI
LoadLibraryExA(
    IN LPCSTR lpLibFileName,
    IN HANDLE hFile,
    IN DWORD dwFlags
    );
WINBASEAPI
HMODULE
WINAPI
LoadLibraryExW(
    IN LPCWSTR lpLibFileName,
    IN HANDLE hFile,
    IN DWORD dwFlags
    );
#ifdef UNICODE
   LoadLibraryEx  LoadLibraryExW
#else
   LoadLibraryEx  LoadLibraryExA
#endif // !UNICODE


   DONT_RESOLVE_DLL_REFERENCES     = $00000001
   LOAD_LIBRARY_AS_DATAFILE        = $00000002
   LOAD_WITH_ALTERED_SEARCH_PATH   = $00000008
   LOAD_IGNORE_CODE_AUTHZ_LEVEL    = $00000010


WINBASEAPI
DWORD
WINAPI
GetModuleFileNameA(
    IN HMODULE hModule,
    OUT LPSTR lpFilename,
    IN DWORD nSize
    );
WINBASEAPI
DWORD
WINAPI
GetModuleFileNameW(
    IN HMODULE hModule,
    OUT LPWSTR lpFilename,
    IN DWORD nSize
    );
#ifdef UNICODE
   GetModuleFileName  GetModuleFileNameW
#else
   GetModuleFileName  GetModuleFileNameA
#endif // !UNICODE

WINBASEAPI
HMODULE
WINAPI
GetModuleHandleA(
    IN LPCSTR lpModuleName
    );
WINBASEAPI
HMODULE
WINAPI
GetModuleHandleW(
    IN LPCWSTR lpModuleName
    );
#ifdef UNICODE
   GetModuleHandle  GetModuleHandleW
#else
   GetModuleHandle  GetModuleHandleA
#endif // !UNICODE

#if !defined(RC_INVOKED)
#if _WIN32_WINNT > = $0500 || defined(WINBASE_DECLARE_GET_MODULE_HANDLE_EX) || ISOLATION_AWARE_ENABLED

   GET_MODULE_HANDLE_EX_FLAG_PIN                 (= $00000001)
   GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT  (= $00000002)
   GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS        (= $00000004)

type
BOOL
(WINAPI*
PGET_MODULE_HANDLE_EXA)(
    IN DWORD        dwFlags,
    IN LPCSTR     lpModuleName,
    OUT HMODULE*    phModule
    );
type
BOOL
(WINAPI*
PGET_MODULE_HANDLE_EXW)(
    IN DWORD        dwFlags,
    IN LPCWSTR     lpModuleName,
    OUT HMODULE*    phModule
    );
#ifdef UNICODE
   PGET_MODULE_HANDLE_EX  PGET_MODULE_HANDLE_EXW
#else
   PGET_MODULE_HANDLE_EX  PGET_MODULE_HANDLE_EXA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetModuleHandleExA(
    IN DWORD        dwFlags,
    IN LPCSTR     lpModuleName,
    OUT HMODULE*    phModule
    );
WINBASEAPI
BOOL
WINAPI
GetModuleHandleExW(
    IN DWORD        dwFlags,
    IN LPCWSTR     lpModuleName,
    OUT HMODULE*    phModule
    );
#ifdef UNICODE
   GetModuleHandleEx  GetModuleHandleExW
#else
   GetModuleHandleEx  GetModuleHandleExA
#endif // !UNICODE

#endif
#endif

WINBASEAPI
BOOL
WINAPI
CreateProcessA(
    IN LPCSTR lpApplicationName,
    IN LPSTR lpCommandLine,
    IN LPSECURITY_ATTRIBUTES lpProcessAttributes,
    IN LPSECURITY_ATTRIBUTES lpThreadAttributes,
    IN BOOL bInheritHandles,
    IN DWORD dwCreationFlags,
    IN LPVOID lpEnvironment,
    IN LPCSTR lpCurrentDirectory,
    IN LPSTARTUPINFOA lpStartupInfo,
    OUT LPPROCESS_INFORMATION lpProcessInformation
    );
WINBASEAPI
BOOL
WINAPI
CreateProcessW(
    IN LPCWSTR lpApplicationName,
    IN LPWSTR lpCommandLine,
    IN LPSECURITY_ATTRIBUTES lpProcessAttributes,
    IN LPSECURITY_ATTRIBUTES lpThreadAttributes,
    IN BOOL bInheritHandles,
    IN DWORD dwCreationFlags,
    IN LPVOID lpEnvironment,
    IN LPCWSTR lpCurrentDirectory,
    IN LPSTARTUPINFOW lpStartupInfo,
    OUT LPPROCESS_INFORMATION lpProcessInformation
    );
#ifdef UNICODE
   CreateProcess  CreateProcessW
#else
   CreateProcess  CreateProcessA
#endif // !UNICODE



WINBASEAPI
BOOL
WINAPI
SetProcessShutdownParameters(
    IN DWORD dwLevel,
    IN DWORD dwFlags
    );

WINBASEAPI
BOOL
WINAPI
GetProcessShutdownParameters(
    OUT LPDWORD lpdwLevel,
    OUT LPDWORD lpdwFlags
    );

WINBASEAPI
DWORD
WINAPI
GetProcessVersion(
    IN DWORD ProcessId
    );

WINBASEAPI
VOID
WINAPI
FatalAppExitA(
    IN UINT uAction,
    IN LPCSTR lpMessageText
    );
WINBASEAPI
VOID
WINAPI
FatalAppExitW(
    IN UINT uAction,
    IN LPCWSTR lpMessageText
    );
#ifdef UNICODE
   FatalAppExit  FatalAppExitW
#else
   FatalAppExit  FatalAppExitA
#endif // !UNICODE

WINBASEAPI
VOID
WINAPI
GetStartupInfoA(
    OUT LPSTARTUPINFOA lpStartupInfo
    );
WINBASEAPI
VOID
WINAPI
GetStartupInfoW(
    OUT LPSTARTUPINFOW lpStartupInfo
    );
#ifdef UNICODE
   GetStartupInfo  GetStartupInfoW
#else
   GetStartupInfo  GetStartupInfoA
#endif // !UNICODE

WINBASEAPI
LPSTR
WINAPI
GetCommandLineA(
    VOID
    );
WINBASEAPI
LPWSTR
WINAPI
GetCommandLineW(
    VOID
    );
#ifdef UNICODE
   GetCommandLine  GetCommandLineW
#else
   GetCommandLine  GetCommandLineA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetEnvironmentVariableA(
    IN LPCSTR lpName,
    OUT LPSTR lpBuffer,
    IN DWORD nSize
    );
WINBASEAPI
DWORD
WINAPI
GetEnvironmentVariableW(
    IN LPCWSTR lpName,
    OUT LPWSTR lpBuffer,
    IN DWORD nSize
    );
#ifdef UNICODE
   GetEnvironmentVariable  GetEnvironmentVariableW
#else
   GetEnvironmentVariable  GetEnvironmentVariableA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetEnvironmentVariableA(
    IN LPCSTR lpName,
    IN LPCSTR lpValue
    );
WINBASEAPI
BOOL
WINAPI
SetEnvironmentVariableW(
    IN LPCWSTR lpName,
    IN LPCWSTR lpValue
    );
#ifdef UNICODE
   SetEnvironmentVariable  SetEnvironmentVariableW
#else
   SetEnvironmentVariable  SetEnvironmentVariableA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
ExpandEnvironmentStringsA(
    IN LPCSTR lpSrc,
    OUT LPSTR lpDst,
    IN DWORD nSize
    );
WINBASEAPI
DWORD
WINAPI
ExpandEnvironmentStringsW(
    IN LPCWSTR lpSrc,
    OUT LPWSTR lpDst,
    IN DWORD nSize
    );
#ifdef UNICODE
   ExpandEnvironmentStrings  ExpandEnvironmentStringsW
#else
   ExpandEnvironmentStrings  ExpandEnvironmentStringsA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetFirmwareEnvironmentVariableA(
    IN LPCSTR lpName,
    IN LPCSTR lpGuid,
    OUT PVOID   pBuffer,
    IN DWORD    nSize
    );
WINBASEAPI
DWORD
WINAPI
GetFirmwareEnvironmentVariableW(
    IN LPCWSTR lpName,
    IN LPCWSTR lpGuid,
    OUT PVOID   pBuffer,
    IN DWORD    nSize
    );
#ifdef UNICODE
   GetFirmwareEnvironmentVariable  GetFirmwareEnvironmentVariableW
#else
   GetFirmwareEnvironmentVariable  GetFirmwareEnvironmentVariableA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetFirmwareEnvironmentVariableA(
    IN LPCSTR lpName,
    IN LPCSTR lpGuid,
    IN PVOID    pValue,
    IN DWORD    nSize
    );
WINBASEAPI
BOOL
WINAPI
SetFirmwareEnvironmentVariableW(
    IN LPCWSTR lpName,
    IN LPCWSTR lpGuid,
    IN PVOID    pValue,
    IN DWORD    nSize
    );
#ifdef UNICODE
   SetFirmwareEnvironmentVariable  SetFirmwareEnvironmentVariableW
#else
   SetFirmwareEnvironmentVariable  SetFirmwareEnvironmentVariableA
#endif // !UNICODE


WINBASEAPI
VOID
WINAPI
OutputDebugStringA(
    IN LPCSTR lpOutputString
    );
WINBASEAPI
VOID
WINAPI
OutputDebugStringW(
    IN LPCWSTR lpOutputString
    );
#ifdef UNICODE
   OutputDebugString  OutputDebugStringW
#else
   OutputDebugString  OutputDebugStringA
#endif // !UNICODE

WINBASEAPI
HRSRC
WINAPI
FindResourceA(
    IN HMODULE hModule,
    IN LPCSTR lpName,
    IN LPCSTR lpType
    );
WINBASEAPI
HRSRC
WINAPI
FindResourceW(
    IN HMODULE hModule,
    IN LPCWSTR lpName,
    IN LPCWSTR lpType
    );
#ifdef UNICODE
   FindResource  FindResourceW
#else
   FindResource  FindResourceA
#endif // !UNICODE

WINBASEAPI
HRSRC
WINAPI
FindResourceExA(
    IN HMODULE hModule,
    IN LPCSTR lpType,
    IN LPCSTR lpName,
    IN WORD    wLanguage
    );
WINBASEAPI
HRSRC
WINAPI
FindResourceExW(
    IN HMODULE hModule,
    IN LPCWSTR lpType,
    IN LPCWSTR lpName,
    IN WORD    wLanguage
    );
#ifdef UNICODE
   FindResourceEx  FindResourceExW
#else
   FindResourceEx  FindResourceExA
#endif // !UNICODE

#ifdef STRICT
type BOOL (CALLBACK* ENUMRESTYPEPROCA)(HMODULE hModule, LPSTR lpType,
        LONG_PTR lParam);
type BOOL (CALLBACK* ENUMRESTYPEPROCW)(HMODULE hModule, LPWSTR lpType,
        LONG_PTR lParam);
#ifdef UNICODE
   ENUMRESTYPEPROC  ENUMRESTYPEPROCW
#else
   ENUMRESTYPEPROC  ENUMRESTYPEPROCA
#endif // !UNICODE
type BOOL (CALLBACK* ENUMRESNAMEPROCA)(HMODULE hModule, LPCSTR lpType,
        LPSTR lpName, LONG_PTR lParam);
type BOOL (CALLBACK* ENUMRESNAMEPROCW)(HMODULE hModule, LPCWSTR lpType,
        LPWSTR lpName, LONG_PTR lParam);
#ifdef UNICODE
   ENUMRESNAMEPROC  ENUMRESNAMEPROCW
#else
   ENUMRESNAMEPROC  ENUMRESNAMEPROCA
#endif // !UNICODE
type BOOL (CALLBACK* ENUMRESLANGPROCA)(HMODULE hModule, LPCSTR lpType,
        LPCSTR lpName, WORD  wLanguage, LONG_PTR lParam);
type BOOL (CALLBACK* ENUMRESLANGPROCW)(HMODULE hModule, LPCWSTR lpType,
        LPCWSTR lpName, WORD  wLanguage, LONG_PTR lParam);
#ifdef UNICODE
   ENUMRESLANGPROC  ENUMRESLANGPROCW
#else
   ENUMRESLANGPROC  ENUMRESLANGPROCA
#endif // !UNICODE
#else
type FARPROC ENUMRESTYPEPROCA;
type FARPROC ENUMRESTYPEPROCW;
#ifdef UNICODE
type ENUMRESTYPEPROCW ENUMRESTYPEPROC;
#else
type ENUMRESTYPEPROCA ENUMRESTYPEPROC;
#endif // UNICODE
type FARPROC ENUMRESNAMEPROCA;
type FARPROC ENUMRESNAMEPROCW;
#ifdef UNICODE
type ENUMRESNAMEPROCW ENUMRESNAMEPROC;
#else
type ENUMRESNAMEPROCA ENUMRESNAMEPROC;
#endif // UNICODE
type FARPROC ENUMRESLANGPROCA;
type FARPROC ENUMRESLANGPROCW;
#ifdef UNICODE
type ENUMRESLANGPROCW ENUMRESLANGPROC;
#else
type ENUMRESLANGPROCA ENUMRESLANGPROC;
#endif // UNICODE
#endif

WINBASEAPI
BOOL
WINAPI
EnumResourceTypesA(
    IN HMODULE hModule,
    IN ENUMRESTYPEPROCA lpEnumFunc,
    IN LONG_PTR lParam
    );
WINBASEAPI
BOOL
WINAPI
EnumResourceTypesW(
    IN HMODULE hModule,
    IN ENUMRESTYPEPROCW lpEnumFunc,
    IN LONG_PTR lParam
    );
#ifdef UNICODE
   EnumResourceTypes  EnumResourceTypesW
#else
   EnumResourceTypes  EnumResourceTypesA
#endif // !UNICODE


WINBASEAPI
BOOL
WINAPI
EnumResourceNamesA(
    IN HMODULE hModule,
    IN LPCSTR lpType,
    IN ENUMRESNAMEPROCA lpEnumFunc,
    IN LONG_PTR lParam
    );
WINBASEAPI
BOOL
WINAPI
EnumResourceNamesW(
    IN HMODULE hModule,
    IN LPCWSTR lpType,
    IN ENUMRESNAMEPROCW lpEnumFunc,
    IN LONG_PTR lParam
    );
#ifdef UNICODE
   EnumResourceNames  EnumResourceNamesW
#else
   EnumResourceNames  EnumResourceNamesA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
EnumResourceLanguagesA(
    IN HMODULE hModule,
    IN LPCSTR lpType,
    IN LPCSTR lpName,
    IN ENUMRESLANGPROCA lpEnumFunc,
    IN LONG_PTR lParam
    );
WINBASEAPI
BOOL
WINAPI
EnumResourceLanguagesW(
    IN HMODULE hModule,
    IN LPCWSTR lpType,
    IN LPCWSTR lpName,
    IN ENUMRESLANGPROCW lpEnumFunc,
    IN LONG_PTR lParam
    );
#ifdef UNICODE
   EnumResourceLanguages  EnumResourceLanguagesW
#else
   EnumResourceLanguages  EnumResourceLanguagesA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
BeginUpdateResourceA(
    IN LPCSTR pFileName,
    IN BOOL bDeleteExistingResources
    );
WINBASEAPI
HANDLE
WINAPI
BeginUpdateResourceW(
    IN LPCWSTR pFileName,
    IN BOOL bDeleteExistingResources
    );
#ifdef UNICODE
   BeginUpdateResource  BeginUpdateResourceW
#else
   BeginUpdateResource  BeginUpdateResourceA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
UpdateResourceA(
    IN HANDLE      hUpdate,
    IN LPCSTR     lpType,
    IN LPCSTR     lpName,
    IN WORD        wLanguage,
    IN LPVOID      lpData,
    IN DWORD       cbData
    );
WINBASEAPI
BOOL
WINAPI
UpdateResourceW(
    IN HANDLE      hUpdate,
    IN LPCWSTR     lpType,
    IN LPCWSTR     lpName,
    IN WORD        wLanguage,
    IN LPVOID      lpData,
    IN DWORD       cbData
    );
#ifdef UNICODE
   UpdateResource  UpdateResourceW
#else
   UpdateResource  UpdateResourceA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
EndUpdateResourceA(
    IN HANDLE      hUpdate,
    IN BOOL        fDiscard
    );
WINBASEAPI
BOOL
WINAPI
EndUpdateResourceW(
    IN HANDLE      hUpdate,
    IN BOOL        fDiscard
    );
#ifdef UNICODE
   EndUpdateResource  EndUpdateResourceW
#else
   EndUpdateResource  EndUpdateResourceA
#endif // !UNICODE

WINBASEAPI
ATOM
WINAPI
GlobalAddAtomA(
    IN LPCSTR lpString
    );
WINBASEAPI
ATOM
WINAPI
GlobalAddAtomW(
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   GlobalAddAtom  GlobalAddAtomW
#else
   GlobalAddAtom  GlobalAddAtomA
#endif // !UNICODE

WINBASEAPI
ATOM
WINAPI
GlobalFindAtomA(
    IN LPCSTR lpString
    );
WINBASEAPI
ATOM
WINAPI
GlobalFindAtomW(
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   GlobalFindAtom  GlobalFindAtomW
#else
   GlobalFindAtom  GlobalFindAtomA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GlobalGetAtomNameA(
    IN ATOM nAtom,
    OUT LPSTR lpBuffer,
    IN int nSize
    );
WINBASEAPI
UINT
WINAPI
GlobalGetAtomNameW(
    IN ATOM nAtom,
    OUT LPWSTR lpBuffer,
    IN int nSize
    );
#ifdef UNICODE
   GlobalGetAtomName  GlobalGetAtomNameW
#else
   GlobalGetAtomName  GlobalGetAtomNameA
#endif // !UNICODE

WINBASEAPI
ATOM
WINAPI
AddAtomA(
    IN LPCSTR lpString
    );
WINBASEAPI
ATOM
WINAPI
AddAtomW(
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   AddAtom  AddAtomW
#else
   AddAtom  AddAtomA
#endif // !UNICODE

WINBASEAPI
ATOM
WINAPI
FindAtomA(
    IN LPCSTR lpString
    );
WINBASEAPI
ATOM
WINAPI
FindAtomW(
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   FindAtom  FindAtomW
#else
   FindAtom  FindAtomA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetAtomNameA(
    IN ATOM nAtom,
    OUT LPSTR lpBuffer,
    IN int nSize
    );
WINBASEAPI
UINT
WINAPI
GetAtomNameW(
    IN ATOM nAtom,
    OUT LPWSTR lpBuffer,
    IN int nSize
    );
#ifdef UNICODE
   GetAtomName  GetAtomNameW
#else
   GetAtomName  GetAtomNameA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetProfileIntA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpKeyName,
    IN INT nDefault
    );
WINBASEAPI
UINT
WINAPI
GetProfileIntW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpKeyName,
    IN INT nDefault
    );
#ifdef UNICODE
   GetProfileInt  GetProfileIntW
#else
   GetProfileInt  GetProfileIntA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetProfileStringA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpKeyName,
    IN LPCSTR lpDefault,
    OUT LPSTR lpReturnedString,
    IN DWORD nSize
    );
WINBASEAPI
DWORD
WINAPI
GetProfileStringW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpKeyName,
    IN LPCWSTR lpDefault,
    OUT LPWSTR lpReturnedString,
    IN DWORD nSize
    );
#ifdef UNICODE
   GetProfileString  GetProfileStringW
#else
   GetProfileString  GetProfileStringA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
WriteProfileStringA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpKeyName,
    IN LPCSTR lpString
    );
WINBASEAPI
BOOL
WINAPI
WriteProfileStringW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpKeyName,
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   WriteProfileString  WriteProfileStringW
#else
   WriteProfileString  WriteProfileStringA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetProfileSectionA(
    IN LPCSTR lpAppName,
    OUT LPSTR lpReturnedString,
    IN DWORD nSize
    );
WINBASEAPI
DWORD
WINAPI
GetProfileSectionW(
    IN LPCWSTR lpAppName,
    OUT LPWSTR lpReturnedString,
    IN DWORD nSize
    );
#ifdef UNICODE
   GetProfileSection  GetProfileSectionW
#else
   GetProfileSection  GetProfileSectionA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
WriteProfileSectionA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpString
    );
WINBASEAPI
BOOL
WINAPI
WriteProfileSectionW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpString
    );
#ifdef UNICODE
   WriteProfileSection  WriteProfileSectionW
#else
   WriteProfileSection  WriteProfileSectionA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetPrivateProfileIntA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpKeyName,
    IN INT nDefault,
    IN LPCSTR lpFileName
    );
WINBASEAPI
UINT
WINAPI
GetPrivateProfileIntW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpKeyName,
    IN INT nDefault,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   GetPrivateProfileInt  GetPrivateProfileIntW
#else
   GetPrivateProfileInt  GetPrivateProfileIntA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetPrivateProfileStringA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpKeyName,
    IN LPCSTR lpDefault,
    OUT LPSTR lpReturnedString,
    IN DWORD nSize,
    IN LPCSTR lpFileName
    );
WINBASEAPI
DWORD
WINAPI
GetPrivateProfileStringW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpKeyName,
    IN LPCWSTR lpDefault,
    OUT LPWSTR lpReturnedString,
    IN DWORD nSize,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   GetPrivateProfileString  GetPrivateProfileStringW
#else
   GetPrivateProfileString  GetPrivateProfileStringA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
WritePrivateProfileStringA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpKeyName,
    IN LPCSTR lpString,
    IN LPCSTR lpFileName
    );
WINBASEAPI
BOOL
WINAPI
WritePrivateProfileStringW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpKeyName,
    IN LPCWSTR lpString,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   WritePrivateProfileString  WritePrivateProfileStringW
#else
   WritePrivateProfileString  WritePrivateProfileStringA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetPrivateProfileSectionA(
    IN LPCSTR lpAppName,
    OUT LPSTR lpReturnedString,
    IN DWORD nSize,
    IN LPCSTR lpFileName
    );
WINBASEAPI
DWORD
WINAPI
GetPrivateProfileSectionW(
    IN LPCWSTR lpAppName,
    OUT LPWSTR lpReturnedString,
    IN DWORD nSize,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   GetPrivateProfileSection  GetPrivateProfileSectionW
#else
   GetPrivateProfileSection  GetPrivateProfileSectionA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
WritePrivateProfileSectionA(
    IN LPCSTR lpAppName,
    IN LPCSTR lpString,
    IN LPCSTR lpFileName
    );
WINBASEAPI
BOOL
WINAPI
WritePrivateProfileSectionW(
    IN LPCWSTR lpAppName,
    IN LPCWSTR lpString,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   WritePrivateProfileSection  WritePrivateProfileSectionW
#else
   WritePrivateProfileSection  WritePrivateProfileSectionA
#endif // !UNICODE


WINBASEAPI
DWORD
WINAPI
GetPrivateProfileSectionNamesA(
    OUT LPSTR lpszReturnBuffer,
    IN DWORD nSize,
    IN LPCSTR lpFileName
    );
WINBASEAPI
DWORD
WINAPI
GetPrivateProfileSectionNamesW(
    OUT LPWSTR lpszReturnBuffer,
    IN DWORD nSize,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   GetPrivateProfileSectionNames  GetPrivateProfileSectionNamesW
#else
   GetPrivateProfileSectionNames  GetPrivateProfileSectionNamesA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetPrivateProfileStructA(
    IN LPCSTR lpszSection,
    IN LPCSTR lpszKey,
    OUT LPVOID   lpStruct,
    IN UINT     uSizeStruct,
    IN LPCSTR szFile
    );
WINBASEAPI
BOOL
WINAPI
GetPrivateProfileStructW(
    IN LPCWSTR lpszSection,
    IN LPCWSTR lpszKey,
    OUT LPVOID   lpStruct,
    IN UINT     uSizeStruct,
    IN LPCWSTR szFile
    );
#ifdef UNICODE
   GetPrivateProfileStruct  GetPrivateProfileStructW
#else
   GetPrivateProfileStruct  GetPrivateProfileStructA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
WritePrivateProfileStructA(
    IN LPCSTR lpszSection,
    IN LPCSTR lpszKey,
    IN LPVOID   lpStruct,
    IN UINT     uSizeStruct,
    IN LPCSTR szFile
    );
WINBASEAPI
BOOL
WINAPI
WritePrivateProfileStructW(
    IN LPCWSTR lpszSection,
    IN LPCWSTR lpszKey,
    IN LPVOID   lpStruct,
    IN UINT     uSizeStruct,
    IN LPCWSTR szFile
    );
#ifdef UNICODE
   WritePrivateProfileStruct  WritePrivateProfileStructW
#else
   WritePrivateProfileStruct  WritePrivateProfileStructA
#endif // !UNICODE


WINBASEAPI
UINT
WINAPI
GetDriveTypeA(
    IN LPCSTR lpRootPathName
    );
WINBASEAPI
UINT
WINAPI
GetDriveTypeW(
    IN LPCWSTR lpRootPathName
    );
#ifdef UNICODE
   GetDriveType  GetDriveTypeW
#else
   GetDriveType  GetDriveTypeA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetSystemDirectoryA(
    OUT LPSTR lpBuffer,
    IN UINT uSize
    );
WINBASEAPI
UINT
WINAPI
GetSystemDirectoryW(
    OUT LPWSTR lpBuffer,
    IN UINT uSize
    );
#ifdef UNICODE
   GetSystemDirectory  GetSystemDirectoryW
#else
   GetSystemDirectory  GetSystemDirectoryA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetTempPathA(
    IN DWORD nBufferLength,
    OUT LPSTR lpBuffer
    );
WINBASEAPI
DWORD
WINAPI
GetTempPathW(
    IN DWORD nBufferLength,
    OUT LPWSTR lpBuffer
    );
#ifdef UNICODE
   GetTempPath  GetTempPathW
#else
   GetTempPath  GetTempPathA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetTempFileNameA(
    IN LPCSTR lpPathName,
    IN LPCSTR lpPrefixString,
    IN UINT uUnique,
    OUT LPSTR lpTempFileName
    );
WINBASEAPI
UINT
WINAPI
GetTempFileNameW(
    IN LPCWSTR lpPathName,
    IN LPCWSTR lpPrefixString,
    IN UINT uUnique,
    OUT LPWSTR lpTempFileName
    );
#ifdef UNICODE
   GetTempFileName  GetTempFileNameW
#else
   GetTempFileName  GetTempFileNameA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetWindowsDirectoryA(
    OUT LPSTR lpBuffer,
    IN UINT uSize
    );
WINBASEAPI
UINT
WINAPI
GetWindowsDirectoryW(
    OUT LPWSTR lpBuffer,
    IN UINT uSize
    );
#ifdef UNICODE
   GetWindowsDirectory  GetWindowsDirectoryW
#else
   GetWindowsDirectory  GetWindowsDirectoryA
#endif // !UNICODE

WINBASEAPI
UINT
WINAPI
GetSystemWindowsDirectoryA(
    OUT LPSTR lpBuffer,
    IN UINT uSize
    );
WINBASEAPI
UINT
WINAPI
GetSystemWindowsDirectoryW(
    OUT LPWSTR lpBuffer,
    IN UINT uSize
    );
#ifdef UNICODE
   GetSystemWindowsDirectory  GetSystemWindowsDirectoryW
#else
   GetSystemWindowsDirectory  GetSystemWindowsDirectoryA
#endif // !UNICODE

#if !defined(RC_INVOKED) // RC warns because "WINBASE_DECLARE_GET_SYSTEM_WOW64_DIRECTORY" is a bit long.
#if _WIN32_WINNT >= = $0501 || defined(WINBASE_DECLARE_GET_SYSTEM_WOW64_DIRECTORY)

WINBASEAPI
UINT
WINAPI
GetSystemWow64DirectoryA(
    OUT LPSTR lpBuffer,
    IN UINT uSize
    );
WINBASEAPI
UINT
WINAPI
GetSystemWow64DirectoryW(
    OUT LPWSTR lpBuffer,
    IN UINT uSize
    );
#ifdef UNICODE
   GetSystemWow64Directory  GetSystemWow64DirectoryW
#else
   GetSystemWow64Directory  GetSystemWow64DirectoryA
#endif // !UNICODE

//
// for GetProcAddress
//
type UINT (WINAPI* PGET_SYSTEM_WOW64_DIRECTORY_A)(OUT  LPSTR lpBuffer, UINT uSize);
type UINT (WINAPI* PGET_SYSTEM_WOW64_DIRECTORY_W)(OUT LPWSTR lpBuffer, UINT uSize);

//
// GetProcAddress only accepts GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A,
// GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A, GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A.
// The others are if you want to use the strings in some other way.
//
   GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A      "GetSystemWow64DirectoryA"
   GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W     L"GetSystemWow64DirectoryA"
   GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T TEXT("GetSystemWow64DirectoryA")
   GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A      "GetSystemWow64DirectoryW"
   GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W     L"GetSystemWow64DirectoryW"
   GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T TEXT("GetSystemWow64DirectoryW")

#ifdef UNICODE
   GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A
   GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W
   GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T
#else
   GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A
   GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W
   GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T
#endif

#endif // _WIN32_WINNT >= = $0501
#endif

WINBASEAPI
BOOL
WINAPI
SetCurrentDirectoryA(
    IN LPCSTR lpPathName
    );
WINBASEAPI
BOOL
WINAPI
SetCurrentDirectoryW(
    IN LPCWSTR lpPathName
    );
#ifdef UNICODE
   SetCurrentDirectory  SetCurrentDirectoryW
#else
   SetCurrentDirectory  SetCurrentDirectoryA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetCurrentDirectoryA(
    IN DWORD nBufferLength,
    OUT LPSTR lpBuffer
    );
WINBASEAPI
DWORD
WINAPI
GetCurrentDirectoryW(
    IN DWORD nBufferLength,
    OUT LPWSTR lpBuffer
    );
#ifdef UNICODE
   GetCurrentDirectory  GetCurrentDirectoryW
#else
   GetCurrentDirectory  GetCurrentDirectoryA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetDiskFreeSpaceA(
    IN LPCSTR lpRootPathName,
    OUT LPDWORD lpSectorsPerCluster,
    OUT LPDWORD lpBytesPerSector,
    OUT LPDWORD lpNumberOfFreeClusters,
    OUT LPDWORD lpTotalNumberOfClusters
    );
WINBASEAPI
BOOL
WINAPI
GetDiskFreeSpaceW(
    IN LPCWSTR lpRootPathName,
    OUT LPDWORD lpSectorsPerCluster,
    OUT LPDWORD lpBytesPerSector,
    OUT LPDWORD lpNumberOfFreeClusters,
    OUT LPDWORD lpTotalNumberOfClusters
    );
#ifdef UNICODE
   GetDiskFreeSpace  GetDiskFreeSpaceW
#else
   GetDiskFreeSpace  GetDiskFreeSpaceA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetDiskFreeSpaceExA(
    IN LPCSTR lpDirectoryName,
    OUT PULARGE_INTEGER lpFreeBytesAvailableToCaller,
    OUT PULARGE_INTEGER lpTotalNumberOfBytes,
    OUT PULARGE_INTEGER lpTotalNumberOfFreeBytes
    );
WINBASEAPI
BOOL
WINAPI
GetDiskFreeSpaceExW(
    IN LPCWSTR lpDirectoryName,
    OUT PULARGE_INTEGER lpFreeBytesAvailableToCaller,
    OUT PULARGE_INTEGER lpTotalNumberOfBytes,
    OUT PULARGE_INTEGER lpTotalNumberOfFreeBytes
    );
#ifdef UNICODE
   GetDiskFreeSpaceEx  GetDiskFreeSpaceExW
#else
   GetDiskFreeSpaceEx  GetDiskFreeSpaceExA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CreateDirectoryA(
    IN LPCSTR lpPathName,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
WINBASEAPI
BOOL
WINAPI
CreateDirectoryW(
    IN LPCWSTR lpPathName,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
#ifdef UNICODE
   CreateDirectory  CreateDirectoryW
#else
   CreateDirectory  CreateDirectoryA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CreateDirectoryExA(
    IN LPCSTR lpTemplateDirectory,
    IN LPCSTR lpNewDirectory,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
WINBASEAPI
BOOL
WINAPI
CreateDirectoryExW(
    IN LPCWSTR lpTemplateDirectory,
    IN LPCWSTR lpNewDirectory,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
#ifdef UNICODE
   CreateDirectoryEx  CreateDirectoryExW
#else
   CreateDirectoryEx  CreateDirectoryExA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
RemoveDirectoryA(
    IN LPCSTR lpPathName
    );
WINBASEAPI
BOOL
WINAPI
RemoveDirectoryW(
    IN LPCWSTR lpPathName
    );
#ifdef UNICODE
   RemoveDirectory  RemoveDirectoryW
#else
   RemoveDirectory  RemoveDirectoryA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetFullPathNameA(
    IN LPCSTR lpFileName,
    IN DWORD nBufferLength,
    OUT LPSTR lpBuffer,
    OUT LPSTR *lpFilePart
    );
WINBASEAPI
DWORD
WINAPI
GetFullPathNameW(
    IN LPCWSTR lpFileName,
    IN DWORD nBufferLength,
    OUT LPWSTR lpBuffer,
    OUT LPWSTR *lpFilePart
    );
#ifdef UNICODE
   GetFullPathName  GetFullPathNameW
#else
   GetFullPathName  GetFullPathNameA
#endif // !UNICODE


   DDD_RAW_TARGET_PATH         = $00000001
   DDD_REMOVE_DEFINITION       = $00000002
   DDD_EXACT_MATCH_ON_REMOVE   = $00000004
   DDD_NO_BROADCAST_SYSTEM     = $00000008
   DDD_LUID_BROADCAST_DRIVE    = $00000010

WINBASEAPI
BOOL
WINAPI
DefineDosDeviceA(
    IN DWORD dwFlags,
    IN LPCSTR lpDeviceName,
    IN LPCSTR lpTargetPath
    );
WINBASEAPI
BOOL
WINAPI
DefineDosDeviceW(
    IN DWORD dwFlags,
    IN LPCWSTR lpDeviceName,
    IN LPCWSTR lpTargetPath
    );
#ifdef UNICODE
   DefineDosDevice  DefineDosDeviceW
#else
   DefineDosDevice  DefineDosDeviceA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
QueryDosDeviceA(
    IN LPCSTR lpDeviceName,
    OUT LPSTR lpTargetPath,
    IN DWORD ucchMax
    );
WINBASEAPI
DWORD
WINAPI
QueryDosDeviceW(
    IN LPCWSTR lpDeviceName,
    OUT LPWSTR lpTargetPath,
    IN DWORD ucchMax
    );
#ifdef UNICODE
   QueryDosDevice  QueryDosDeviceW
#else
   QueryDosDevice  QueryDosDeviceA
#endif // !UNICODE

   EXPAND_LOCAL_DRIVES

WINBASEAPI
HANDLE
WINAPI
CreateFileA(
    IN LPCSTR lpFileName,
    IN DWORD dwDesiredAccess,
    IN DWORD dwShareMode,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes,
    IN DWORD dwCreationDisposition,
    IN DWORD dwFlagsAndAttributes,
    IN HANDLE hTemplateFile
    );
WINBASEAPI
HANDLE
WINAPI
CreateFileW(
    IN LPCWSTR lpFileName,
    IN DWORD dwDesiredAccess,
    IN DWORD dwShareMode,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes,
    IN DWORD dwCreationDisposition,
    IN DWORD dwFlagsAndAttributes,
    IN HANDLE hTemplateFile
    );
#ifdef UNICODE
   CreateFile  CreateFileW
#else
   CreateFile  CreateFileA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetFileAttributesA(
    IN LPCSTR lpFileName,
    IN DWORD dwFileAttributes
    );
WINBASEAPI
BOOL
WINAPI
SetFileAttributesW(
    IN LPCWSTR lpFileName,
    IN DWORD dwFileAttributes
    );
#ifdef UNICODE
   SetFileAttributes  SetFileAttributesW
#else
   SetFileAttributes  SetFileAttributesA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetFileAttributesA(
    IN LPCSTR lpFileName
    );
WINBASEAPI
DWORD
WINAPI
GetFileAttributesW(
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   GetFileAttributes  GetFileAttributesW
#else
   GetFileAttributes  GetFileAttributesA
#endif // !UNICODE

type enum _GET_FILEEX_INFO_LEVELS {
    GetFileExInfoStandard,
    GetFileExMaxInfoLevel
} GET_FILEEX_INFO_LEVELS;

WINBASEAPI
BOOL
WINAPI
GetFileAttributesExA(
    IN LPCSTR lpFileName,
    IN GET_FILEEX_INFO_LEVELS fInfoLevelId,
    OUT LPVOID lpFileInformation
    );
WINBASEAPI
BOOL
WINAPI
GetFileAttributesExW(
    IN LPCWSTR lpFileName,
    IN GET_FILEEX_INFO_LEVELS fInfoLevelId,
    OUT LPVOID lpFileInformation
    );
#ifdef UNICODE
   GetFileAttributesEx  GetFileAttributesExW
#else
   GetFileAttributesEx  GetFileAttributesExA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
GetCompressedFileSizeA(
    IN LPCSTR lpFileName,
    OUT LPDWORD lpFileSizeHigh
    );
WINBASEAPI
DWORD
WINAPI
GetCompressedFileSizeW(
    IN LPCWSTR lpFileName,
    OUT LPDWORD lpFileSizeHigh
    );
#ifdef UNICODE
   GetCompressedFileSize  GetCompressedFileSizeW
#else
   GetCompressedFileSize  GetCompressedFileSizeA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
DeleteFileA(
    IN LPCSTR lpFileName
    );
WINBASEAPI
BOOL
WINAPI
DeleteFileW(
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   DeleteFile  DeleteFileW
#else
   DeleteFile  DeleteFileA
#endif // !UNICODE

#if(_WIN32_WINNT >= = $0400)
type enum _FINDEX_INFO_LEVELS {
    FindExInfoStandard,
    FindExInfoMaxInfoLevel
} FINDEX_INFO_LEVELS;

type enum _FINDEX_SEARCH_OPS {
    FindExSearchNameMatch,
    FindExSearchLimitToDirectories,
    FindExSearchLimitToDevices,
    FindExSearchMaxSearchOp
} FINDEX_SEARCH_OPS;

   FIND_FIRST_EX_CASE_SENSITIVE   = $00000001

WINBASEAPI
HANDLE
WINAPI
FindFirstFileExA(
    IN LPCSTR lpFileName,
    IN FINDEX_INFO_LEVELS fInfoLevelId,
    OUT LPVOID lpFindFileData,
    IN FINDEX_SEARCH_OPS fSearchOp,
    IN LPVOID lpSearchFilter,
    IN DWORD dwAdditionalFlags
    );
WINBASEAPI
HANDLE
WINAPI
FindFirstFileExW(
    IN LPCWSTR lpFileName,
    IN FINDEX_INFO_LEVELS fInfoLevelId,
    OUT LPVOID lpFindFileData,
    IN FINDEX_SEARCH_OPS fSearchOp,
    IN LPVOID lpSearchFilter,
    IN DWORD dwAdditionalFlags
    );
#ifdef UNICODE
   FindFirstFileEx  FindFirstFileExW
#else
   FindFirstFileEx  FindFirstFileExA
#endif // !UNICODE
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
HANDLE
WINAPI
FindFirstFileA(
    IN LPCSTR lpFileName,
    OUT LPWIN32_FIND_DATAA lpFindFileData
    );
WINBASEAPI
HANDLE
WINAPI
FindFirstFileW(
    IN LPCWSTR lpFileName,
    OUT LPWIN32_FIND_DATAW lpFindFileData
    );
#ifdef UNICODE
   FindFirstFile  FindFirstFileW
#else
   FindFirstFile  FindFirstFileA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindNextFileA(
    IN HANDLE hFindFile,
    OUT LPWIN32_FIND_DATAA lpFindFileData
    );
WINBASEAPI
BOOL
WINAPI
FindNextFileW(
    IN HANDLE hFindFile,
    OUT LPWIN32_FIND_DATAW lpFindFileData
    );
#ifdef UNICODE
   FindNextFile  FindNextFileW
#else
   FindNextFile  FindNextFileA
#endif // !UNICODE



WINBASEAPI
DWORD
WINAPI
SearchPathA(
    IN LPCSTR lpPath,
    IN LPCSTR lpFileName,
    IN LPCSTR lpExtension,
    IN DWORD nBufferLength,
    OUT LPSTR lpBuffer,
    OUT LPSTR *lpFilePart
    );
WINBASEAPI
DWORD
WINAPI
SearchPathW(
    IN LPCWSTR lpPath,
    IN LPCWSTR lpFileName,
    IN LPCWSTR lpExtension,
    IN DWORD nBufferLength,
    OUT LPWSTR lpBuffer,
    OUT LPWSTR *lpFilePart
    );
#ifdef UNICODE
   SearchPath  SearchPathW
#else
   SearchPath  SearchPathA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CopyFileA(
    IN LPCSTR lpExistingFileName,
    IN LPCSTR lpNewFileName,
    IN BOOL bFailIfExists
    );
WINBASEAPI
BOOL
WINAPI
CopyFileW(
    IN LPCWSTR lpExistingFileName,
    IN LPCWSTR lpNewFileName,
    IN BOOL bFailIfExists
    );
#ifdef UNICODE
   CopyFile  CopyFileW
#else
   CopyFile  CopyFileA
#endif // !UNICODE

#if(_WIN32_WINNT >= = $0400)
type
DWORD
(WINAPI *LPPROGRESS_ROUTINE)(
    LARGE_INTEGER TotalFileSize,
    LARGE_INTEGER TotalBytesTransferred,
    LARGE_INTEGER StreamSize,
    LARGE_INTEGER StreamBytesTransferred,
    DWORD dwStreamNumber,
    DWORD dwCallbackReason,
    HANDLE hSourceFile,
    HANDLE hDestinationFile,
    LPVOID lpData OPTIONAL
    );

WINBASEAPI
BOOL
WINAPI
CopyFileExA(
    IN LPCSTR lpExistingFileName,
    IN LPCSTR lpNewFileName,
    IN LPPROGRESS_ROUTINE lpProgressRoutine OPTIONAL,
    IN LPVOID lpData OPTIONAL,
    IN LPBOOL pbCancel OPTIONAL,
    IN DWORD dwCopyFlags
    );
WINBASEAPI
BOOL
WINAPI
CopyFileExW(
    IN LPCWSTR lpExistingFileName,
    IN LPCWSTR lpNewFileName,
    IN LPPROGRESS_ROUTINE lpProgressRoutine OPTIONAL,
    IN LPVOID lpData OPTIONAL,
    IN LPBOOL pbCancel OPTIONAL,
    IN DWORD dwCopyFlags
    );
#ifdef UNICODE
   CopyFileEx  CopyFileExW
#else
   CopyFileEx  CopyFileExA
#endif // !UNICODE
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
BOOL
WINAPI
MoveFileA(
    IN LPCSTR lpExistingFileName,
    IN LPCSTR lpNewFileName
    );
WINBASEAPI
BOOL
WINAPI
MoveFileW(
    IN LPCWSTR lpExistingFileName,
    IN LPCWSTR lpNewFileName
    );
#ifdef UNICODE
   MoveFile  MoveFileW
#else
   MoveFile  MoveFileA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
MoveFileExA(
    IN LPCSTR lpExistingFileName,
    IN LPCSTR lpNewFileName,
    IN DWORD dwFlags
    );
WINBASEAPI
BOOL
WINAPI
MoveFileExW(
    IN LPCWSTR lpExistingFileName,
    IN LPCWSTR lpNewFileName,
    IN DWORD dwFlags
    );
#ifdef UNICODE
   MoveFileEx  MoveFileExW
#else
   MoveFileEx  MoveFileExA
#endif // !UNICODE

#if (_WIN32_WINNT >= = $0500)
WINBASEAPI
BOOL
WINAPI
MoveFileWithProgressA(
    IN LPCSTR lpExistingFileName,
    IN LPCSTR lpNewFileName,
    IN LPPROGRESS_ROUTINE lpProgressRoutine OPTIONAL,
    IN LPVOID lpData OPTIONAL,
    IN DWORD dwFlags
    );
WINBASEAPI
BOOL
WINAPI
MoveFileWithProgressW(
    IN LPCWSTR lpExistingFileName,
    IN LPCWSTR lpNewFileName,
    IN LPPROGRESS_ROUTINE lpProgressRoutine OPTIONAL,
    IN LPVOID lpData OPTIONAL,
    IN DWORD dwFlags
    );
#ifdef UNICODE
   MoveFileWithProgress  MoveFileWithProgressW
#else
   MoveFileWithProgress  MoveFileWithProgressA
#endif // !UNICODE
#endif // (_WIN32_WINNT >= = $0500)

   MOVEFILE_REPLACE_EXISTING       = $00000001
   MOVEFILE_COPY_ALLOWED           = $00000002
   MOVEFILE_DELAY_UNTIL_REBOOT     = $00000004
   MOVEFILE_WRITE_THROUGH          = $00000008
#if (_WIN32_WINNT >= = $0500)
   MOVEFILE_CREATE_HARDLINK        = $00000010
   MOVEFILE_FAIL_IF_NOT_TRACKABLE  = $00000020
#endif // (_WIN32_WINNT >= = $0500)



#if (_WIN32_WINNT >= = $0500)
WINBASEAPI
BOOL
WINAPI
ReplaceFileA(
    LPCSTR  lpReplacedFileName,
    LPCSTR  lpReplacementFileName,
    LPCSTR  lpBackupFileName,
    DWORD   dwReplaceFlags,
    LPVOID  lpExclude,
    LPVOID  lpReserved
    );
WINBASEAPI
BOOL
WINAPI
ReplaceFileW(
    LPCWSTR lpReplacedFileName,
    LPCWSTR lpReplacementFileName,
    LPCWSTR lpBackupFileName,
    DWORD   dwReplaceFlags,
    LPVOID  lpExclude,
    LPVOID  lpReserved
    );
#ifdef UNICODE
   ReplaceFile  ReplaceFileW
#else
   ReplaceFile  ReplaceFileA
#endif // !UNICODE
#endif // (_WIN32_WINNT >= = $0500)


#if (_WIN32_WINNT >= = $0500)
//
// API call to create hard links.
//

WINBASEAPI
BOOL
WINAPI
CreateHardLinkA(
    IN LPCSTR lpFileName,
    IN LPCSTR lpExistingFileName,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
WINBASEAPI
BOOL
WINAPI
CreateHardLinkW(
    IN LPCWSTR lpFileName,
    IN LPCWSTR lpExistingFileName,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
#ifdef UNICODE
   CreateHardLink  CreateHardLinkW
#else
   CreateHardLink  CreateHardLinkA
#endif // !UNICODE

#endif // (_WIN32_WINNT >= = $0500)


WINBASEAPI
HANDLE
WINAPI
CreateNamedPipeA(
    IN LPCSTR lpName,
    IN DWORD dwOpenMode,
    IN DWORD dwPipeMode,
    IN DWORD nMaxInstances,
    IN DWORD nOutBufferSize,
    IN DWORD nInBufferSize,
    IN DWORD nDefaultTimeOut,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
WINBASEAPI
HANDLE
WINAPI
CreateNamedPipeW(
    IN LPCWSTR lpName,
    IN DWORD dwOpenMode,
    IN DWORD dwPipeMode,
    IN DWORD nMaxInstances,
    IN DWORD nOutBufferSize,
    IN DWORD nInBufferSize,
    IN DWORD nDefaultTimeOut,
    IN LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
#ifdef UNICODE
   CreateNamedPipe  CreateNamedPipeW
#else
   CreateNamedPipe  CreateNamedPipeA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetNamedPipeHandleStateA(
    IN HANDLE hNamedPipe,
    OUT LPDWORD lpState,
    OUT LPDWORD lpCurInstances,
    OUT LPDWORD lpMaxCollectionCount,
    OUT LPDWORD lpCollectDataTimeout,
    OUT LPSTR lpUserName,
    IN DWORD nMaxUserNameSize
    );
WINBASEAPI
BOOL
WINAPI
GetNamedPipeHandleStateW(
    IN HANDLE hNamedPipe,
    OUT LPDWORD lpState,
    OUT LPDWORD lpCurInstances,
    OUT LPDWORD lpMaxCollectionCount,
    OUT LPDWORD lpCollectDataTimeout,
    OUT LPWSTR lpUserName,
    IN DWORD nMaxUserNameSize
    );
#ifdef UNICODE
   GetNamedPipeHandleState  GetNamedPipeHandleStateW
#else
   GetNamedPipeHandleState  GetNamedPipeHandleStateA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CallNamedPipeA(
    IN LPCSTR lpNamedPipeName,
    IN LPVOID lpInBuffer,
    IN DWORD nInBufferSize,
    OUT LPVOID lpOutBuffer,
    IN DWORD nOutBufferSize,
    OUT LPDWORD lpBytesRead,
    IN DWORD nTimeOut
    );
WINBASEAPI
BOOL
WINAPI
CallNamedPipeW(
    IN LPCWSTR lpNamedPipeName,
    IN LPVOID lpInBuffer,
    IN DWORD nInBufferSize,
    OUT LPVOID lpOutBuffer,
    IN DWORD nOutBufferSize,
    OUT LPDWORD lpBytesRead,
    IN DWORD nTimeOut
    );
#ifdef UNICODE
   CallNamedPipe  CallNamedPipeW
#else
   CallNamedPipe  CallNamedPipeA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
WaitNamedPipeA(
    IN LPCSTR lpNamedPipeName,
    IN DWORD nTimeOut
    );
WINBASEAPI
BOOL
WINAPI
WaitNamedPipeW(
    IN LPCWSTR lpNamedPipeName,
    IN DWORD nTimeOut
    );
#ifdef UNICODE
   WaitNamedPipe  WaitNamedPipeW
#else
   WaitNamedPipe  WaitNamedPipeA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetVolumeLabelA(
    IN LPCSTR lpRootPathName,
    IN LPCSTR lpVolumeName
    );
WINBASEAPI
BOOL
WINAPI
SetVolumeLabelW(
    IN LPCWSTR lpRootPathName,
    IN LPCWSTR lpVolumeName
    );
#ifdef UNICODE
   SetVolumeLabel  SetVolumeLabelW
#else
   SetVolumeLabel  SetVolumeLabelA
#endif // !UNICODE

WINBASEAPI
VOID
WINAPI
SetFileApisToOEM( VOID );

WINBASEAPI
VOID
WINAPI
SetFileApisToANSI( VOID );

WINBASEAPI
BOOL
WINAPI
AreFileApisANSI( VOID );

WINBASEAPI
BOOL
WINAPI
GetVolumeInformationA(
    IN LPCSTR lpRootPathName,
    OUT LPSTR lpVolumeNameBuffer,
    IN DWORD nVolumeNameSize,
    OUT LPDWORD lpVolumeSerialNumber,
    OUT LPDWORD lpMaximumComponentLength,
    OUT LPDWORD lpFileSystemFlags,
    OUT LPSTR lpFileSystemNameBuffer,
    IN DWORD nFileSystemNameSize
    );
WINBASEAPI
BOOL
WINAPI
GetVolumeInformationW(
    IN LPCWSTR lpRootPathName,
    OUT LPWSTR lpVolumeNameBuffer,
    IN DWORD nVolumeNameSize,
    OUT LPDWORD lpVolumeSerialNumber,
    OUT LPDWORD lpMaximumComponentLength,
    OUT LPDWORD lpFileSystemFlags,
    OUT LPWSTR lpFileSystemNameBuffer,
    IN DWORD nFileSystemNameSize
    );
#ifdef UNICODE
   GetVolumeInformation  GetVolumeInformationW
#else
   GetVolumeInformation  GetVolumeInformationA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CancelIo(
    IN HANDLE hFile
    );

//
// Event logging APIs
//

WINADVAPI
BOOL
WINAPI
ClearEventLogA (
    IN HANDLE hEventLog,
    IN LPCSTR lpBackupFileName
    );
WINADVAPI
BOOL
WINAPI
ClearEventLogW (
    IN HANDLE hEventLog,
    IN LPCWSTR lpBackupFileName
    );
#ifdef UNICODE
   ClearEventLog  ClearEventLogW
#else
   ClearEventLog  ClearEventLogA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
BackupEventLogA (
    IN HANDLE hEventLog,
    IN LPCSTR lpBackupFileName
    );
WINADVAPI
BOOL
WINAPI
BackupEventLogW (
    IN HANDLE hEventLog,
    IN LPCWSTR lpBackupFileName
    );
#ifdef UNICODE
   BackupEventLog  BackupEventLogW
#else
   BackupEventLog  BackupEventLogA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
CloseEventLog (
    IN OUT HANDLE hEventLog
    );

WINADVAPI
BOOL
WINAPI
DeregisterEventSource (
    IN OUT HANDLE hEventLog
    );

WINADVAPI
BOOL
WINAPI
NotifyChangeEventLog(
    IN HANDLE  hEventLog,
    IN HANDLE  hEvent
    );

WINADVAPI
BOOL
WINAPI
GetNumberOfEventLogRecords (
    IN HANDLE hEventLog,
    OUT PDWORD NumberOfRecords
    );

WINADVAPI
BOOL
WINAPI
GetOldestEventLogRecord (
    IN HANDLE hEventLog,
    OUT PDWORD OldestRecord
    );

WINADVAPI
HANDLE
WINAPI
OpenEventLogA (
    IN LPCSTR lpUNCServerName,
    IN LPCSTR lpSourceName
    );
WINADVAPI
HANDLE
WINAPI
OpenEventLogW (
    IN LPCWSTR lpUNCServerName,
    IN LPCWSTR lpSourceName
    );
#ifdef UNICODE
   OpenEventLog  OpenEventLogW
#else
   OpenEventLog  OpenEventLogA
#endif // !UNICODE

WINADVAPI
HANDLE
WINAPI
RegisterEventSourceA (
    IN LPCSTR lpUNCServerName,
    IN LPCSTR lpSourceName
    );
WINADVAPI
HANDLE
WINAPI
RegisterEventSourceW (
    IN LPCWSTR lpUNCServerName,
    IN LPCWSTR lpSourceName
    );
#ifdef UNICODE
   RegisterEventSource  RegisterEventSourceW
#else
   RegisterEventSource  RegisterEventSourceA
#endif // !UNICODE

WINADVAPI
HANDLE
WINAPI
OpenBackupEventLogA (
    IN LPCSTR lpUNCServerName,
    IN LPCSTR lpFileName
    );
WINADVAPI
HANDLE
WINAPI
OpenBackupEventLogW (
    IN LPCWSTR lpUNCServerName,
    IN LPCWSTR lpFileName
    );
#ifdef UNICODE
   OpenBackupEventLog  OpenBackupEventLogW
#else
   OpenBackupEventLog  OpenBackupEventLogA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
ReadEventLogA (
     IN HANDLE     hEventLog,
     IN DWORD      dwReadFlags,
     IN DWORD      dwRecordOffset,
     OUT LPVOID     lpBuffer,
     IN DWORD      nNumberOfBytesToRead,
     OUT DWORD      *pnBytesRead,
     OUT DWORD      *pnMinNumberOfBytesNeeded
    );
WINADVAPI
BOOL
WINAPI
ReadEventLogW (
     IN HANDLE     hEventLog,
     IN DWORD      dwReadFlags,
     IN DWORD      dwRecordOffset,
     OUT LPVOID     lpBuffer,
     IN DWORD      nNumberOfBytesToRead,
     OUT DWORD      *pnBytesRead,
     OUT DWORD      *pnMinNumberOfBytesNeeded
    );
#ifdef UNICODE
   ReadEventLog  ReadEventLogW
#else
   ReadEventLog  ReadEventLogA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
ReportEventA (
     IN HANDLE     hEventLog,
     IN WORD       wType,
     IN WORD       wCategory,
     IN DWORD      dwEventID,
     IN PSID       lpUserSid,
     IN WORD       wNumStrings,
     IN DWORD      dwDataSize,
     IN LPCSTR   *lpStrings,
     IN LPVOID     lpRawData
    );
WINADVAPI
BOOL
WINAPI
ReportEventW (
     IN HANDLE     hEventLog,
     IN WORD       wType,
     IN WORD       wCategory,
     IN DWORD      dwEventID,
     IN PSID       lpUserSid,
     IN WORD       wNumStrings,
     IN DWORD      dwDataSize,
     IN LPCWSTR   *lpStrings,
     IN LPVOID     lpRawData
    );
#ifdef UNICODE
   ReportEvent  ReportEventW
#else
   ReportEvent  ReportEventA
#endif // !UNICODE


   EVENTLOG_FULL_INFO      0

type struct _EVENTLOG_FULL_INFORMATION
{
    DWORD    dwFull;
}
EVENTLOG_FULL_INFORMATION, *LPEVENTLOG_FULL_INFORMATION;

WINADVAPI
BOOL
WINAPI
GetEventLogInformation (
     IN  HANDLE     hEventLog,
     IN  DWORD      dwInfoLevel,
     OUT LPVOID     lpBuffer,
     IN  DWORD      cbBufSize,
     OUT LPDWORD    pcbBytesNeeded
    );

//
//
// Security APIs
//


WINADVAPI
BOOL
WINAPI
DuplicateToken(
    IN HANDLE ExistingTokenHandle,
    IN SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
    OUT PHANDLE DuplicateTokenHandle
    );

WINADVAPI
BOOL
WINAPI
GetKernelObjectSecurity (
    IN HANDLE Handle,
    IN SECURITY_INFORMATION RequestedInformation,
    OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN DWORD nLength,
    OUT LPDWORD lpnLengthNeeded
    );

WINADVAPI
BOOL
WINAPI
ImpersonateNamedPipeClient(
    IN HANDLE hNamedPipe
    );

WINADVAPI
BOOL
WINAPI
ImpersonateSelf(
    IN SECURITY_IMPERSONATION_LEVEL ImpersonationLevel
    );


WINADVAPI
BOOL
WINAPI
RevertToSelf (
    VOID
    );

WINADVAPI
BOOL
APIENTRY
SetThreadToken (
    IN PHANDLE Thread,
    IN HANDLE Token
    );

WINADVAPI
BOOL
WINAPI
AccessCheck (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    IN PGENERIC_MAPPING GenericMapping,
    OUT PPRIVILEGE_SET PrivilegeSet,
    IN LPDWORD PrivilegeSetLength,
    OUT LPDWORD GrantedAccess,
    OUT LPBOOL AccessStatus
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
AccessCheckByType (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    OUT POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    OUT PGENERIC_MAPPING GenericMapping,
    OUT PPRIVILEGE_SET PrivilegeSet,
    OUT LPDWORD PrivilegeSetLength,
    OUT LPDWORD GrantedAccess,
    OUT LPBOOL AccessStatus
    );

WINADVAPI
BOOL
WINAPI
AccessCheckByTypeResultList (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    OUT POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    OUT PGENERIC_MAPPING GenericMapping,
    OUT PPRIVILEGE_SET PrivilegeSet,
    OUT LPDWORD PrivilegeSetLength,
    OUT LPDWORD GrantedAccessList,
    OUT LPDWORD AccessStatusList
    );
#endif (* _WIN32_WINNT >=  = $0500 *)


WINADVAPI
BOOL
WINAPI
OpenProcessToken (
    IN HANDLE ProcessHandle,
    IN DWORD DesiredAccess,
    OUT PHANDLE TokenHandle
    );


WINADVAPI
BOOL
WINAPI
OpenThreadToken (
    IN HANDLE ThreadHandle,
    IN DWORD DesiredAccess,
    IN BOOL OpenAsSelf,
    OUT PHANDLE TokenHandle
    );


WINADVAPI
BOOL
WINAPI
GetTokenInformation (
    IN HANDLE TokenHandle,
    IN TOKEN_INFORMATION_CLASS TokenInformationClass,
    OUT LPVOID TokenInformation,
    IN DWORD TokenInformationLength,
    OUT PDWORD ReturnLength
    );


WINADVAPI
BOOL
WINAPI
SetTokenInformation (
    IN HANDLE TokenHandle,
    IN TOKEN_INFORMATION_CLASS TokenInformationClass,
    IN LPVOID TokenInformation,
    IN DWORD TokenInformationLength
    );


WINADVAPI
BOOL
WINAPI
AdjustTokenPrivileges (
    IN HANDLE TokenHandle,
    IN BOOL DisableAllPrivileges,
    IN PTOKEN_PRIVILEGES NewState,
    IN DWORD BufferLength,
    OUT PTOKEN_PRIVILEGES PreviousState,
    OUT PDWORD ReturnLength
    );


WINADVAPI
BOOL
WINAPI
AdjustTokenGroups (
    IN HANDLE TokenHandle,
    IN BOOL ResetToDefault,
    IN PTOKEN_GROUPS NewState,
    IN DWORD BufferLength,
    OUT PTOKEN_GROUPS PreviousState,
    OUT PDWORD ReturnLength
    );


WINADVAPI
BOOL
WINAPI
PrivilegeCheck (
    IN HANDLE ClientToken,
    IN PPRIVILEGE_SET RequiredPrivileges,
    OUT LPBOOL pfResult
    );


WINADVAPI
BOOL
WINAPI
AccessCheckAndAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPSTR ObjectTypeName,
    IN LPSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN DWORD DesiredAccess,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPBOOL AccessStatus,
    OUT LPBOOL pfGenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
AccessCheckAndAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPWSTR ObjectTypeName,
    IN LPWSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN DWORD DesiredAccess,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPBOOL AccessStatus,
    OUT LPBOOL pfGenerateOnClose
    );
#ifdef UNICODE
   AccessCheckAndAuditAlarm  AccessCheckAndAuditAlarmW
#else
   AccessCheckAndAuditAlarm  AccessCheckAndAuditAlarmA
#endif // !UNICODE

#if(_WIN32_WINNT >= = $0500)

WINADVAPI
BOOL
WINAPI
AccessCheckByTypeAndAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPCSTR ObjectTypeName,
    IN LPCSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN DWORD DesiredAccess,
    IN AUDIT_EVENT_TYPE AuditType,
    IN DWORD Flags,
    IN POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPBOOL AccessStatus,
    OUT LPBOOL pfGenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
AccessCheckByTypeAndAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPCWSTR ObjectTypeName,
    IN LPCWSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN DWORD DesiredAccess,
    IN AUDIT_EVENT_TYPE AuditType,
    IN DWORD Flags,
    IN POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPBOOL AccessStatus,
    OUT LPBOOL pfGenerateOnClose
    );
#ifdef UNICODE
   AccessCheckByTypeAndAuditAlarm  AccessCheckByTypeAndAuditAlarmW
#else
   AccessCheckByTypeAndAuditAlarm  AccessCheckByTypeAndAuditAlarmA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
AccessCheckByTypeResultListAndAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPCSTR ObjectTypeName,
    IN LPCSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN DWORD DesiredAccess,
    IN AUDIT_EVENT_TYPE AuditType,
    IN DWORD Flags,
    IN POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPDWORD AccessStatusList,
    OUT LPBOOL pfGenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
AccessCheckByTypeResultListAndAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPCWSTR ObjectTypeName,
    IN LPCWSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN DWORD DesiredAccess,
    IN AUDIT_EVENT_TYPE AuditType,
    IN DWORD Flags,
    IN POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPDWORD AccessStatusList,
    OUT LPBOOL pfGenerateOnClose
    );
#ifdef UNICODE
   AccessCheckByTypeResultListAndAuditAlarm  AccessCheckByTypeResultListAndAuditAlarmW
#else
   AccessCheckByTypeResultListAndAuditAlarm  AccessCheckByTypeResultListAndAuditAlarmA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
AccessCheckByTypeResultListAndAuditAlarmByHandleA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN HANDLE ClientToken,
    IN LPCSTR ObjectTypeName,
    IN LPCSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN DWORD DesiredAccess,
    IN AUDIT_EVENT_TYPE AuditType,
    IN DWORD Flags,
    IN POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPDWORD AccessStatusList,
    OUT LPBOOL pfGenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
AccessCheckByTypeResultListAndAuditAlarmByHandleW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN HANDLE ClientToken,
    IN LPCWSTR ObjectTypeName,
    IN LPCWSTR ObjectName,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PSID PrincipalSelfSid,
    IN DWORD DesiredAccess,
    IN AUDIT_EVENT_TYPE AuditType,
    IN DWORD Flags,
    IN POBJECT_TYPE_LIST ObjectTypeList,
    IN DWORD ObjectTypeListLength,
    IN PGENERIC_MAPPING GenericMapping,
    IN BOOL ObjectCreation,
    OUT LPDWORD GrantedAccess,
    OUT LPDWORD AccessStatusList,
    OUT LPBOOL pfGenerateOnClose
    );
#ifdef UNICODE
   AccessCheckByTypeResultListAndAuditAlarmByHandle  AccessCheckByTypeResultListAndAuditAlarmByHandleW
#else
   AccessCheckByTypeResultListAndAuditAlarmByHandle  AccessCheckByTypeResultListAndAuditAlarmByHandleA
#endif // !UNICODE

#endif //(_WIN32_WINNT >= = $0500)


WINADVAPI
BOOL
WINAPI
ObjectOpenAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPSTR ObjectTypeName,
    IN LPSTR ObjectName,
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    IN DWORD GrantedAccess,
    IN PPRIVILEGE_SET Privileges,
    IN BOOL ObjectCreation,
    IN BOOL AccessGranted,
    OUT LPBOOL GenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
ObjectOpenAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN LPWSTR ObjectTypeName,
    IN LPWSTR ObjectName,
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    IN DWORD GrantedAccess,
    IN PPRIVILEGE_SET Privileges,
    IN BOOL ObjectCreation,
    IN BOOL AccessGranted,
    OUT LPBOOL GenerateOnClose
    );
#ifdef UNICODE
   ObjectOpenAuditAlarm  ObjectOpenAuditAlarmW
#else
   ObjectOpenAuditAlarm  ObjectOpenAuditAlarmA
#endif // !UNICODE


WINADVAPI
BOOL
WINAPI
ObjectPrivilegeAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    IN PPRIVILEGE_SET Privileges,
    IN BOOL AccessGranted
    );
WINADVAPI
BOOL
WINAPI
ObjectPrivilegeAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN HANDLE ClientToken,
    IN DWORD DesiredAccess,
    IN PPRIVILEGE_SET Privileges,
    IN BOOL AccessGranted
    );
#ifdef UNICODE
   ObjectPrivilegeAuditAlarm  ObjectPrivilegeAuditAlarmW
#else
   ObjectPrivilegeAuditAlarm  ObjectPrivilegeAuditAlarmA
#endif // !UNICODE


WINADVAPI
BOOL
WINAPI
ObjectCloseAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN BOOL GenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
ObjectCloseAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN BOOL GenerateOnClose
    );
#ifdef UNICODE
   ObjectCloseAuditAlarm  ObjectCloseAuditAlarmW
#else
   ObjectCloseAuditAlarm  ObjectCloseAuditAlarmA
#endif // !UNICODE


WINADVAPI
BOOL
WINAPI
ObjectDeleteAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPVOID HandleId,
    IN BOOL GenerateOnClose
    );
WINADVAPI
BOOL
WINAPI
ObjectDeleteAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPVOID HandleId,
    IN BOOL GenerateOnClose
    );
#ifdef UNICODE
   ObjectDeleteAuditAlarm  ObjectDeleteAuditAlarmW
#else
   ObjectDeleteAuditAlarm  ObjectDeleteAuditAlarmA
#endif // !UNICODE


WINADVAPI
BOOL
WINAPI
PrivilegedServiceAuditAlarmA (
    IN LPCSTR SubsystemName,
    IN LPCSTR ServiceName,
    IN HANDLE ClientToken,
    IN PPRIVILEGE_SET Privileges,
    IN BOOL AccessGranted
    );
WINADVAPI
BOOL
WINAPI
PrivilegedServiceAuditAlarmW (
    IN LPCWSTR SubsystemName,
    IN LPCWSTR ServiceName,
    IN HANDLE ClientToken,
    IN PPRIVILEGE_SET Privileges,
    IN BOOL AccessGranted
    );
#ifdef UNICODE
   PrivilegedServiceAuditAlarm  PrivilegedServiceAuditAlarmW
#else
   PrivilegedServiceAuditAlarm  PrivilegedServiceAuditAlarmA
#endif // !UNICODE



#if(_WIN32_WINNT >= = $0501)

type enum {

    WinNullSid                                  = 0,
    WinWorldSid                                 = 1,
    WinLocalSid                                 = 2,
    WinCreatorOwnerSid                          = 3,
    WinCreatorGroupSid                          = 4,
    WinCreatorOwnerServerSid                    = 5,
    WinCreatorGroupServerSid                    = 6,
    WinNtAuthoritySid                           = 7,
    WinDialupSid                                = 8,
    WinNetworkSid                               = 9,
    WinBatchSid                                 = 10,
    WinInteractiveSid                           = 11,
    WinServiceSid                               = 12,
    WinAnonymousSid                             = 13,
    WinProxySid                                 = 14,
    WinEnterpriseControllersSid                 = 15,
    WinSelfSid                                  = 16,
    WinAuthenticatedUserSid                     = 17,
    WinRestrictedCodeSid                        = 18,
    WinTerminalServerSid                        = 19,
    WinRemoteLogonIdSid                         = 20,
    WinLogonIdsSid                              = 21,
    WinLocalSystemSid                           = 22,
    WinLocalServiceSid                          = 23,
    WinNetworkServiceSid                        = 24,
    WinBuiltinDomainSid                         = 25,
    WinBuiltinAdministratorsSid                 = 26,
    WinBuiltinUsersSid                          = 27,
    WinBuiltinGuestsSid                         = 28,
    WinBuiltinPowerUsersSid                     = 29,
    WinBuiltinAccountOperatorsSid               = 30,
    WinBuiltinSystemOperatorsSid                = 31,
    WinBuiltinPrintOperatorsSid                 = 32,
    WinBuiltinBackupOperatorsSid                = 33,
    WinBuiltinReplicatorSid                     = 34,
    WinBuiltinPreWindows2000CompatibleAccessSid = 35,
    WinBuiltinRemoteDesktopUsersSid             = 36,
    WinBuiltinNetworkConfigurationOperatorsSid  = 37,
    WinAccountAdministratorSid                  = 38,
    WinAccountGuestSid                          = 39,
    WinAccountKrbtgtSid                         = 40,
    WinAccountDomainAdminsSid                   = 41,
    WinAccountDomainUsersSid                    = 42,
    WinAccountDomainGuestsSid                   = 43,
    WinAccountComputersSid                      = 44,
    WinAccountControllersSid                    = 45,
    WinAccountCertAdminsSid                     = 46,
    WinAccountSchemaAdminsSid                   = 47,
    WinAccountEnterpriseAdminsSid               = 48,
    WinAccountPolicyAdminsSid                   = 49,
    WinAccountRasAndIasServersSid               = 50,

} WELL_KNOWN_SID_TYPE;

WINADVAPI
BOOL
WINAPI
IsWellKnownSid (
    IN  PSID pSid,
    IN  WELL_KNOWN_SID_TYPE WellKnownSidType
    );

WINADVAPI
BOOL
WINAPI
CreateWellKnownSid(
    IN WELL_KNOWN_SID_TYPE WellKnownSidType,
    IN PSID DomainSid  OPTIONAL,
    OUT PSID pSid,
    IN OUT DWORD *cbSid
    );

WINADVAPI
BOOL
WINAPI
EqualDomainSid(
    IN PSID pSid1,
    IN PSID pSid2,
    OUT BOOL *pfEqual
    );

WINADVAPI
BOOL
WINAPI
GetWindowsAccountDomainSid(
    IN PSID pSid,
    OUT PSID ppDomainSid OPTIONAL,
    IN OUT DWORD *cbSid
    );

#endif //(_WIN32_WINNT >= = $0501)

WINADVAPI
BOOL
WINAPI
IsValidSid (
    IN PSID pSid
    );


WINADVAPI
BOOL
WINAPI
EqualSid (
    IN PSID pSid1,
    IN PSID pSid2
    );


WINADVAPI
BOOL
WINAPI
EqualPrefixSid (
    PSID pSid1,
    PSID pSid2
    );


WINADVAPI
DWORD
WINAPI
GetSidLengthRequired (
    IN UCHAR nSubAuthorityCount
    );


WINADVAPI
BOOL
WINAPI
AllocateAndInitializeSid (
    IN PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority,
    IN BYTE nSubAuthorityCount,
    IN DWORD nSubAuthority0,
    IN DWORD nSubAuthority1,
    IN DWORD nSubAuthority2,
    IN DWORD nSubAuthority3,
    IN DWORD nSubAuthority4,
    IN DWORD nSubAuthority5,
    IN DWORD nSubAuthority6,
    IN DWORD nSubAuthority7,
    OUT PSID *pSid
    );

WINADVAPI
PVOID
WINAPI
FreeSid(
    IN PSID pSid
    );

WINADVAPI
BOOL
WINAPI
InitializeSid (
    OUT PSID Sid,
    IN PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority,
    IN BYTE nSubAuthorityCount
    );


WINADVAPI
PSID_IDENTIFIER_AUTHORITY
WINAPI
GetSidIdentifierAuthority (
    IN PSID pSid
    );


WINADVAPI
PDWORD
WINAPI
GetSidSubAuthority (
    IN PSID pSid,
    IN DWORD nSubAuthority
    );


WINADVAPI
PUCHAR
WINAPI
GetSidSubAuthorityCount (
    IN PSID pSid
    );


WINADVAPI
DWORD
WINAPI
GetLengthSid (
    IN PSID pSid
    );


WINADVAPI
BOOL
WINAPI
CopySid (
    IN DWORD nDestinationSidLength,
    OUT PSID pDestinationSid,
    IN PSID pSourceSid
    );


WINADVAPI
BOOL
WINAPI
AreAllAccessesGranted (
    IN DWORD GrantedAccess,
    IN DWORD DesiredAccess
    );


WINADVAPI
BOOL
WINAPI
AreAnyAccessesGranted (
    IN DWORD GrantedAccess,
    IN DWORD DesiredAccess
    );


WINADVAPI
VOID
WINAPI
MapGenericMask (
    OUT PDWORD AccessMask,
    IN PGENERIC_MAPPING GenericMapping
    );


WINADVAPI
BOOL
WINAPI
IsValidAcl (
    IN PACL pAcl
    );


WINADVAPI
BOOL
WINAPI
InitializeAcl (
    OUT PACL pAcl,
    IN DWORD nAclLength,
    IN DWORD dwAclRevision
    );


WINADVAPI
BOOL
WINAPI
GetAclInformation (
    IN PACL pAcl,
    OUT LPVOID pAclInformation,
    IN DWORD nAclInformationLength,
    IN ACL_INFORMATION_CLASS dwAclInformationClass
    );


WINADVAPI
BOOL
WINAPI
SetAclInformation (
    IN PACL pAcl,
    IN LPVOID pAclInformation,
    IN DWORD nAclInformationLength,
    IN ACL_INFORMATION_CLASS dwAclInformationClass
    );


WINADVAPI
BOOL
WINAPI
AddAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD dwStartingAceIndex,
    IN LPVOID pAceList,
    IN DWORD nAceListLength
    );


WINADVAPI
BOOL
WINAPI
DeleteAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceIndex
    );


WINADVAPI
BOOL
WINAPI
GetAce (
    IN PACL pAcl,
    IN DWORD dwAceIndex,
    OUT LPVOID *pAce
    );


WINADVAPI
BOOL
WINAPI
AddAccessAllowedAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AccessMask,
    IN PSID pSid
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
AddAccessAllowedAceEx (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AceFlags,
    IN DWORD AccessMask,
    IN PSID pSid
    );
#endif (* _WIN32_WINNT >=  = $0500 *)


WINADVAPI
BOOL
WINAPI
AddAccessDeniedAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AccessMask,
    IN PSID pSid
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
AddAccessDeniedAceEx (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AceFlags,
    IN DWORD AccessMask,
    IN PSID pSid
    );
#endif (* _WIN32_WINNT >=  = $0500 *)

WINADVAPI
BOOL
WINAPI
AddAuditAccessAce(
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD dwAccessMask,
    IN PSID pSid,
    IN BOOL bAuditSuccess,
    IN BOOL bAuditFailure
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
AddAuditAccessAceEx(
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AceFlags,
    IN DWORD dwAccessMask,
    IN PSID pSid,
    IN BOOL bAuditSuccess,
    IN BOOL bAuditFailure
    );

WINADVAPI
BOOL
WINAPI
AddAccessAllowedObjectAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AceFlags,
    IN DWORD AccessMask,
    IN GUID *ObjectTypeGuid,
    IN GUID *InheritedObjectTypeGuid,
    IN PSID pSid
    );

WINADVAPI
BOOL
WINAPI
AddAccessDeniedObjectAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AceFlags,
    IN DWORD AccessMask,
    IN GUID *ObjectTypeGuid,
    IN GUID *InheritedObjectTypeGuid,
    IN PSID pSid
    );

WINADVAPI
BOOL
WINAPI
AddAuditAccessObjectAce (
    IN OUT PACL pAcl,
    IN DWORD dwAceRevision,
    IN DWORD AceFlags,
    IN DWORD AccessMask,
    IN GUID *ObjectTypeGuid,
    IN GUID *InheritedObjectTypeGuid,
    IN PSID pSid,
    IN BOOL bAuditSuccess,
    IN BOOL bAuditFailure
    );
#endif (* _WIN32_WINNT >=  = $0500 *)

WINADVAPI
BOOL
WINAPI
FindFirstFreeAce (
    IN PACL pAcl,
    OUT LPVOID *pAce
    );


WINADVAPI
BOOL
WINAPI
InitializeSecurityDescriptor (
    OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN DWORD dwRevision
    );


WINADVAPI
BOOL
WINAPI
IsValidSecurityDescriptor (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor
    );


WINADVAPI
DWORD
WINAPI
GetSecurityDescriptorLength (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor
    );


WINADVAPI
BOOL
WINAPI
GetSecurityDescriptorControl (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    OUT PSECURITY_DESCRIPTOR_CONTROL pControl,
    OUT LPDWORD lpdwRevision
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
SetSecurityDescriptorControl (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest,
    IN SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet
    );
#endif (* _WIN32_WINNT >=  = $0500 *)

WINADVAPI
BOOL
WINAPI
SetSecurityDescriptorDacl (
    IN OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN BOOL bDaclPresent,
    IN PACL pDacl,
    IN BOOL bDaclDefaulted
    );


WINADVAPI
BOOL
WINAPI
GetSecurityDescriptorDacl (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    OUT LPBOOL lpbDaclPresent,
    OUT PACL *pDacl,
    OUT LPBOOL lpbDaclDefaulted
    );


WINADVAPI
BOOL
WINAPI
SetSecurityDescriptorSacl (
    IN OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN BOOL bSaclPresent,
    IN PACL pSacl,
    IN BOOL bSaclDefaulted
    );


WINADVAPI
BOOL
WINAPI
GetSecurityDescriptorSacl (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    OUT LPBOOL lpbSaclPresent,
    OUT PACL *pSacl,
    OUT LPBOOL lpbSaclDefaulted
    );


WINADVAPI
BOOL
WINAPI
SetSecurityDescriptorOwner (
    IN OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN PSID pOwner,
    IN BOOL bOwnerDefaulted
    );


WINADVAPI
BOOL
WINAPI
GetSecurityDescriptorOwner (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    OUT PSID *pOwner,
    OUT LPBOOL lpbOwnerDefaulted
    );


WINADVAPI
BOOL
WINAPI
SetSecurityDescriptorGroup (
    IN OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN PSID pGroup,
    IN BOOL bGroupDefaulted
    );


WINADVAPI
BOOL
WINAPI
GetSecurityDescriptorGroup (
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
    OUT PSID *pGroup,
    OUT LPBOOL lpbGroupDefaulted
    );


WINADVAPI
DWORD
WINAPI
SetSecurityDescriptorRMControl(
    IN OUT PSECURITY_DESCRIPTOR SecurityDescriptor,
    IN PUCHAR RMControl OPTIONAL
    );

WINADVAPI
DWORD
WINAPI
GetSecurityDescriptorRMControl(
    IN PSECURITY_DESCRIPTOR SecurityDescriptor,
    OUT PUCHAR RMControl
    );

WINADVAPI
BOOL
WINAPI
CreatePrivateObjectSecurity (
    IN PSECURITY_DESCRIPTOR ParentDescriptor,
    IN PSECURITY_DESCRIPTOR CreatorDescriptor,
    OUT PSECURITY_DESCRIPTOR * NewDescriptor,
    IN BOOL IsDirectoryObject,
    IN HANDLE Token,
    IN PGENERIC_MAPPING GenericMapping
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
ConvertToAutoInheritPrivateObjectSecurity(
    IN PSECURITY_DESCRIPTOR ParentDescriptor,
    IN PSECURITY_DESCRIPTOR CurrentSecurityDescriptor,
    OUT PSECURITY_DESCRIPTOR *NewSecurityDescriptor,
    IN GUID *ObjectType,
    IN BOOLEAN IsDirectoryObject,
    IN PGENERIC_MAPPING GenericMapping
    );

WINADVAPI
BOOL
WINAPI
CreatePrivateObjectSecurityEx (
    IN PSECURITY_DESCRIPTOR ParentDescriptor,
    IN PSECURITY_DESCRIPTOR CreatorDescriptor,
    OUT PSECURITY_DESCRIPTOR * NewDescriptor,
    IN GUID *ObjectType OPTIONAL,
    IN BOOL IsContainerObject,
    IN ULONG AutoInheritFlags,
    IN HANDLE Token,
    IN PGENERIC_MAPPING GenericMapping
    );

WINADVAPI
BOOL
WINAPI
CreatePrivateObjectSecurityWithMultipleInheritance (
    IN PSECURITY_DESCRIPTOR ParentDescriptor,
    IN PSECURITY_DESCRIPTOR CreatorDescriptor,
    OUT PSECURITY_DESCRIPTOR * NewDescriptor,
    IN GUID **ObjectTypes OPTIONAL,
    IN ULONG GuidCount,
    IN BOOL IsContainerObject,
    IN ULONG AutoInheritFlags,
    IN HANDLE Token,
    IN PGENERIC_MAPPING GenericMapping
    );
#endif (* _WIN32_WINNT >=  = $0500 *)

WINADVAPI
BOOL
WINAPI
SetPrivateObjectSecurity (
    IN SECURITY_INFORMATION SecurityInformation,
    IN PSECURITY_DESCRIPTOR ModificationDescriptor,
    OUT PSECURITY_DESCRIPTOR *ObjectsSecurityDescriptor,
    IN PGENERIC_MAPPING GenericMapping,
    IN HANDLE Token
    );

#if(_WIN32_WINNT >= = $0500)
WINADVAPI
BOOL
WINAPI
SetPrivateObjectSecurityEx (
    IN SECURITY_INFORMATION SecurityInformation,
    IN PSECURITY_DESCRIPTOR ModificationDescriptor,
    OUT PSECURITY_DESCRIPTOR *ObjectsSecurityDescriptor,
    IN ULONG AutoInheritFlags,
    IN PGENERIC_MAPPING GenericMapping,
    IN HANDLE Token OPTIONAL
    );
#endif (* _WIN32_WINNT >=  = $0500 *)

WINADVAPI
BOOL
WINAPI
GetPrivateObjectSecurity (
    IN PSECURITY_DESCRIPTOR ObjectDescriptor,
    IN SECURITY_INFORMATION SecurityInformation,
    OUT PSECURITY_DESCRIPTOR ResultantDescriptor,
    IN DWORD DescriptorLength,
    OUT PDWORD ReturnLength
    );


WINADVAPI
BOOL
WINAPI
DestroyPrivateObjectSecurity (
    IN OUT PSECURITY_DESCRIPTOR * ObjectDescriptor
    );


WINADVAPI
BOOL
WINAPI
MakeSelfRelativeSD (
    IN PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor,
    OUT PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor,
    OUT LPDWORD lpdwBufferLength
    );


WINADVAPI
BOOL
WINAPI
MakeAbsoluteSD (
    IN PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor,
    OUT PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor,
    OUT LPDWORD lpdwAbsoluteSecurityDescriptorSize,
    OUT PACL pDacl,
    OUT LPDWORD lpdwDaclSize,
    OUT PACL pSacl,
    OUT LPDWORD lpdwSaclSize,
    OUT PSID pOwner,
    OUT LPDWORD lpdwOwnerSize,
    OUT PSID pPrimaryGroup,
    OUT LPDWORD lpdwPrimaryGroupSize
    );


WINADVAPI
BOOL
WINAPI
MakeAbsoluteSD2 (
    IN PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor,
    OUT LPDWORD lpdwBufferSize
    );

WINADVAPI
BOOL
WINAPI
SetFileSecurityA (
    IN LPCSTR lpFileName,
    IN SECURITY_INFORMATION SecurityInformation,
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor
    );
WINADVAPI
BOOL
WINAPI
SetFileSecurityW (
    IN LPCWSTR lpFileName,
    IN SECURITY_INFORMATION SecurityInformation,
    IN PSECURITY_DESCRIPTOR pSecurityDescriptor
    );
#ifdef UNICODE
   SetFileSecurity  SetFileSecurityW
#else
   SetFileSecurity  SetFileSecurityA
#endif // !UNICODE


WINADVAPI
BOOL
WINAPI
GetFileSecurityA (
    IN LPCSTR lpFileName,
    IN SECURITY_INFORMATION RequestedInformation,
    OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN DWORD nLength,
    OUT LPDWORD lpnLengthNeeded
    );
WINADVAPI
BOOL
WINAPI
GetFileSecurityW (
    IN LPCWSTR lpFileName,
    IN SECURITY_INFORMATION RequestedInformation,
    OUT PSECURITY_DESCRIPTOR pSecurityDescriptor,
    IN DWORD nLength,
    OUT LPDWORD lpnLengthNeeded
    );
#ifdef UNICODE
   GetFileSecurity  GetFileSecurityW
#else
   GetFileSecurity  GetFileSecurityA
#endif // !UNICODE


WINADVAPI
BOOL
WINAPI
SetKernelObjectSecurity (
    IN HANDLE Handle,
    IN SECURITY_INFORMATION SecurityInformation,
    IN PSECURITY_DESCRIPTOR SecurityDescriptor
    );

WINBASEAPI
HANDLE
WINAPI
FindFirstChangeNotificationA(
    IN LPCSTR lpPathName,
    IN BOOL bWatchSubtree,
    IN DWORD dwNotifyFilter
    );
WINBASEAPI
HANDLE
WINAPI
FindFirstChangeNotificationW(
    IN LPCWSTR lpPathName,
    IN BOOL bWatchSubtree,
    IN DWORD dwNotifyFilter
    );
#ifdef UNICODE
   FindFirstChangeNotification  FindFirstChangeNotificationW
#else
   FindFirstChangeNotification  FindFirstChangeNotificationA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindNextChangeNotification(
    IN HANDLE hChangeHandle
    );

WINBASEAPI
BOOL
WINAPI
FindCloseChangeNotification(
    IN HANDLE hChangeHandle
    );

#if(_WIN32_WINNT >= = $0400)
WINBASEAPI
BOOL
WINAPI
ReadDirectoryChangesW(
    IN HANDLE hDirectory,
    IN OUT LPVOID lpBuffer,
    IN DWORD nBufferLength,
    IN BOOL bWatchSubtree,
    IN DWORD dwNotifyFilter,
    OUT LPDWORD lpBytesReturned,
    IN LPOVERLAPPED lpOverlapped,
    IN LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    );
#endif (* _WIN32_WINNT >= = $0400 *)

WINBASEAPI
BOOL
WINAPI
VirtualLock(
    IN LPVOID lpAddress,
    IN SIZE_T dwSize
    );

WINBASEAPI
BOOL
WINAPI
VirtualUnlock(
    IN LPVOID lpAddress,
    IN SIZE_T dwSize
    );

WINBASEAPI
LPVOID
WINAPI
MapViewOfFileEx(
    IN HANDLE hFileMappingObject,
    IN DWORD dwDesiredAccess,
    IN DWORD dwFileOffsetHigh,
    IN DWORD dwFileOffsetLow,
    IN SIZE_T dwNumberOfBytesToMap,
    IN LPVOID lpBaseAddress
    );

WINBASEAPI
BOOL
WINAPI
SetPriorityClass(
    IN HANDLE hProcess,
    IN DWORD dwPriorityClass
    );

WINBASEAPI
DWORD
WINAPI
GetPriorityClass(
    IN HANDLE hProcess
    );

WINBASEAPI
BOOL
WINAPI
IsBadReadPtr(
    IN CONST VOID *lp,
    IN UINT_PTR ucb
    );

WINBASEAPI
BOOL
WINAPI
IsBadWritePtr(
    IN LPVOID lp,
    IN UINT_PTR ucb
    );

WINBASEAPI
BOOL
WINAPI
IsBadHugeReadPtr(
    IN CONST VOID *lp,
    IN UINT_PTR ucb
    );

WINBASEAPI
BOOL
WINAPI
IsBadHugeWritePtr(
    IN LPVOID lp,
    IN UINT_PTR ucb
    );

WINBASEAPI
BOOL
WINAPI
IsBadCodePtr(
    IN FARPROC lpfn
    );

WINBASEAPI
BOOL
WINAPI
IsBadStringPtrA(
    IN LPCSTR lpsz,
    IN UINT_PTR ucchMax
    );
WINBASEAPI
BOOL
WINAPI
IsBadStringPtrW(
    IN LPCWSTR lpsz,
    IN UINT_PTR ucchMax
    );
#ifdef UNICODE
   IsBadStringPtr  IsBadStringPtrW
#else
   IsBadStringPtr  IsBadStringPtrA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
LookupAccountSidA(
    IN LPCSTR lpSystemName,
    IN PSID Sid,
    OUT LPSTR Name,
    IN OUT LPDWORD cbName,
    OUT LPSTR ReferencedDomainName,
    IN OUT LPDWORD cbReferencedDomainName,
    OUT PSID_NAME_USE peUse
    );
WINADVAPI
BOOL
WINAPI
LookupAccountSidW(
    IN LPCWSTR lpSystemName,
    IN PSID Sid,
    OUT LPWSTR Name,
    IN OUT LPDWORD cbName,
    OUT LPWSTR ReferencedDomainName,
    IN OUT LPDWORD cbReferencedDomainName,
    OUT PSID_NAME_USE peUse
    );
#ifdef UNICODE
   LookupAccountSid  LookupAccountSidW
#else
   LookupAccountSid  LookupAccountSidA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
LookupAccountNameA(
    IN LPCSTR lpSystemName,
    IN LPCSTR lpAccountName,
    OUT PSID Sid,
    IN OUT LPDWORD cbSid,
    OUT LPSTR ReferencedDomainName,
    IN OUT LPDWORD cbReferencedDomainName,
    OUT PSID_NAME_USE peUse
    );
WINADVAPI
BOOL
WINAPI
LookupAccountNameW(
    IN LPCWSTR lpSystemName,
    IN LPCWSTR lpAccountName,
    OUT PSID Sid,
    IN OUT LPDWORD cbSid,
    OUT LPWSTR ReferencedDomainName,
    IN OUT LPDWORD cbReferencedDomainName,
    OUT PSID_NAME_USE peUse
    );
#ifdef UNICODE
   LookupAccountName  LookupAccountNameW
#else
   LookupAccountName  LookupAccountNameA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
LookupPrivilegeValueA(
    IN LPCSTR lpSystemName,
    IN LPCSTR lpName,
    OUT PLUID   lpLuid
    );
WINADVAPI
BOOL
WINAPI
LookupPrivilegeValueW(
    IN LPCWSTR lpSystemName,
    IN LPCWSTR lpName,
    OUT PLUID   lpLuid
    );
#ifdef UNICODE
   LookupPrivilegeValue  LookupPrivilegeValueW
#else
   LookupPrivilegeValue  LookupPrivilegeValueA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
LookupPrivilegeNameA(
    IN LPCSTR lpSystemName,
    IN PLUID   lpLuid,
    OUT LPSTR lpName,
    IN OUT LPDWORD cbName
    );
WINADVAPI
BOOL
WINAPI
LookupPrivilegeNameW(
    IN LPCWSTR lpSystemName,
    IN PLUID   lpLuid,
    OUT LPWSTR lpName,
    IN OUT LPDWORD cbName
    );
#ifdef UNICODE
   LookupPrivilegeName  LookupPrivilegeNameW
#else
   LookupPrivilegeName  LookupPrivilegeNameA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
LookupPrivilegeDisplayNameA(
    IN LPCSTR lpSystemName,
    IN LPCSTR lpName,
    OUT LPSTR lpDisplayName,
    IN OUT LPDWORD cbDisplayName,
    OUT LPDWORD lpLanguageId
    );
WINADVAPI
BOOL
WINAPI
LookupPrivilegeDisplayNameW(
    IN LPCWSTR lpSystemName,
    IN LPCWSTR lpName,
    OUT LPWSTR lpDisplayName,
    IN OUT LPDWORD cbDisplayName,
    OUT LPDWORD lpLanguageId
    );
#ifdef UNICODE
   LookupPrivilegeDisplayName  LookupPrivilegeDisplayNameW
#else
   LookupPrivilegeDisplayName  LookupPrivilegeDisplayNameA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
AllocateLocallyUniqueId(
    OUT PLUID Luid
    );

WINBASEAPI
BOOL
WINAPI
BuildCommDCBA(
    IN LPCSTR lpDef,
    OUT LPDCB lpDCB
    );
WINBASEAPI
BOOL
WINAPI
BuildCommDCBW(
    IN LPCWSTR lpDef,
    OUT LPDCB lpDCB
    );
#ifdef UNICODE
   BuildCommDCB  BuildCommDCBW
#else
   BuildCommDCB  BuildCommDCBA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
BuildCommDCBAndTimeoutsA(
    IN LPCSTR lpDef,
    OUT LPDCB lpDCB,
    IN LPCOMMTIMEOUTS lpCommTimeouts
    );
WINBASEAPI
BOOL
WINAPI
BuildCommDCBAndTimeoutsW(
    IN LPCWSTR lpDef,
    OUT LPDCB lpDCB,
    IN LPCOMMTIMEOUTS lpCommTimeouts
    );
#ifdef UNICODE
   BuildCommDCBAndTimeouts  BuildCommDCBAndTimeoutsW
#else
   BuildCommDCBAndTimeouts  BuildCommDCBAndTimeoutsA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
CommConfigDialogA(
    IN LPCSTR lpszName,
    IN HWND hWnd,
    IN OUT LPCOMMCONFIG lpCC
    );
WINBASEAPI
BOOL
WINAPI
CommConfigDialogW(
    IN LPCWSTR lpszName,
    IN HWND hWnd,
    IN OUT LPCOMMCONFIG lpCC
    );
#ifdef UNICODE
   CommConfigDialog  CommConfigDialogW
#else
   CommConfigDialog  CommConfigDialogA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetDefaultCommConfigA(
    IN LPCSTR lpszName,
    OUT LPCOMMCONFIG lpCC,
    IN OUT LPDWORD lpdwSize
    );
WINBASEAPI
BOOL
WINAPI
GetDefaultCommConfigW(
    IN LPCWSTR lpszName,
    OUT LPCOMMCONFIG lpCC,
    IN OUT LPDWORD lpdwSize
    );
#ifdef UNICODE
   GetDefaultCommConfig  GetDefaultCommConfigW
#else
   GetDefaultCommConfig  GetDefaultCommConfigA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetDefaultCommConfigA(
    IN LPCSTR lpszName,
    IN LPCOMMCONFIG lpCC,
    IN DWORD dwSize
    );
WINBASEAPI
BOOL
WINAPI
SetDefaultCommConfigW(
    IN LPCWSTR lpszName,
    IN LPCOMMCONFIG lpCC,
    IN DWORD dwSize
    );
#ifdef UNICODE
   SetDefaultCommConfig  SetDefaultCommConfigW
#else
   SetDefaultCommConfig  SetDefaultCommConfigA
#endif // !UNICODE

#ifndef _MAC
   MAX_COMPUTERNAME_LENGTH 15
#else
   MAX_COMPUTERNAME_LENGTH 31
#endif

WINBASEAPI
BOOL
WINAPI
GetComputerNameA (
    OUT LPSTR lpBuffer,
    IN OUT LPDWORD nSize
    );
WINBASEAPI
BOOL
WINAPI
GetComputerNameW (
    OUT LPWSTR lpBuffer,
    IN OUT LPDWORD nSize
    );
#ifdef UNICODE
   GetComputerName  GetComputerNameW
#else
   GetComputerName  GetComputerNameA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetComputerNameA (
    IN LPCSTR lpComputerName
    );
WINBASEAPI
BOOL
WINAPI
SetComputerNameW (
    IN LPCWSTR lpComputerName
    );
#ifdef UNICODE
   SetComputerName  SetComputerNameW
#else
   SetComputerName  SetComputerNameA
#endif // !UNICODE


#if (_WIN32_WINNT >= = $0500)

type enum _COMPUTER_NAME_FORMAT {
    ComputerNameNetBIOS,
    ComputerNameDnsHostname,
    ComputerNameDnsDomain,
    ComputerNameDnsFullyQualified,
    ComputerNamePhysicalNetBIOS,
    ComputerNamePhysicalDnsHostname,
    ComputerNamePhysicalDnsDomain,
    ComputerNamePhysicalDnsFullyQualified,
    ComputerNameMax
} COMPUTER_NAME_FORMAT ;

WINBASEAPI
BOOL
WINAPI
GetComputerNameExA (
    IN COMPUTER_NAME_FORMAT NameType,
    OUT LPSTR lpBuffer,
    IN OUT LPDWORD nSize
    );
WINBASEAPI
BOOL
WINAPI
GetComputerNameExW (
    IN COMPUTER_NAME_FORMAT NameType,
    OUT LPWSTR lpBuffer,
    IN OUT LPDWORD nSize
    );
#ifdef UNICODE
   GetComputerNameEx  GetComputerNameExW
#else
   GetComputerNameEx  GetComputerNameExA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
SetComputerNameExA (
    IN COMPUTER_NAME_FORMAT NameType,
    IN LPCSTR lpBuffer
    );
WINBASEAPI
BOOL
WINAPI
SetComputerNameExW (
    IN COMPUTER_NAME_FORMAT NameType,
    IN LPCWSTR lpBuffer
    );
#ifdef UNICODE
   SetComputerNameEx  SetComputerNameExW
#else
   SetComputerNameEx  SetComputerNameExA
#endif // !UNICODE
    
WINBASEAPI
DWORD
WINAPI
AddLocalAlternateComputerNameA (
    IN LPCSTR lpDnsFQHostname,
    IN ULONG    ulFlags
    );
WINBASEAPI
DWORD
WINAPI
AddLocalAlternateComputerNameW (
    IN LPCWSTR lpDnsFQHostname,
    IN ULONG    ulFlags
    );
#ifdef UNICODE
   AddLocalAlternateComputerName  AddLocalAlternateComputerNameW
#else
   AddLocalAlternateComputerName  AddLocalAlternateComputerNameA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
RemoveLocalAlternateComputerNameA (
    IN LPCSTR lpAltDnsFQHostname,
    IN ULONG    ulFlags
    );
WINBASEAPI
DWORD
WINAPI
RemoveLocalAlternateComputerNameW (
    IN LPCWSTR lpAltDnsFQHostname,
    IN ULONG    ulFlags
    );
#ifdef UNICODE
   RemoveLocalAlternateComputerName  RemoveLocalAlternateComputerNameW
#else
   RemoveLocalAlternateComputerName  RemoveLocalAlternateComputerNameA
#endif // !UNICODE

WINBASEAPI
DWORD
WINAPI
SetLocalPrimaryComputerNameA (
    IN LPCSTR  lpAltDnsFQHostname,
    IN ULONG     ulFlags
    );
WINBASEAPI
DWORD
WINAPI
SetLocalPrimaryComputerNameW (
    IN LPCWSTR  lpAltDnsFQHostname,
    IN ULONG     ulFlags
    );
#ifdef UNICODE
   SetLocalPrimaryComputerName  SetLocalPrimaryComputerNameW
#else
   SetLocalPrimaryComputerName  SetLocalPrimaryComputerNameA
#endif // !UNICODE

type enum _COMPUTER_NAME_TYPE {
    PrimaryComputerName,
    AlternateComputerNames,
    AllComputerNames,
    ComputerNameTypeMax
} COMPUTER_NAME_TYPE ;

WINBASEAPI
DWORD
WINAPI
EnumerateLocalComputerNamesA (
    IN COMPUTER_NAME_TYPE        NameType,
    IN ULONG                     ulFlags,
    IN OUT LPSTR               lpDnsFQHostname,
    IN OUT LPDWORD               nSize
    );
WINBASEAPI
DWORD
WINAPI
EnumerateLocalComputerNamesW (
    IN COMPUTER_NAME_TYPE        NameType,
    IN ULONG                     ulFlags,
    IN OUT LPWSTR               lpDnsFQHostname,
    IN OUT LPDWORD               nSize
    );
#ifdef UNICODE
   EnumerateLocalComputerNames  EnumerateLocalComputerNamesW
#else
   EnumerateLocalComputerNames  EnumerateLocalComputerNamesA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
DnsHostnameToComputerNameA (
    IN LPCSTR Hostname,
    OUT LPSTR ComputerName,
    IN OUT LPDWORD nSize
    );
WINBASEAPI
BOOL
WINAPI
DnsHostnameToComputerNameW (
    IN LPCWSTR Hostname,
    OUT LPWSTR ComputerName,
    IN OUT LPDWORD nSize
    );
#ifdef UNICODE
   DnsHostnameToComputerName  DnsHostnameToComputerNameW
#else
   DnsHostnameToComputerName  DnsHostnameToComputerNameA
#endif // !UNICODE

#endif // _WIN32_WINNT

WINADVAPI
BOOL
WINAPI
GetUserNameA (
    OUT LPSTR lpBuffer,
    IN OUT LPDWORD nSize
    );
WINADVAPI
BOOL
WINAPI
GetUserNameW (
    OUT LPWSTR lpBuffer,
    IN OUT LPDWORD nSize
    );
#ifdef UNICODE
   GetUserName  GetUserNameW
#else
   GetUserName  GetUserNameA
#endif // !UNICODE

//
// Logon Support APIs
//

   LOGON32_LOGON_INTERACTIVE       2
   LOGON32_LOGON_NETWORK           3
   LOGON32_LOGON_BATCH             4
   LOGON32_LOGON_SERVICE           5
   LOGON32_LOGON_UNLOCK            7
#if(_WIN32_WINNT >= = $0500)
   LOGON32_LOGON_NETWORK_CLEARTEXT 8
   LOGON32_LOGON_NEW_CREDENTIALS   9
#endif // (_WIN32_WINNT >= = $0500)

   LOGON32_PROVIDER_DEFAULT    0
   LOGON32_PROVIDER_WINNT35    1
#if(_WIN32_WINNT >= = $0400)
   LOGON32_PROVIDER_WINNT40    2
#endif (* _WIN32_WINNT >= = $0400 *)
#if(_WIN32_WINNT >= = $0500)
   LOGON32_PROVIDER_WINNT50    3
#endif // (_WIN32_WINNT >= = $0500)



WINADVAPI
BOOL
WINAPI
LogonUserA (
    IN LPSTR lpszUsername,
    IN LPSTR lpszDomain,
    IN LPSTR lpszPassword,
    IN DWORD dwLogonType,
    IN DWORD dwLogonProvider,
    OUT PHANDLE phToken
    );
WINADVAPI
BOOL
WINAPI
LogonUserW (
    IN LPWSTR lpszUsername,
    IN LPWSTR lpszDomain,
    IN LPWSTR lpszPassword,
    IN DWORD dwLogonType,
    IN DWORD dwLogonProvider,
    OUT PHANDLE phToken
    );
#ifdef UNICODE
   LogonUser  LogonUserW
#else
   LogonUser  LogonUserA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
LogonUserExA (
    IN LPSTR lpszUsername,
    IN LPSTR lpszDomain,
    IN LPSTR lpszPassword,
    IN DWORD dwLogonType,
    IN DWORD dwLogonProvider,
    OUT PHANDLE phToken           OPTIONAL,
    OUT PSID  *ppLogonSid       OPTIONAL,
    OUT PVOID *ppProfileBuffer  OPTIONAL,
    OUT LPDWORD pdwProfileLength  OPTIONAL,
    OUT PQUOTA_LIMITS pQuotaLimits OPTIONAL
    );
WINADVAPI
BOOL
WINAPI
LogonUserExW (
    IN LPWSTR lpszUsername,
    IN LPWSTR lpszDomain,
    IN LPWSTR lpszPassword,
    IN DWORD dwLogonType,
    IN DWORD dwLogonProvider,
    OUT PHANDLE phToken           OPTIONAL,
    OUT PSID  *ppLogonSid       OPTIONAL,
    OUT PVOID *ppProfileBuffer  OPTIONAL,
    OUT LPDWORD pdwProfileLength  OPTIONAL,
    OUT PQUOTA_LIMITS pQuotaLimits OPTIONAL
    );
#ifdef UNICODE
   LogonUserEx  LogonUserExW
#else
   LogonUserEx  LogonUserExA
#endif // !UNICODE

WINADVAPI
BOOL
WINAPI
ImpersonateLoggedOnUser(
    IN HANDLE  hToken
    );

WINADVAPI
BOOL
WINAPI
CreateProcessAsUserA (
    IN HANDLE hToken,
    IN LPCSTR lpApplicationName,
    IN LPSTR lpCommandLine,
    IN LPSECURITY_ATTRIBUTES lpProcessAttributes,
    IN LPSECURITY_ATTRIBUTES lpThreadAttributes,
    IN BOOL bInheritHandles,
    IN DWORD dwCreationFlags,
    IN LPVOID lpEnvironment,
    IN LPCSTR lpCurrentDirectory,
    IN LPSTARTUPINFOA lpStartupInfo,
    OUT LPPROCESS_INFORMATION lpProcessInformation
    );
WINADVAPI
BOOL
WINAPI
CreateProcessAsUserW (
    IN HANDLE hToken,
    IN LPCWSTR lpApplicationName,
    IN LPWSTR lpCommandLine,
    IN LPSECURITY_ATTRIBUTES lpProcessAttributes,
    IN LPSECURITY_ATTRIBUTES lpThreadAttributes,
    IN BOOL bInheritHandles,
    IN DWORD dwCreationFlags,
    IN LPVOID lpEnvironment,
    IN LPCWSTR lpCurrentDirectory,
    IN LPSTARTUPINFOW lpStartupInfo,
    OUT LPPROCESS_INFORMATION lpProcessInformation
    );
#ifdef UNICODE
   CreateProcessAsUser  CreateProcessAsUserW
#else
   CreateProcessAsUser  CreateProcessAsUserA
#endif // !UNICODE


#if(_WIN32_WINNT >= = $0500)

//
// LogonFlags
//
   LOGON_WITH_PROFILE              = $00000001
   LOGON_NETCREDENTIALS_ONLY       = $00000002

WINADVAPI
BOOL
WINAPI
CreateProcessWithLogonW(
      LPCWSTR lpUsername,
      LPCWSTR lpDomain,
      LPCWSTR lpPassword,
      DWORD   dwLogonFlags,
      LPCWSTR lpApplicationName,
      LPWSTR lpCommandLine,
      DWORD dwCreationFlags,
      LPVOID lpEnvironment,
      LPCWSTR lpCurrentDirectory,
      LPSTARTUPINFOW lpStartupInfo,
      LPPROCESS_INFORMATION lpProcessInformation
      );

#endif // (_WIN32_WINNT >= = $0500)

WINADVAPI
BOOL
APIENTRY
ImpersonateAnonymousToken(
    IN HANDLE ThreadHandle
    );

WINADVAPI
BOOL
WINAPI
DuplicateTokenEx(
    IN HANDLE hExistingToken,
    IN DWORD dwDesiredAccess,
    IN LPSECURITY_ATTRIBUTES lpTokenAttributes,
    IN SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
    IN TOKEN_TYPE TokenType,
    OUT PHANDLE phNewToken);

WINADVAPI
BOOL
APIENTRY
CreateRestrictedToken(
    IN HANDLE ExistingTokenHandle,
    IN DWORD Flags,
    IN DWORD DisableSidCount,
    IN PSID_AND_ATTRIBUTES SidsToDisable OPTIONAL,
    IN DWORD DeletePrivilegeCount,
    IN PLUID_AND_ATTRIBUTES PrivilegesToDelete OPTIONAL,
    IN DWORD RestrictedSidCount,
    IN PSID_AND_ATTRIBUTES SidsToRestrict OPTIONAL,
    OUT PHANDLE NewTokenHandle
    );


WINADVAPI
BOOL
WINAPI
IsTokenRestricted(
    IN HANDLE TokenHandle
    );

WINADVAPI
BOOL
WINAPI
IsTokenUntrusted(
    IN HANDLE TokenHandle
    );


BOOL
APIENTRY
CheckTokenMembership(
    IN HANDLE TokenHandle OPTIONAL,
    IN PSID SidToCheck,
    OUT PBOOL IsMember
    );

//
// Thread pool API's
//

#if (_WIN32_WINNT >= = $0500)

type WAITORTIMERCALLBACKFUNC WAITORTIMERCALLBACK ;

WINBASEAPI
BOOL
WINAPI
RegisterWaitForSingleObject(
    PHANDLE phNewWaitObject,
    HANDLE hObject,
    WAITORTIMERCALLBACK Callback,
    PVOID Context,
    ULONG dwMilliseconds,
    ULONG dwFlags
    );

WINBASEAPI
HANDLE
WINAPI
RegisterWaitForSingleObjectEx(
    HANDLE hObject,
    WAITORTIMERCALLBACK Callback,
    PVOID Context,
    ULONG dwMilliseconds,
    ULONG dwFlags
    );

WINBASEAPI
BOOL
WINAPI
UnregisterWait(
    HANDLE WaitHandle
    );

WINBASEAPI
BOOL
WINAPI
UnregisterWaitEx(
    HANDLE WaitHandle,
    HANDLE CompletionEvent
    );

WINBASEAPI
BOOL
WINAPI
QueueUserWorkItem(
    LPTHREAD_START_ROUTINE Function,
    PVOID Context,
    ULONG Flags
    );

WINBASEAPI
BOOL
WINAPI
BindIoCompletionCallback (
    HANDLE FileHandle,
    LPOVERLAPPED_COMPLETION_ROUTINE Function,
    ULONG Flags
    );

WINBASEAPI
HANDLE
WINAPI
CreateTimerQueue(
    VOID
    );

WINBASEAPI
BOOL
WINAPI
CreateTimerQueueTimer(
    PHANDLE phNewTimer,
    HANDLE TimerQueue,
    WAITORTIMERCALLBACK Callback,
    PVOID Parameter,
    DWORD DueTime,
    DWORD Period,
    ULONG Flags
    ) ;

WINBASEAPI
BOOL
WINAPI
ChangeTimerQueueTimer(
    HANDLE TimerQueue,
    HANDLE Timer,
    ULONG DueTime,
    ULONG Period
    );

WINBASEAPI
BOOL
WINAPI
DeleteTimerQueueTimer(
    HANDLE TimerQueue,
    HANDLE Timer,
    HANDLE CompletionEvent
    );

WINBASEAPI
BOOL
WINAPI
DeleteTimerQueueEx(
    HANDLE TimerQueue,
    HANDLE CompletionEvent
    );

WINBASEAPI
HANDLE
WINAPI
SetTimerQueueTimer(
    HANDLE TimerQueue,
    WAITORTIMERCALLBACK Callback,
    PVOID Parameter,
    DWORD DueTime,
    DWORD Period,
    BOOL PreferIo
    );

WINBASEAPI
BOOL
WINAPI
CancelTimerQueueTimer(
    HANDLE TimerQueue,
    HANDLE Timer
    );

WINBASEAPI
BOOL
WINAPI
DeleteTimerQueue(
    HANDLE TimerQueue
    );

#endif // _WIN32_WINNT


#if(_WIN32_WINNT >= = $0400)
//
// Plug-and-Play API's
//

   HW_PROFILE_GUIDLEN         39      // 36-characters plus NULL terminator
   MAX_PROFILE_LEN            80

   DOCKINFO_UNDOCKED          (= $1)
   DOCKINFO_DOCKED            (= $2)
   DOCKINFO_USER_SUPPLIED     (= $4)
   DOCKINFO_USER_UNDOCKED     (DOCKINFO_USER_SUPPLIED | DOCKINFO_UNDOCKED)
   DOCKINFO_USER_DOCKED       (DOCKINFO_USER_SUPPLIED | DOCKINFO_DOCKED)

type struct tagHW_PROFILE_INFOA {
    DWORD  dwDockInfo;
    CHAR   szHwProfileGuid[HW_PROFILE_GUIDLEN];
    CHAR   szHwProfileName[MAX_PROFILE_LEN];
} HW_PROFILE_INFOA, *LPHW_PROFILE_INFOA;
type struct tagHW_PROFILE_INFOW {
    DWORD  dwDockInfo;
    WCHAR  szHwProfileGuid[HW_PROFILE_GUIDLEN];
    WCHAR  szHwProfileName[MAX_PROFILE_LEN];
} HW_PROFILE_INFOW, *LPHW_PROFILE_INFOW;
#ifdef UNICODE
type HW_PROFILE_INFOW HW_PROFILE_INFO;
type LPHW_PROFILE_INFOW LPHW_PROFILE_INFO;
#else
type HW_PROFILE_INFOA HW_PROFILE_INFO;
type LPHW_PROFILE_INFOA LPHW_PROFILE_INFO;
#endif // UNICODE


WINADVAPI
BOOL
WINAPI
GetCurrentHwProfileA (
    OUT LPHW_PROFILE_INFOA  lpHwProfileInfo
    );
WINADVAPI
BOOL
WINAPI
GetCurrentHwProfileW (
    OUT LPHW_PROFILE_INFOW  lpHwProfileInfo
    );
#ifdef UNICODE
   GetCurrentHwProfile  GetCurrentHwProfileW
#else
   GetCurrentHwProfile  GetCurrentHwProfileA
#endif // !UNICODE
#endif (* _WIN32_WINNT >= = $0400 *)

//
// Performance counter API's
//

WINBASEAPI
BOOL
WINAPI
QueryPerformanceCounter(
    OUT LARGE_INTEGER *lpPerformanceCount
    );

WINBASEAPI
BOOL
WINAPI
QueryPerformanceFrequency(
    OUT LARGE_INTEGER *lpFrequency
    );



WINBASEAPI
BOOL
WINAPI
GetVersionExA(
    IN OUT LPOSVERSIONINFOA lpVersionInformation
    );
WINBASEAPI
BOOL
WINAPI
GetVersionExW(
    IN OUT LPOSVERSIONINFOW lpVersionInformation
    );
#ifdef UNICODE
   GetVersionEx  GetVersionExW
#else
   GetVersionEx  GetVersionExA
#endif // !UNICODE



WINBASEAPI
BOOL
WINAPI
VerifyVersionInfoA(
    IN LPOSVERSIONINFOEXA lpVersionInformation,
    IN DWORD dwTypeMask,
    IN DWORDLONG dwlConditionMask
    );
WINBASEAPI
BOOL
WINAPI
VerifyVersionInfoW(
    IN LPOSVERSIONINFOEXW lpVersionInformation,
    IN DWORD dwTypeMask,
    IN DWORDLONG dwlConditionMask
    );
#ifdef UNICODE
   VerifyVersionInfo  VerifyVersionInfoW
#else
   VerifyVersionInfo  VerifyVersionInfoA
#endif // !UNICODE

// DOS and OS/2 Compatible Error Code definitions returned by the Win32 Base
// API functions.
//

#include <winerror.h>

(* Abnormal termination codes *)

   TC_NORMAL       0
   TC_HARDERR      1
   TC_GP_TRAP      2
   TC_SIGNAL       3

#if(WINVER >= = $0400)
//
// Power Management APIs
//

   AC_LINE_OFFLINE                 = $00
   AC_LINE_ONLINE                  = $01
   AC_LINE_BACKUP_POWER            = $02
   AC_LINE_UNKNOWN                 = $FF

   BATTERY_FLAG_HIGH               = $01
   BATTERY_FLAG_LOW                = $02
   BATTERY_FLAG_CRITICAL           = $04
   BATTERY_FLAG_CHARGING           = $08
   BATTERY_FLAG_NO_BATTERY         = $80
   BATTERY_FLAG_UNKNOWN            = $FF

   BATTERY_PERCENTAGE_UNKNOWN      = $FF

   BATTERY_LIFE_UNKNOWN        = $FFFFFFFF

type struct _SYSTEM_POWER_STATUS {
    BYTE ACLineStatus;
    BYTE BatteryFlag;
    BYTE BatteryLifePercent;
    BYTE Reserved1;
    DWORD BatteryLifeTime;
    DWORD BatteryFullLifeTime;
}   SYSTEM_POWER_STATUS, *LPSYSTEM_POWER_STATUS;

BOOL
WINAPI
GetSystemPowerStatus(
    OUT LPSYSTEM_POWER_STATUS lpSystemPowerStatus
    );

BOOL
WINAPI
SetSystemPowerState(
    IN BOOL fSuspend,
    IN BOOL fForce
    );

#endif (* WINVER >= = $0400 *)

#if (_WIN32_WINNT >= = $0500)
//
// Very Large Memory API Subset
//

WINBASEAPI
BOOL
WINAPI
AllocateUserPhysicalPages(
    IN HANDLE hProcess,
    IN OUT PULONG_PTR NumberOfPages,
    OUT PULONG_PTR PageArray
    );

WINBASEAPI
BOOL
WINAPI
FreeUserPhysicalPages(
    IN HANDLE hProcess,
    IN OUT PULONG_PTR NumberOfPages,
    IN PULONG_PTR PageArray
    );

WINBASEAPI
BOOL
WINAPI
MapUserPhysicalPages(
    IN PVOID VirtualAddress,
    IN ULONG_PTR NumberOfPages,
    IN PULONG_PTR PageArray OPTIONAL
    );

WINBASEAPI
BOOL
WINAPI
MapUserPhysicalPagesScatter(
    IN PVOID *VirtualAddresses,
    IN ULONG_PTR NumberOfPages,
    IN PULONG_PTR PageArray OPTIONAL
    );

WINBASEAPI
HANDLE
WINAPI
CreateJobObjectA(
    IN LPSECURITY_ATTRIBUTES lpJobAttributes,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
CreateJobObjectW(
    IN LPSECURITY_ATTRIBUTES lpJobAttributes,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   CreateJobObject  CreateJobObjectW
#else
   CreateJobObject  CreateJobObjectA
#endif // !UNICODE

WINBASEAPI
HANDLE
WINAPI
OpenJobObjectA(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCSTR lpName
    );
WINBASEAPI
HANDLE
WINAPI
OpenJobObjectW(
    IN DWORD dwDesiredAccess,
    IN BOOL bInheritHandle,
    IN LPCWSTR lpName
    );
#ifdef UNICODE
   OpenJobObject  OpenJobObjectW
#else
   OpenJobObject  OpenJobObjectA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
AssignProcessToJobObject(
    IN HANDLE hJob,
    IN HANDLE hProcess
    );

WINBASEAPI
BOOL
WINAPI
TerminateJobObject(
    IN HANDLE hJob,
    IN UINT uExitCode
    );

WINBASEAPI
BOOL
WINAPI
QueryInformationJobObject(
    IN HANDLE hJob,
    IN JOBOBJECTINFOCLASS JobObjectInformationClass,
    OUT LPVOID lpJobObjectInformation,
    IN DWORD cbJobObjectInformationLength,
    OUT LPDWORD lpReturnLength
    );

WINBASEAPI
BOOL
WINAPI
SetInformationJobObject(
    IN HANDLE hJob,
    IN JOBOBJECTINFOCLASS JobObjectInformationClass,
    IN LPVOID lpJobObjectInformation,
    IN DWORD cbJobObjectInformationLength
    );

WINBASEAPI
BOOL
WINAPI
IsProcessInJob (
    IN HANDLE ProcessHandle,
    IN HANDLE JobHandle,
    OUT PBOOL Result
    );


WINBASEAPI
BOOL
WINAPI
CreateJobSet (
    IN ULONG NumJob,
    IN PJOB_SET_ARRAY UserJobSet,
    IN ULONG Flags);


WINBASEAPI
PVOID
WINAPI
AddVectoredExceptionHandler(
    IN ULONG FirstHandler,
    IN PVECTORED_EXCEPTION_HANDLER VectoredHandler
    );

WINBASEAPI
ULONG
WINAPI
RemoveVectoredExceptionHandler(
    IN PVOID VectoredHandlerHandle
    );

//
// New Volume Mount Point API.
//

WINBASEAPI
HANDLE
WINAPI
FindFirstVolumeA(
    LPSTR lpszVolumeName,
    DWORD cchBufferLength
    );
WINBASEAPI
HANDLE
WINAPI
FindFirstVolumeW(
    LPWSTR lpszVolumeName,
    DWORD cchBufferLength
    );
#ifdef UNICODE
   FindFirstVolume FindFirstVolumeW
#else
   FindFirstVolume FindFirstVolumeA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindNextVolumeA(
    HANDLE hFindVolume,
    LPSTR lpszVolumeName,
    DWORD cchBufferLength
    );
WINBASEAPI
BOOL
WINAPI
FindNextVolumeW(
    HANDLE hFindVolume,
    LPWSTR lpszVolumeName,
    DWORD cchBufferLength
    );
#ifdef UNICODE
   FindNextVolume FindNextVolumeW
#else
   FindNextVolume FindNextVolumeA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindVolumeClose(
    HANDLE hFindVolume
    );

WINBASEAPI
HANDLE
WINAPI
FindFirstVolumeMountPointA(
    LPCSTR lpszRootPathName,
    LPSTR lpszVolumeMountPoint,
    DWORD cchBufferLength
    );
WINBASEAPI
HANDLE
WINAPI
FindFirstVolumeMountPointW(
    LPCWSTR lpszRootPathName,
    LPWSTR lpszVolumeMountPoint,
    DWORD cchBufferLength
    );
#ifdef UNICODE
   FindFirstVolumeMountPoint FindFirstVolumeMountPointW
#else
   FindFirstVolumeMountPoint FindFirstVolumeMountPointA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindNextVolumeMountPointA(
    HANDLE hFindVolumeMountPoint,
    LPSTR lpszVolumeMountPoint,
    DWORD cchBufferLength
    );
WINBASEAPI
BOOL
WINAPI
FindNextVolumeMountPointW(
    HANDLE hFindVolumeMountPoint,
    LPWSTR lpszVolumeMountPoint,
    DWORD cchBufferLength
    );
#ifdef UNICODE
   FindNextVolumeMountPoint FindNextVolumeMountPointW
#else
   FindNextVolumeMountPoint FindNextVolumeMountPointA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindVolumeMountPointClose(
    HANDLE hFindVolumeMountPoint
    );

WINBASEAPI
BOOL
WINAPI
SetVolumeMountPointA(
    LPCSTR lpszVolumeMountPoint,
    LPCSTR lpszVolumeName
    );
WINBASEAPI
BOOL
WINAPI
SetVolumeMountPointW(
    LPCWSTR lpszVolumeMountPoint,
    LPCWSTR lpszVolumeName
    );
#ifdef UNICODE
   SetVolumeMountPoint  SetVolumeMountPointW
#else
   SetVolumeMountPoint  SetVolumeMountPointA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
DeleteVolumeMountPointA(
    LPCSTR lpszVolumeMountPoint
    );
WINBASEAPI
BOOL
WINAPI
DeleteVolumeMountPointW(
    LPCWSTR lpszVolumeMountPoint
    );
#ifdef UNICODE
   DeleteVolumeMountPoint  DeleteVolumeMountPointW
#else
   DeleteVolumeMountPoint  DeleteVolumeMountPointA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetVolumeNameForVolumeMountPointA(
    LPCSTR lpszVolumeMountPoint,
    LPSTR lpszVolumeName,
    DWORD cchBufferLength
    );
WINBASEAPI
BOOL
WINAPI
GetVolumeNameForVolumeMountPointW(
    LPCWSTR lpszVolumeMountPoint,
    LPWSTR lpszVolumeName,
    DWORD cchBufferLength
    );
#ifdef UNICODE
   GetVolumeNameForVolumeMountPoint  GetVolumeNameForVolumeMountPointW
#else
   GetVolumeNameForVolumeMountPoint  GetVolumeNameForVolumeMountPointA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetVolumePathNameA(
    LPCSTR lpszFileName,
    LPSTR lpszVolumePathName,
    DWORD cchBufferLength
    );
WINBASEAPI
BOOL
WINAPI
GetVolumePathNameW(
    LPCWSTR lpszFileName,
    LPWSTR lpszVolumePathName,
    DWORD cchBufferLength
    );
#ifdef UNICODE
   GetVolumePathName  GetVolumePathNameW
#else
   GetVolumePathName  GetVolumePathNameA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
GetVolumePathNamesForVolumeNameA(
    LPCSTR lpszVolumeName,
    LPSTR lpszVolumePathNames,
    DWORD cchBufferLength,
    PDWORD lpcchReturnLength
    );
WINBASEAPI
BOOL
WINAPI
GetVolumePathNamesForVolumeNameW(
    LPCWSTR lpszVolumeName,
    LPWSTR lpszVolumePathNames,
    DWORD cchBufferLength,
    PDWORD lpcchReturnLength
    );
#ifdef UNICODE
   GetVolumePathNamesForVolumeName  GetVolumePathNamesForVolumeNameW
#else
   GetVolumePathNamesForVolumeName  GetVolumePathNamesForVolumeNameA
#endif // !UNICODE

#endif

#if (_WIN32_WINNT >= = $0500) || (_WIN32_FUSION >= = $0100) || ISOLATION_AWARE_ENABLED

   ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID    (= $00000001)
   ACTCTX_FLAG_LANGID_VALID                    (= $00000002)
   ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID        (= $00000004)
   ACTCTX_FLAG_RESOURCE_NAME_VALID             (= $00000008)
   ACTCTX_FLAG_SET_PROCESS_DEFAULT             (= $00000010)
   ACTCTX_FLAG_APPLICATION_NAME_VALID          (= $00000020)
   ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF           (= $00000040)
   ACTCTX_FLAG_HMODULE_VALID                   (= $00000080)

type struct tagACTCTXA {
    ULONG       cbSize;
    DWORD       dwFlags;
    LPCSTR      lpSource;
    USHORT      wProcessorArchitecture;
    LANGID      wLangId;
    LPCSTR      lpAssemblyDirectory;
    LPCSTR      lpResourceName;
    LPCSTR      lpApplicationName;
    HMODULE     hModule;
} ACTCTXA, *PACTCTXA;
type struct tagACTCTXW {
    ULONG       cbSize;
    DWORD       dwFlags;
    LPCWSTR     lpSource;
    USHORT      wProcessorArchitecture;
    LANGID      wLangId;
    LPCWSTR     lpAssemblyDirectory;
    LPCWSTR     lpResourceName;
    LPCWSTR     lpApplicationName;
    HMODULE     hModule;
} ACTCTXW, *PACTCTXW;
#ifdef UNICODE
type ACTCTXW ACTCTX;
type PACTCTXW PACTCTX;
#else
type ACTCTXA ACTCTX;
type PACTCTXA PACTCTX;
#endif // UNICODE

type const ACTCTXA *PCACTCTXA;
type const ACTCTXW *PCACTCTXW;
#ifdef UNICODE
type ACTCTXW ACTCTX;
type PCACTCTXW PCACTCTX;
#else
type ACTCTXA ACTCTX;
type PCACTCTXA PCACTCTX;
#endif // UNICODE

#endif

#if (_WIN32_WINNT >= = $0500) || (_WIN32_FUSION >= = $0100)



WINBASEAPI
HANDLE
WINAPI
CreateActCtxA(
    PCACTCTXA pActCtx
    );
WINBASEAPI
HANDLE
WINAPI
CreateActCtxW(
    PCACTCTXW pActCtx
    );
#ifdef UNICODE
   CreateActCtx  CreateActCtxW
#else
   CreateActCtx  CreateActCtxA
#endif // !UNICODE

WINBASEAPI
VOID
WINAPI
AddRefActCtx(
    HANDLE hActCtx
    );



WINBASEAPI
VOID
WINAPI
ReleaseActCtx(
    HANDLE hActCtx
    );

WINBASEAPI
BOOL
WINAPI
ZombifyActCtx(
    HANDLE hActCtx
    );



WINBASEAPI
BOOL
WINAPI
ActivateActCtx(
    HANDLE hActCtx,
    ULONG_PTR *lpCookie
    );



   DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION (= $00000001)

WINBASEAPI
BOOL
WINAPI
DeactivateActCtx(
    DWORD dwFlags,
    ULONG_PTR ulCookie
    );

WINBASEAPI
BOOL
WINAPI
GetCurrentActCtx(
    HANDLE *lphActCtx);

#endif

#if (_WIN32_WINNT >= = $0500) || (_WIN32_FUSION >= = $0100) || ISOLATION_AWARE_ENABLED

type struct tagACTCTX_SECTION_KEYED_DATA {
    ULONG cbSize;
    ULONG ulDataFormatVersion;
    PVOID lpData;
    ULONG ulLength;
    PVOID lpSectionGlobalData;
    ULONG ulSectionGlobalDataLength;
    PVOID lpSectionBase;
    ULONG ulSectionTotalLength;
    HANDLE hActCtx;
    ULONG ulAssemblyRosterIndex;
} ACTCTX_SECTION_KEYED_DATA, *PACTCTX_SECTION_KEYED_DATA;

   FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX (= $00000001)

#endif

#if (_WIN32_WINNT >= = $0500) || (_WIN32_FUSION >= = $0100)



WINBASEAPI
BOOL
WINAPI
FindActCtxSectionStringA(
    DWORD dwFlags,
    const GUID *lpExtensionGuid,
    ULONG ulSectionId,
    LPCSTR lpStringToFind,
    PACTCTX_SECTION_KEYED_DATA ReturnedData
    );
WINBASEAPI
BOOL
WINAPI
FindActCtxSectionStringW(
    DWORD dwFlags,
    const GUID *lpExtensionGuid,
    ULONG ulSectionId,
    LPCWSTR lpStringToFind,
    PACTCTX_SECTION_KEYED_DATA ReturnedData
    );
#ifdef UNICODE
   FindActCtxSectionString  FindActCtxSectionStringW
#else
   FindActCtxSectionString  FindActCtxSectionStringA
#endif // !UNICODE

WINBASEAPI
BOOL
WINAPI
FindActCtxSectionGuid(
    DWORD dwFlags,
    const GUID *lpExtensionGuid,
    ULONG ulSectionId,
    const GUID *lpGuidToFind,
    PACTCTX_SECTION_KEYED_DATA ReturnedData
    );

#endif

#if (_WIN32_WINNT >= = $0500) || (_WIN32_FUSION >= = $0100) || ISOLATION_AWARE_ENABLED

#if !defined(RC_INVOKED) (* RC complains about long symbols in #ifs *)
#if !defined(ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED)

type struct _ACTIVATION_CONTEXT_BASIC_INFORMATION {
    HANDLE  hActCtx;
    DWORD   dwFlags;
} ACTIVATION_CONTEXT_BASIC_INFORMATION, *PACTIVATION_CONTEXT_BASIC_INFORMATION;

type const struct _ACTIVATION_CONTEXT_BASIC_INFORMATION *PCACTIVATION_CONTEXT_BASIC_INFORMATION;

   ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED 1

#endif // !defined(ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED)
#endif

   QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX (= $00000004)
   QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE (= $00000008)
   QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS (= $00000010)
   QUERY_ACTCTX_FLAG_NO_ADDREF         (= $80000000)

#endif

#if (_WIN32_WINNT >= = $0500) || (_WIN32_FUSION >= = $0100)



//
// switch (ulInfoClass)
//
//  case ActivationContextBasicInformation:
//    pvSubInstance == NULL
//    pvBuffer is of type PACTIVATION_CONTEXT_BASIC_INFORMATION
//
//  case ActivationContextDetailedInformation:
//    pvSubInstance == NULL
//    pvBuffer is of type PACTIVATION_CONTEXT_DETAILED_INFORMATION
//
//  case AssemblyDetailedInformationInActivationContext:
//    pvSubInstance is of type PULONG
//      *pvSubInstance < ACTIVATION_CONTEXT_DETAILED_INFORMATION::ulAssemblyCount
//    pvBuffer is of type PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION
//
//  case FileInformationInAssemblyOfAssemblyInActivationContext:
//    pvSubInstance is of type PACTIVATION_CONTEXT_QUERY_INDEX
//      pvSubInstance->ulAssemblyIndex < ACTIVATION_CONTEXT_DETAILED_INFORMATION::ulAssemblyCount
//      pvSubInstance->ulFileIndexInAssembly < ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION::ulFileCount
//    pvBuffer is of type PASSEMBLY_FILE_DETAILED_INFORMATION
//
// String are placed after the structs.
//
WINBASEAPI
BOOL
WINAPI
QueryActCtxW(
    IN DWORD dwFlags,
    IN HANDLE hActCtx,
    IN PVOID pvSubInstance,
    IN ULONG ulInfoClass,
    OUT PVOID pvBuffer,
    IN SIZE_T cbBuffer OPTIONAL,
    OUT SIZE_T *pcbWrittenOrRequired OPTIONAL
    );

type BOOL (WINAPI * PQUERYACTCTXW_FUNC)(
    IN DWORD dwFlags,
    IN HANDLE hActCtx,
    IN PVOID pvSubInstance,
    IN ULONG ulInfoClass,
    OUT PVOID pvBuffer,
    IN SIZE_T cbBuffer OPTIONAL,
    OUT SIZE_T *pcbWrittenOrRequired OPTIONAL
    );

#endif // (_WIN32_WINNT > = $0500) || (_WIN32_FUSION >= = $0100)


WINBASEAPI
BOOL
WINAPI
ProcessIdToSessionId(
    IN  DWORD dwProcessId,
    OUT DWORD *pSessionId
    );

#if _WIN32_WINNT >= = $0501

WINBASEAPI
DWORD
WINAPI
WTSGetActiveConsoleSessionId();

WINBASEAPI
BOOL
WINAPI
IsWow64Process(
    HANDLE hProcess,
    PBOOL Wow64Process
    );

#endif // (_WIN32_WINNT >= = $0501)


//
// NUMA Information routines.
//

WINBASEAPI
BOOL
WINAPI
GetNumaHighestNodeNumber(
    PULONG HighestNodeNumber
    );

WINBASEAPI
BOOL
WINAPI
GetNumaProcessorNode(
    UCHAR Processor,
    PUCHAR NodeNumber
    );

WINBASEAPI
BOOL
WINAPI
GetNumaNodeProcessorMask(
    UCHAR Node,
    PULONGLONG ProcessorMask
    );

WINBASEAPI
BOOL
WINAPI
GetNumaProcessorMap(
    PSYSTEM_NUMA_INFORMATION Map,
    ULONG Length,
    PULONG ReturnedLength
    );

WINBASEAPI
BOOL
WINAPI
GetNumaAvailableMemory(
    PSYSTEM_NUMA_INFORMATION Memory,
    ULONG Length,
    PULONG ReturnedLength
    );

WINBASEAPI
BOOL
WINAPI
GetNumaAvailableMemoryNode(
    UCHAR Node,
    PULONGLONG AvailableBytes
    );

WINBASEAPI
ULONGLONG
WINAPI
NumaVirtualQueryNode(
    IN  ULONG       NumberOfRanges,
    IN  PULONG_PTR  RangeList,
    OUT PULONG_PTR  VirtualPageAndNode,
    IN  SIZE_T      MaximumOutputLength
    );




#if !defined(RC_INVOKED) (* RC complains about long symbols in #ifs *)
#if ISOLATION_AWARE_ENABLED
#include "winbase.inl"
#endif (* ISOLATION_AWARE_ENABLED *)
#endif (* RC *)

#ifdef __cplusplus
}
#endif



#endif // _WINBASE_

