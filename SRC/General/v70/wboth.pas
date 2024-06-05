{***************************************************************************
 � ������ ������ ������� ������� ��������� WBOTH.DLL(WBOTHO.DLL)

 Copyright (C) �� �����, 2003
 ���� ���� �������� ����������,
 ���������� �������������� �� �����.

 ����� ����� ����� ����� �� ����� ���� �����������,
 ����������, ���������� �� ������ �����,
 ������������ ��� �������������� ����� ��������,
 ���������������, �������� �� ���� � ��� ��
 ����� ������������ ������� ��� ����������������
 ���������� ���������� � �� �����.

 �������� �������� �������� ����������:

  StaticDLL - ������� �������� ����������:
              ���������� - �����������
              �� ���������� - ������������

  VerbaO    - ��� ����������:
              ���������� - �����-OW
              �� ���������� - �����-W
***************************************************************************}

{$B-}

{$DEFINE StaticDLL}
{$DEFINE VerbaO}

unit WBoth;

interface

uses
  Windows, SysUtils, Classes;

Const
  txt_verba_dll     = 'WBOTH.DLL';
  txt_verba_o_dll   = 'WBOTHO.DLL';

{$IFDEF StaticDLL}
  cDllFN    = {$IFDEF VerbaO} txt_verba_o_dll {$ELSE} txt_verba_dll {$ENDIF};
{$ENDIF}

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

  // �������������
  ERR_V_CHECK         = 600;
  ERR_V_COPY_FILE     = 601;
  ERR_V_FILE_ENCMEM   = 602;
  ERR_V_FILE_DECMEM   = 603;

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
  NUM_KEY_LENGTH      = 4; // ����� ������
  NUM_SIGN_LENGTH     = 2; // ����� ��������� ��������� ����� �������
  SERIA_KEY_LENGTH    = 6; // ����� �����
  LFX_ID_LENGTH       = NUM_KEY_LENGTH+SERIA_KEY_LENGTH+NUM_SIGN_LENGTH; // ����� �������������� ��������� ����� �������
  PUB_ID_LENGTH       = NUM_KEY_LENGTH+SERIA_KEY_LENGTH;                 // ����� �������������� ��������� ����� ����������
  SERTIFICAT_LENGTH   = 304;
  SERTIFICAT_LENGTH_42= 240;
  MAX_SIGNS           = 255;      // ������������ ���-�� ��� ��� ������
  cRazd               = '�';

  HASH_LEN            = 32;
  IMITA_LEN           = 4;
  RKEY_LEN            = HASH_LEN; // ����� ����� � �������� "���������� �� ������"
  BUFF_SIZE           = 32784;    // ������ ������ ��� �������� "���������� �� ������"

Type

  T32bit  = Cardinal;
  T16bit  = Word;
  T8bit   = Byte;
  LPSTR   = PChar;
  P8bit   = ^T8bit;
  P16bit  = ^T16bit;
  pP16bit = ^P16bit;
  P32bit  = ^T32bit;
  TLen    = T32bit;
  PLen    = ^TLen;

Type

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

  TAFName = Array [0..0] Of Char;

  TKey = Array [0..LFX_ID_LENGTH] Of Char;
  TSeria = Array [0..SERIA_KEY_LENGTH] Of Char;
  TSKey = String[LFX_ID_LENGTH];
  TSSeria = String[SERIA_KEY_LENGTH];
  TSNum = String[NUM_KEY_LENGTH];
  TSSignNum = String[NUM_SIGN_LENGTH];
  TSCryptoNum = String[NUM_KEY_LENGTH+SERIA_KEY_LENGTH];
  TAlias = Array [0..ALIAS_LEN] Of Char;
  THash = Array [0..Pred(HASH_LEN)] Of Byte;
  PTHash = ^THash;
  TImita = Array [0..Pred(IMITA_LEN)] Of Byte;

  TFA = Record
    Attr : Integer;
    DT : Integer;
  End;

  TUSR_KEYS_INFO = record
    num : Array [0..11-1] Of Char;
    nump : Array [0..13-1] Of Char;
    keys_status : T32bit;
    KeySlotNumber : T32bit;
  end;
  PUSR_KEYS_INFO = ^USR_KEYS_INFO;
  USR_KEYS_INFO = Array [0..15] Of TUSR_KEYS_INFO;

{$IFDEF StaticDLL}

//*** ������� ����������� �������� *********************************************
//------------------------------------------------------------------------------
// ��������� ������ ������, ����������� � �������
//
// ���������:
// (o) Keys_Info - ��������� �� ������ �� 16 �������� USR_KEYS_INFO, ����
// ����� ���������� ���������� � ������ ��������, � ������� ���������� �����
// ��� ���������� �/��� ������� (CKD �/��� CKDI). ������ ��� ������ �������������
// �������������.
// (o) n_Key_Slot - ������������ ���������� ����������� ������ (����� ���� �����
// ����, � ��� ������, ����� ���� ����������� �������� ���� ������).
// ������� � ������ ������ �������� ���� ������ �������� Keys_Info, � �����
// ��������������� ��������� ��� ����������� � ��������� ����������� ������ �
// ������� ����������� �� �������. (� Keys_Info[0] ������������ ���������� �
// ������ ��������� ����������� �����, � Keys_Info[1] - � ������, � �. �.)
//------------------------------------------------------------------------------
function GetDrvInfo(Keys_Info:PUSR_KEYS_INFO;n_Key_Slot:P32bit):T16bit;
  stdcall; external cDLLFn name 'GetDrvInfo';
//==============================================================================
//            �������������
//==============================================================================
// pathToSecret - ������ ���� � ����� � ��������� ������ �������
// pathToBase   - ������ ���� � ���� �������� ������ �������
//==============================================================================
  function SignInit(pathToSecret,pathToBase:LPSTR):T16bit;
   stdcall; external cDLLFn name 'SignInit';
//==============================================================================
//            ����������
//==============================================================================
 function SignDone:T16bit;
   stdcall; external cDLLFn name 'SignDone';
//==============================================================================
//            �������������
//==============================================================================
// path - ��������� �� ������ ������� ���� � ��������� ������
// base_path - ��������� �� ������ ������� ���� � �������� ������
//             NULL, ���� ����� ������������
//==============================================================================
  function CryptoInit(path,base_path:LPSTR ):T16bit;
   stdcall; external cDLLFn name 'CryptoInit';
//==============================================================================
//            ����������
//==============================================================================
  function CryptoDone:T16bit;
   stdcall; external cDLLFn name 'CryptoDone';
//==============================================================================
//            ������������ ������
//==============================================================================
// file_in   - �������� ����
// file_out  - ������������� ����
// node_From - ���� �������������
// node_To   - ������ ����������������� ������� �����������,
// ser       - ����� �������(�����), ���� ������������ ����
//==============================================================================
function EnCryptFile(file_in,file_out:LPSTR;node_From:T16bit;node_To:P16bit;ser:LPSTR):T16bit ;
  stdcall; external cDLLFn name 'EnCryptFile';

{$IFDEF VerbaO}
//==============================================================================
//            ������������ ������ (�����������)
//==============================================================================
// file_in   - �������� ����
// file_out  - ������������� ����
// From - ������������� ����� ����������� ("XXXXSSSSSS")
// open_keys_array   - ������ ���������� �� �������� ����� �����������
// open_keys_quantity - ���������� �����������
//==============================================================================
function EnCryptFileEx(file_in,file_out,From:LPSTR;Open_Key_Array:Pointer;Open_Keys_Quantity:Word;Flags:T32bit):T16bit;
         stdcall; external cDLLFn name 'EnCryptFileEx';
{$ENDIF}

//==============================================================================
//            ������������� ������
//==============================================================================
// file_in   - ������������� ����
// file_out  - �������������� ����
// abonent   - ����� ����������
//==============================================================================
function DeCryptFile(file_in,file_out:LPSTR;abonent:T16bit):T16bit;
  stdcall; external cDLLFn name 'DeCryptFile';

{$IFDEF VerbaO}
//==============================================================================
//            ������������� ������ (�����������)
//==============================================================================
// file_in  - ������������� ����
// file_out - �������������� ����
// abonent  - ������������� �����  ����������("XXXXSSSSSS")
// pub_key  - ��������� �� �������� ���� �����������
//==============================================================================
function DeCryptFileEx(file_in,file_out,abonent:LPSTR;pub_key:Pointer):T16bit;
  stdcall; external cDLLFn name 'DeCryptFileEx';
{$ENDIF}

