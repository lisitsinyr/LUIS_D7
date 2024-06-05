{***************************************************************************
*
* Copyright (C) T������������������, 2001
* ���� ���� �������� ����������,
* ���������� �������������� T������������������.
*
* ����� ����� ����� ����� �� ����� ���� �����������,
* ����������, ���������� �� ������ �����,
* ������������ ��� �������������� ����� ��������,
* ���������������, �������� �� ���� � ��� ��
* ����� ������������ ������� ��� ����������������
* ���������� ���������� � T������������������.
*
***************************************************************************}

{.$I FColse.Inc}

unit WBothX;

interface

Uses
  SysUtils, Windows;

Const
  //cDllFN = {$IFDEF VerbaO} 'WBOTHO.DLL' {$ELSE} 'WBOTH.DLL' {$ENDIF};
  cDllFN = 'WBOTHO.DLL';

  // ������
  NO_ERROR            = 0;
  E_NO_MEM            = 1;
  E_CONTROL           = 2;
  E_DRIVER            = 3;
  E_IMMITO            = 4;
  E_KEY_NOT_FOUND     = 6;
  E_PARAM             = 7;
  E_INIT              = 8;
  E_MEM_LENGTH        = 10;
  E_MEM_NOT_ENCRYPTED = 11;
  E_MEM_NOT_SIGNED    = 12;
  E_OPEN_IN_FILE      = 21;
  E_OPEN_OUT_FILE     = 22;
  E_WRITE_FILE        = 23;
  E_READ_FILE         = 24;
  E_RENAME_FILE       = 25;
  E_FILE_LENGTH       = 26;
  E_SRC               = 27;
  E_FILE_NOT_ENCRYPTED= 29;
  E_FILE_NOT_SIGNED   = 30;
  E_SEEK              = 31;
  E_CLOSE             = 32;
  E_DELETE_FILE       = 33;
  E_GK                = 34;
  E_KS                = 35;
  E_DEVICE            = 36;
  // ��� ������� InitKey
  E_REDEFINE          = 37;
  E_NO_FREE_SLOTS     = 38;
  E_KEY_NOT_SET       = 39;
  E_GK_R              = 40;
  E_GK_W              = 41;
  ERR_UNSUPPORTED_FORMAT = 42;

  ERR_NUMP            = 101;
  ERR_HASH            = 102;
  ERR_OPEN_SPR        = 103;
  ERR_OPEN_IMM        = 104;
  ERR_UZ              = 105;
  ERR_CKD             = 106;
  ERR_IMM_SPR         = 107;
  ERR_READ_SPR        = 108;
  ERR_WRITE_SPR       = 109;
  ERR_READ_IMM        = 110;
  ERR_IMM             = 111;
  ERR_COMPROM         = 112;
  ERR_CRE_DIR         = 113;
  ERR_CRE_FILE        = 114;
  ERR_EXIST_SPR       = 115;
  ERR_WRITE_IMM       = 116;
  ERR_NO_KEY          = 117;
  ERR_LENGTH          = 118;
  ERR_OPEN_TMP        = 119;
  ERR_SPR_EMPTY       = 120;
  ERR_KEY_HEAD        = 121;
  ERR_FIND_SPR        = 122;
  ERR_NO_RES          = 123;
  ERR_IMM_HEAD        = 124;
  ERR_NO_SIGN         = 125;
  ERR_NO_IMM          = 126;
  ERR_FLOP            = 127;
  ERR_SPR_NOT_FOUND   = 128;
  ERR_BAD_KEY         = 129;
  ERR_PACK_BUF        = 130;
  ERR_OTHER_IMM_KEY   = 131;
  ERR_BAD_KEY_TYPE    = 132;
  ERR_ANOTHER_CARRIER = 133;

  ERR_UNSUPPORTED     = $1000;
  ERR_CONNECT         = $1001;
  ERR_NO_CARRIER      = $1002;
  ERR_INVALID_MEDIA   = $1003;
  ERR_WRITE_PROTECT   = $1004;
  ERR_INVALID_PASSWD  = $1005;
  ERR_CANCEL          = $1006;
  ERR_FULL            = $1007;
  ERR_VERSION_1       = $1008;

  // Error ASR
  BASE_ASR                   = 200;
  ASR_ERRRO_NUMBER_BEGIN     =  BASE_ASR+1;
  ASR_ERRRO_NUMBER_END       =  BASE_ASR+51;
  ASR_DRIVER_ERROR           =  BASE_ASR+1;
  ERROR_CHECK_SUM            =  BASE_ASR+2;
  DLL_BUFFER_ERROR           =  BASE_ASR+3;
  ERROR_OUTPUT_SIZE          =  BASE_ASR+4;
  ERROR_GET_KEY_INPUT_SIZE   =  BASE_ASR+5;
  ERROR_GET_KEY_INPUT_CHECK  =  BASE_ASR+6;
  ERROR_GET_KEY_COMMAND      =  BASE_ASR+7;
  ERROR_SET_KEY_INPUT_SIZE   =  BASE_ASR+8;
  ERROR_SET_KEY_INPUT_CHECK  =  BASE_ASR+9;
  ERROR_SET_KEY_COMMAND      =  BASE_ASR+10;
  ERROR_CKDI_NOT_SET         =  BASE_ASR+11;
  ERROR_TGKEY_NOT_SET        =  BASE_ASR+12;
  ERROR_GKEY_NOT_SET         =  BASE_ASR+13;
  ERROR_CKD_NOT_SET          =  BASE_ASR+14;
  ERROR_NUM_NOT_SET          =  BASE_ASR+15;
  ERROR_NUMP_NOT_SET         =  BASE_ASR+16;
  ERROR_KEYC_NOT_SET         =  BASE_ASR+17;
  ERROR_UZ_NOT_SET           =  BASE_ASR+18;
  ERROR_DMASK_NOT_SET        =  BASE_ASR+19;
  ERROR_DMASK_REDEFINE       =  BASE_ASR+20;
  ERROR_DMASK_SIZE_SET       =  BASE_ASR+21;
  ERROR_UZ_REDEFINE          =  BASE_ASR+22;
  ERROR_UZ_SIZE_SET          =  BASE_ASR+23;
  ERROR_GKEY_REDEFINE        =  BASE_ASR+24;
  ERROR_GKEY_SIZE_SET        =  BASE_ASR+25;
  ERROR_GKEY_ICMP_SET        =  BASE_ASR+26;
  ERROR_KEYC_REDEFINE        =  BASE_ASR+27;
  ERROR_KEYC_SIZE_SET        =  BASE_ASR+28;
  ERROR_KEYC_ICMP_SET        =  BASE_ASR+29;
  ERROR_NUM_REDEFINE         =  BASE_ASR+30;
  ERROR_NUM_SIZE_SET         =  BASE_ASR+31;
  ERROR_NUMP_REDEFINE        =  BASE_ASR+32;
  ERROR_NUMP_SIZE_SET        =  BASE_ASR+33;
  ERROR_CKEYD_REDEFINE       =  BASE_ASR+34;
  ERROR_CKEYD_SIZE_SET       =  BASE_ASR+35;
  ERROR_CKEYD_NUM_SET        =  BASE_ASR+36;
  ERROR_CKEYD_ICMP_SET       =  BASE_ASR+37;
  ERROR_CKEYDI_REDEFINE      =  BASE_ASR+38;
  ERROR_CKEYDI_SIZE_SET      =  BASE_ASR+39;
  ERROR_CKEYDI_NUMP_SET      =  BASE_ASR+40;
  ERROR_CKEYDI_ICMP_SET      =  BASE_ASR+41;
  ERROR_INIGAMMA_STATUS      =  BASE_ASR+42;
  ERROR_INIGAMMASP_SET       =  BASE_ASR+43;
  ERROR_INIGAMMASP_OVERFLOW  =  BASE_ASR+44;
  ERROR_NUM_ASCII_NUMBER     =  BASE_ASR+45;
  ERROR_NUM_ICMP_SET         =  BASE_ASR+46;
  ERROR_NUMP_ASCII_NUMBER    =  BASE_ASR+47;
  ERROR_NUMP_ICMP_SET        =  BASE_ASR+48;
  ERROR_GOST_KMT_STATUS      =  BASE_ASR+49;
  ERROR_RND_TEST_STATUS      =  BASE_ASR+50;
  DRIVER_OPEN_ERROR          =  BASE_ASR+51;
  ERROR_CANT_RESET_KEY       =  BASE_ASR+53;

  // ��� ������
  ERR_SECRKEYNOTFOUND        = 500;
  ERR_NO_SECRPATH            = 501;
  ERR_NO_BASEPATH            = 502;
  ERR_BAD_INIT               = 503;
  ERR_BAD_SPR                = 504;
  ERR_BAD_SER                = 505;
  ERR_LOCK_COMPROMAT         = 506;
  // ��� ������
  sNO_ERROR                  = '��� ������.';
  sE_NO_MEM                  = '�� ������� ������������ ������.';
  sE_CONTROL                 = '���� ����������������� ������� ��� ��������� ���� ����������.';
  sE_DRIVER                  = '������ ������� ��������� �����.';
  sE_IMMITO                  = '�� ��������� ������������- ���� (���� ������) �������.';
  sE_KEY_NOT_FOUND           = '�� ������ ����.';
  sE_PARAM                   = '������ ��������� ��������� � �������.';
  sE_INIT                    = '������ �������������.';
  sE_MEM_LENGTH              = '�������� ����� ����� ������.';
  sE_MEM_NOT_ENCRYPTED       = '������� ������������ ��������������� ���� ������.';
  sE_MEM_NOT_SIGNED          = '������� ��������� ������� �������������� ����� ������.';
  sE_OPEN_IN_FILE            = '������ �������� �������� �����.';
  sE_OPEN_OUT_FILE           = '������ �������� ��������� �����.';
  sE_WRITE_FILE              = '������ ������ �����.';
  sE_READ_FILE               = '������ ������ �����.';
  sE_RENAME_FILE             = '������ �������������� �����.';
  sE_FILE_LENGTH             = '�������� (��������, �������) ����� �����.';
  sE_SRC                     = '������������ ����������� ����� �������������� �����.';
  sE_FILE_NOT_ENCRYPTED      = '������� ������������� ���������������� �����.';
  sE_FILE_NOT_SIGNED         = '������� �������� ������� �������������� �����.';
  sE_SEEK                    = '������ �������� ��������� ���������.';
  sE_CLOSE                   = '������ �������� �����.';
  sE_DELETE_FILE             = '������ �������� �����.';
  sE_GK                      = '������ GK.';
  sE_KS                      = '������ KS.';
  sE_DEVICE                  = '������ DEVICE.';
  sE_REDEFINE                = '������ REDEFINE.';
  sE_NO_FREE_SLOTS           = '��� ��������� ������.';
  sE_KEY_NOT_SET             = '������ KEY_NOT_SET';
  sE_GK_R                    = '������ ������ GK.';
  sE_GK_W                    = '������ ������ GK.';
  sERR_UNSUPPORTED_FORMAT    = '������ �� ��������������.';
  sERR_NUMP                  = '����� ����� NUM ��� NUMP �� ������������� ���������� �� ������� ��������� �����.';
  sERR_HASH                  = '�������� ���-������� �� �������.';
  sERR_OPEN_SPR              = '������ ��� �������� ����� �� ������������ �������� ������.';
  sERR_OPEN_IMM              = '������ ��� �������� ����� � ��������������.';
  sERR_UZ                    = '������ ������ UZ.';
  sERR_CKD                   = '������ ������ CKD ��� CKDI.';
  sERR_IMM_SPR               = '����� ����� �� ������������ �� ������������� ����� ����� � ��������������.';
  sERR_READ_SPR              = '������ ������ ����� �� ������������ �������� ������.';
  sERR_WRITE_SPR             = '������ ������ � ���� �� ������������ �������� ������.';
  sERR_READ_IMM              = '������ ������ ����� � ��������������.';
  sERR_IMM                   = '����������� �������.';
  sERR_COMPROM               = '�������� ���� ����������������.';
  sERR_CRE_DIR               = '������ ��� �������� ��������.';
  sERR_CRE_FILE              = '������ ��� �������� ����� *.imm, *.imp, ��� *.spr.';
  sERR_EXIST_SPR             = '� �������� �������� ��� ���������� ���� *.spr.';
  sERR_WRITE_IMM             = '������ ������ � ���� ������������.';
  sERR_NO_KEY                = '��������� �������� ���� ����������� � �����������.';
  sERR_LENGTH                = '�������� ����� ����� *.imm, *.imp, ��� *.spr.';
  sERR_OPEN_TMP              = '������ �������� ���������� �����.';
  sERR_SPR_EMPTY             = '���������� �������� ������ ����.';
  sERR_KEY_HEAD              = '��������� ��������� ����� �������.';
  sERR_FIND_SPR              = '���������� �������� ������ �� ������.';
  sERR_NO_RES                = '�������� ���� �� �������� ���������.';
  sERR_IMM_HEAD              = '��������� ����� � �������������� �������.';
  sERR_NO_SIGN               = '��� ������������ �� �������� ����.';
  sERR_NO_IMM                = '��� ������������ �� �������� ����.';
  sERR_FLOP                  = '������ ��� ��������� � ������� �����.';
  sERR_SPR_NOT_FOUND         = '���������� �� ������.';
  sERR_BAD_KEY               = 'ERR_BAD_KEY';
  sERR_PACK_BUF              = 'ERR_PACK_BUF';
  sERR_OTHER_IMM_KEY         = '������������ �� ���������� ���������� �� ����� ������ �����.';
  sERR_BAD_KEY_TYPE          = '�������� ��� ��������� ��������';
  sERR_ANOTHER_CARRIER       = '�������� ������ ��������.';
  // ASR Error
  sASR_ERRRO_NUMBER_BEGIN    = 'ASR_ERRRO_NUMBER_BEGIN';
  sASR_ERRRO_NUMBER_END      = 'ASR_ERRRO_NUMBER_END';
  sASR_DRIVER_ERROR          = 'ASR_DRIVER_ERROR';
  sERROR_CHECK_SUM           = 'ERROR_CHECK_SUM';
  sDLL_BUFFER_ERROR          = 'DLL_BUFFER_ERROR';
  sERROR_OUTPUT_SIZE         = 'ERROR_OUTPUT_SIZE';
  sERROR_GET_KEY_INPUT_SIZE  = 'ERROR_GET_KEY_INPUT_SIZE';
  sERROR_GET_KEY_INPUT_CHECK = 'ERROR_GET_KEY_INPUT_CHECK';
  sERROR_GET_KEY_COMMAND     = 'ERROR_GET_KEY_COMMAND';
  sERROR_SET_KEY_INPUT_SIZE  = 'ERROR_SET_KEY_INPUT_SIZE';
  sERROR_SET_KEY_INPUT_CHECK = 'ERROR_SET_KEY_INPUT_CHECK';
  sERROR_SET_KEY_COMMAND     = 'ERROR_SET_KEY_COMMAND';
  sERROR_CKDI_NOT_SET        = 'ERROR_CKDI_NOT_SET';
  sERROR_TGKEY_NOT_SET       = 'ERROR_TGKEY_NOT_SET';
  sERROR_GKEY_NOT_SET        = 'ERROR_GKEY_NOT_SET';
  sERROR_CKD_NOT_SET         = 'ERROR_CKD_NOT_SET';
  sERROR_NUM_NOT_SET         = 'ERROR_NUM_NOT_SET';
  sERROR_NUMP_NOT_SET        = 'ERROR_NUMP_NOT_SET';
  sERROR_KEYC_NOT_SET        = 'ERROR_KEYC_NOT_SET';
  sERROR_UZ_NOT_SET          = 'ERROR_UZ_NOT_SET';
  sERROR_DMASK_NOT_SET       = 'ERROR_DMASK_NOT_SET';
  sERROR_DMASK_REDEFINE      = 'ERROR_DMASK_REDEFINE';
  sERROR_DMASK_SIZE_SET      = 'ERROR_DMASK_SIZE_SET';
  sERROR_UZ_REDEFINE         = 'ERROR_UZ_REDEFINE';
  sERROR_UZ_SIZE_SET         = 'ERROR_UZ_SIZE_SET';
  sERROR_GKEY_REDEFINE       = 'ERROR_GKEY_REDEFINE';
  sERROR_GKEY_SIZE_SET       = 'ERROR_GKEY_SIZE_SET';
  sERROR_GKEY_ICMP_SET       = 'ERROR_GKEY_ICMP_SET';
  sERROR_KEYC_REDEFINE       = 'ERROR_KEYC_REDEFINE';
  sERROR_KEYC_SIZE_SET       = 'ERROR_KEYC_SIZE_SET';
  sERROR_KEYC_ICMP_SET       = 'ERROR_KEYC_ICMP_SET';
  sERROR_NUM_REDEFINE        = 'ERROR_NUM_REDEFINE';
  sERROR_NUM_SIZE_SET        = 'ERROR_NUM_SIZE_SET';
  sERROR_NUMP_REDEFINE       = 'ERROR_NUMP_REDEFINE';
  sERROR_NUMP_SIZE_SET       = 'ERROR_NUMP_SIZE_SET';
  sERROR_CKEYD_REDEFINE      = 'ERROR_CKEYD_REDEFINE';
  sERROR_CKEYD_SIZE_SET      = 'ERROR_CKEYD_SIZE_SET';
  sERROR_CKEYD_NUM_SET       = 'ERROR_CKEYD_NUM_SET';
  sERROR_CKEYD_ICMP_SET      = 'ERROR_CKEYD_ICMP_SET';
  sERROR_CKEYDI_REDEFINE     = 'ERROR_CKEYDI_REDEFINE';
  sERROR_CKEYDI_SIZE_SET     = 'ERROR_CKEYDI_SIZE_SET';
  sERROR_CKEYDI_NUMP_SET     = 'ERROR_CKEYDI_NUMP_SET';
  sERROR_CKEYDI_ICMP_SET     = 'ERROR_CKEYDI_ICMP_SET';
  sERROR_INIGAMMA_STATUS     = 'ERROR_INIGAMMA_STATUS';
  sERROR_INIGAMMASP_SET      = 'ERROR_INIGAMMASP_SET';
  sERROR_INIGAMMASP_OVERFLOW = 'ERROR_INIGAMMASP_OVERFLOW';
  sERROR_NUM_ASCII_NUMBER    = 'ERROR_NUM_ASCII_NUMBER';
  sERROR_NUM_ICMP_SET        = 'ERROR_NUM_ICMP_SET';
  sERROR_NUMP_ASCII_NUMBER   = 'ERROR_NUMP_ASCII_NUMBER';
  sERROR_NUMP_ICMP_SET       = 'ERROR_NUMP_ICMP_SET';
  sERROR_GOST_KMT_STATUS     = 'ERROR_GOST_KMT_STATUS';
  sERROR_RND_TEST_STATUS     = 'ERROR_RND_TEST_STATUS';
  sDRIVER_OPEN_ERROR         = 'DRIVER_OPEN_ERROR';
  sERROR_CANT_RESET_KEY      = 'ERROR_CANT_RESET_KEY';
  sERR_UNSUPPORTED           = '������� �� ��������������.';
  sERR_CONNECT               = '���������� �� ���������� ��� ������.';
  sERR_NO_CARRIER            = '���������� �������� � �����������.';
  sERR_INVALID_MEDIA         = '�����. �� ����� �������������� � �������� ��������� ��� ������. �����. ��������.';
  sERR_WRITE_PROTECT         = '�������� ������� �� ������.';
  sERR_INVALID_PASSWD        = '������ ������������ ������.';
  sERR_CANCEL                = '����� �� ���������� ��������.';
  sERR_FULL                  = '��� ����� �� ��������.';
  sERR_VERSION_1             = '������ ������ 5.0 �� ��������������.';
  // ��� ������
  sERR_SECRKEYNOTFOUND       = '��������� ����� ���������� �� �������.';
  sERR_NO_SECRPATH           = '������� ������� ��� ��������� ������ �� ������';
  sERR_NO_BASEPATH           = '������� ������� ��� ������������ �������� ������ �� ������';
  sERR_BAD_INIT              = '���������� ������ ������������� ������� ����';
  sERR_BAD_SPR               = '������ � ����������� �������� ������ � ����������� - ���� �� ������ �������';
  sERR_BAD_SER               = 'C���� ��������� ����� �� ��������� � ������ �����������';
  sERR_LOCK_COMPROMAT        = '�������� ���� ���������������� � ������������ ��� �������� � �����������';

  // ��������� ���������� �������� �������
  CORRECT             = 0;
  NOT_CORRECT         = 1;
  OKEY_NOT_FOUND      = 2;

  SIGN_TAIL_LEN       = 11;
  FILE_SIGN_LEN       = 87;
  MEM_TITLE_LEN       = 37;
  FILE_KEY_LEN        = 48;
  KEY_IN_FILE_LEN     = 48;
  NAME_LEN            = 12;
  ALIAS_LEN           = 120;

  //��� �����
  KEY_TYPE_WORK       = ' '; // �������
  KEY_TYPE_RESERV     = 'R'; // ���������
  KEY_TYPE_COMPROMAT  = 'C'; // �������������������

  //������ �����
  KEY_STAT_OK         = 0; // Ok
  KEY_STAT_BADHASH    = 1; //
  KEY_STAT_BADSER     = 2; //C���� ��������� ����� �� ��������� � ������ �����������
  KEY_STAT_BADIMM     = 4; //�������� ������������ �� �������� ����
  KEY_STAT_NOIMM      = 8; //��� ������������ �� �������� ����
  NUM_KEY_LENGTH      = 4;  // ����� ������
  NUM_SIGN_LENGTH     = 2;  // ����� ��������� ��������� ����� �������
  SERIA_KEY_LENGTH    = 6;  // ����� �����
  LFX_ID_LENGTH       = NUM_KEY_LENGTH+SERIA_KEY_LENGTH+NUM_SIGN_LENGTH; // ����� �������������� ��������� ����� �������
  PUB_ID_LENGTH       = NUM_KEY_LENGTH+SERIA_KEY_LENGTH; // ����� �������������� ��������� ����� ����������
  SERTIFICAT_LENGTH   = {$IFDEF Verba50} 304 {$ELSE} 240 {$ENDIF} ;
  SERTIFICAT_LENGTH_42= 240;
  MAX_SIGNS           = 255; // ������������ ���-�� ��� ��� ������
  cRazd               = '�';

  cNumWordInHash      = 32;

