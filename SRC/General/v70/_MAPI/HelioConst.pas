unit HelioConst;

interface

uses
  Windows, Dialogs;

const
  RegistryRoot             = HKEY_LOCAL_MACHINE;
  HelioRootKey             = '\Software\Helio\5.0\';

  { --- Для Юры специально }
  KEY_HELIO                = HelioRootKey;
    HELIOLOG               = 'Server';
      LogPath              = 'LogPath';
    DBADMIN                = KEY_HELIO + 'Database Administrator';
      HELIODAS             = 'Data Access Server';

   szSCATPASSWORD          = 'SCAT PASSWORD';   
  { --- }

  { Фолдеры }

  ServerSubKey             = 'Server';
  ClientSubKey             = 'Client';
  CryptSubKey              = 'InfoCryptSign';
  AdminSubKey              = 'Admin';
  ServicesSubKey           = 'Services';
  Scat200SubKey            = 'SCAT200';
  Scat200DEV               = '\Devices';
  Scat200PubKeys           = '\Public Keys';

  { Серверные параметры }

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

  { Клиентские параметры }

  sHelioServerName         = 'HelioServerName';
  sConnectType             = 'ConnectType';
  sConnectPort             = 'ConnectPort';
  sPacketSize              = 'PacketSize';
  sInterceptor             = 'Interceptor';

  { Шифрование/подпись }
  sPrivateKey              = 'PrivateKey';
  sPublicBase              = 'PublicBase';
  sRandomFile              = 'RandomFile';

  { Сервисы }

  sInterval                = 'Interval';
  sServerName              = 'ServerName';

  { Параметры по умолчанию }

  InterbaseDriverName      = 'INTRBASE';
  OracleDriverName         = 'ORACLE';
  SocketConnectType        = 'SOCKET';
  DCOMConnectType          = 'DCOM';
  SocketPort               = 211;

  { Клиент }

  cHelioServerName         = '';
  cConnectType             = SocketConnectType;
  cConnectPort             = SocketPort;
  cPacketSize              = 50;
  cInterceptor             = '';

  { Сервер }

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

  { Подпись }

  cPrivateDirectory        = 'A:\';
  cPrivateKey              = cPrivateDirectory + 'SIGN.KEY';
  cPublicBase              = cPrivateDirectory + 'PUBL.KEY';
  cRandomFile              = cPrivateDirectory + 'RANDOM.BIN';

  { Сервисы }

  cInterval                = 5;

  { Timer }

  tmServiceTime            = 101;      { Продолжительность работы сервиса       }
  tmImportTime             = 102;      { Продолжительность импорта              }
  tmExportTime             = 103;      { Продолжительность экспорта             }
  tmPrintTime              = 104;      { Продолжительность формирования выписки }
  tmNSITime                = 105;      { Продолжительность обновления НСИ       }
  tmProcess                = 106;      { Продолжительность процесса             }
  tmSubProcess             = 107;      { Продолжительность подпроцесса          }
  tmAPITimeout             = 108;      { Timeout для API                        }
  tmAPIImportTime          = 109;      { Продолжительность API импорта          }
  tmAPIExportTime          = 110;      { Продолжительность API экспорта         }

(* BEGIN --- DO NOT CHANGE NEXT SECTION! *)

