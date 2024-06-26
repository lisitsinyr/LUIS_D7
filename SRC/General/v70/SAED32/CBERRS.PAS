unit CBERRS;

interface

uses
   Windows;

const
   CBERR = -1;
   cb_MAX_ERR_PARAM = 256;

type
   Pcb_ERRORINFO = ^cb_ERRORINFO;
   cb_ERRORINFO = packed record
      code: DWORD;
      winCode: DWORD;
      param: array[0..cb_MAX_ERR_PARAM] of char;
   end;

   (* ��������� ���������� ������������� cb_ERRORINFO *)
   ErrEx = class
   public
      code: DWORD;
      winCode: DWORD;
      param: array[0..cb_MAX_ERR_PARAM] of char;
      //class procedure ErrEx(acode: DWORD); overload;
      //class procedure ErrEx(acode: DWORD; const aparam: PChar);overload;
      //class procedure ErrEx(acode: DWORD; awinCode: Integer); overload;
      //class procedure ErrEx(acode: DWORD; const aparam: PChar; awinCode: Integer);overload;
   end;

(* ===============   ������������� ������: ============ *)
const
   //CBERRCLASS(e)        = ((e)&$FF00);

   (*  1. ������ ��������� � ���������. *)
   CBEC_DEVICE          = $100;

   CBE_INITDEVICE       = (CBEC_DEVICE+1);   (* ������ ������������� ���������� *)
   CBE_DEVICE           = (CBEC_DEVICE+2);   (* ������ ���������� *)
   CBE_MEDIA            = (CBEC_DEVICE+3);   (* ��� �������� ( �������� �������� � ���������� %% ) *)
   CBE_NOT_FORMAT       = (CBEC_DEVICE+5);   (* �������� �� ������������ *)
   CBE_NOT_RESPOND      = (CBEC_DEVICE+6);   (* ���������� �� �������� *)
   CBE_BUSY             = (CBEC_DEVICE+7);   (* ���������� ������ *)

   (*  2. �������� ������ *)
   CBEC_FILE            = $200;

   CBE_NOSPACE          = (CBEC_FILE+1);    (* ��� ����� �� ���������� *)
   CBE_OPEN             = (CBEC_FILE+2);    (* ������ �������� *)
   CBE_WRITE            = (CBEC_FILE+3);    (* ������ ������ *)
   CBE_READ             = (CBEC_FILE+4);    (* ������ ������ *)
   CBE_CREATE           = (CBEC_FILE+5);    (* ������ �������� *)
   CBE_DELETE           = (CBEC_FILE+6);    (* ������ �������� *)
   CBE_RENAME           = (CBEC_FILE+7);    (* ������ �������������� *)
   CBE_ACCESS           = (CBEC_FILE+8);    (* ������ ������� (sharing/locking/network) *)
   CBE_ALREADY_EXIST    = (CBEC_FILE+9);    (* ���� ��� ���������� *)
   CBE_UNDEFIO          = (CBEC_FILE+10);   (* ������������������ ������ �/� *)
   CBE_MKDIR            = (CBEC_FILE+11);   (* ������ ��� �������� �������� *)
   CBE_PACKING          = (CBEC_FILE+12);   (* ������ ��� ������������� *)
   CBE_UNPACKING        = (CBEC_FILE+13);   (* ������ ��� ���������������� *)

   (*  3. ������ ������� ���� � ������ ������ *)
   CBEC_NAME            = $300;

   CBE_NODEV            = (CBEC_NAME+1);  (* ������� �������� ���������� *)
   CBE_NODIR            = (CBEC_NAME+2);  (* ��� �������� *)
   CBE_NOFILE           = (CBEC_NAME+3);  (* ��� ����� *)
   CBE_BADNAME          = (CBEC_NAME+4);  (* �������� ��� ����� *)

   (*  4. ���������� ������������ *)
   CBEC_USER            = $C00;

   CBE_USERBREAK        = (CBEC_USER+1);  (* ������������ ������� ������� *)

   (*  5. ������ �������� *)
   CBEC_FORMAT          = $400;

   CBE_BADFORMAT        = (CBEC_FORMAT+1); (* �������� ������ ����� *)
   CBE_FUTUREFORMAT     = (CBEC_FORMAT+2); (* ������ ������� ����� *)
   CBE_CORRUPTED        = (CBEC_FORMAT+3); (* ���� ��������� (CRC �� �������) *)
   CBE_OBSOLETE         = (CBEC_FORMAT+4); (* ���������� ������ *)

   (*  6. ������ ����������� *)
   CBEC_CODING          = $600;

   CBE_BADIP            = (CBEC_CODING+1); (* ��������� ����������� *)
   CBE_CANTRECODE       = (CBEC_CODING+2); (* �� ������������ *)
   CBE_CANTSELFENCODE   = (CBEC_CODING+3); (* �� ������������ *)
   CBE_BADKEYNO         = (CBEC_CODING+4); (* �� ������������ *)
   CBE_EMPTYNODE        = (CBEC_CODING+5); (* �� ������������ *)
   CBE_BADNETADDR       = (CBEC_CODING+6); (* ���� �� ��� ����� �������� � �� �� ������ *)

   (*  7. ������ ��� *)
   CBEC_KPD             = $700;

   CBE_NOKPD            = (CBEC_KPD+1); (* ���� �� ����� ���. *)
   CBE_SIA_NOKPD        = (CBEC_KPD+2); (* ������������� �� ������������� *)
   CBE_KPDDATE_WRONG    = (CBEC_KPD+3); (* �������� ���� ��� *)
   CBE_SIAKPD_WRONG     = (CBEC_KPD+4); (* �������� ��� �� *)
   CBE_KPD_WRONG        = (CBEC_KPD+5); (* ��� �� ����� *)
   CBE_NOSIA            = (CBEC_KPD+6); (* ��� �� ������ *)
   CBE_NOSIRC           = (CBEC_KPD+7); (* ���� �� ������ *)

   (*  8. ����� ������ ������ � ���������������� � ���. *)
   CBEC_IACMN           = $800;

   CBE_BADPASSWORD      = (CBEC_IACMN+1); (* �������� ������ *)
   CBE_PW_EXPECTED      = (CBEC_IACMN+2); (* �� ������������ *)
   CBE_TIMEOVER         = (CBEC_IACMN+3); (* ����� �������� ������� *)

   (*  9. ��������� ������ *)
   CBEC_FATAL           = $900;

   CBE_NOMEMORY         = (CBEC_FATAL+1); (* �������� ������ *)
   CBE_CRYPTODEVICE     = (CBEC_FATAL+2); (* ������ ����������� ���������� *)
   CBE_LOGERROR         = (CBEC_FATAL+3); (* ������ ������� ������� *)
   CBE_LOGOPEN          = (CBEC_FATAL+4); (* ������ �������� ������� *)
   CBE_NOT_ALLOWED      = (CBEC_FATAL+5); (* ������� ��������� *)
   CBE_CFG              = (CBEC_FATAL+6); (* ��������� �������
                                           (��� �������� ������������) *)
   CBE_PIA_NOT_REG      = (CBEC_FATAL+7); (* ��� �� ������� � ������������� *)

   (*  10. ���������� ������ (������ ������������).
        ��� ������������� ���������� �������� ������������� *)
   CBEC_INT             =  $A00;

   CBE_NONAME           = (CBEC_INT+1);  (* �� ������� ��� ����� *)
   CBE_BADUK            = (CBEC_INT+2);  (* - *)
   CBE_BADUK_KS         = (CBEC_INT+3);  (* - *)
   CBE_BADHANDLE        = (CBEC_INT+4);  (* �������� handle ����� *)
   CBE_NOTDECODED       = (CBEC_INT+5);  (* ������� ������������ ����������������� ������������� *)
   CBE_BADPARAM         = (CBEC_INT+6);  (* �������� �������� ������� *)
   CBE_LOG_SEQ          = (CBEC_INT+7);  (* ������ � ������� ������� - ���������� �������� �� ��������� *)


   (* ===================================== Extentions ============== *)

   CBEC_USERCLASS_BASE  = $4000;   (* ���� ��� ������� *)
                                    (* ���������������� ������ *)
   CBE_USERBASE         = $40;     (* ���� ��� ���������� ������ �������� *)

implementation   

end.