Type
  T32bit = Cardinal;
  T16bit = Word;
  T8bit  = Byte;
  LPSTR  = PChar;

  P8bit  = ^T8bit;
  P16bit = ^T16bit;
  pP16bit = ^P16bit;
  P32bit = ^T32bit;
  TLen   = T32bit;
  PLen   = ^TLen;

  Check_Status = Record
          Name : Array [0..NAME_LEN] Of Char;
          Alias : Array [0..ALIAS_LEN] Of Char;
          Position : T8bit;
          Status : T8bit;
          Date : T32bit;
   End;
  TSprList = Record
          key_id : Array [0..LFX_ID_LENGTH] Of Char;
          key_type : Byte;
          key_status : Byte;
   End;
  Tsign_info = Record
      key_id : Array [0..LFX_ID_LENGTH] Of Char;
      reg_num : Array [0..7] Of Char;
  End;
  PSign_info=^Asign_info;
  Asign_info = Array [0..0] Of Tsign_info;

  pCheck_Status=^ACheck_Status;
  ACheck_Status = Array [0..0] Of Check_Status;
  pSprList=^ASprList;
  ASprList = Array [0..0] Of TSprList;
  pAT16Bit = ^AT16Bit;
  AT16Bit = Array [0..0] Of T16Bit;
