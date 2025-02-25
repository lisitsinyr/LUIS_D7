unit HelioConst;

interface

uses
  Windows, Dialogs;

const
  RegistryRoot             = HKEY_LOCAL_MACHINE;
  HelioRootKey             = '\Software\Helio\5.0\';

  { --- ��� ��� ���������� }
  KEY_HELIO                = HelioRootKey;
    HELIOLOG               = 'Server';
      LogPath              = 'LogPath';
    DBADMIN                = KEY_HELIO + 'Database Administrator';
      HELIODAS             = 'Data Access Server';

   szSCATPASSWORD          = 'SCAT PASSWORD';   
  { --- }

  { ������� }

  ServerSubKey             = 'Server';
  ClientSubKey             = 'Client';
  CryptSubKey              = 'InfoCryptSign';
  AdminSubKey              = 'Admin';
  ServicesSubKey           = 'Services';
  Scat200SubKey            = 'SCAT200';
  Scat200DEV               = '\Devices';
  Scat200PubKeys           = '\Public Keys';

  { ��������� ��������� }

  sDBName                  = 'DBName';
  sDBDriver                = 'DBDriver';
  sRabis2                  = 'Rabis2';
  sExternalConnectType     = 'ExternalConnectType';
  sExternalPort            = 'ExternalPort';
  sTimeOutOnLine           = 'TimeOutOnLine';
  sLogPath                 = 'LogPath';
  sImportpath              = 'ImportPath';
  sExportPath              = 'ExportPath';
  sExchangeFormat          = 'ExchangeFormat';
  sRabisMode               = 'RabisMode';
  sEtalonDoc               = 'EtalonDOC';
  sEtalonMERDOK            = 'EtalonMERDOK';
  sEtalonMERKWI            = 'EtalonMERKWI';
  sEtalonQuery             = 'EtalonQuery';
  sBICDirectory            = 'BICDirectory';
  sAccountMapDirectory     = 'AccountMapDirectory';
  sAccountDirectory        = 'AccountDirectory';
  sAccount2Format          = 'Account2Format';
  sAccountFormat           = 'AccountFormat';
  sInMailDir               = 'InMailDir';
  sOutMailDir              = 'OutMailDir';
  sArjPassword             = 'ARJPassword';
  sBadFiles                = 'BadFiles';
  sImportZ                 = 'ImportZ';
  sClientIniName           = 'ClientIniName';
  sNSIMessage              = 'NSIMessage';

  { ���������� ��������� }

  sHelioServerName         = 'HelioServerName';
  sConnectType             = 'ConnectType';
  sConnectPort             = 'ConnectPort';
  sPacketSize              = 'PacketSize';
  sInterceptor             = 'Interceptor';

  { ����������/������� }
  sPrivateKey              = 'PrivateKey';
  sPublicBase              = 'PublicBase';
  sRandomFile              = 'RandomFile';

  { ������� }

  sInterval                = 'Interval';
  sServerName              = 'ServerName';

  { ��������� �� ��������� }

  InterbaseDriverName      = 'INTRBASE';
  OracleDriverName         = 'ORACLE';
  SocketConnectType        = 'SOCKET';
  DCOMConnectType          = 'DCOM';
  SocketPort               = 211;

  { ������ }

  cHelioServerName         = '';
  cConnectType             = SocketConnectType;
  cConnectPort             = SocketPort;
  cPacketSize              = 50;
  cInterceptor             = '';

  { ������ }

  cHelioDirectory          = 'C:\HELIO5\';
  cDBName                  = cHelioDirectory + 'DATABASE\SP.GDB';
  cRabis2                  = '';
  cDBDriver                = 'INTRBASE';
  cExternalConnectType     = SocketConnectType;
  cExternalPort            = SocketPort;
  cTimeOutOnLine           = 10;
  cLogPath                 = cHelioDirectory;
  cImportPath              = cHelioDirectory;
  cExportpath              = cHelioDirectory;
  cExchangeFormat          = 0;
  cEtalonDoc               = cHelioDirectory + 'DOCS.DBF';
  cEtalonMERDOK            = cHelioDirectory + 'MERDOK.DBF';
  cEtalonMERKWI            = cHelioDirectory + 'MERKWI.DBF';
  cEtalonQuery             = cHelioDirectory + 'QUERY.DBF';
  cBICDirectory            = cHelioDirectory;
  cAccountMapDirectory     = cHelioDirectory;
  cAccountDirectory        = cHelioDirectory;
  cAccount2Format          = 0;
  cAccountFormat           = 0;
  cRabisMode               = 0;
  cInMailDir               = cHelioDirectory;
  cOutMailDir              = cHelioDirectory;
  cArjPassword             = '';
  cBadFiles                = '';
  cImportZ                 = '';
  cClientIniName           = cHelioDirectory + 'HCLIENT.INI';
  cNSIMessage              = 'NSI.MSG';

  { ������� }

  cPrivateDirectory        = 'A:\';
  cPrivateKey              = cPrivateDirectory + 'SIGN.KEY';
  cPublicBase              = cPrivateDirectory + 'PUBL.KEY';
  cRandomFile              = cPrivateDirectory + 'RANDOM.BIN';

  { ������� }

  cInterval                = 5;

  { Timer }

  tmServiceTime            = 101;      { ����������������� ������ �������       }
  tmImportTime             = 102;      { ����������������� �������              }
  tmExportTime             = 103;      { ����������������� ��������             }
  tmPrintTime              = 104;      { ����������������� ������������ ������� }
  tmNSITime                = 105;      { ����������������� ���������� ���       }
  tmProcess                = 106;      { ����������������� ��������             }
  tmSubProcess             = 107;      { ����������������� �����������          }
  tmAPITimeout             = 108;      { Timeout ��� API                        }
  tmAPIImportTime          = 109;      { ����������������� API �������          }
  tmAPIExportTime          = 110;      { ����������������� API ��������         }

