object fPrincipal: TfPrincipal
  Left = 157
  Top = 91
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ClubeDelphi - Programa exemplo de Recep'#231#227'o'
  ClientHeight = 472
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 325
    Width = 107
    Height = 13
    Caption = 'Hist'#243'rico de visitas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 304
    Width = 781
    Height = 15
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 8
    Top = 60
    Width = 32
    Height = 13
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 100
    Width = 52
    Height = 13
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 296
    Top = 100
    Width = 38
    Height = 13
    Caption = 'Cidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 472
    Top = 100
    Width = 14
    Height = 13
    Caption = 'UF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 140
    Width = 99
    Height = 13
    Caption = 'R.G. (Obrigat'#243'rio)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 136
    Top = 140
    Width = 29
    Height = 13
    Caption = 'C.P.F.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 296
    Top = 140
    Width = 59
    Height = 13
    Caption = 'Data Nasc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 391
    Top = 140
    Width = 49
    Height = 13
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 180
    Width = 49
    Height = 13
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 8
    Top = 223
    Width = 45
    Height = 13
    Caption = 'Contato'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCaptura: TButton
    Left = 575
    Top = 267
    Width = 216
    Height = 25
    Caption = 'Capturar'
    Enabled = False
    TabOrder = 10
    OnClick = btnCapturaClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 54
    Align = alTop
    TabOrder = 11
    object Bevel2: TBevel
      Left = 128
      Top = 3
      Width = 9
      Height = 50
      Shape = bsLeftLine
    end
    object Bevel3: TBevel
      Left = 260
      Top = 3
      Width = 9
      Height = 50
      Shape = bsLeftLine
    end
    object btnIncluir: TBitBtn
      Left = 5
      Top = 4
      Width = 58
      Height = 47
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Layout = blGlyphTop
    end
    object btnAlterar: TBitBtn
      Left = 63
      Top = 4
      Width = 58
      Height = 47
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777000077777777777777777777000077777771171177777777000078FF
        FFFFF1FFFFFFFFF70000780000000100000000F70000780FFFFFF1FFFFFFF0F7
        0000780FFFFFF1FFFFFFF0F70000780FCCCCF1FCCCCFF0F70000780FCFCCF1FC
        CFCCF0F70000780FCCCCF1FCCFCCF0F70000780FFFCCF1FCCFCCF0F70000780F
        CCCFF1FCCCCFF0F70000780FFFFFF1FCCFFFF0F70000780FFFFFF1FCCFFFF0F7
        0000780FFFFFF1FFFFFFF0F70000780000000100000000F70000788888888188
        8888888700007777777117117777777700007777777777777777777700007777
        77777777777777770000}
      Layout = blGlyphTop
    end
    object btnGravar: TBitBtn
      Left = 136
      Top = 4
      Width = 58
      Height = 47
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 2
      OnClick = btnGravarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
      Layout = blGlyphTop
    end
    object btnCancelar: TBitBtn
      Left = 194
      Top = 4
      Width = 58
      Height = 47
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = btnCancelarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00331111133333
        333333FFFFF33333333333319993333333333338888333333333333199933333
        1133333888833333FF3333991993333399133388F883333388F3339133933333
        3913338F33833333388F391333333333339138F333333333338F391333333333
        339138F333333333338F391333333333339138F333333333338F391333333333
        339138F333333333338F391333333333339138F333333333338F339133333333
        3991338F33333333388F33991333333399133388F333333388F3333991333339
        913333388F3333388F333333991111191333333388FFFFF8F333333333999993
        3333333333888883333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object btnExcluir: TBitBtn
      Left = 269
      Top = 4
      Width = 58
      Height = 47
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777771077771077777777777771110777777
        1077771110777771077777711107771107777777111071107777777771111107
        7777777777111077777777777111110777777777111071077777771111077711
        0777711110777771107771107777777711077777777777777777}
      Layout = blGlyphTop
    end
    object btnSair: TBitBtn
      Left = 738
      Top = 4
      Width = 58
      Height = 47
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btnSairClick
      Glyph.Data = {
        D6020000424DD6020000000000003600000028000000100000000E0000000100
        180000000000A0020000C40E0000C40E00000000000000000000404040404040
        4040404040404040404040404040404040404040404040404040404040404040
        40404040404040404040FFFFFF80808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080404040FFFFFFC8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4
        C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4C8D0D4000000000000C8D0
        D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4000000000000C8
        D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000C8D0D4C8D0D4C8D0
        D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
        0000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000C8D0D4C8D0D4C8D0
        D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4000000000000C8
        D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4
        C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4C8D0D4000000000000C8D0
        D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4808080404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040}
      Layout = blGlyphTop
    end
    object DBNavigator1: TDBNavigator
      Left = 423
      Top = 4
      Width = 224
      Height = 47
      DataSource = dmPrincipal.dtsVisitantes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object dbgVisitas: TDBGrid
    Left = 8
    Top = 344
    Width = 781
    Height = 121
    DataSource = dmPrincipal.dtsVisitas
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ANDAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALA'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Width = 333
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTATO'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VISITA'
        Width = 147
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 575
    Top = 64
    Width = 218
    Height = 197
    Caption = 'Foto'
    TabOrder = 13
    object imgFoto: TImage
      Left = 1
      Top = 1
      Width = 216
      Height = 195
      Align = alClient
      AutoSize = True
      Stretch = True
    end
  end
  object dbeNome: TDBEdit
    Left = 8
    Top = 76
    Width = 504
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 0
  end
  object dbeEndereco: TDBEdit
    Left = 8
    Top = 116
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ENDERECO'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 1
  end
  object dbeCidade: TDBEdit
    Left = 296
    Top = 116
    Width = 170
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CIDADE'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 2
  end
  object dbeRG: TDBEdit
    Left = 8
    Top = 156
    Width = 121
    Height = 21
    DataField = 'RG'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 4
  end
  object dbeCPF: TDBEdit
    Left = 136
    Top = 156
    Width = 121
    Height = 21
    DataField = 'CPF'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 5
  end
  object dbeNasc: TDBEdit
    Left = 296
    Top = 156
    Width = 89
    Height = 21
    DataField = 'DATA_NASC'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 6
  end
  object dbeEmpresa: TDBEdit
    Left = 8
    Top = 196
    Width = 459
    Height = 21
    CharCase = ecUpperCase
    DataField = 'EMPRESA'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 8
  end
  object dbeContato: TDBEdit
    Left = 8
    Top = 239
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CONTATO'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 9
  end
  object dbeTelefone: TDBEdit
    Left = 391
    Top = 156
    Width = 121
    Height = 21
    DataField = 'TELEFONE'
    DataSource = dmPrincipal.dtsVisitantes
    TabOrder = 7
  end
  object dbeEstado: TDBComboBox
    Left = 472
    Top = 116
    Width = 43
    Height = 21
    DataField = 'ESTADO'
    DataSource = dmPrincipal.dtsVisitantes
    ItemHeight = 13
    TabOrder = 3
  end
  object DBNavigator2: TDBNavigator
    Left = 586
    Top = 312
    Width = 207
    Height = 25
    DataSource = dmPrincipal.dtsVisitas
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    TabOrder = 14
    OnClick = DBNavigator2Click
  end
  object MainMenu1: TMainMenu
    Left = 680
    Top = 8
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object mnuSair1: TMenuItem
        Caption = '&Sair'
        OnClick = btnSairClick
      end
    end
    object Editar1: TMenuItem
      Caption = '&Editar'
      object mnuInserir1: TMenuItem
        Caption = '&Inserir'
        OnClick = btnIncluirClick
      end
      object mnuAlterar1: TMenuItem
        Caption = '&Alterar'
        OnClick = btnAlterarClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuGravar1: TMenuItem
        Caption = '&Gravar'
        OnClick = btnGravarClick
      end
      object mnuCancelar1: TMenuItem
        Caption = '&Cancelar'
        OnClick = btnCancelarClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuExcluir1: TMenuItem
        Caption = '&Excluir'
        OnClick = btnExcluirClick
      end
    end
  end
end