Type
  TAFName = Array [0..0] Of Char;

  TKey = Array [0..LFX_ID_LENGTH] Of Char;
  TSeria = Array [0..SERIA_KEY_LENGTH] Of Char;
  TSKey = String[LFX_ID_LENGTH];
  TSSeria = String[SERIA_KEY_LENGTH];
  TSNum = String[NUM_KEY_LENGTH];
  TSSignNum = String[NUM_SIGN_LENGTH];
  TSCryptoNum = String[NUM_KEY_LENGTH+SERIA_KEY_LENGTH];
  TAlias = Array [0..ALIAS_LEN] Of Char;
  PTHash = ^THash;
  THash = Array [0..Pred(cNumWordInHash)] Of Byte;


type
   PUSR_KEYS_INFO = ^USR_KEYS_INFO;
   _USR_KEYS_INFO = packed record
      num: array[1..11] of char;
      nump: array[1..13] of char;
      keys_status: T16bit;
      version_high: T8bit;
      version_low: T8bit;
      KeySlotNumber: T32bit;
   end;
   USR_KEYS_INFO = Array [0..15] Of _USR_KEYS_INFO;

   PUSR_KEYS_INFO_EX = ^USR_KEYS_INFO_EX;
   _USR_KEYS_INFO_EX = packed record
      num: array[1..11] of char;
      nump: array[1..13] of char;
      keys_status: T16bit;
      version_high: T8bit;
      version_low: T8bit;
      KeySlotNumber: T32bit;
      alg: PChar;
      Reserved: T32bit;
   end;
   USR_KEYS_INFO_EX = Array [0..15] Of _USR_KEYS_INFO_EX;