(* BEGIN --- DO NOT CHANGE NEXT SECTION! *)

const
  err_MFOAInvalid                    = 1;     { H�����c����� ��� ���p�������            }
  err_MFOBInvalid                    = 2;     { H�����c����� ��� ����������             }
  err_MFOANotFound                   = 3;     { ��� ���p������� �� c���c�����           }
  err_MFOBNotFound                   = 4;     { ��� ���������� �� c���c�����            }
  err_AccountAIsNull                 = 5;     { H� �������� c��� ���p�������            }
  err_AccountBIsNull                 = 6;     { H� �������� c��� ����������             }
  err_AccountANotFound               = 7;     { ���� ���p������� �� ���p��              }
  err_AccountBNotFound               = 8;     { ���� ���������� �� ���p��               }
  err_AccountAMap                    = 9;     { H���p��� �����c���� c��� 2-�� ��p���� ���p�������}
  err_AccountBMap                    = 10;    { H���p��� �����c���� c��� 2-�� ��p���� ����������}
  err_AccountAUse                    = 11;    { H���p��� �c����������� c���� ���p�������}
  err_AccountBUse                    = 12;    { H���p��� �c����������� c���� ���������� }
  err_AccountACurrency               = 13;    { H���p��� ��� ������ � c���� ���p������� }
  err_AccountBCurrency               = 14;    { H���p��� ��� ������ � c���� ����������  }
  err_AccountAKey                    = 15;    { H���p��� ���� � c���� ���p�������       }
  err_AccountBKey                    = 16;    { ����p��� ���� � c���� ����������        }
  err_AccountAPrevent                = 17;    { ���� ���p���� ��� �c����������� ���p��������}
  err_AccountBPrevent                = 18;    { ���� ���p���� ��� �c����������� �����������}
  err_InvalidAmount                  = 19;    { H�����c����� c���� ���������            }
  err_NullDateInput                  = 20;    { H� ��������� ���� ��c�������� � ����-���p�������}
  err_NullDatePayment                = 21;    { H� ��������� ���� ���������� ���������  }
  err_NullDatePaymentTurn            = 22;    { H� ��������� ���� �������               }
  err_NullDateRepaySend              = 23;    { H� ��������� ���� ������ � �����-�����������}
  err_InvalidDateInput               = 24;    { H���p��� ���� ��c�������� � ����-���p�������}
  err_InvalidDatePayment             = 25;    { H���p��� ���� ���������� ���������      }
  err_InvalidDatePaymentTurn         = 26;    { ����p��� ���� �������                   }
  err_InvalidDateRepaySend           = 27;    { H���p��� ���� ������ � �����-���p�������}
  err_InvalidNumPayment              = 28;    { H���p��� ����p ���������                }
  err_InvalidCodeTurn                = 29;    { H���p��� ��� ���p����c�� �������        }
  err_InvalidCriteriaGate            = 30;    { H�����c����� c��c�� ���p���� ���������  }
  err_InvalidTypeDoc                 = 31;    { ��� ��������� �� ������������� ������� ��������}
  err_InvalidINNA                    = 32;    { H���p��� �HH ���p�������                }
  err_InvalidINNB                    = 33;    { ����p��� �HH ����������                 }
  err_NameASymbols                   = 34;    { � ������������ ���p������� c���p���c� ������c����� c������}
  err_NameBSymbols                   = 35;    { � ������������ ���������� c���p���c� ������c����� c������}
  err_InfoSymbols                    = 36;    { � ���������� ������� c���p���c� ������c����� c������}
  err_InvalidAccountD                = 37;    { ���������� �������� ���� �� ������      }
  err_InvalidAccountK                = 38;    { ���������� �������� ���� �� �������     }
  err_InvalidELNUM                   = 39;    { ������������� �� �������������� ��������}
  err_RepeatDoc                      = 40;    { ��������� ��������                      }
  err_UnexpectedConfirmation         = 41;    { �������� �� ������� ����������� �������������}
  err_INNAInvalidLength              = 42;    { �������� ����� ��� �����������          }
  err_INNBInvalidLength              = 43;    { �������� ����� ��� ����������           }
  err_INNAInvalidSymbols             = 44;    { ������������ ������� � ��� �����������  }
  err_INNBInvalidSymbols             = 45;    { ������������ ������� � ��� ����������   }
  err_INNAInvalidRegion              = 46;    { � ��� ����������� ������ �������� ������}
  err_INNBInvalidRegion              = 47;    { � ��� ���������� ������ �������� ������ }
  err_cUnknownError                  = 50;    { ������                                  }
  err_NullNameSender                 = 51;    { �� ��������� ������������ �����������   }
  err_NullNameReceiver               = 52;    { �� ��������� ������������ ����������    }
  err_NullInformationSend            = 53;    { �� ��������� ���������� �������         }
  err_RabisError                     = 54;    { �������� �� ������ �������� �����       }
  err_InvalidKSA                     = 55;    { �������� �/C �����-�����������          }
  err_InvalidKSB                     = 56;    { �������� �/C �����-����������           }
  err_cErrSender                     = 57;    { �������� �� ����� ���� ��������� �� ����� ������ �����������}
  err_cErrReceiver                   = 58;    { �������� �� ����� ���� ��������� �� ������ �����������}
  err_cBadSignature                  = 90;    { ������ �������                          }
  err_cElSign1                       = 200;   { �������� �������                        }
  err_cElSign2                       = 201;   { ������� ����������                      }
  err_cDocToPost                     = 202;   { �������� � �����                        }
  err_cELRKC                         = 203;   { ������� ���                             }
  err_cBackBadSign                   = 204;   { ����� ������ ��-�� ������ �������       }
  err_cErrToPost                     = 205;   { ����� �� ��������� � �����              }
  err_cReqToPost                     = 206;   { ������������� � �����                   }
  err_cErrFromPost                   = 207;   { ����� �� ��������� �� ������            }
  err_cReqFromPost                   = 209;   { ������������� �� ������                 }
  err_cDocFromPost                   = 251;   { �������� �� ������                      }
  err_cDocOnLine                     = 252;   { �������� ��������� � ������ On-Line     }
  err_cReqOnLine                     = 253;   { �������� ������������� � ������ On-Line }
  err_cErrOnLine                     = 254;   { �������� ������ �� ��������� � ������ On-Line}
  err_cRDocOnLine                    = 255;   { ����� ��������� � ������ On-Line        }
  err_cRReqOnLine                    = 256;   { ����� ������������� � ������ On-Line    }
  err_cRErrOnLine                    = 257;   { ����� ������ �� ��������� � ������ On-Line}
  err_cExportToRabis                 = 260;   { ������� ��������� � �����               }
  err_cPayRabis1                     = 300;   { �������� ������� � ���                  }
  err_cPayRabis2                     = 301;   { �������� ������� � ���                  }
  err_cWaitAmount                    = 303;   { ������� ��-�� ���������� �������        }
  err_cPayBack                       = 304;   { ����������� ������������                }
  err_cErrorAmount                   = 305;   { ����� �� ��������� ��-�� ���������� �������}
  err_cAcceptPay                     = 306;   { �������� ������ � ���                   }
  err_cExportABC                     = 320;   { ����������� �����                       }
  err_cDocToErrArc                   = 350;   { �������� � ����� ���������              }
  err_cDocToArc                      = 360;   { �������� � �����                        }
  err_cBackSign                      = 361;   { ������ �������                          }
  err_cCreateDoc2                    = 540;   { �������� ��������� ��� �������� �����   }
  err_cRecreateDoc2                  = 543;   { �������������� ���������                }
  err_cCreateDoc1                    = 544;   { �������� ��������� ��� �����            }
  err_cRecreateDoc1                  = 546;   { �������������� ���������                }
  err_cImportDBF                     = 547;   { ������ �� ������� ����������            }
  err_cImportDoc                     = 550;   { ������ ���������                        }
  err_cCreateDoc                     = 551;   { �������� ���������                      }
  err_cRecreateDoc                   = 552;   { �������������� ���������                }
  err_cImportRabis                   = 560;   { ������ ��������� �� �����               }
  err_InvalidReference               = 1001;  { �������� ������ �� ��������             }
  err_InvalidInputStatus             = 1002;  { �������� ������� ���������              }
  err_UnknownCurrentStatus           = 1003;  { ����������� ������� ��������� ��������� }

  err_HelioError                     = 20000; { ������                                  }
  err_sysSentRepeatQueryPacket       = 20001; { ��������� ������ �� ������ ������       }
  err_sysRecvRepeatQueryPacket       = 20002; { ������� ������ �� ������ ������         }
  err_sysSendRepeatPacket            = 20003; { ����� �������� ��������� �� �������     }
  err_sysReceiverPacketFalse         = 20004; { ������� ����� ������������ �� ������� ����������}
  err_sysSenderPacketFalse           = 20005; { ������� ����� �� ������������ ��������� ��������}
  err_sysDublPacket                  = 20006; { ��������� ����� ������                  }
  err_sysReferencePacketFalse        = 20007; { �������� ������ � ����������� ������    }
  err_sysErrProcedure                = 20008; { ������ ��� ���������� ���������         }
  err_sysLogin                       = 20009; { ���� � �������                          }
  err_sysLogout                      = 20010; { ����� �� �������                        }
  err_sysErrLogin                    = 20011; { ��������� ���� � �������                }
  err_sysServerOFF                   = 20012; { ������ ���������� ��� �������� ��� ����������� ������������}
  err_sysCheckSign                   = 20013; { ������ ��� �������� ������� �� �����    }
  err_sysPutSign                     = 20014; { ������ ������� �����                    }
  err_sysDeleteFile                  = 20015; { ���������� ������� ����                 }
  err_sysMoveFile                    = 20016; { ���������� ����������� ����             }
  err_sysCopyFile                    = 20017; { ���������� ����������� ����             }
  err_sysTableUpdate                 = 20018; { ���������� �������� �������(�)          }
  err_sysAPIImport                   = 20019; { API ������                              }
  err_sysAPIExport                   = 20020; { API �������                             }
  err_sysInvalidMsgFormat            = 20021; { ��������� � �������� �������            }
  err_sysNullSection                 = 20022; { ������ FILES ����� ��� �����������      }
  err_sysWrongVersion                = 20023; { ������� ���������� ��� ��������� ������ }
  err_sysGetMaxVersion               = 20024; { ���������� ����������� � ������� tVersions}
  err_sysNoFileInfo                  = 20025; { ��� ���������� � �����                  }
  err_sysBadFile                     = 20030; { ���� ������� �� ����������              }
  err_sysReport                      = 20031; { ��������� ������ �� ������������ �������}
  err_sysNSIBankIsNull               = 20032; { ���������� ���������� ��� ���. �������� �� �������� ���������� ������}
  err_sysDayClosed                   = 20033; { ���� �� ������. �������� �� ���������   }
  err_sysDoExport                    = 20034; { ������� ����������                      }
  err_sysDoImport                    = 20035; { ������ ����������                       }
  err_sysBadNSI                      = 20036; { ������ ����������. ��������� ������ ������������ ������������. ���������� ���������� ������ ���}
  err_sysSetNSIVersion               = 20100; { ��������� ������ ���                    }
  err_sysSetPrgVersion               = 20101; { ��������� ������ ��                     }
  err_sysSetWorkbaseVersion          = 20102; { ��������� �������                       }
  err_sysNoLicense                   = 20200; { � ��� ��� �������� �������������� ����� }
  err_sysRemoteConnect               = 20201; { ������� ������� ���������� ����������   }
  err_sysRemoteConnectFailed         = 20202; { ��������� ������� ���������� ���������� }
  err_sysRemoteDisconnect            = 20203; { ������������ �� ���������� �������      }
  err_sysLongTimeout                 = 20204; { ������� � ����� Off-Line ��� ���������� �������}
  err_sysPrintConnectFailed          = 20205; { ������ ���������� � �������� ������     }
  err_sysAppServConnectFailed        = 20206; { ������ ���������� ��������              }
  err_sysPacketControlAbort          = 20207; { ������������ ������ ��� �������� ������ }
  err_sysPacketQueryFalse            = 20208; { ������ �� �������������� �����          }
  err_sysSocketConnectionError       = 20209; { ������ Socket ����������                }
  err_sysPacketInBodyError           = 20210; { ������ ������������ ����������� ������  }
  err_MakeSings                      = 20211; { �� � �������                            }
  err_SendDocs                       = 20212; { �� � �������  ����������                }
  err_SendReqs                       = 20213; { �� � �������  �������������             }
  err_SendClose                      = 20214; { �� � �������  ��������                  }
  err_sysSendDocs                    = 20215; { ������ ��� �������� ����������          }
  err_sysSendReqs                    = 20216; { ������ ��� �������� �������������       }
  err_sysSendClose                   = 20217; { ������ ��� �������� ��������            }
  err_sysBadUser                     = 20218; { ������������ �� ��������������� � ���� ��������� ������}
  err_sysBadPassword                 = 20219; { ������������� %s ������ �������� ������ }
  err_sysBadOldPassword              = 20220; { ������������� %s ������ �������� ������ ������}