const
  err_MFOAInvalid                    = 1;     { Hедопуcтимый БИК отпpавителя            }
  err_MFOBInvalid                    = 2;     { Hедопуcтимый БИК получателя             }
  err_MFOANotFound                   = 3;     { БИК отпpавителя не cущеcтвует           }
  err_MFOBNotFound                   = 4;     { БИК получателя не cущеcтвует            }
  err_AccountAIsNull                 = 5;     { Hе заполнен cчет отпpавителя            }
  err_AccountBIsNull                 = 6;     { Hе заполнен cчет получателя             }
  err_AccountANotFound               = 7;     { Счет отпpавителя не откpыт              }
  err_AccountBNotFound               = 8;     { Счет получателя не откpыт               }
  err_AccountAMap                    = 9;     { Hевеpный баланcовый cчет 2-го поpядка отпpавителя}
  err_AccountBMap                    = 10;    { Hевеpный баланcовый cчет 2-го поpядка получателя}
  err_AccountAUse                    = 11;    { Hевеpное иcпользование cчета отпpавителя}
  err_AccountBUse                    = 12;    { Hевеpное иcпользование cчета получателя }
  err_AccountACurrency               = 13;    { Hевеpный код валюты в cчете оптpавителя }
  err_AccountBCurrency               = 14;    { Hевеpный код валюты в cчете получателя  }
  err_AccountAKey                    = 15;    { Hевеpный ключ в cчете отпpавителя       }
  err_AccountBKey                    = 16;    { Невеpный ключ в cчете получателя        }
  err_AccountAPrevent                = 17;    { Счет запpещен для иcпользования отпpавителем}
  err_AccountBPrevent                = 18;    { Счет запpещен для иcпользования получателем}
  err_InvalidAmount                  = 19;    { Hедопуcтимая cумма документа            }
  err_NullDateInput                  = 20;    { Hе заполнена дата поcтупления в банк-отпpавитель}
  err_NullDatePayment                = 21;    { Hе заполнена дата платежного документа  }
  err_NullDatePaymentTurn            = 22;    { Hе заполнена дата платежа               }
  err_NullDateRepaySend              = 23;    { Hе заполнена дата оплаты в банке-отправителе}
  err_InvalidDateInput               = 24;    { Hевеpная дата поcтупления в банк-отпpавитель}
  err_InvalidDatePayment             = 25;    { Hевеpная дата платежного документа      }
  err_InvalidDatePaymentTurn         = 26;    { Невеpная дата платежа                   }
  err_InvalidDateRepaySend           = 27;    { Hевеpная дата оплаты в банке-отпpавителе}
  err_InvalidNumPayment              = 28;    { Hевеpный номеp документа                }
  err_InvalidCodeTurn                = 29;    { Hевеpный код очеpедноcти платежа        }
  err_InvalidCriteriaGate            = 30;    { Hедопуcтимый cпоcоб отпpавки документа  }
  err_InvalidTypeDoc                 = 31;    { Тип документа не соответствует способу отправки}
  err_InvalidINNA                    = 32;    { Hевеpный ИHH отпpавителя                }
  err_InvalidINNB                    = 33;    { Невеpный ИHH получателя                 }
  err_NameASymbols                   = 34;    { В наименовании отпpавителя cодеpжатcя недопуcтимые cимволы}
  err_NameBSymbols                   = 35;    { В наименовании получателя cодеpжатcя недопуcтимые cимволы}
  err_InfoSymbols                    = 36;    { В назначении платежа cодеpжатcя недопуcтимые cимволы}
  err_InvalidAccountD                = 37;    { Невозможно получить счет по дебету      }
  err_InvalidAccountK                = 38;    { Невозможно получить счет по кредиту     }
  err_InvalidELNUM                   = 39;    { Подтверждение на несуществующий документ}
  err_RepeatDoc                      = 40;    { Повторный документ                      }
  err_UnexpectedConfirmation         = 41;    { Документ не ожидает полученного подтверждения}
  err_INNAInvalidLength              = 42;    { Неверная длина ИНН отправителя          }
  err_INNBInvalidLength              = 43;    { Неверная длина ИНН получателя           }
  err_INNAInvalidSymbols             = 44;    { Недопустимые символы в ИНН отправителя  }
  err_INNBInvalidSymbols             = 45;    { Недопустимые символы в ИНН получателя   }
  err_INNAInvalidRegion              = 46;    { В ИНН отправителя указан неверный регион}
  err_INNBInvalidRegion              = 47;    { В ИНН получателя указан неверный регион }
  err_cUnknownError                  = 50;    { Ошибка                                  }
  err_NullNameSender                 = 51;    { Не заполнено наименование отправителя   }
  err_NullNameReceiver               = 52;    { Не заполнено наименование получателя    }
  err_NullInformationSend            = 53;    { Не заполнено назначение платежа         }
  err_RabisError                     = 54;    { Документ не принят системой РАБИС       }
  err_InvalidKSA                     = 55;    { Неверный К/C банка-отправителя          }
  err_InvalidKSB                     = 56;    { Неверный К/C банка-получателя           }
  err_cErrSender                     = 57;    { Документ не может быть отправлен от имени данной организации}
  err_cErrReceiver                   = 58;    { Документ не может быть отправлен на данную организацию}
  err_cBadSignature                  = 90;    { Плохая подпись                          }
  err_cElSign1                       = 200;   { Цифровая подпись                        }
  err_cElSign2                       = 201;   { Подпись получателя                      }
  err_cDocToPost                     = 202;   { Документ в канал                        }
  err_cELRKC                         = 203;   { Подпись РКЦ                             }
  err_cBackBadSign                   = 204;   { Отказ пакета из-за плохой подписи       }
  err_cErrToPost                     = 205;   { Отказ от документа в канал              }
  err_cReqToPost                     = 206;   { Подтверждение в канал                   }
  err_cErrFromPost                   = 207;   { Отказ от документа из канала            }
  err_cReqFromPost                   = 209;   { Подтверждение из канала                 }
  err_cDocFromPost                   = 251;   { Документ из канала                      }
  err_cDocOnLine                     = 252;   { Передача документа в режиме On-Line     }
  err_cReqOnLine                     = 253;   { Передача подтверждения в режиме On-Line }
  err_cErrOnLine                     = 254;   { Передача отказа от документа в режиме On-Line}
  err_cRDocOnLine                    = 255;   { Прием документа в режиме On-Line        }
  err_cRReqOnLine                    = 256;   { Прием подтверждения в режиме On-Line    }
  err_cRErrOnLine                    = 257;   { Прием отказа от документа в режиме On-Line}
  err_cExportToRabis                 = 260;   { Экспорт документа в РАБИС               }
  err_cPayRabis1                     = 300;   { Документ оплачен в РКЦ                  }
  err_cPayRabis2                     = 301;   { Документ оплачен в РКЦ                  }
  err_cWaitAmount                    = 303;   { Отложен из-за недостатка средств        }
  err_cPayBack                       = 304;   { Аннулирован отправителем                }
  err_cErrorAmount                   = 305;   { Отказ от документа из-за недостатка средств}
  err_cAcceptPay                     = 306;   { Документ принят в РКЦ                   }
  err_cExportABC                     = 320;   { Сформирован пакет                       }
  err_cDocToErrArc                   = 350;   { Документ в архив ошибочных              }
  err_cDocToArc                      = 360;   { Документ в архив                        }
  err_cBackSign                      = 361;   { Снятие подписи                          }
  err_cCreateDoc2                    = 540;   { Создание документа для двойного ввода   }
  err_cRecreateDoc2                  = 543;   { Переоформление документа                }
  err_cCreateDoc1                    = 544;   { Создание документа при вводе            }
  err_cRecreateDoc1                  = 546;   { Переоформление документа                }
  err_cImportDBF                     = 547;   { Импорт от внешних источников            }
  err_cImportDoc                     = 550;   { Импорт документа                        }
  err_cCreateDoc                     = 551;   { Создание документа                      }
  err_cRecreateDoc                   = 552;   { Переоформление документа                }
  err_cImportRabis                   = 560;   { Импорт документа из РАБИС               }
  err_InvalidReference               = 1001;  { Неверная ссылка на документ             }
  err_InvalidInputStatus             = 1002;  { Неверное входное состояние              }
  err_UnknownCurrentStatus           = 1003;  { Неизвестное текущее состояние документа }

  err_HelioError                     = 20000; { Ошибка                                  }
  err_sysSentRepeatQueryPacket       = 20001; { Отправлен запрос на повтор пакета       }
  err_sysRecvRepeatQueryPacket       = 20002; { Получен запрос на повтор пакета         }
  err_sysSendRepeatPacket            = 20003; { Пакет повторно отправлен по запросу     }
  err_sysReceiverPacketFalse         = 20004; { Получен пакет направленрый на другого получателя}
  err_sysSenderPacketFalse           = 20005; { Получен пакет от отключенного участника платежей}
  err_sysDublPacket                  = 20006; { Повторный прием пакета                  }
  err_sysReferencePacketFalse        = 20007; { Неверная ссылка у полученного пакета    }
  err_sysErrProcedure                = 20008; { Ошибка при исполнении процедуры         }
  err_sysLogin                       = 20009; { Вход в систему                          }
  err_sysLogout                      = 20010; { Выход из системы                        }
  err_sysErrLogin                    = 20011; { Неудачный вход в систему                }
  err_sysServerOFF                   = 20012; { Сервер приложений был отключен при подключении пользователя}
  err_sysCheckSign                   = 20013; { Ошибка при проверке подписи на файле    }
  err_sysPutSign                     = 20014; { Ошибка подписи файла                    }
  err_sysDeleteFile                  = 20015; { Невозможно удалить файл                 }
  err_sysMoveFile                    = 20016; { Невозможно переместить файл             }
  err_sysCopyFile                    = 20017; { Невозможно скопировать файл             }
  err_sysTableUpdate                 = 20018; { Невозможно обновить таблицу(ы)          }
  err_sysAPIImport                   = 20019; { API Импорт                              }
  err_sysAPIExport                   = 20020; { API Экспорт                             }
  err_sysInvalidMsgFormat            = 20021; { Сообщение в неверном формате            }
  err_sysNullSection                 = 20022; { Секция FILES пуста или отсутствует      }
  err_sysWrongVersion                = 20023; { Попытка установить уже имеющуюся версию }
  err_sysGetMaxVersion               = 20024; { Невозможно доступиться к таблице tVersions}
  err_sysNoFileInfo                  = 20025; { Нет информации о файле                  }
  err_sysBadFile                     = 20030; { Файл отличен от ожидаемого              }
  err_sysReport                      = 20031; { Обработан запрос на формирование выписки}
  err_sysNSIBankIsNull               = 20032; { Невозможно определить БИК РКЦ. Возможно не заполнен справочник банков}
  err_sysDayClosed                   = 20033; { День не открыт. Операции не разрешены   }
  err_sysDoExport                    = 20034; { Экспорт документов                      }
  err_sysDoImport                    = 20035; { Импорт документов                       }
  err_sysBadNSI                      = 20036; { Работа невозможна. Запустите сервис обслуживания справочников. Установите актуальную версию НСИ}
  err_sysSetNSIVersion               = 20100; { Установка версии НСИ                    }
  err_sysSetPrgVersion               = 20101; { Установка версии ПО                     }
  err_sysSetWorkbaseVersion          = 20102; { Установка таблицы                       }
  err_sysNoLicense                   = 20200; { У вас нет лицензии администратора ГЕЛИО }
  err_sysRemoteConnect               = 20201; { Удачная попытка удаленного соединения   }
  err_sysRemoteConnectFailed         = 20202; { Неудачная попытка удаленного соединения }
  err_sysRemoteDisconnect            = 20203; { Отсоединение от удаленного сервера      }
  err_sysLongTimeout                 = 20204; { Переход в режим Off-Line при длительном простое}
  err_sysPrintConnectFailed          = 20205; { Ошибка соединения с сервером печати     }
  err_sysAppServConnectFailed        = 20206; { Сервер приложений отключен              }
  err_sysPacketControlAbort          = 20207; { Неустранимая ошибка при контроле потока }
  err_sysPacketQueryFalse            = 20208; { Запрос на несуществующий пакет          }
  err_sysSocketConnectionError       = 20209; { Ошибка Socket соединения                }
  err_sysPacketInBodyError           = 20210; { Ошибка разрушенного содержимого пакета  }
  err_MakeSings                      = 20211; { ИС о подписи                            }
  err_SendDocs                       = 20212; { ИС о посылке  документов                }
  err_SendReqs                       = 20213; { ИС о посылке  подтверждений             }
  err_SendClose                      = 20214; { ИС о посылке  закрытия                  }
  err_sysSendDocs                    = 20215; { Ошибка при отправке документов          }
  err_sysSendReqs                    = 20216; { Ошибка при отправке подтверждений       }
  err_sysSendClose                   = 20217; { Ошибка при отправке закрытия            }
  err_sysBadUser                     = 20218; { Пользователь не зарегистрирован в базе публичных ключей}
  err_sysBadPassword                 = 20219; { Пользователем %s введен неверный пароль }
  err_sysBadOldPassword              = 20220; { Пользователем %s введен неверный старый пароль}

(* END *)


resourcestring
  Unclaimed                          = '';

  { Services }

  WorkPlaceServiceID                 = 'Обслуживание рабочих мест';
  ReportServiceID                    = 'Служба отчетности';
  ExternalExchangeServiceID          = 'Служба обмена с внешними системами';
  NSIServiceID                       = 'Служба обновления справочников';
  ExchangeServiceID                  = 'Служба обмена документами';

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

  rs_sysInvalidExchangeFormat        = 'Неверный параметр формата обмена с внешними системами (%d)';
  rs_sysInvalidMode                  = 'Неверный параметр режима обмена с Рабис (%d)';
  rs_sysInvalidAccountFormat         = 'Неверный параметр формата справочника счетов (%d)';
  rs_sysInvalidAccount2Format        = 'Неверный параметр формата справочника счетов 2-го порядка (%d)';
  rs_sysCannotCreateDir              = 'Невозможно создать каталог %s';
  rs_sysCopyMove                     = '%s -> %s';
  rs_ImportExportCount               = 'Обработано %d документов';
  rs_APIImportExportComment          = '%s код завершения %d';

type
  TOnProtocolEvent = procedure(MsgType : TMsgDlgType; SysActionID : Integer; Comment : String) of object;

implementation

end.