//*====================================================================*/
//*  �������� � ��������� ������������� ����� �� ������� ��������      */
//*====================================================================*/
//* key_dev - ��������� ��� ������ �  ������ ��������� ����������      */
//* key_id - ��������� ��� ������ �  ��������������� (11 ��� 13 ����)  */
//* S_or_E  - ������ ���� ����� ('S' ��� 'E')                          */
//*====================================================================*/
   function GetKeyID (key_dev: LPSTR; key_id:LPSTR; S_or_E: Char):T16bit;
   stdcall; external cDLLFn name 'GetKeyID';
//*=========================================================*/
//* ������������������� ��� ������ � ��������.              */
//* key_dev - ������ � ������ ��������� ����������          */
//* window_enable - ���������� (!0) ��� ���������� (0)      */
//*  ������ ���� ������������� ���.                         */
//*=========================================================*/
   function InitRndm (key_dev:LPSTR; window_enable: Integer):T16bit;
   stdcall; external cDLLFn name 'InitRndm';
//*=========================================================*/
//* ��������� ����� � ������� ASYNCR                        */
//* key_dev - ������ � ������ ��������� ����������          */
//* key_ID  - ������������� ����� ��� ������ ������ ("")    */
//*=========================================================*/
   function InitKey (key_dev: LPSTR; key_ID:LPSTR):T16bit;
   stdcall; external cDLLFn name 'InitKey';
//*=========================================================*/
//* ��������� ����� �� �������� ASYNCR                      */
//* key_ID  - ������������� �����                           */
//*=========================================================*/
   function ResetKey (key_ID: LPSTR):T16bit;
   stdcall; external cDLLFn name 'ResetKey';
//*=========================================================*/
//* ��������� ����� �� �������� ASYNCR                      */
//* key_ID - ������������� �����                            */
//* flag   - ������� ����������� �������� ����� �� "�����"0 */
//* FALSE-�������� ���������, TRUE-���������                */
//*=========================================================*/
   function ResetKeyEx (key_ID:LPSTR; flag: Boolean):T16bit;
   stdcall; external cDLLFn name 'ResetKeyEx';
//*=========================================================*/
//* �������� ������ ������, ����������� � ������� ASYNCR    */
//* keys_info - ��������� �� ������ �������� � �����������  */
//* � ������������ ������                                   */
//* nKeySlots - ���������� ����������� �������� "������"    */
//* �������� ASYNCR                                         */
//*=========================================================*/
   function GetDrvInfo (keys_info: PUSR_KEYS_INFO; nKeySlots: P32bit):T16bit;
   stdcall; external cDLLFn name 'GetDrvInfo';
//*=========================================================*/
//* �������� ������ ������, ����������� � ������� ASYNCR    */
//* keys_info - ��������� �� ������ �������� � �����������  */
//* � ������������ ������                                   */
//* nKeySlots - ���������� ����������� �������� "������"    */
//* �������� ASYNCR                                         */
//*=========================================================*/
   function GetDrvInfoEx (keys_info:USR_KEYS_INFO_EX; nKeySlots: P32bit):T16bit;
   stdcall; external cDLLFn name 'GetDrvInfoEx';

   function WipeFile (file_name:LPSTR ):T16bit;
   stdcall; external cDLLFn name 'WipeFile';

   function SetDevParam (dev_name:LPSTR; flag:DWORD; data_leng: DWORD; data: Pointer):T16bit;
   stdcall; external cDLLFn name 'SetDevParam';

  //*==============================================================*/
  //*            �������������                                     */
  //*==============================================================*/
  //* pathToSecret - ������ ���� � ����� � ��������� ������ �������*/
  //* pathToBase   - ������ ���� � ���� �������� ������ �������    */
  //*==============================================================*/
  function SignInit(pathToSecret,pathToBase:LPSTR):T16bit;
   stdcall; external cDLLFn name 'SignInit';
  //*==============================================================*/
  //*            ����������                                        */
  //*==============================================================*/
 function SignDone:T16bit;
   stdcall; external cDLLFn name 'SignDone';
 //*====================================================================*/
 //*            �������������                                           */
 //*====================================================================*/
 //* path - ��������� �� ������ ������� ���� � ��������� ������         */
 //* base_path - ��������� �� ������ ������� ���� � �������� ������     */
 //*             NULL, ���� ����� ������������                          */
 //*====================================================================*/
  function CryptoInit(path,base_path:LPSTR):T16bit;
   stdcall; external cDLLFn name 'CryptoInit';
 //*====================================================================*/
 //*            ����������                                              */
 //*====================================================================*/
  function CryptoDone:T16bit;
   stdcall; external cDLLFn name 'CryptoDone';
//*====================================================================*/
//*            ������������ ������                                     */
//*====================================================================*/
//* file_in   - �������� ����                                          */
//* file_out  - ������������� ����                                     */
//* node_From - ���� �������������                                     */
//* node_To   - ������ ����������������� ������� �����������,          */
//* ser       - ����� �������(�����), ���� ������������ ����           */
//*====================================================================*/
function EnCryptFile(file_in,file_out:LPSTR;node_From:T16bit;node_To:P16bit;ser:LPSTR):T16bit ;
  stdcall; external cDLLFn name 'EnCryptFile';
//*====================================================================*/
//*            ������������� ������                                    */
//*====================================================================*/
//* file_in   - ������������� ����                                     */
//* file_out  - �������������� ����                                    */
//* abonent   - ����� ����������                                       */
//*====================================================================*/
function DeCryptFile(file_in,file_out:LPSTR;abonent:T16bit):T16bit;
  stdcall; external cDLLFn name 'DeCryptFile';