//==============================================================================
//        �������� ������������� ����� ��������, �������������� ����
//==============================================================================
// path - ���� � �������������� �����
// sender_id - ��������� ��� ������ � 10-�������� ���������������
//==============================================================================
function GetFileSenderID(path,sender_id:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetFileSenderID';
//==============================================================================
//     �������� ������ ���������, ������� ��������� ����
//==============================================================================
// file_name - ������������� ����
// abonents  - ����� �����������
// user_list - ������ ���������
// ser       - ����� �������(�����), ������ ��������� ����
//==============================================================================
function GetCryptKeysF(file_name:LPSTR; abonents:P16bit;user_list:pP16bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetCryptKeysF';
//==============================================================================
//            ������������� ����� ������
//==============================================================================
// buffer - ��������� �� ����� ��� �������������
// leng   - ����� ����� ������
// abonent- ����� ����������
//==============================================================================
function DeCryptMem(buffer:Pointer;leng:PLen;abonent:T16bit):T16bit;
  stdcall; external cDLLFn name 'DeCryptMem';

{$IFDEF VerbaO}
//==============================================================================
//            ������������� ����� ������ (�����������)
//==============================================================================
// buffer - ��������� �� ����� ��� �������������
// leng   - ����� ����� ������
// abonent- ������������� �����  ����������("XXXXSSSSSS")
// pub_key- ��������� �� �������� ���� �����������
//==============================================================================
function  DeCryptMemEx(buffer:Pointer;leng:PLen;abonent:LPSTR;pub_key:Pointer):T16bit;
  stdcall; external cDLLFn name 'DeCryptMemEx';
{$ENDIF}

//==============================================================================
//                     ������������ ����� ������
//==============================================================================
// in_mem_buf - ��������� �� ���� ��������� ������
// length   - ����� �����
// out_mem_buf- ��������� �� ���� ������������� ������
//              �.�. ������� (�����_���������� + MEM_TITLE_LEN +
//              + FILE_KEY_LEN * Abonents), ���
//              MEM_TITLE_LEN == 37
//              FILE_KEY_LEN  == 48
//              Abonents      == ����� �����������
// node_From- ���� �������������
// node_To  - ������ ����������������� ������� �����������,
// ser      - ����� �������(�����), ���� ������������ ����
//==============================================================================
function EnCryptMem(in_mem_buf:Pointer;leng:TLen;out_mem_buf:Pointer;node_From:T16bit;
                    node_To:P16bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'EnCryptMem';

{$IFDEF VerbaO}
//==============================================================================
//                     ������������ ����� ������ (�����������)
//==============================================================================
// in_mem_buf - ��������� �� ���� ��������� ������
// leng   - ��������� �� ����� �����
// out_mem_buf- ��������� �� ���� ������������� ������
//              �.�. ������� (�����_���������� + MEM_TITLE_LEN +
//              + FILE_KEY_LEN * Abonents), ���
//              MEM_TITLE_LEN == 37
//              FILE_KEY_LEN  == 48
//              Abonents      == ����� �����������
// From - ������������� ����� ����������� ("XXXXSSSSSS")
// open_keys_array   - ������ ���������� �� �������� ����� �����������
// open_keys_quantity - ���������� �����������
//==============================================================================
function EnCryptMemEx (in_mem_buf:Pointer;leng:PLen;out_mem_buf:Pointer;From:LPSTR;
                       Open_Key_Array:Pointer;Open_Keys_Quantity:Word;Flags:T32bit):T16bit;
  stdcall; external cDLLFn name 'EnCryptMemEx';
{$ENDIF}

//==============================================================================
//  �������� ������������� ����� ��������, �������������� ���� ������
//==============================================================================
// mem_block ��������� �� ���� ������������� ������
// leng - ����� �����
// sender_id - ��������� ��� ������ � 10-�������� ���������������
//==============================================================================
function GetMemSenderID (mem_block:Pointer;leng:TLen;sender_id:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetMemSenderID';
//==============================================================================
//     �������� ������ ���������, ������� ��������� ���� ������
//==============================================================================
// block     - ������������� ����
// leng      - ����� �����
// abonents  - ����� �����������
// user_list - ������ ���������
// ser       - ����� �������(�����), ������ ��������� ����
//==============================================================================
function GetCryptKeysM(block:Pointer;leng:TLen;abonents:P16bit;user_list:pP16bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetCryptKeysM';
//==============================================================================
//        ��������� ���� ������� �������� � ������
//==============================================================================
//   path    - ������ ���� � ����� � ��������� ������ �������
//==============================================================================
function SignLogIn(path:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignLogIn';
//==============================================================================
//        ������� ���� ������� �� ������
//==============================================================================
function SignLogOut:T16bit;
  stdcall; external cDLLFn name 'SignLogOut';
//==============================================================================
//         �������� �������� �� �����
//==============================================================================
// file_name - ������ ��� �����
// count     - ���-�� ��������� ��������
//             (-1)  - ������� ��� �������                      
//==============================================================================
function DelSign(file_name:LPSTR;count:T8bit):T16bit;
  stdcall; external cDLLFn name 'DelSign';
//==============================================================================
//                         ������� �����
//==============================================================================
// src_file_name- ��� �������������� �����
// dst_file_name- ��� ������������ �����
// name     - ������������� ��������
//==============================================================================
function SignFile(src_file_name,dst_file_name,name:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignFile';
//==============================================================================
//         �������� ������� ��� ������
//==============================================================================
// file_name - ������ ��� �����
// count     - ����� ������������ ��������
// stat_array- ������ ����������� �������� ������ �������
//==============================================================================
function check_file_sign(file_name:LPSTR;count:P8bit;stat_array:pCheck_Status):T16bit;
  stdcall; external cDLLFn name 'check_file_sign';
//==============================================================================
//         �������� ������� ��� ������ (�����������)
//==============================================================================
// file_name - ������ ��� �����
// open_keys_array - ��������� �� ������ ���������� �� �������� �����
// open_keys_quantity - ���������� �������� ������
// count     - ����� ������������ ��������
// stat_array- ������ ����������� �������� ������ �������
//==============================================================================
function check_file_sign_ex(file_name:LPSTR;open_keys_array:Pointer;open_keys_quantity:T32bit;
         count:P8bit;stat_array:pCheck_Status):T16bit;stdcall; external cDLLFn name 'check_file_sign_ex';
//==============================================================================
//   ��������� ���������� � ����������� ����� (��� 32-� ��������� ���������)
//==============================================================================
// (i) name -��������� �� ������ � ������ ������������ �����;
// (i/o) info - ��������� �� ������ �������� ������ �� ������� ������� �� ���� �����:
//   ������ � ��������������� �����, �� ������� ���� ������������ ������� �
//   ������ � ��������������� ������� ���������� ����
// (i/o) sign_quantity -��������� �� ����������, � ������� ������������ ����� ������������ ��������.
function GetFileSignInfo(name:LPSTR;info:Psign_info;sign_quantity:P32bit):T16bit;
  stdcall; external cDLLFn name 'GetFileSignInfo';
//==============================================================================
//   ��������� ���������� � ����������� ����� ������
//==============================================================================
function GetMemSignInfo(block:Pointer;leng:TLen;info:Psign_info;sign_quantity:P32bit):T16bit;
  stdcall; external cDLLFn name 'GetMemSignInfo';
//==============================================================================
//  ���������� ������ �������������� �����������
//==============================================================================
// lpMemory - ��������� ���������� � �������� GetCryptKeysF,
//  GetCryptKeysM.
//==============================================================================
procedure FreeMemory (lpMemory:Pointer);
  stdcall; external cDLLFn name 'FreeMemory';
//==============================================================================
// ������� ����� � ���������� ������� � ��������� ����
//==============================================================================
// src_file_name - ��� �������������� �����
// name          - ������������� ��������
// sign_file     - ��� ����� � ���������
//==============================================================================
function SignFileSeparate(src_file,name,sign_file:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignFileSeparate';
//==============================================================================
// �������� ������� ��� ������ ��� �������� �������� � ���������
//   �����
//==============================================================================
// file_name - ��� �����
// count     - ����� ������������ ��������
// stat_array- ������ ����������� �������� ������ �������
// sign_file - ��� ����� � ���������
//==============================================================================
function CheckFileSeparate(file_name:LPSTR;count:P8bit;stat_array:pCheck_Status;sign_file:LPSTR):T16bit;
  stdcall; external cDLLFn name 'CheckFileSeparate';
//==============================================================================
//              ������� ����� ������
//==============================================================================
// block    - ��������� �� ���� ������������� ������
//      ������ ��� ���� �.�. �������� � ������� ��� �������
//      leng + SIGN_TAIL_LEN + FILE_SIGN_LEN ��� ������ �������
//      leng + FILE_SIGN_LEN ��� ����� ����������� �������
//      SIGN_TAIL_LEN = 11;
//      FILE_SIGN_LEN = 87;                                     
// leng     - �����  ������������� ����������
// name     - ������������� ����� �������
//==============================================================================
function SignMem(block:Pointer;leng:TLen;name:LPSTR):T16bit;
  stdcall; external cDLLFn name 'SignMem';
//==============================================================================
//         �������� ������� ��� ������ ������
//==============================================================================
// block     - ��������� �� ���� ������
// leng      - �����  �����
// count     - ����� ������������ ��������
// stat_array- ������ ����������� �������� ������ �������
//==============================================================================
function check_mem_sign(block:Pointer;leng:TLen;count:P8bit;stat_array:pCheck_Status):T16bit;
  stdcall; external cDLLFn name 'check_mem_sign';
//==============================================================================
//         �������� �������� �� ������
//==============================================================================
// block - ��������� �� ���� ������
// leng  - ����� �����
// count - ���-�� ��������� ��������
//             (-1)  - ������� ��� �������
//==============================================================================
function Del_Mem_Sign(block:Pointer;leng:PLen;count:T8bit):T16bit;
  stdcall; external cDLLFn name 'Del_Mem_Sign';
//==============================================================================
// ������� ����� ������ � ���������� ������� � ��������� ����
//==============================================================================
// block           - ���� ������������� ������;
// leng - ����� �������������� ����� ������
// sign_block_leng - ����� �������� ���������� � ����� �
// ���������;
// sign_block      - ���� ������, ��� �������� �������;
// name     - ������������� ����� �������
// � ���� ��� �������� ����� �������� ���������� ������
// SIGN_TAIL_LEN + FILE_SIGN_LEN ��� ������ ������� �
// FILE_SIGN_LEN ��� ����������� ��������.
// ��� ������ ������������ ����� ������ �������� sign_block_leng
// ������ ���� ����� ����, ��� ����������� -
// - SIGN_TAIL_LEN + (FILE_SIGN_LEN*n).
//==============================================================================
function SignMemSeparate(block:Pointer;leng,sign_block_leng:TLen;name:LPSTR;sign_block:Pointer):T16bit;
  stdcall; external cDLLFn name 'SignMemSeparate';
//==============================================================================
// ������� ����� ������ � ���������� ������� � ��������� ���� (�����������)
//==============================================================================
function SignMemSeparateEx(block:Pointer;leng:TLen;sign_block_leng:PLen;name:LPSTR;sign_block:Pointer):T16bit;
  stdcall; external cDLLFn name 'SignMemSeparateEx';
//==============================================================================
// �������� ������� ��� ������ ������ ��� �������� �������� �
// ��������� �����
//==============================================================================
// block - ��������� �� ���� ������
// leng - ����� ����� ������
// sign_block_leng - ����� ����� � ���������
// count     - ����� ������������ ��������
// stat_array- ������ ����������� �������� ������ �������
// block - ��������� �� ���� ������ � ���������
//==============================================================================
function CheckMemSeparate(block:Pointer;leng,sign_block_leng:TLen;count:P8bit;
                          stat_array:pCheck_Status;sign_block:Pointer):T16bit;
  stdcall; external cDLLFn name 'CheckMemSeparate';
//==============================================================================
// �������� ������� ��� ������ ������ ��� �������� �������� �
// ��������� ����� (�����������)
//==============================================================================
function CheckMemSeparateEx(block:Pointer; leng:TLen; sign_block:Pointer; sign_block_leng:TLen;
                            Open_Key_Array:Pointer; Open_Keys_Quantity:Word;
                            count:P8bit; stat_array:pCheck_Status):T16bit;
  stdcall; external cDLLFn name 'CheckMemSeparateEx';
//==============================================================================
//            ���������� ��� ������� �����
//==============================================================================
// file_name - ������ ��� �����
// h_out - ��������� �� ������ ��� �������� 8-� ���� T32bit
//==============================================================================
function HashFile(file_name:LPSTR;h_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'HashFile';
//==============================================================================
//            ���������� ��� ������� ����� ������
//==============================================================================
// block - ��������� �� ���� ������
// leng - ����� ����� ������
// h_out - ��������� �� ������ ��� �������� 8-� ���� T32bit
//==============================================================================
function HashMem(buff:Pointer;leng:TLen;h_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'HashMem';
//==============================================================================
//  �������� ��������� �������� ��������� ����� �� ���
//  ��������������
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// Alias - ��������� �������� ��������� ����� (121 ����)
//==============================================================================
function GetAlias(base_dir,open_key_ID,Alias:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetAlias';
//==============================================================================
//  �������� ������������� ��������� ����� �� ���
//  ��������� ���������
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// Alias - ��������� �������� ��������� �����
// ser - ����� �����������
// S_or_E - ��� ��������� ����� ( 'S' - �������� ����
// ������� ; 'E'- �������� ���� ���������� )
//==============================================================================
function GetID(base_dir,Alias,ser:LPSTR;S_or_E:char;open_key_ID:LPSTR):T16bit;
  stdcall; external cDLLFn name 'GetID';
//==============================================================================
//  �������� ������������� ����� ������� ������������� � �������
//==============================================================================
// curr_id - ��������� ��� ������ � 10-�������� ���������������
// S_or_E  - ������ ���� ����� (������ ���� ����� 'S' )
//==============================================================================
function GetCurrID(curr_id:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'GetCurrID';
//==============================================================================
//  �������� � ��������� ������������� ����� ������� � �������
//==============================================================================
// flop_id - ��������� ��� ������ � 10-�������� ���������������
// S_or_E  - ������ ���� ����� (������ ���� ����� 'S' )
//==============================================================================
function GetFlopID(flop_id:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'GetFlopID';
//==============================================================================
//  �������� � ��������� ������������� ����� �� ������� ��������
//==============================================================================
// key_dev - ��������� ��� ������ �  ������ ��������� ����������
// key_id - ��������� ��� ������ �  ��������������� (11 ��� 13 ����)
// S_or_E  - ������ ���� ����� ('S' ��� 'E')
//==============================================================================
function GetKeyID(key_dev:LPSTR;key_id:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'GetKeyID';
//==============================================================================
//  �������� ������ ������ � �����������
// base_dir - ������� ���� � ����������� �������� ������
// ser - ����� �����������
// list - ��������� �� ������ ������
// num - ���������� ������ � �����������
// S_or_E - ��� �����������
//==============================================================================
function SprList(base_dir,ser:LPSTR;list:pSprList;num:P16bit;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'SprList';
//==============================================================================
// ��������� �������� ���� � �����������
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// my_ID - ���� ������������� �����
// S_or_E - ��� ��������� �����
//==============================================================================
function CheckOpenKey(base_dir,open_key_ID,my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'CheckOpenKey';
//==============================================================================
// ��������� �������� ���� � �������� ���������� �������
// base_dir - ������� ���� � ����������� �������� ������
// ser - ����� �����������
// num - ���������� ����� ��������� ����� � �����������
// my_ID - ���� ������������� �����
// S_or_E - ��� ��������� �����
//==============================================================================
function CheckKeyByNum(base_dir,ser:LPSTR;num:T16bit;my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'CheckKeyByNum';
//==============================================================================
//  ��������� ���������� �������� ������
// base_dir - ������� ���� � ����������� �������� ������
// ser - ����� �����������
// list - ������ ������
// num - ���������� ������ � �����������
// S_or_E - ��� �����������
//==============================================================================
function CheckSpr(base_dir,ser:LPSTR;list:pSprList;num:P16bit;my_ID:LPSTR;s_or_e:char):T16bit;
  stdcall; external cDLLFn name 'CheckSpr';
//==============================================================================
// ��������� ���-������� ��������� �����
// open_key - ����� ���  ��������� �����
// hash_adr - ����� ���  ���-������� ��������� �����
//==============================================================================
function CheckKeyHash(open_key,hash_adr:Pointer):T16bit;
  stdcall; external cDLLFn name 'CheckKeyHash';
//==============================================================================
//  �������� �������� ���� �� �����������
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// key - ��������� �� ����� ��� ��������� �����(240 ���� ��� ����� ������ 4.2 ��� 304 ����� ��� ������ 5.0)
//==============================================================================
function ExtractKey(base_dir,open_key_ID:LPSTR;key:Pointer):T16bit;
  stdcall; external cDLLFn name 'ExtractKey';
//==============================================================================
//         �������� �������� ���� � ����������
// base_dir - ������� ���� � ����������� �������� ������
// open_key - ��������� �� ���� ������ � �������� ������
// my_ID    - ������������� ���������� ����� �������
// (����������) ��������  ( "����" ������������� )
// S_or_E - ��� ��������� �����
//==============================================================================
function AddOpenKey (base_dir:LPSTR;open_key:Pointer;my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'AddOpenKey';
//==============================================================================
// ������� �������� ���� ��  �����������
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// my_ID - ���� ������������� �����
// S_or_E - ��� ��������� �����
//==============================================================================
function DelOpenKey (base_dir:LPSTR;open_key:LPSTR;my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'DelOpenKey';
//==============================================================================
// ������� ��� ��������� ����� � ����������� � ����������
// �� �������
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// my_ID - ���� ������������� �����
// S_or_E - ��� ��������� �����
//==============================================================================
function Res2Work(base_dir,open_key_ID,my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'Res2Work';
//==============================================================================
// ��������� ���������� �������� ������
// base_dir - ������� ���� � ����������� �������� ������
// ser - ����� �����������
// my_ID - ���� ������������� �����
// S_or_E - ��� ����������� �������� ������
//==============================================================================
function SignSpr(base_dir,ser,my_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'SignSpr';
//==============================================================================
//        �������� ������������������ ��������� ����
//==============================================================================
// buff- ��������� �� ����� ��� ��������� ������������������
// rnd_size - ����� ��������� ������������������
//==============================================================================
function Rndm(buff:Pointer;rnd_size:TLen):T16bit;
  stdcall; external cDLLFn name 'Rndm';
//==============================================================================
//        ��������� ������������ ����� ������ �� ������
//==============================================================================
// buff - ��������� �� ���� ������
// sender_id - ��������� ��� ������ � ���������������
// leng - ����� ����� ������
// password - ��������� �� 32-� �������� ������
// imito_out - ��������� ��� 4-� �������� ������������
//==============================================================================
function  ImitoMemOnPassword(buff:Pointer;leng:TLen;password:Pointer;imito_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'ImitoMemOnPassword';
//==============================================================================
//        ��������� ������������ ����� �� ������
//==============================================================================
// path - ���� � �����
// password - ��������� �� 32-� �������� ������
// imito_out - ��������� ��� 4-� �������� ������������
//==============================================================================
function ImitoFileOnPassword(path:LPSTR;password:Pointer;imito_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'ImitoFileOnPassword';
//==============================================================================
//        ��������� ������������ ����� �� GK
//==============================================================================
// path - ���� � �����
// my_ID - ��������� �� 10-�������� ������������� ����� ����������
//                                                           ��������
// imito_out - ��������� ��� 4-� �������� ������������
//==============================================================================
function ImitoFileOnGk(path,my_ID:LPSTR;imito_out:P32bit):T16bit;
  stdcall; external cDLLFn name 'ImitoFileOnGk';
//==============================================================================
//        ��������� ������������ ����� �� ������ ����� �����
//==============================================================================
// path - ���� � �����
// From - ����� �����������
// To   - ����� ����������
// imito_out - ��������� ��� 4-� �������� ������������
// ser       - ����� �������(�����)
//==============================================================================
function ImitoFile(path:LPSTR;From,To_:T16bit;imit_out:P32bit;ser:LPSTR):T16bit;
  stdcall; external cDLLFn name 'ImitoFile';
//==============================================================================
//       ������ ���������� �����
//==============================================================================
// ���������� � ������� �����: $03 - ��� 4.2, � $05 - ��� 5.0
//==============================================================================
function Version:Word;
  stdcall; external cDLLFn name 'version';
//==============================================================================
//       ������������� ��������� ����� � �����������
//==============================================================================
// base_dir - ������� ���� � ����������� �������� ������
// open_key_ID - ������������� ��������� �����
// S_or_E - ��� ��������� �����
//==============================================================================
function OpenKeyCompromise(base_dir,open_key_ID:LPSTR;S_or_E:char):T16bit;
  stdcall; external cDLLFn name 'OpenKeyCompromise';

//*** �������  ������ � ������� ************************************************
//==============================================================================
// ��������� ����� � ������� ASYNCR
// key_dev - ������ � ������ ��������� ���������� ��� ���������� ��������� ������
// key_ID  - ������������� ����� ��� ������ ������ ("")
//==============================================================================
function InitKey (key_dev:Pointer; key_ID:LPSTR):T16bit;
  stdcall; external cDLLFn name 'InitKey';
//==============================================================================
// ��������� ����� �� �������� ASYNCR
// key_ID  - ������������� �����
//==============================================================================
function ResetKey(key_ID:LPSTR):T16bit;
  stdcall; external cDLLFn name 'ResetKey';
//==============================================================================
// ��������� ����� �� �������� ASYNCR
// key_ID - ������������� �����
// flag   - ������� ����������� �������� ����� �� "�����"0
// FALSE-�������� ���������, TRUE-���������
//==============================================================================
function ResetKeyEx(key_ID:LPSTR;flag:Integer):T16bit;
  stdcall; external cDLLFn name 'ResetKeyEx';

{$ELSE}

//*** ������� ������������ ��������/�������� ***********************************
type
  T_GetDrvInfo           = function (Keys_Info:PUSR_KEYS_INFO;n_Key_Slot:P32bit):T16bit;stdcall;
  T_SignInit             = function (pathToSecret,pathToBase:LPSTR):T16bit;stdcall;
  T_SignDone             = function :T16bit;stdcall;
  T_CryptoInit           = function (path,base_path:LPSTR ):T16bit;stdcall;
  T_CryptoDone           = function :T16bit;stdcall;
  T_EnCryptFile          = function (file_in,file_out:LPSTR;node_From:T16bit;node_To:P16bit;ser:LPSTR):T16bit;stdcall;
  T_EnCryptFileEx        = function (file_in,file_out,From:LPSTR;Open_Key_Array:Pointer;Open_Keys_Quantity:Word;Flags:T32bit):T16bit;stdcall;
  T_DeCryptFile          = function (file_in,file_out:LPSTR;abonent:T16bit):T16bit;stdcall;
  T_DeCryptFileEx        = function (file_in,file_out,abonent:LPSTR;pub_key:Pointer):T16bit;stdcall;
  T_GetFileSenderID      = function (path,sender_id:LPSTR):T16bit;stdcall;
  T_GetCryptKeysF        = function (file_name:LPSTR; abonents:P16bit;user_list:pP16bit;ser:LPSTR):T16bit;stdcall;
  T_DeCryptMem           = function (buffer:Pointer;leng:PLen;abonent:T16bit):T16bit;stdcall;
  T_DeCryptMemEx         = function (buffer:Pointer;leng:PLen;abonent:LPSTR;pub_key:Pointer):T16bit;stdcall;
  T_EnCryptMem           = function (in_mem_buf:Pointer;leng:TLen;out_mem_buf:Pointer;node_From:T16bit;node_To:P16bit;ser:LPSTR):T16bit;stdcall;
  T_EnCryptMemEx         = function (in_mem_buf:Pointer;leng:PLen;out_mem_buf:Pointer;From:LPSTR;Open_Key_Array:Pointer;Open_Keys_Quantity:Word;Flags:T32bit):T16bit;stdcall;
  T_GetMemSenderID       = function (mem_block:Pointer;leng:TLen;sender_id:LPSTR):T16bit;stdcall;
  T_GetCryptKeysM        = function (block:Pointer;leng:TLen;abonents:P16bit;user_list:pP16bit;ser:LPSTR):T16bit;stdcall;
  T_SignLogIn            = function (path:LPSTR):T16bit;stdcall;
  T_SignLogOut           = function :T16bit;stdcall;
  T_DelSign              = function (file_name:LPSTR;count:T8bit):T16bit;stdcall;
  T_SignFile             = function (src_file_name,dst_file_name,name:LPSTR):T16bit;stdcall;
  T_check_file_sign      = function (file_name:LPSTR;count:P8bit;stat_array:pCheck_Status):T16bit;stdcall;
  T_check_file_sign_ex   = function (file_name:LPSTR;open_keys_array:Pointer;open_keys_quantity:T32bit;count:P8bit;stat_array:pCheck_Status):T16bit;stdcall;
  T_GetFileSignInfo      = function (name:LPSTR;info:Psign_info;sign_quantity:P32bit):T16bit;stdcall;
  T_GetMemSignInfo       = function (block:Pointer;leng:TLen;info:Psign_info;sign_quantity:P32bit):T16bit;stdcall;
  T_FreeMemory           = procedure (lpMemory:Pointer);stdcall;
  T_SignFileSeparate     = function (src_file,name,sign_file:LPSTR):T16bit;stdcall;
  T_CheckFileSeparate    = function (file_name:LPSTR;count:P8bit;stat_array:pCheck_Status;sign_file:LPSTR):T16bit;stdcall;
  T_SignMem              = function (block:Pointer;leng:TLen;name:LPSTR):T16bit;stdcall;
  T_check_mem_sign       = function (block:Pointer;leng:TLen;count:P8bit;stat_array:pCheck_Status):T16bit;stdcall;
  T_Del_Mem_Sign         = function (block:Pointer;leng:PLen;count:T8bit):T16bit;stdcall;
  T_SignMemSeparate      = function (block:Pointer;leng,sign_block_leng:TLen;name:LPSTR;sign_block:Pointer):T16bit;stdcall;
  T_SignMemSeparateEx    = function (block:Pointer;leng:TLen;sign_block_leng:PLen;name:LPSTR;sign_block:Pointer):T16bit;stdcall;
  T_CheckMemSeparate     = function (block:Pointer;leng,sign_block_leng:TLen;count:P8bit;stat_array:pCheck_Status;sign_block:Pointer):T16bit;stdcall;
  T_CheckMemSeparateEx   = function (block:Pointer; leng:TLen; sign_block:Pointer; sign_block_leng:TLen;Open_Key_Array:Pointer; Open_Keys_Quantity:Word;count:P8bit; stat_array:pCheck_Status):T16bit;stdcall;
  T_HashFile             = function (file_name:LPSTR;h_out:P32bit):T16bit;stdcall;
  T_HashMem              = function (buff:Pointer;leng:TLen;h_out:P32bit):T16bit;stdcall;
  T_GetAlias             = function (base_dir,open_key_ID,Alias:LPSTR):T16bit;stdcall;
  T_GetID                = function (base_dir,Alias,ser:LPSTR;S_or_E:char;open_key_ID:LPSTR):T16bit;stdcall;
  T_GetCurrID            = function (curr_id:LPSTR;S_or_E:char):T16bit;stdcall;
  T_GetFlopID            = function (flop_id:LPSTR;S_or_E:char):T16bit;stdcall;
  T_GetKeyID             = function (key_dev:LPSTR;key_id:LPSTR;S_or_E:char):T16bit;stdcall;
  T_SprList              = function (base_dir,ser:LPSTR;list:pSprList;num:P16bit;S_or_E:char):T16bit;stdcall;
  T_CheckOpenKey         = function (base_dir,open_key_ID,my_ID:LPSTR;S_or_E:char):T16bit;stdcall;
  T_CheckKeyByNum        = function (base_dir,ser:LPSTR;num:T16bit;my_ID:LPSTR;S_or_E:char):T16bit;stdcall;
  T_CheckSpr             = function (base_dir,ser:LPSTR;list:pSprList;num:P16bit;my_ID:LPSTR;s_or_e:char):T16bit;stdcall;
  T_CheckKeyHash         = function (open_key,hash_adr:Pointer):T16bit;stdcall;
  T_ExtractKey           = function (base_dir,open_key_ID:LPSTR;key:Pointer):T16bit;stdcall;
  T_AddOpenKey           = function (base_dir:LPSTR;open_key:Pointer;my_ID:LPSTR;S_or_E:char):T16bit;stdcall;
  T_DelOpenKey           = function (base_dir:LPSTR;open_key:LPSTR;my_ID:LPSTR;S_or_E:char):T16bit;stdcall;
  T_Res2Work             = function (base_dir,open_key_ID,my_ID:LPSTR;S_or_E:char):T16bit;stdcall;
  T_SignSpr              = function (base_dir,ser,my_ID:LPSTR;S_or_E:char):T16bit;stdcall;
  T_Rndm                 = function (buff:Pointer;rnd_size:TLen):T16bit;stdcall;
  T_ImitoMemOnPassword   = function (buff:Pointer;leng:TLen;password:Pointer;imito_out:P32bit):T16bit;
  T_ImitoFileOnPassword  = function (path:LPSTR;password:Pointer;imito_out:P32bit):T16bit;
  T_ImitoFileOnGk        = function (path,my_ID:LPSTR;imito_out:P32bit):T16bit;stdcall;
  T_ImitoFile            = function (path:LPSTR;From,To_:T16bit;imit_out:P32bit;ser:LPSTR):T16bit;stdcall;
  T_Version              = function :Word;stdcall;
  T_OpenKeyCompromise    = function (base_dir,open_key_ID:LPSTR;S_or_E:char):T16bit;stdcall;

var
  LibModule      : DWORD;

  GetDrvInfo           : T_GetDrvInfo;
  SignInit             : T_SignInit;
  SignDone             : T_SignDone;
  CryptoInit           : T_CryptoInit;
  CryptoDone           : T_CryptoDone;
  EnCryptFile          : T_EnCryptFile;
  EnCryptFileEx        : T_EnCryptFileEx;
  DeCryptFile          : T_DeCryptFile;
  DeCryptFileEx        : T_DeCryptFileEx;
  GetFileSenderID      : T_GetFileSenderID;
  GetCryptKeysF        : T_GetCryptKeysF;
  DeCryptMem           : T_DeCryptMem;
  DeCryptMemEx         : T_DeCryptMemEx;
  EnCryptMem           : T_EnCryptMem;
  EnCryptMemEx         : T_EnCryptMemEx;
  GetMemSenderID       : T_GetMemSenderID;
  GetCryptKeysM        : T_GetCryptKeysM;
  SignLogIn            : T_SignLogIn;
  SignLogOut           : T_SignLogOut;
  DelSign              : T_DelSign;
  SignFile             : T_SignFile;
  check_file_sign      : T_check_file_sign;
  check_file_sign_ex   : T_check_file_sign_ex;
  GetFileSignInfo      : T_GetFileSignInfo;
  GetMemSignInfo       : T_GetMemSignInfo;
  FreeMemory           : T_FreeMemory;
  SignFileSeparate     : T_SignFileSeparate;
  CheckFileSeparate    : T_CheckFileSeparate;
  SignMem              : T_SignMem;
  check_mem_sign       : T_check_mem_sign;
  Del_Mem_Sign         : T_Del_Mem_Sign;
  SignMemSeparate      : T_SignMemSeparate;
  SignMemSeparateEx    : T_SignMemSeparateEx;
  CheckMemSeparate     : T_CheckMemSeparate;
  CheckMemSeparateEx   : T_CheckMemSeparateEx;
  HashFile             : T_HashFile;
  HashMem              : T_HashMem;
  GetAlias             : T_GetAlias;
  GetID                : T_GetID;
  GetCurrID            : T_GetCurrID;
  GetFlopID            : T_GetFlopID;
  GetKeyID             : T_GetKeyID;
  SprList              : T_SprList;
  CheckOpenKey         : T_CheckOpenKey;
  CheckKeyByNum        : T_CheckKeyByNum;
  CheckSpr             : T_CheckSpr;
  CheckKeyHash         : T_CheckKeyHash;
  ExtractKey           : T_ExtractKey;
  AddOpenKey           : T_AddOpenKey;
  DelOpenKey           : T_DelOpenKey;
  Res2Work             : T_Res2Work;
  SignSpr              : T_SignSpr;
  Rndm                 : T_Rndm;
  ImitoMemOnPassword   : T_ImitoMemOnPassword;
  ImitoFileOnPassword  : T_ImitoFileOnPassword;
  ImitoFileOnGk        : T_ImitoFileOnGk;
  ImitoFile            : T_ImitoFile;
  Version              : T_Version;
  OpenKeyCompromise    : T_OpenKeyCompromise;

  function LoadDLL(DllName : string) : Boolean;
  function UnLoadDLL(DllName : string) : Boolean;

{$ENDIF}

//*** ��������������� ������� **************************************************

  procedure OemToAnsi(var s : string);
  function  GetVerbaErrorStr(N:Integer):String;
  function  GetVerbaSignStatusStr(N:T8bit):String;
//Error  function  GetVerbaKeyDevStr(index : Integer) : string;
//Error  function  GetVerbaKeyDevDescrStr(index : Integer) : string;
  function  GetCryptoIDStr(KeyID : string) : string;
  function  GetCryptoNumberStr(KeyID : string) : string;
  function  GetSeriaStr(KeyID : string) : string;
  function  GetFnameLFX(KeyID : string) : string;
  function  GetFnamePUB(KeyID : string) : string;
  function  GetIdFromDriver(S_or_E:char) : string;
  function  GetIdFromDev(key_dev:string; S_or_E:char) : string;
  function  CheckFileSign(fname, sfname : string; SignIdList : TStrings; Report : TStrings) : T16bit;
  function  DeleteFileSign(in_file, out_file : string; del_count : Integer) : T16bit;
  function  EnCryptFileAsMem(in_file,out_file : string; Abonents : Integer; node_From:T16bit; node_To:P16bit; ser:LPSTR) : T16bit;
  function  DeCryptFileAsMem(in_file,out_file : string; abonent:T16bit) : T16bit;
{$IFDEF VerbaO}
  function  EnCryptFileAsMemEx(in_file,out_file,From : string; Abonents : Integer; Open_Key_Array:Pointer;Open_Keys_Quantity:Word;Flags:T32bit) : T16bit;
  function  DeCryptFileAsMemEx(in_file,out_file : string; abonent:LPSTR; pub_key:Pointer) : T16bit;
{$ENDIF}

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

//*** ��������������� ������� **************************************************
//------------------------------------------------------------------------------
// ������������� ������ �� CP866 � Windows1251
//------------------------------------------------------------------------------
procedure OemToAnsi(var s : string);
var
  i, n : Integer;
begin
  for i:=1 to Length(s) do begin
    n := ord(s[i]);
    if (n > $7f) and (n < $b0) then
       s[i] := char(n+$40)
    else if (n > $df) and (n < $f0) then
       s[i] := char(n+$10);
  end;

end;
//------------------------------------------------------------------------------
// ���������� ������ � ����������� �� ������ �����
//------------------------------------------------------------------------------
function GetVerbaErrorStr(N : Integer) : String;
begin
  case N of
    NO_ERROR            : Result := '��� ������.';
    E_NO_MEM            : Result := '�� ������� ������������ ������.';
    E_CONTROL           : Result := '���� ����������������� ������� ��� ��������� ���� ����������.';
    E_DRIVER            : Result := '������ ������� ��������� �����.';
    E_IMMITO            : Result := '�� ��������� �����������ࠗ ���� (���� ������) �������.';
    E_KEY_NOT_FOUND     : Result := '�� ������ ����.';
    E_PARAM             : Result := '������ ��������� ��������� � �������.';
    E_INIT              : Result := '������ �������������.';
    E_MEM_LENGTH        : Result := '�������� ����� ����� ������.';
    E_MEM_NOT_ENCRYPTED : Result := '������� ������������ ��������������� ���� ������.';
    E_MEM_NOT_SIGNED    : Result := '������� ��������� ������� �������������� ����� ������.';
    E_OPEN_IN_FILE      : Result := '������ �������� �������� �����.';
    E_OPEN_OUT_FILE     : Result := '������ �������� ��������� �����.';
    E_WRITE_FILE        : Result := '������ ������ �����.';
    E_READ_FILE         : Result := '������ ������ �����.';
    E_RENAME_FILE       : Result := '������ �������������� �����.';
    E_FILE_LENGTH       : Result := '�������� (��������, �������) ����� �����.';
    E_SRC               : Result := '������������ ����������� ����� �������������� �����.';
    E_FILE_NOT_ENCRYPTED: Result := '������� ������������� ���������������� �����.';
    E_FILE_NOT_SIGNED   : Result := '������� �������� ������� �������������� �����.';
    E_SEEK              : Result := '������ �������� ��������� ���������.';
    E_CLOSE             : Result := '������ �������� �����.';
    E_DELETE_FILE       : Result := '������ �������� �����.';

    E_GK         : Result := '������ GK.';
    E_KS         : Result := '������ KS.';
    E_DEVICE           : Result := '������ DEVICE.';
    E_REDEFINE         : Result := '������ REDEFINE.';
    E_NO_FREE_SLOTS     : Result := '��� ��������� ������.';
    E_KEY_NOT_SET       : Result := '������ KEY_NOT_SET';
    E_GK_R              : Result := '������ ������ GK.';
    E_GK_W              : Result := '������ ������ GK.';

    ERR_UNSUPPORTED_FORMAT : Result :='������ �� ��������������.';
    ERR_NUMP            : Result := '����� ����� NUM ��� NUMP �� ������������� ���������� �� ������� ��������� �����.';
    ERR_HASH            : Result := '�������� ���-������� �� �������.';
    ERR_OPEN_SPR        : Result := '������ ��� �������� ����� �� ������������ �������� ������.';
    ERR_OPEN_IMM        : Result := '������ ��� �������� ����� � ��������������.';
    ERR_UZ              : Result := '������ ������ UZ.';
    ERR_CKD             : Result := '������ ������ CKD ��� CKDI.';
    ERR_IMM_SPR         : Result := '����� ����� �� ������������ �� ������������� ����� ����� � ��������������.';
    ERR_READ_SPR        : Result := '������ ������ ����� �� ������������ �������� ������.';
    ERR_WRITE_SPR       : Result := '������ ������ � ���� �� ������������ �������� ������.';
    ERR_READ_IMM        : Result := '������ ������ ����� � ��������������.';
    ERR_IMM             : Result := '����������� �������.';
    ERR_COMPROM         : Result := '�������� ���� ����������������.';
    ERR_CRE_DIR         : Result := '������ ��� �������� ��������.';
    ERR_CRE_FILE        : Result := '������ ��� �������� ����� *.imm, *.imp, ��� *.spr.';
    ERR_EXIST_SPR       : Result := '� �������� �������� ��� ���������� ���� *.spr.';
    ERR_WRITE_IMM       : Result := '������ ������ � ���� ������������.';
    ERR_NO_KEY          : Result := '��������� �������� ���� ����������� � �����������.';
    ERR_LENGTH          : Result := '�������� ����� ����� *.imm, *.imp, ��� *.spr.';
    ERR_OPEN_TMP        : Result := '������ �������� ���������� �����.';
    ERR_SPR_EMPTY       : Result := '���������� �������� ������ ����.';
    ERR_KEY_HEAD        : Result := '��������� ��������� ����� �������.';
    ERR_FIND_SPR        : Result := '���������� �������� ������ �� ������.';
    ERR_NO_RES          : Result := '�������� ���� �� �������� ���������.';
    ERR_IMM_HEAD        : Result := '��������� ����� � �������������� �������.';
    ERR_NO_SIGN         : Result := '��� ������������ �� �������� ����.';
    ERR_NO_IMM          : Result := '��� ������������ �� �������� ����.';
    ERR_FLOP            : Result := '������ ��� ��������� � ������� �����.';
    ERR_SPR_NOT_FOUND   : Result := '���������� �� ������.';
    ERR_BAD_KEY           : Result := 'ERR_BAD_KEY';
    ERR_PACK_BUF        : Result := 'ERR_PACK_BUF';
    ERR_OTHER_IMM_KEY   : Result := '������������ �� ���������� ���������� �� ����� ������ �����.';
    ERR_BAD_KEY_TYPE    : Result := '�������� ��� ��������� ��������';
    ERR_ANOTHER_CARRIER : Result := '�������� ������ ��������.';

    ERR_UNSUPPORTED            : Result := '������� �� ��������������.';
    ERR_CONNECT                : Result := '���������� �� ���������� ��� ������.';
    ERR_NO_CARRIER             : Result := '���������� �������� � �����������.';
    ERR_INVALID_MEDIA          : Result := '�����. �� ����� �������������� � �������� ��������� ��� ������. �����. ��������.';
    ERR_WRITE_PROTECT          : Result := '�������� ������� �� ������.';
    ERR_INVALID_PASSWD         : Result := '������ ������������ ������.';
    ERR_CANCEL                 : Result := '����� �� ���������� ��������.';
    ERR_FULL                   : Result := '��� ����� �� ��������.';
    ERR_VERSION_1              : Result := '������ ������ 5.0 �� ��������������.';

    // ������
    ERR_V_CHECK                : Result := '����� �������� ���: ��������� �������������';
    ERR_V_COPY_FILE            : Result := '������ ����������� �����';
    ERR_V_FILE_ENCMEM          : Result := '������ ������������ �����, ��� ������� ������';
    ERR_V_FILE_DECMEM          : Result := '������ ������������� �����, ��� ������� ������';
  else
                                 Result := Format('����������� ������. ��� ��������: %d (0x%.8x)',[N,N]);
  end;
End;
//------------------------------------------------------------------------------
// ���������� ������ � ����������� �� ������� ��� �����
//------------------------------------------------------------------------------
function GetVerbaSignStatusStr(N : T8bit) : String;
begin
  case N Of
    CORRECT        : Result := 'OK';
    NOT_CORRECT    : Result := '��� ��������';
    OKEY_NOT_FOUND : Result := '����������� ��� ���������������� �������� ���� ��� � ������������';
  else
                     Result := Format('����������� ������ #%d', [N]);
  End;
end;
//------------------------------------------------------------------------------
// ���������� ������ �������������� ����� ����������
//------------------------------------------------------------------------------
function GetCryptoIDStr(KeyID : string) : string;
begin
  Result := System.Copy(KeyID, 1, 10);
end;
//------------------------------------------------------------------------------
// ���������� ������ ������ ����� ����������
//------------------------------------------------------------------------------
function GetCryptoNumberStr(KeyID : string) : string;
begin
    Result := System.Copy(KeyID, 1, 4)
end;
//------------------------------------------------------------------------------
// ���������� ������ �������� �����
//------------------------------------------------------------------------------
function GetSeriaStr(KeyID : string) : string;
begin
  Result := System.Copy(KeyID, 5, 6)
end;
//------------------------------------------------------------------------------
// ���������� ��� ����� ��������� ����� ���
//------------------------------------------------------------------------------
function GetFnameLFX(KeyID : string) : string;
begin
  Result := System.Copy(KeyID, 1, 4) + System.Copy(KeyID, 11, 2) + '.lfx';
end;
//------------------------------------------------------------------------------
// ���������� ��� ����� ��������� ����� ���
//------------------------------------------------------------------------------
function GetFnamePUB(KeyID : string) : string;
begin
  Result := System.Copy(KeyID, 1, 4) + '.pub';
end;
//------------------------------------------------------------------------------
// ���������� ������ �������������� ����� ��� (����������) ������������� � �������
//------------------------------------------------------------------------------
function GetIdFromDriver(S_or_E:char) : string;
var
  s : array[0..LFX_ID_LENGTH] of Char;
begin
  Result := '';
  if GetCurrID(PChar(@s), S_or_E) <> NO_ERROR then
     Exit;
  Result := string(PChar(@s));
end;
//------------------------------------------------------------------------------
// ���������� ������ �������������� ����� ��� (����������) � ����������
//------------------------------------------------------------------------------
function  GetIdFromDev(key_dev:string; S_or_E:char) : string;
var
  s : array[0..LFX_ID_LENGTH] of Char;
begin
  Result := '';
  if GetKeyID(PChar(key_dev),PChar(@s),S_or_E) <> NO_ERROR then
     Exit;
  Result := string(PChar(@s));
end;
//------------------------------------------------------------------------------
// �������� ������� ����� fname
// E��� ������ SignIdList=nil, ��� ����, �� ����������� ��� ������� � �����,
// ����� ����������� ������� �� ��� ������, ��� �������������� ������ � ������ SignIdList
// Report - ��������� ����� �� ����������� ������
// sname - ��� ����� � ��������� ���, ���� sname<>'', �� ����������� ���������� �������� ���
//------------------------------------------------------------------------------
function CheckFileSign(fname, sfname : string; SignIdList : TStrings; Report : TStrings) : T16bit;
var
  count      : T8bit;
  err_code   : T16bit;
  stat_array : pCheck_Status;
  i, j       : Integer;
  s          : string;
  found      : Boolean;
begin
  Result := NO_ERROR;
  count  := 0;

  stat_array := nil;
  try
    if Report<>nil then
       Report.Clear;

    if sfname = '' then
       err_code := check_file_sign(PChar(fname), @count, @stat_array)
    else
       err_code := CheckFileSeparate(PChar(fname), @count, @stat_array, PChar(sfname));

    if err_code <> NO_ERROR then begin
       if Report<>nil then begin
          if err_code = E_FILE_LENGTH then
             Report.Add('���� �� �������� ��� �������');
          Report.Add('check_file_sign: ' + GetVerbaErrorStr(err_code));
       end;
       Result := ERR_V_CHECK;
       Exit;
    end;

    if (SignIdList = nil) or (SignIdList.Count = 0) then begin
      if Report<>nil then
         Report.Add('����� ��������: ' + IntToStr(count));
      // ����� �� ���
      for i:=0 to count-1 do begin
          err_code := stat_array[i].Status;
          s := '��� '+ stat_array[i].Name + ' : ';
          case err_code of
            CORRECT        : s := s + '��� �����';
            NOT_CORRECT    : begin
                             s := s + '��� �� �����';
                             Result := ERR_V_CHECK;
            end;
            OKEY_NOT_FOUND : begin
                             s := s + '�������� ���� ��� �� ������';
                             Result := ERR_V_CHECK;
            end;
          else ;
                             s := s + '����������� ������ �������� ���' + IntTostr(err_code);
                             Result := ERR_V_CHECK;
          end;
          if Report<>nil then
             Report.Add(s);
      end;
    end
    else begin
      // ����� �� ������
      for i:=0 to SignIdList.Count-1 do begin
        s := '���� '+ SignIdList[i] + ' : ';
        found := False;
        for j:=0 to Count-1 do begin
          if stat_array[j].Name <> SignIdList[i] then
             Continue;
          err_code := stat_array[j].Status;
          case err_code of
            CORRECT        : s := s + '��� �����';
            NOT_CORRECT    : begin
                             s := s + '��� �� �����';
                             Result := ERR_V_CHECK;
            end;
            OKEY_NOT_FOUND : begin
                             s := s + '�������� ���� ��� �� ������';
                             Result := ERR_V_CHECK;
            end;
          else ;
                             s := s + '����������� ������ �������� ��� ' + IntTostr(err_code);
                             Result := ERR_V_CHECK;
          end;
          found := True;
          Break;
        end;
        if not found then begin
           s := s + '��� �� ������ ����� �� �������';
           Result := ERR_V_CHECK;
        end;

        if Report<>nil then
           Report.Add(s);
      end;
    end;
  finally
    if stat_array <> nil then
       FreeMemory(stat_array);
  end;
end;
//------------------------------------------------------------------------------
// �������� ������� �������� ���� sour, �������� ���� dest
// (����������� ������� �������� ������ � �������� ������)
//------------------------------------------------------------------------------
function DeleteFileSign(in_file, out_file : string; del_count : Integer) : T16bit;
begin
  if in_file = out_file then
     Result := DelSign(PChar(in_file), del_count)
  else begin
     if Windows.CopyFile(PChar(in_file), PChar(out_file), BOOL(0)) = BOOL(0) then begin
        Result := ERR_V_COPY_FILE;
        Exit;
     end;
     Result := DelSign(PChar(out_file), del_count);
  end;
end;
//------------------------------------------------------------------------------
// ������������ �����, ��� ������� ������
//------------------------------------------------------------------------------
function EnCryptFileAsMem(in_file,out_file : string; Abonents : Integer; node_From:T16bit; node_To:P16bit; ser:LPSTR) : T16bit;
var
  ms_in, ms_out : TMemoryStream;
  p_in, p_out   : PChar;
begin
  ms_in  := TMemoryStream.Create;
  ms_out := TMemoryStream.Create;
  try
    try
      ms_in.LoadFromFile(in_file);
      p_in := PChar(ms_in.Memory);
      ms_out.Size := ms_in.Size + MEM_TITLE_LEN + FILE_KEY_LEN*Abonents;
      p_out := PChar(ms_out.Memory);
      Result := EnCryptMem(p_in, ms_in.Size, p_out, node_From, node_To, ser);
      if Result = NO_ERROR then
         ms_out.SaveToFile(out_file);
    except
      Result := ERR_V_FILE_ENCMEM;
    end;
  finally
    ms_in.Free;
    ms_out.Free;
  end;
end;
//------------------------------------------------------------------------------
// �������������� �����, ��� ������� ������
//------------------------------------------------------------------------------
function DeCryptFileAsMem(in_file,out_file : string; abonent:T16bit) : T16bit;
var
  ms  : TMemoryStream;
  p   : PChar;
  len : TLen;
begin
  ms  := TMemoryStream.Create;
  try
    try
      ms.LoadFromFile(in_file);
      p := PChar(ms.Memory);
      len := ms.Size;
      Result := DeCryptMem(p, @len, abonent);
      if Result = NO_ERROR then begin
         ms.Size := len;
         ms.SaveToFile(out_file);
      end;
    except
      Result := ERR_V_FILE_DECMEM;
    end;
  finally
    ms.Free;
  end;
end;

{$IFDEF VerbaO}
//------------------------------------------------------------------------------
// ������������ �����, ��� ������� ������ (�����������)
//------------------------------------------------------------------------------
function EnCryptFileAsMemEx(in_file,out_file,From : string; Abonents : Integer; Open_Key_Array:Pointer;Open_Keys_Quantity:Word;Flags:T32bit) : T16bit;
var
  ms_in, ms_out : TMemoryStream;
  p_in, p_out   : PChar;
  len           : TLen;
begin
  ms_in  := TMemoryStream.Create;
  ms_out := TMemoryStream.Create;
  try
    try
      ms_in.LoadFromFile(in_file);
      p_in := PChar(ms_in.Memory);
      ms_out.Size := ms_in.Size + MEM_TITLE_LEN + FILE_KEY_LEN*Abonents;
      p_out := PChar(ms_out.Memory);
      len := ms_in.Size;
      Result := EnCryptMemEx(p_in, @len, p_out, PChar(From), Open_Key_Array, Open_Keys_Quantity, Flags);
      if Result = NO_ERROR then
         ms_out.SaveToFile(out_file);
    except
      Result := ERR_V_FILE_ENCMEM;
    end;
  finally
    ms_in.Free;
    ms_out.Free;
  end;
end;
//------------------------------------------------------------------------------
// ������������� �����, ��� ������� ������ (�����������)
//------------------------------------------------------------------------------
function DeCryptFileAsMemEx(in_file,out_file : string; abonent:LPSTR; pub_key:Pointer) : T16bit;
var
  ms  : TMemoryStream;
  p   : PChar;
  len : TLen;
begin
  ms  := TMemoryStream.Create;
  try
    try
      ms.LoadFromFile(in_file);
      p := PChar(ms.Memory);
      len := ms.Size;
      Result := DeCryptMemEx(p, @len, abonent, pub_key);
      if Result = NO_ERROR then begin
         ms.Size := len;
         ms.SaveToFile(out_file);
      end;
    except
      Result := ERR_V_FILE_DECMEM;
    end;
  finally
    ms.Free;
  end;
end;
{$ENDIF}

{$IFNDEF StaticDLL}

//*** ������� ������������ ��������/�������� ***********************************
//------------------------------------------------------------------------------
// �������� ����������
//------------------------------------------------------------------------------
function LoadDLL(DllName : string) : Boolean;
begin
  Result := False;

  LibModule := LoadLibrary(PChar(DllName));
  if LibModule = 0 then
     Exit;
  @GetDrvInfo           := GetProcAddress(LibModule, 'GetDrvInfo');
  @SignInit             := GetProcAddress(LibModule, 'SignInit');
  @SignDone             := GetProcAddress(LibModule, 'SignDone');
  @CryptoInit           := GetProcAddress(LibModule, 'CryptoInit');
  @CryptoDone           := GetProcAddress(LibModule, 'CryptoDone');
  @EnCryptFile          := GetProcAddress(LibModule, 'EnCryptFile');
  @EnCryptFileEx        := GetProcAddress(LibModule, 'EnCryptFileEx');
  @DeCryptFile          := GetProcAddress(LibModule, 'DeCryptFile');
  @DeCryptFileEx        := GetProcAddress(LibModule, 'DeCryptFileEx');
  @GetFileSenderID      := GetProcAddress(LibModule, 'GetFileSenderID');
  @GetCryptKeysF        := GetProcAddress(LibModule, 'GetCryptKeysF');
  @DeCryptMem           := GetProcAddress(LibModule, 'DeCryptMem');
  @DeCryptMemEx         := GetProcAddress(LibModule, 'DeCryptMemEx');
  @EnCryptMem           := GetProcAddress(LibModule, 'EnCryptMem');
  @EnCryptMemEx         := GetProcAddress(LibModule, 'EnCryptMemEx');
  @GetMemSenderID       := GetProcAddress(LibModule, 'GetMemSenderID');
  @GetCryptKeysM        := GetProcAddress(LibModule, 'GetCryptKeysM');
  @SignLogIn            := GetProcAddress(LibModule, 'SignLogIn');
  @SignLogOut           := GetProcAddress(LibModule, 'SignLogOut');
  @DelSign              := GetProcAddress(LibModule, 'DelSign');
  @SignFile             := GetProcAddress(LibModule, 'SignFile');
  @check_file_sign      := GetProcAddress(LibModule, 'check_file_sign');
  @check_file_sign_ex   := GetProcAddress(LibModule, 'check_file_sign_ex');
  @GetFileSignInfo      := GetProcAddress(LibModule, 'GetFileSignInfo');
  @GetMemSignInfo       := GetProcAddress(LibModule, 'GetMemSignInfo');
  @FreeMemory           := GetProcAddress(LibModule, 'FreeMemory');
  @SignFileSeparate     := GetProcAddress(LibModule, 'SignFileSeparate');
  @CheckFileSeparate    := GetProcAddress(LibModule, 'CheckFileSeparate');
  @SignMem              := GetProcAddress(LibModule, 'SignMem');
  @check_mem_sign       := GetProcAddress(LibModule, 'check_mem_sign');
  @Del_Mem_Sign         := GetProcAddress(LibModule, 'Del_Mem_Sign');
  @SignMemSeparate      := GetProcAddress(LibModule, 'SignMemSeparate');
  @SignMemSeparateEx    := GetProcAddress(LibModule, 'SignMemSeparateEx');
  @CheckMemSeparate     := GetProcAddress(LibModule, 'CheckMemSeparate');
  @CheckMemSeparateEx   := GetProcAddress(LibModule, 'CheckMemSeparateEx');
  @HashFile             := GetProcAddress(LibModule, 'HashFile');
  @HashMem              := GetProcAddress(LibModule, 'HashMem');
  @GetAlias             := GetProcAddress(LibModule, 'GetAlias');
  @GetID                := GetProcAddress(LibModule, 'GetID');
  @GetCurrID            := GetProcAddress(LibModule, 'GetCurrID');
  @GetFlopID            := GetProcAddress(LibModule, 'GetFlopID');
  @GetKeyID             := GetProcAddress(LibModule, 'GetKeyID');
  @SprList              := GetProcAddress(LibModule, 'SprList');
  @CheckOpenKey         := GetProcAddress(LibModule, 'CheckOpenKey');
  @CheckKeyByNum        := GetProcAddress(LibModule, 'CheckKeyByNum');
  @CheckSpr             := GetProcAddress(LibModule, 'CheckSpr');
  @CheckKeyHash         := GetProcAddress(LibModule, 'CheckKeyHash');
  @ExtractKey           := GetProcAddress(LibModule, 'ExtractKey');
  @AddOpenKey           := GetProcAddress(LibModule, 'AddOpenKey');
  @DelOpenKey           := GetProcAddress(LibModule, 'DelOpenKey');
  @Res2Work             := GetProcAddress(LibModule, 'Res2Work');
  @SignSpr              := GetProcAddress(LibModule, 'SignSpr');
//Error  @EncryptMemOnPassword := GetProcAddress(LibModule, 'EncryptMemOnPassword');
  @Rndm                 := GetProcAddress(LibModule, 'Rndm');
  @ImitoMemOnPassword   := GetProcAddress(LibModule, 'ImitoMemOnPassword');
  @ImitoFileOnPassword  := GetProcAddress(LibModule, 'ImitoFileOnPassword');
  @ImitoFileOnGk        := GetProcAddress(LibModule, 'ImitoFileOnGk');
  @ImitoFile            := GetProcAddress(LibModule, 'ImitoFile');
  @Version              := GetProcAddress(LibModule, 'version');
  @OpenKeyCompromise    := GetProcAddress(LibModule, 'OpenKeyCompromise');

  Result :=
     Assigned(GetDrvInfo) and
     Assigned(SignInit) and
     Assigned(SignDone) and
     Assigned(CryptoInit) and
     Assigned(CryptoDone) and
     Assigned(EnCryptFile) and
     Assigned(DeCryptFile) and
     Assigned(GetFileSenderID) and
     Assigned(GetCryptKeysF) and
     Assigned(DeCryptMem) and
     Assigned(EnCryptMem) and
     Assigned(GetMemSenderID) and
     Assigned(GetCryptKeysM) and
     Assigned(SignLogIn) and
     Assigned(SignLogOut) and
     Assigned(DelSign) and
     Assigned(SignFile) and
     Assigned(check_file_sign) and
     Assigned(check_file_sign_ex) and
     Assigned(GetFileSignInfo) and
     Assigned(GetMemSignInfo) and
     Assigned(FreeMemory) and
     Assigned(SignFileSeparate) and
     Assigned(CheckFileSeparate) and
     Assigned(SignMem) and
     Assigned(check_mem_sign) and
     Assigned(Del_Mem_Sign) and
     Assigned(SignMemSeparate) and
     Assigned(SignMemSeparateEx) and
     Assigned(CheckMemSeparate) and
     Assigned(CheckMemSeparateEx) and
     Assigned(HashFile) and
     Assigned(HashMem) and
     Assigned(GetAlias) and
     Assigned(GetID) and
     Assigned(GetCurrID) and
     Assigned(GetFlopID) and
     Assigned(GetKeyID) and
     Assigned(SprList) and
     Assigned(CheckOpenKey) and
     Assigned(CheckKeyByNum) and
     Assigned(CheckSpr) and
     Assigned(CheckKeyHash) and
     Assigned(ExtractKey) and
     Assigned(AddOpenKey) and
     Assigned(DelOpenKey) and
     Assigned(Res2Work) and
     Assigned(SignSpr) and
//Error     Assigned(EncryptMemOnPassword) and
     Assigned(Rndm) and
     Assigned(ImitoMemOnPassword) and
     Assigned(ImitoFileOnPassword) and
     Assigned(ImitoFileOnGk) and
     Assigned(ImitoFile) and
     Assigned(Version) and
     Assigned(OpenKeyCompromise);

//Error     if SKZI = tpVerbaO then begin
//Error        Result := Result and Assigned(EnCryptMemEx) and Assigned(DeCryptMemEx) and Assigned(EnCryptFileEx) and Assigned(DeCryptFileEx);
//Error     end;

  if not Result then
     UnLoadDLL(PChar(DllName));
End;
//------------------------------------------------------------------------------
// �������� ����������
//------------------------------------------------------------------------------
function UnLoadDLL(DllName : string) : Boolean;
begin
 Result := (LibModule<>0) and not FreeLibrary(LibModule);
 LibModule := 0;
end;

{$ENDIF}


end.