(* END *)


resourcestring
  Unclaimed                          = '';

  { Services }

  WorkPlaceServiceID                 = '������������ ������� ����';
  ReportServiceID                    = '������ ����������';
  ExternalExchangeServiceID          = '������ ������ � �������� ���������';
  NSIServiceID                       = '������ ���������� ������������';
  ExchangeServiceID                  = '������ ������ �����������';

  HelioAppServerName                 = 'DocSrv.HelioAppServer';
  HelioManServerName                 = 'DocSrv.AppManager';
  ReportCoiServerName                = 'RabisPrint.RabisPrintIntf';
  CoiOnLineName                      = 'cserver.XOnLineServer';
  KBOnLineName                       = 'hserver.OnLineServer';
  CoiExchangeServiceName             = 'cserver.CServerManager';
  KBExchangeServiceName              = 'hserver.HServerManager';
  APIServiceName                     = 'APIImportExport.API';

  WorkPlaceServiceName               = 'OnSrv.OnLineManager';
  ReportServiceName                  = 'RabisPrint.PrintLogin';
  ExternalExchangeServiceName        = 'KBImportExport.KB';
  Rabis2ExchangeServiceName          = 'COIImportExport.COI';
  NSIServiceName                     = 'UpdateNSI.NSI';

  rs_sysInvalidExchangeFormat        = '�������� �������� ������� ������ � �������� ��������� (%d)';
  rs_sysInvalidMode                  = '�������� �������� ������ ������ � ����� (%d)';
  rs_sysInvalidAccountFormat         = '�������� �������� ������� ����������� ������ (%d)';
  rs_sysInvalidAccount2Format        = '�������� �������� ������� ����������� ������ 2-�� ������� (%d)';
  rs_sysCannotCreateDir              = '���������� ������� ������� %s';
  rs_sysCopyMove                     = '%s -> %s';
  rs_ImportExportCount               = '���������� %d ����������';
  rs_APIImportExportComment          = '%s ��� ���������� %d';

type
  TOnProtocolEvent = procedure(MsgType : TMsgDlgType; SysActionID : Integer; Comment : String) of object;

implementation

end.