//*====================================================================*/
//*     �������� ������ ���������, ������� ��������� ����              */
//*====================================================================*/
//* file_name - ������������� ����                                     */
//* abonents  - ����� �����������                                      */
//* user_list - ������ ���������                                       */
//* ser       - ����� �������(�����), ������ ��������� ����            */
//*====================================================================*/
function GetCryptKeysF(file_name:LPSTR; abonents:P16bit;user_list:pP16bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetCryptKeysF';
//*==============================================================*/
//*        ��������� ���� ������� �������� � ������              */
//*==============================================================*/
//*   path    - ������ ���� � ����� � ��������� ������ �������   */
//*==============================================================*/
function SignLogIn(path:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignLogIn';
//*==============================================================*/
//*        ������� ���� ������� �� ������                        */
//*==============================================================*/
function SignLogOut:T16bit;
  stdcall; external cDLLFn name 'SignLogOut';
//*==============================================================*/
//*         �������� �������� �� �����                           */
//*==============================================================*/
//* file_name - ������ ��� �����                                 */
//* count     - ���-�� ��������� ��������                        */
//*             (-1)  - ������� ��� �������                      */
//*==============================================================*/
function DelSign(file_name:LPSTR;count:T8bit):T16bit;
  stdcall; external cDLLFn name 'DelSign';
//*==============================================================*/
//*                         ������� �����                        */
//*==============================================================*/
//* src_file_name- ��� �������������� �����                      */
//* dst_file_name- ��� ������������ �����                        */
//* name     - ������������� ��������                            */
//*==============================================================*/
function SignFile(src_file_name,dst_file_name,name:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignFile';
//*==============================================================*/
//*         �������� ������� ��� ������                          */
//*==============================================================*/
//* file_name - ������ ��� �����                                 */
//* count     - ����� ������������ ��������                      */
//* stat_array- ������ ����������� �������� ������ �������       */
//*==============================================================*/
function check_file_sign(file_name:LPSTR;count:P8bit;stat_array:pCheck_Status):T16bit;
  stdcall; external cDLLFn name 'check_file_sign';
//*==============================================================*/
//*         �������� ������� ��� ������ (�����������)            */
//*==============================================================*/
//* file_name - ������ ��� �����                                 */
//* open_keys_array - ��������� �� ������ ���������� �� �������� ����� */
//* open_keys_quantity - ���������� �������� ������              */
//* count     - ����� ������������ ��������                      */
//* stat_array- ������ ����������� �������� ������ �������       */
//*==============================================================*/
function check_file_sign_ex(file_name:LPSTR;open_keys_array:Pointer;open_keys_quantity:T32bit;
         count:P8bit;stat_array:pCheck_Status):T16bit;stdcall; external cDLLFn name 'check_file_sign_ex';
//*==============================================================*/
//*   ��������� ���������� � ����������� ����� (��� 32-� ��������� ���������)
//*==============================================================*/
// (i) name -��������� �� ������ � ������ ������������ �����;
// (i/o) info - ��������� �� ������ �������� ������ �� ������� ������� �� ���� �����:
//   ������ � ��������������� �����, �� ������� ���� ������������ ������� �
//   ������ � ��������������� ������� ���������� ����
// (i/o) sign_quantity -��������� �� ����������, � ������� ������������ ����� ������������ ��������.
function GetFileSignInfo(name:LPSTR;info:Psign_info;sign_quantity:P32bit):T16bit;
  stdcall; external cDLLFn name 'GetFileSignInfo';
//*==============================================================*/
//*   ��������� ���������� � ����������� ����� ������
//*==============================================================*/
function GetMemSignInfo(block:Pointer;leng:TLen;info:Psign_info;sign_quantity:P32bit):T16bit;
  stdcall; external cDLLFn name 'GetMemSignInfo';
//*==============================================================*/
//*  ���������� ������ �������������� �����������                */
//*==============================================================*/
//* lpMemory - ��������� ���������� � �������� GetCryptKeysF,    */
//*  GetCryptKeysM.                                              */
//*==============================================================*/
procedure FreeMemory (lpMemory:Pointer);
  stdcall; external cDLLFn name 'FreeMemory';
//*==============================================================*/
//* ������� ����� � ���������� ������� � ��������� ����          */
//*==============================================================*/
//* src_file_name - ��� �������������� �����                     */
//* name          - ������������� ��������                       */
//* sign_file     - ��� ����� � ���������                        */
//*==============================================================*/
function SignFileSeparate(src_file,name,sign_file:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignFileSeparate';
//*==============================================================*/
//* �������� ������� ��� ������ ��� �������� �������� � ���������*/
//*   �����                                                      */
//*==============================================================*/
//* file_name - ��� �����                                        */
//* count     - ����� ������������ ��������                      */
//* stat_array- ������ ����������� �������� ������ �������       */
//* sign_file - ��� ����� � ���������                            */
//*==============================================================*/
function CheckFileSeparate(file_name:LPSTR;count:P8bit;stat_array:pCheck_Status;sign_file:LPSTR):T16bit;
  stdcall; external cDLLFn name 'CheckFileSeparate';
//*==============================================================*/
//*              ������� ����� ������                            */
//*==============================================================*/
//* block    - ��������� �� ���� ������������� ������            */
//*      ������ ��� ���� �.�. �������� � ������� ��� �������     */
//*      leng + SIGN_TAIL_LEN + FILE_SIGN_LEN ��� ������ ������� */
//*      leng + FILE_SIGN_LEN ��� ����� ����������� �������      */
//*      SIGN_TAIL_LEN = 11;                                     */
//*      FILE_SIGN_LEN = 87;                                     */
//* leng     - �����  ������������� ����������                   */
//* name     - ������������� ����� �������                       */
//*==============================================================*/
function SignMem(block:Pointer;leng:TLen;name:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignMem';
//*==============================================================*/
//*         �������� ������� ��� ������ ������                   */
//*==============================================================*/
//* block     - ��������� �� ���� ������                         */
//* leng      - �����  �����                                     */
//* count     - ����� ������������ ��������                      */
//* stat_array- ������ ����������� �������� ������ �������       */
//*==============================================================*/
function check_mem_sign(block:Pointer;leng:TLen;count:P8bit;stat_array:pCheck_Status):T16bit;
  stdcall; external cDLLFn name 'check_mem_sign';
//*==============================================================*/
//*         �������� �������� �� ������                          */ !!!!!!!!!
//*==============================================================*/
//* block - ��������� �� ���� ������                             */
//* leng  - ����� �����                                          */
//* count - ���-�� ��������� ��������                            */
//*             (-1)  - ������� ��� �������                      */
//*==============================================================*/
function Del_Mem_Sign(block:Pointer;leng:PLen;count:T8bit):T16bit;
  stdcall; external cDLLFn name 'Del_Mem_Sign';
//*==============================================================*/
//* ������� ����� ������ � ���������� ������� � ��������� ����   */
//*==============================================================*/
//* block           - ���� ������������� ������;                 */
//* leng - ����� �������������� ����� ������                     */
//* sign_block_leng - ����� �������� ���������� � ����� �        */
//* ���������;                                                   */
//* sign_block      - ���� ������, ��� �������� �������;         */
//* name     - ������������� ����� �������                       */
//* � ���� ��� �������� ����� �������� ���������� ������         */
//* SIGN_TAIL_LEN + FILE_SIGN_LEN ��� ������ ������� �           */
//* FILE_SIGN_LEN ��� ����������� ��������.                      */
//* ��� ������ ������������ ����� ������ �������� sign_block_leng*/
//* ������ ���� ����� ����, ��� ����������� -                    */
//* - SIGN_TAIL_LEN + (FILE_SIGN_LEN*n).                         */
//*==============================================================*/
function SignMemSeparate(block:Pointer;leng,sign_block_leng:TLen;name:LPSTR;sign_block:Pointer):T16bit;
  stdcall; external cDLLFn name 'SignMemSeparate';
//*==============================================================*/
//* �������� ������� ��� ������ ������ ��� �������� �������� �   */
//* ��������� �����                                              */
//*==============================================================*/
//* block - ��������� �� ���� ������                             */
//* leng - ����� ����� ������                                    */
//* sign_block_leng - ����� ����� � ���������                    */
//* count     - ����� ������������ ��������                      */
//* stat_array- ������ ����������� �������� ������ �������       */
//* block - ��������� �� ���� ������ � ���������                 */
//*==============================================================*/
function CheckMemSeparate(block:Pointer;leng,sign_block_leng:TLen;count:P8bit;
                          stat_array:pCheck_Status;sign_block:Pointer):T16bit;
  stdcall; external cDLLFn name 'CheckMemSeparate';
//*==============================================================*/
//*            ���������� ��� ������� �����                      */
//*==============================================================*/
//* file_name - ������ ��� �����                                 */
//* h_out - ��������� �� ������ ��� �������� 8-� ���� T32bit     */
//*==============================================================*/
function HashFile(file_name:LPSTR;h_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'HashFile';
//*==============================================================*/
//*            ���������� ��� ������� ����� ������               */
//*==============================================================*/
//* block - ��������� �� ���� ������                             */
//* leng - ����� ����� ������                                    */
//* h_out - ��������� �� ������ ��� �������� 8-� ���� T32bit     */
//*==============================================================*/
function HashMem(buff:Pointer;leng:TLen;h_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'HashMem';
//*=========================================================*/
//*  �������� ��������� �������� ��������� ����� �� ���     */
//*  ��������������                                         */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key_ID - ������������� ��������� �����             */
//* Alias - ��������� �������� ��������� ����� (121 ����)   */
//*=========================================================*/
function GetAlias(base_dir,open_key_ID,Alias:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetAlias';
//*=========================================================*/
//*  �������� ������������� ��������� ����� �� ���          */
//*  ��������� ���������                                    */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key_ID - ������������� ��������� �����             */
//* Alias - ��������� �������� ��������� �����              */
//* ser - ����� �����������                                 */
//* S_or_E - ��� ��������� ����� ( 'S' - �������� ����      */
//* ������� ; 'E'- �������� ���� ���������� )               */
//*=========================================================*/
function GetID(base_dir,Alias,ser:LPSTR;S_or_E:char;open_key_ID:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetID';
//*  �������� ������������� ����� ������� ������������� � �������*/
//*==============================================================*/
//* curr_id - ��������� ��� ������ � 10-�������� ��������������� */
//* S_or_E  - ������ ���� ����� (������ ���� ����� 'S' )         */
//*==============================================================*/
function GetCurrID(curr_id:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'GetCurrID';
//*==============================================================*/
//*  �������� � ��������� ������������� ����� ������� � �������  */
//*==============================================================*/
//* flop_id - ��������� ��� ������ � 10-�������� ��������������� */
//* S_or_E  - ������ ���� ����� (������ ���� ����� 'S' )         */
//*==============================================================*/
function GetFlopID(flop_id:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'GetFlopID';
//*=========================================================*/
//*  �������� ������ ������ � �����������                   */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* ser - ����� �����������                                 */
//* list - ��������� �� ������ ������                       */
//* num - ���������� ������ � �����������                   */
//* S_or_E - ��� �����������                                */
//*=========================================================*/
function SprList(base_dir,ser:LPSTR;list:pSprList;num:P16bit;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'SprList';
//*=========================================================*/
//* ��������� �������� ���� � �����������                   */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key_ID - ������������� ��������� �����             */
//* my_ID - ���� ������������� �����                        */
//* S_or_E - ��� ��������� �����                            */
//*=========================================================*/
function CheckOpenKey(base_dir,open_key_ID,my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'CheckOpenKey';
//*=========================================================*/
//* ��������� �������� ���� � �������� ���������� �������   */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* ser - ����� �����������                                 */
//* num - ���������� ����� ��������� ����� � �����������    */
//* my_ID - ���� ������������� �����                        */
//* S_or_E - ��� ��������� �����                            */
//*=========================================================*/
function CheckKeyByNum(base_dir,ser:LPSTR;num:T16bit;my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'CheckKeyByNum';
//*=========================================================*/
//*  ��������� ���������� �������� ������                   */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* ser - ����� �����������                                 */
//* list - ������ ������                                    */
//* num - ���������� ������ � �����������                   */
//* S_or_E - ��� �����������                                */
//*=========================================================*/
function CheckSpr(base_dir,ser:LPSTR;list:pSprList;num:P16bit;my_ID:LPSTR;s_or_e:char):T16bit;
  stdcall; external cDLLFn name 'CheckSpr';
//*=========================================================*/
//* ��������� ���-������� ��������� �����                   */
//* open_key - ����� ���  ��������� �����                   */
//* hash_adr - ����� ���  ���-������� ��������� �����       */
//*=========================================================*/
function CheckKeyHash(open_key,hash_adr:Pointer):T16bit;
  stdcall; external cDLLFn name 'CheckKeyHash';
//*=========================================================*/
//*  �������� �������� ���� �� �����������                  */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key_ID - ������������� ��������� �����             */
//* key - ��������� �� ����� ��� ��������� �����(240 ���� ��� ����� ������ 4.2 ��� 304 ����� ��� ������ 5.0)  */
//*=========================================================*/
function ExtractKey(base_dir,open_key_ID:LPSTR;key:Pointer):T16bit;
  stdcall; external cDLLFn name 'ExtractKey';
//*====================================================================*/
//*        �������� ������������� ����� ��������, �������������� ����  */
//*====================================================================*/
//* path - ���� � �������������� �����                                 */
//* sender_id - ��������� ��� ������ � 10-�������� ���������������     */
//*====================================================================*/
function GetFileSenderID(path,sender_id:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetFileSenderID';
//*====================================================================*/
//*            ������������� ����� ������                              */
//*====================================================================*/
//* buffer - ��������� �� ����� ��� �������������                      */
//* leng   - ����� ����� ������                                        */
//* abonent- ����� ����������                                          */
//*====================================================================*/
function DeCryptMem(buffer:Pointer;leng:PLen;abonent:T16bit):T16bit;
  stdcall; external cDLLFn name 'DeCryptMem';
//*====================================================================*/
//*                     ������������ ����� ������                      */
//*====================================================================*/
//* in_mem_buf - ��������� �� ���� ��������� ������                    */
//* length   - ����� �����                                             */
//* out_mem_buf- ��������� �� ���� ������������� ������                */
//*              �.�. ������� (�����_���������� + MEM_TITLE_LEN +      */
//*              + FILE_KEY_LEN * Abonents), ���                       */
//*              MEM_TITLE_LEN == 37                                   */
//*              FILE_KEY_LEN  == 48                                   */
//*              Abonents      == ����� �����������                    */
//* node_From- ���� �������������                                      */
//* node_To  - ������ ����������������� ������� �����������,           */
//* ser      - ����� �������(�����), ���� ������������ ����            */
//*====================================================================*/
function EnCryptMem(in_mem_buf:Pointer;leng:TLen;out_mem_buf:Pointer;node_From:T16bit;
                    node_To:P16bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'EnCryptMem';
//*====================================================================*/
//*  �������� ������������� ����� ��������, �������������� ���� ������ */
//*====================================================================*/
//* mem_block ��������� �� ���� ������������� ������                   */
//* leng - ����� �����                                                 */
//* sender_id - ��������� ��� ������ � 10-�������� ���������������     */
//*====================================================================*/
function GetMemSenderID (mem_block:Pointer;leng:TLen;sender_id:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetMemSenderID';
//*====================================================================*/
//*     �������� ������ ���������, ������� ��������� ���� ������       */
//*====================================================================*/
//* block     - ������������� ����                                     */
//* leng      - ����� �����                                            */
//* abonents  - ����� �����������                                      */
//* user_list - ������ ���������                                       */
//* ser       - ����� �������(�����), ������ ��������� ����            */
//*====================================================================*/
function GetCryptKeysM(block:Pointer;leng:TLen;abonents:P16bit;user_list:pP16bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetCryptKeysM';
//*=========================================================*/
//*         �������� �������� ���� � ����������             */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key - ��������� �� ���� ������ � �������� ������   */
//* my_ID    - ������������� ���������� ����� �������       */
//* (����������) ��������  ( "����" ������������� )         */
//* S_or_E - ��� ��������� �����                            */
//*=========================================================*/
function AddOpenKey (base_dir:LPSTR;open_key:Pointer;my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'AddOpenKey';
//*=========================================================*/
//* ������� �������� ���� ��  �����������                   */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key_ID - ������������� ��������� �����             */
//* my_ID - ���� ������������� �����                        */
//* S_or_E - ��� ��������� �����                            */
//*=========================================================*/
function DelOpenKey (base_dir:LPSTR;open_key:LPSTR;my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'DelOpenKey';
//*=========================================================*/
//* ������� ��� ��������� ����� � ����������� � ����������  */
//* �� �������                                              */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* open_key_ID - ������������� ��������� �����             */
//* my_ID - ���� ������������� �����                        */
//* S_or_E - ��� ��������� �����                            */
//*=========================================================*/
function Res2Work(base_dir,open_key_ID,my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'Res2Work';
//*=========================================================*/
//* ��������� ���������� �������� ������                    */
//* base_dir - ������� ���� � ����������� �������� ������   */
//* ser - ����� �����������                                 */
//* my_ID - ���� ������������� �����                        */
//* S_or_E - ��� ����������� �������� ������                */
//*=========================================================*/
function SignSpr(base_dir,ser,my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'SignSpr';
//*====================================================================*/
//*        �����������/����������� ����� ������ �� ������              */
//*====================================================================*/
//* in_buff - ��������� �� ��������� ���� ������                       */
//* leng - ����� ����� ������                                          */
//* out_buff - ��������� �� ���������� ���� ��� ������������� ������   */
//* (����� �������������� ����� ����� ����� ��������� �����)           */
//* password - ��������� �� 32-� �������� ������                       */
//*====================================================================*/
function EncryptMemOnPassword(in_buff:Pointer;leng:TLen;out_buff,password:Pointer):T16bit;
  stdcall; external cDLLFn name 'EncryptMemOnPassword';

//*====================================================================*/
//*        �������� ������������������ ��������� ����                  */
//*====================================================================*/
//* buff- ��������� �� ����� ��� ��������� ������������������          */
//* rnd_size - ����� ��������� ������������������                      */
//*====================================================================*/
function Rndm(buff:Pointer;rnd_size:TLen):T16bit;
  stdcall; external cDLLFn name 'Rndm';
//*====================================================================*/
//*        ��������� ������������ ����� �� GK                          */
//*====================================================================*/
//* path - ���� � �����                                                */
//* my_ID - ��������� �� 10-�������� ������������� ����� ����������    */
//*                                                           �������� */
//* imito_out - ��������� ��� 4-� �������� ������������                */
//*====================================================================*/
function ImitoFileOnGk(path,my_ID:LPSTR;imito_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'ImitoFileOnGk';
//*====================================================================*/
//*        ��������� ������������ ����� �� ������ ����� �����          */
//*====================================================================*/
//* path - ���� � �����                                                */
//* From - ����� �����������                                           */
//* To   - ����� ����������                                            */
//* imito_out - ��������� ��� 4-� �������� ������������                */
//* ser       - ����� �������(�����)                                   */
//*====================================================================*/
function ImitoFile(path:LPSTR;From,To_:T16bit;imit_out:P32bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'ImitoFile';
//*====================================================================*/
//*       ������ ���������� �����                                      */
//*====================================================================*/
// ���������� � ������� �����: $03 - ��� 4.2, � $05 - ��� 5.0          */
//*====================================================================*/
function Version:Word;
  stdcall; external cDLLFn name 'version';
//*====================================================================*/
//*       ������������� ��������� ����� � �����������                  */
//*====================================================================*/
//* base_dir - ������� ���� � ����������� �������� ������              */
//* open_key_ID - ������������� ��������� �����                        */
//* S_or_E - ��� ��������� �����                                       */
//*====================================================================*/
function OpenKeyCompromise(base_dir,open_key_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'OpenKeyCompromise';

// My function
function DecodeERRV0(N:Integer):String;
function DecodeStatus(N:T8bit):String;

implementation

Const
  cErrNum =56+54+1+6+9+9;
  cErrStrLen=80;
  cStrErrArr : Array [1..cErrNum] Of String[cErrStrLen] =(sNO_ERROR,sE_NO_MEM,sE_CONTROL,sE_DRIVER,sE_IMMITO,
               sE_KEY_NOT_FOUND,sE_PARAM,sE_INIT,sE_MEM_LENGTH,sE_MEM_NOT_ENCRYPTED,sE_MEM_NOT_SIGNED,
               sE_OPEN_IN_FILE,sE_OPEN_OUT_FILE,sE_WRITE_FILE,sE_READ_FILE,sE_RENAME_FILE,sE_FILE_LENGTH,
               sE_SRC,sE_FILE_NOT_ENCRYPTED,sE_FILE_NOT_SIGNED,sE_SEEK,sE_CLOSE,sE_DELETE_FILE,sERR_NUMP,
               sERR_HASH,sERR_OPEN_SPR,sERR_OPEN_IMM,sERR_UZ,sERR_CKD,sERR_IMM_SPR,sERR_READ_SPR,sERR_WRITE_SPR,
               sERR_READ_IMM,sERR_IMM,sERR_COMPROM,sERR_CRE_DIR,sERR_CRE_FILE,sERR_EXIST_SPR,sERR_WRITE_IMM,
               sERR_NO_KEY,sERR_LENGTH,sERR_OPEN_TMP,sERR_SPR_EMPTY,sERR_KEY_HEAD,sERR_FIND_SPR,sERR_NO_RES,
               sERR_IMM_HEAD,sERR_NO_SIGN,sERR_NO_IMM,sERR_FLOP,sERR_SECRKEYNOTFOUND,
               sERR_NO_SECRPATH,sERR_NO_BASEPATH,sERR_BAD_INIT,sERR_BAD_SPR,sERR_BAD_SER,
               sASR_ERRRO_NUMBER_BEGIN,sASR_ERRRO_NUMBER_END,sASR_DRIVER_ERROR,sERROR_CHECK_SUM,
               sDLL_BUFFER_ERROR,sERROR_OUTPUT_SIZE,sERROR_GET_KEY_INPUT_SIZE,sERROR_GET_KEY_INPUT_CHECK,
               sERROR_GET_KEY_COMMAND,sERROR_SET_KEY_INPUT_SIZE,sERROR_SET_KEY_INPUT_CHECK,sERROR_SET_KEY_COMMAND,
               sERROR_CKDI_NOT_SET,sERROR_TGKEY_NOT_SET,sERROR_GKEY_NOT_SET,sERROR_CKD_NOT_SET,
               sERROR_NUM_NOT_SET,sERROR_NUMP_NOT_SET,sERROR_KEYC_NOT_SET,sERROR_UZ_NOT_SET,
               sERROR_DMASK_NOT_SET,sERROR_DMASK_REDEFINE,sERROR_DMASK_SIZE_SET,sERROR_UZ_REDEFINE,
               sERROR_UZ_SIZE_SET,sERROR_GKEY_REDEFINE,sERROR_GKEY_SIZE_SET,sERROR_GKEY_ICMP_SET,
               sERROR_KEYC_REDEFINE,sERROR_KEYC_SIZE_SET,sERROR_KEYC_ICMP_SET,sERROR_NUM_REDEFINE,
               sERROR_NUM_SIZE_SET,sERROR_NUMP_REDEFINE,sERROR_NUMP_SIZE_SET,sERROR_CKEYD_REDEFINE,
               sERROR_CKEYD_SIZE_SET,sERROR_CKEYD_NUM_SET,sERROR_CKEYD_ICMP_SET,sERROR_CKEYDI_REDEFINE,
               sERROR_CKEYDI_SIZE_SET,sERROR_CKEYDI_NUMP_SET,sERROR_CKEYDI_ICMP_SET,sERROR_INIGAMMA_STATUS,
               sERROR_INIGAMMASP_SET,sERROR_INIGAMMASP_OVERFLOW,sERROR_NUM_ASCII_NUMBER,sERROR_NUM_ICMP_SET,
               sERROR_NUMP_ASCII_NUMBER,sERROR_NUMP_ICMP_SET,sERROR_GOST_KMT_STATUS,sERROR_RND_TEST_STATUS,
               sDRIVER_OPEN_ERROR,sERROR_CANT_RESET_KEY,sERR_LOCK_COMPROMAT,
               sERR_SPR_NOT_FOUND,sERR_BAD_KEY,sERR_PACK_BUF,sERR_OTHER_IMM_KEY,sERR_BAD_KEY_TYPE,sERR_ANOTHER_CARRIER,
               sE_GK,sE_KS,sE_DEVICE,sE_REDEFINE,sE_NO_FREE_SLOTS,sE_KEY_NOT_SET,sE_GK_R,sE_GK_W,sERR_UNSUPPORTED_FORMAT,
               sERR_UNSUPPORTED,sERR_CONNECT,sERR_NO_CARRIER,sERR_INVALID_MEDIA,sERR_WRITE_PROTECT,sERR_INVALID_PASSWD,
               sERR_CANCEL,sERR_FULL,sERR_VERSION_1
               );
  cIntErrArr : Array [1..cErrNum] Of Integer =(NO_ERROR,E_NO_MEM,E_CONTROL,E_DRIVER,E_IMMITO,E_KEY_NOT_FOUND,
               E_PARAM,E_INIT,E_MEM_LENGTH,E_MEM_NOT_ENCRYPTED,E_MEM_NOT_SIGNED,E_OPEN_IN_FILE,E_OPEN_OUT_FILE,
               E_WRITE_FILE,E_READ_FILE,E_RENAME_FILE,E_FILE_LENGTH,E_SRC,E_FILE_NOT_ENCRYPTED,E_FILE_NOT_SIGNED,
               E_SEEK,E_CLOSE,E_DELETE_FILE,ERR_NUMP,ERR_HASH,ERR_OPEN_SPR,ERR_OPEN_IMM,ERR_UZ,ERR_CKD,ERR_IMM_SPR,
               ERR_READ_SPR,ERR_WRITE_SPR,ERR_READ_IMM,ERR_IMM,ERR_COMPROM,ERR_CRE_DIR,ERR_CRE_FILE,ERR_EXIST_SPR,
               ERR_WRITE_IMM,ERR_NO_KEY,ERR_LENGTH,ERR_OPEN_TMP,ERR_SPR_EMPTY,ERR_KEY_HEAD,ERR_FIND_SPR,ERR_NO_RES,
               ERR_IMM_HEAD,ERR_NO_SIGN,ERR_NO_IMM,ERR_FLOP,ERR_SECRKEYNOTFOUND,
               ERR_NO_SECRPATH,ERR_NO_BASEPATH,ERR_BAD_INIT,ERR_BAD_SPR,ERR_BAD_SER,
               ASR_ERRRO_NUMBER_BEGIN,ASR_ERRRO_NUMBER_END,ASR_DRIVER_ERROR,ERROR_CHECK_SUM,
               DLL_BUFFER_ERROR,ERROR_OUTPUT_SIZE,ERROR_GET_KEY_INPUT_SIZE,ERROR_GET_KEY_INPUT_CHECK,
               ERROR_GET_KEY_COMMAND,ERROR_SET_KEY_INPUT_SIZE,ERROR_SET_KEY_INPUT_CHECK,ERROR_SET_KEY_COMMAND,
               ERROR_CKDI_NOT_SET,ERROR_TGKEY_NOT_SET,ERROR_GKEY_NOT_SET,ERROR_CKD_NOT_SET,
               ERROR_NUM_NOT_SET,ERROR_NUMP_NOT_SET,ERROR_KEYC_NOT_SET,ERROR_UZ_NOT_SET,
               ERROR_DMASK_NOT_SET,ERROR_DMASK_REDEFINE,ERROR_DMASK_SIZE_SET,ERROR_UZ_REDEFINE,
               ERROR_UZ_SIZE_SET,ERROR_GKEY_REDEFINE,ERROR_GKEY_SIZE_SET,ERROR_GKEY_ICMP_SET,
               ERROR_KEYC_REDEFINE,ERROR_KEYC_SIZE_SET,ERROR_KEYC_ICMP_SET,ERROR_NUM_REDEFINE,
               ERROR_NUM_SIZE_SET,ERROR_NUMP_REDEFINE,ERROR_NUMP_SIZE_SET,ERROR_CKEYD_REDEFINE,
               ERROR_CKEYD_SIZE_SET,ERROR_CKEYD_NUM_SET,ERROR_CKEYD_ICMP_SET,ERROR_CKEYDI_REDEFINE,
               ERROR_CKEYDI_SIZE_SET,ERROR_CKEYDI_NUMP_SET,ERROR_CKEYDI_ICMP_SET,ERROR_INIGAMMA_STATUS,
               ERROR_INIGAMMASP_SET,ERROR_INIGAMMASP_OVERFLOW,ERROR_NUM_ASCII_NUMBER,ERROR_NUM_ICMP_SET,
               ERROR_NUMP_ASCII_NUMBER,ERROR_NUMP_ICMP_SET,ERROR_GOST_KMT_STATUS,ERROR_RND_TEST_STATUS,
               DRIVER_OPEN_ERROR,ERROR_CANT_RESET_KEY,ERR_LOCK_COMPROMAT,
               ERR_SPR_NOT_FOUND,ERR_BAD_KEY,ERR_PACK_BUF,ERR_OTHER_IMM_KEY,ERR_BAD_KEY_TYPE,ERR_ANOTHER_CARRIER,
               E_GK,E_KS,E_DEVICE,E_REDEFINE,E_NO_FREE_SLOTS,E_KEY_NOT_SET,E_GK_R,E_GK_W,ERR_UNSUPPORTED_FORMAT,
               ERR_UNSUPPORTED,ERR_CONNECT,ERR_NO_CARRIER,ERR_INVALID_MEDIA,ERR_WRITE_PROTECT,ERR_INVALID_PASSWD,
               ERR_CANCEL,ERR_FULL,ERR_VERSION_1
               );

function DecodeERRV0(N:Integer):String;
Var
  I : Integer;
Begin
  for I :=1 to cErrNum do
     If N = cIntErrArr[I] Then
       Begin
         Result :=cStrErrArr[I];
         Exit;
       End;
  Result := Format('����������� ������. ��� ��������: %d (0x%.8x)',[N,N]);
  Result := '';
End;

function DecodeStatus(N:T8bit):String;
begin
{
  CORRECT       =0;
  NOT_CORRECT   =1;
  OKEY_NOT_FOUND=2;
}
  Case N Of
    CORRECT : Result :='OK';
    NOT_CORRECT : Result :='��� ��������';
    OKEY_NOT_FOUND : Result :='����������� ��� ���������������� �������� ���� ��� � ������������';
    Else Result :=Format('����������� ������ #%d',[N]);
  End;
end;


end.
