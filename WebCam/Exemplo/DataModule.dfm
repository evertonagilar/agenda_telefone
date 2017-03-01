object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Left = 313
  Top = 155
  Height = 225
  Width = 454
  object sqlConexao: TSQLConnection
    ConnectionName = 'Acesso'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=localhost:D:\ClubeDelphi\Revista\ed77\Autor\WebCam\Exem' +
        'plo\Recepcao.gdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 24
    Top = 64
  end
  object sdsVisitantes: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * FROM VISITANTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 104
    Top = 8
  end
  object dspVisitantes: TDataSetProvider
    DataSet = sdsVisitantes
    Left = 200
    Top = 8
  end
  object cdsVisitantes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVisitantes'
    AfterScroll = cdsVisitantesAfterScroll
    Left = 296
    Top = 8
    object cdsVisitantesID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Required = True
    end
    object cdsVisitantesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsVisitantesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsVisitantesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsVisitantesESTADO: TStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsVisitantesRG: TStringField
      DisplayLabel = 'R.G.:'
      FieldName = 'RG'
      EditMask = '99.999.999-9;1;_'
      Size = 15
    end
    object cdsVisitantesCPF: TStringField
      DisplayLabel = 'C.P.F.:'
      FieldName = 'CPF'
      EditMask = '999.999.999-99;1;_'
      Size = 15
    end
    object cdsVisitantesDATA_NASC: TSQLTimeStampField
      DisplayLabel = 'Data Nasc.'
      FieldName = 'DATA_NASC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsVisitantesTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      EditMask = '(9999)9999-9999;1;_'
      Size = 15
    end
    object cdsVisitantesEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Size = 60
    end
    object cdsVisitantesCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 30
    end
    object cdsVisitantesDATA_CAD: TSQLTimeStampField
      DisplayLabel = 'Data Cad.'
      FieldName = 'DATA_CAD'
    end
    object cdsVisitantesFOTO: TStringField
      DisplayLabel = 'Foto'
      FieldName = 'FOTO'
      Size = 200
    end
  end
  object dspVisitas: TDataSetProvider
    DataSet = sdsVisitas
    Left = 200
    Top = 72
  end
  object sdsVisitas: TSQLDataSet
    CommandText = 'SELECT * FROM VISITAS WHERE ID_VISITANTE= :ID_VISITANTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_VISITANTE'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 104
    Top = 72
  end
  object cdsVisitas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_VISITANTE'
        ParamType = ptInput
        Value = '9'
      end>
    ProviderName = 'dspVisitas'
    AfterInsert = cdsVisitasAfterInsert
    Left = 296
    Top = 72
    object cdsVisitasID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Required = True
    end
    object cdsVisitasID_VISITANTE: TIntegerField
      DisplayLabel = 'C'#243'd. Visitante'
      FieldName = 'ID_VISITANTE'
    end
    object cdsVisitasANDAR: TIntegerField
      DisplayLabel = 'Andar'
      FieldName = 'ANDAR'
    end
    object cdsVisitasSALA: TStringField
      DisplayLabel = 'Sala'
      FieldName = 'SALA'
      Size = 5
    end
    object cdsVisitasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Size = 60
    end
    object cdsVisitasCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 30
    end
    object cdsVisitasDATA_VISITA: TSQLTimeStampField
      DisplayLabel = 'Data Visita'
      FieldName = 'DATA_VISITA'
    end
  end
  object sdsAuxiliar: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 104
    Top = 136
  end
  object dspAuxiliar: TDataSetProvider
    DataSet = sdsAuxiliar
    Left = 200
    Top = 136
  end
  object cdsAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAuxiliar'
    Left = 304
    Top = 136
  end
  object dtsVisitas: TDataSource
    AutoEdit = False
    DataSet = cdsVisitas
    Left = 392
    Top = 72
  end
  object dtsVisitantes: TDataSource
    AutoEdit = False
    DataSet = cdsVisitantes
    OnDataChange = dtsVisitantesDataChange
    Left = 392
    Top = 8
  end
end
