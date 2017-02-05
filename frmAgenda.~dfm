object FormAgenda: TFormAgenda
  Left = 44
  Top = 78
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisar Telefone/Ramal no CPD/UnB  (Vers'#227'o 1.0.0)'
  ClientHeight = 594
  ClientWidth = 1133
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PainelReservarSalas: TGroupBox
    Left = 182
    Top = 8
    Width = 946
    Height = 567
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object Label2: TLabel
      Left = 12
      Top = 48
      Width = 246
      Height = 16
      Caption = '&Informe a sala e o hor'#225'rio da reuni'#227'o:'
      FocusControl = Edit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 540
      Width = 45
      Height = 13
      Caption = 'REST Url:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object JvHTLabel4: TJvHTLabel
      Left = 10
      Top = 13
      Width = 332
      Height = 31
      Caption = 'Reservar Salas de Reuni'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = 1795864
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object grdReservas: TJvDBGrid
      Left = 0
      Top = 101
      Width = 946
      Height = 466
      Ctl3D = False
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = grdItensDrawColumnCell
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 20
      TitleRowHeight = 17
      UseXPThemes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'matricula'
          Title.Alignment = taCenter
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Width = 261
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone1'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone2'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ramal'
          Title.Alignment = taCenter
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'setor'
          Title.Alignment = taCenter
          Title.Caption = 'Setor / Local'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Alignment = taCenter
          Width = 191
          Visible = True
        end>
    end
    object Edit1: TEdit
      Left = 10
      Top = 70
      Width = 607
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      TabOrder = 1
      OnChange = edtNomeChange
      OnKeyDown = edtNomeKeyDown
    end
  end
  object PainelAniversariantes: TGroupBox
    Left = 182
    Top = 8
    Width = 945
    Height = 567
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label3: TLabel
      Left = 32
      Top = 540
      Width = 45
      Height = 13
      Caption = 'REST Url:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object JvHTLabel1: TJvHTLabel
      Left = 10
      Top = 13
      Width = 303
      Height = 31
      Caption = 'Lista de Aniversariantes'
      Font.Charset = ANSI_CHARSET
      Font.Color = 1795864
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object BitBtn2: TBitBtn
      Left = 821
      Top = 535
      Width = 115
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object grdListaAniversariantes: TJvDBGrid
      Left = 0
      Top = 48
      Width = 950
      Height = 519
      Ctl3D = False
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = grdItensDrawColumnCell
      BevelEdges = []
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 20
      TitleRowHeight = 17
      UseXPThemes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'foto'
          Title.Alignment = taCenter
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Width = 336
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aniversario'
          Title.Alignment = taCenter
          Width = 88
          Visible = True
        end>
    end
  end
  object PainelBranco: TGroupBox
    Left = 182
    Top = 13
    Width = 946
    Height = 562
    Align = alRight
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 9
    object Label6: TLabel
      Left = 32
      Top = 540
      Width = 45
      Height = 13
      Caption = 'REST Url:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object BitBtn3: TBitBtn
      Left = 821
      Top = 535
      Width = 115
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object JvTabBar1: TJvTabBar
      Left = 1
      Top = 538
      Width = 944
      Align = alBottom
      Orientation = toBottom
      CloseButton = False
      Tabs = <
        item
          Caption = 'Listagem'
          Selected = True
        end
        item
          Caption = 'Edi'#231#227'o'
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1133
    Height = 13
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 1124
      Top = 0
      Width = 9
      Height = 13
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 180
    Top = 13
    Width = 2
    Height = 562
    Align = alRight
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 1
    object Panel4: TPanel
      Left = -2
      Top = 0
      Width = 4
      Height = 562
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 13
    Width = 4
    Height = 562
    Align = alLeft
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 2
    object Panel6: TPanel
      Left = 1
      Top = 0
      Width = 3
      Height = 562
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 575
    Width = 1133
    Height = 19
    Panels = <
      item
        Bevel = pbRaised
        Text = 'Centro de Inform'#225'tica - CPD/UnB'
        Width = 220
      end
      item
        Text = ' Barramento: https://servicosssi.unb.br:2301/agenda/telefone'
        Width = 50
      end>
  end
  object JvExpress1: TJvExpress
    Left = 4
    Top = 13
    Width = 176
    Height = 562
    Cursor = crHandPoint
    Align = alClient
    HighlightFont.Charset = ANSI_CHARSET
    HighlightFont.Color = clWindowText
    HighlightFont.Height = -19
    HighlightFont.Name = 'Tahoma'
    HighlightFont.Style = []
    ParentImageSize = False
    ShowPressed = True
    Caption = 'Menu'
    Color = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ButtonHeight = 100
    object btnMostraPainelAgendaRamais: TJvExpressButton
      Left = 0
      Top = 0
      Width = 172
      Height = 100
      ButtonBorder = bbMono
      Caption = 'Agenda de Ramais'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HighlightFont.Charset = ANSI_CHARSET
      HighlightFont.Color = clGreen
      HighlightFont.Height = -13
      HighlightFont.Name = 'Tahoma'
      HighlightFont.Style = [fsBold]
      ImageIndex = 11
      LargeImages = ImageList1
      ParentImageSize = False
      Spacing = 18
      OnClick = btnMostraPainelAgendaRamaisClick
    end
    object btnMostrarAniversariantes: TJvExpressButton
      Left = 0
      Top = 100
      Width = 172
      Height = 100
      ButtonBorder = bbMono
      Caption = 'Lista de '#13#10'Aniversariantes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HighlightFont.Charset = ANSI_CHARSET
      HighlightFont.Color = clGreen
      HighlightFont.Height = -13
      HighlightFont.Name = 'Tahoma'
      HighlightFont.Style = [fsBold]
      ImageIndex = 1
      LargeImages = ImageList1
      Spacing = 16
      OnClick = btnMostrarAniversariantesClick
    end
    object btnReservasSala: TJvExpressButton
      Left = 0
      Top = 200
      Width = 172
      Height = 100
      Caption = 'Reservar Salas '#13#10'de Reuni'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HighlightFont.Charset = ANSI_CHARSET
      HighlightFont.Color = clGreen
      HighlightFont.Height = -13
      HighlightFont.Name = 'Tahoma'
      HighlightFont.Style = [fsBold]
      ImageIndex = 15
      LargeImages = ImageList1
      Spacing = 18
      OnClick = btnReservasSalaClick
    end
    object Image2: TImage
      Left = 34
      Top = 405
      Width = 98
      Height = 105
      Align = alCustom
      Center = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D49484452000000A100
        00004B0806000000188EE7520000000467414D410000B18F0BFC610500000009
        7048597300001E9800001E98018391EB710000001C74455874536F6674776172
        650041646F62652046697265776F726B7320435336E8BCB28C00001300494441
        5478DAED5C095C95C5DE7E0EBB6CB20AC8E2066A4A566A69659B5AA9DD8052B1
        5C2A2D97ECBAA4A581E6114BD25273AFC4A5CFBC19B81EAF61B651A957FCE486
        A64822CAA20888B26FB29D6F66DE73F0703CCB7B3807DEDB77E7F9C50F999977
        DE99FF3CF3DF66DE64E0E0901832A907C0C1C149C821393809392407272187E4
        E024E4901C9C841C928393904372701272480E4E420EC9C149C8213938093924
        07272187E4E024E4901C9C841C928393904372701272480ED348F864741EAC64
        2E928EB8AE01A8AEC5D9840508EDE68B81333723F5583AE0EB2EDD981A9B801B
        65905FD8E416239335492A9FBF204C23E1A30B9470B417842E1528096BEA702E
        9E90B0872FFACFA0244C9396844A2570ED1612960FB3898C8C6C946E207F4D98
        46C20173CB515BEF027F4FA0412259FFA791D0DA0A28AF0632F214F2E2DD2F72
        4D683A4C22E177A732CA272CFCD2E5D6A5EB40EF00A1906A81F6443D35C71A24
        9CBE09A9C72F4843425B6BA6015151A390C74C7A2D66F253A5ED3F88BF3E4C22
        616363637961598D4BE4DB5B71FCE8EF40B02FD0A19DCD73BD4A137E23A12694
        11B159C9A8F643075FF7ED0B46AC9A1A13C335606B611209D36EE694F7F10C62
        81C95B2BF761F3C66F012FF26727B7F633CFD41CD74A48422B627EEBEA818B79
        087DB40FCEEF8FE2190633619200ADE68796FFCFC48F5D26DE3F92FDFDE5B729
        981CFD15505503F4F0A3AA9298E7361EB1943EA10D31BFC515C0F562BC316D04
        E2E42F11A5286332ECF2FEA079AF0D9DB139E6A9C9B56D3F90FF5F306D17BF7D
        4F396E97BBCC1B3917ABFFF60E2B3A73A51063E6C4E172CA25E09E40E2A8932E
        9BDA9089DA3E617B91901230FB0633C5EB978DC7ACC821ACF8D09FBFE1A52F67
        A326E72CE4BB95D63C30311DA69130E6A972D457B920FF12863D1881FD5336C1
        D5B6036A1A94889CB71587E38F01DD7D00970E6DE72732735C4FCCF1BBED4342
        A6E8C8A64ABF06DF3E41885F3D058FF7EBCAAA96276DC5E2FD1F101361438214
        7BC8575D683509131212ACD3D2C6B2DDBB74299444C11ADCC972B9D24AFDEFBE
        7DF7C8DA3235A439362C55152E157EC87F46C76A54C426B5963F5EDE9CACCEBB
        80C0C0507C3571359EE8FA002B5A16F73DE41FEF03ECC9A2F87BB58D9F78974F
        48A2E3636D141DD3F44B15B1AE570A30F46F0F21FED3A9F072B6476D530326EC
        7A07FB8FFF83F8C44180031149C975C83FCD68150947CDDF362871FDE16404FB
        09E6BE9BB702C96B220C3ED47BC64154DE0E671B9E0448933F9CD46347D4982B
        9616C18E1D490E93676EAC4150272118D306DDA40E360A3F3FCF534FF60A3CB0
        7BCDE43F4D7D87E92494C1853D654D88569805AA25D6447E80B7874C644DBE3D
        7911E3DED986AABC6220C44FF0112D99C6692F9F909ADFC212A0B41A51F35F40
        ECACE758716A41065EDC310BD959BF039D7B0B726824814AD98D56937052ECEE
        9E5F6DF9F122BA92852EAD824780E7CAE2C3F2F70C3EF46494929010209B826E
        92D9F3227CD7CF0D2FB4AC10802F52526CA78FFBA28EE586D524A4564EBDA4B4
        8CAE6F25D9AC05258C90F27533C7C7840DAC16FB8E5668424242A5EA49BA00E5
        B788E0F23179D8546C8FFC9035CB2BAE44C4EC2D48F9319510D11FE8606739F3
        DCD63E21DDD9746E99F9809B13E257BD8EC861FD58D5B6D307F0C6EE28320622
        709FEEC4F76D121640D968160927C6C607EFDAF6E325741148E81DE0155B7468
        F122830F0D5DA4441521A11321615621E6BF3BD667F5CC676F58460877C04838
        3E4E2021B50CD4DF27EB2BACA79229043890F5EDEC213C70A31428AA54206F7B
        84D877984742FADB8A688C06228CFC0CF4EBFD18F64EDE8010777FD67CDA07F1
        88DBFA3DD0D111F0F3B08C796ECB140D153215EAE57CDCF7582876AD7C0DA15D
        BD59D5EC83B1D8F0DD06E2EF1237A323210B31C9CD68B20009B7121276359584
        64333839104D4848B8A01D4848656F6393BB2B7AF4241F1FB782C6867AAB4BB9
        B78237EF39392B3D2DAB373A7904315EA4E5226CD2D0FE8756BE9A2AE61DAD37
        C76A3042CA849F824BB075F5C6D7133EC198D0E1AC7AD7917F63CAFBFF407D51
        1998CF636566F4DC56E6989ADFBC5BEC086EF2EB4F63BBFC65569C57790B2F6C
        7F0BA7CFFD40DED193F8BB1D04D26982FE5D4E48B8462212124D387BCEF32699
        63795292CDEDF42A17376BFBA685D38697EB0B2E18095F26240C2024ACBE4DB5
        5E2E7EFDA88B763B8F6716A7161757DD0F57477699A3EBBD5DE766EF7E679D98
        B1B49E844A1D4F53F35C42CC585529A2C31662F9C839ACF8727E095E89DA897F
        FD788698B18EC49977255AB195E6D9D29A906ABFDBF5CCAFEAD8D5071BA3C662
        E2A801ACEAC7CC5318BD732ECA6FE6124D1EA2F28374ACD57F2009C72CDE75EF
        DEF5FFFC034446746EA3DE7C6E70E28A574EAD4BCCB09F1BB57197B2A4D296B8
        13E16C11AD648ABE0342F6A71D208BA485664DD8D993C91DF6B6B9CA5F62BBC9
        B4E6397AD937ABF76DFF611EBA93F7DD2A4797DE81F373E217AC1133FFD69963
        43A0E6B9B68A38F55730FCC1707CF9F247F077114CDACA2F7F46D4FA4350929D
        C284636F6BBAAF68294DA83E7ACB2116ACAE11611183B0356602BC5D3B08533D
        BA01CB0EAF66A9171229DC31BF6A0EAA25C7022FA97C42FD249CF2C9DE2EDBD7
        1ECE6629B39C22BCF56E98FFA65911D7E1FFEA41B83886C3C74DD0FE14D4B73D
        97A30818D6EFC4B5F8859F68BE4617097569C287FFFE79FCC91FCE442280B82B
        D985B87F58BFC8335B66ED11B51426494BAD09753DA9B9383255C444CCB32359
        C04D11D1786DA0E0A7665CBD85A8B50AEC3F744A68D3A59369265A9B84D30909
        8F9B48421BA2FD8ACA891F5B825E837A21F6EFCFE1C5E1F7B1AAB41B97F1E6DE
        181C3B7304F026B276701548A63947F53CD5D640729FB080F884912D7CC2B96B
        8EF8ADDDB0EF3ABA111256D6E0C10121C8279BFFDA4FC44D0BF617B43F9D000D
        28EA1B8579A45F5324AC7D6EB466CEB1854FA8C71C6F57A40C9DB2E4AB1D7073
        147CC2DF3315EBBE993C6ECEA851B7C5CCBFF59A50DF8268829AE7D202A0E216
        C63D3A1E1F872D4050475F5675E0E773581E7714FF3E7101702682A43B8DF56B
        848CE644C7D4F49245C6D522B8F4F4C7DB2F3D8E9837473657AFFC792BDE3BBA
        9E2C5A31711B8255A5223687D424CC2A209A30AC85269C4A4818A726219D7745
        0D3D6E54108D38936A44A55229BB77D2A7E3CFA75E1E4B82C67026F78C3C4C7C
        7344C8AEE87199EA7E9A7D424A42B636B2DCF047EE39E4EAE2505A555DE77C39
        FF66F7B3A72EDE0F379720F64066BE62D484273E4A5CFDFA29B1F3373F30D15C
        275DBDC988001A0971F22FC2DEBB2B3E1E311BB35539458ACFF79CC0DAAF7FC5
        C5944C21DD40A3682A347D64BCCB1C1B4956CB54832AA9209AB9143644F3CE78
        FE412C993E0ADE1E4EACEAA7CC642C3EB21EC9E74824EF114836858761F3AB3D
        57C948A84AD1E8D0842D48486540DA8C9E303474DF87E3D35A88A7FFEC3DCA0E
        0E63986B945B8451E1430627AE7EA599402DCCB18D2A45430338A63D59A29AF8
        F81D59E6A3B3831DD64E7FC93E3232B4CE94F95B8684EAC5D18E9A35DF408FB6
        CA8BC80FF1177A0DC1A2615331A6DF88E6E63B0E24E33345324E9F48174C859B
        93F043FD169946C7627C424A602A2CAA296E55B020C8BD6767CC0C1F84696386
        20C8CF8D35CBBC998D25DF6DC4EED30704D275EAAECAFB29EF269DA6C4B4E726
        B926BC3B4FD88284546655B50AA4AEBB2B7717FCEADA1999BF677E06EF8E8C84
        CF463CFAC8D155AF9E54D7B7D084F45E009D3B35CB6AF789BA520EB64CC61ECE
        1D306A40F7EE8F05F5B9367DFAC07AB1F3B7AC4F68AC4CA69AC4CD1CF2BB09CF
        F47B06F31E7B05CFF67EACB9C9F7C7D3F1DDA98BF8F6F42564D0CBB3F4D67283
        EA760ED590AAFB8429C7566040EF0078442C47C9F7A9826FA3CEE4D31D4B76A5
        3B11DCF001C1786E504F8C19DE1F4E4EB6EC1DD7CB0B10FB531C36FFEF01284B
        F208F97A9000C4A1A5EF678A64A8635F56D8DE81C94142AC705124243274F2ED
        B8A5EAF0D2E9DADDDC3F6DC3D833C7D313D826266ECAA8303D9A909250A50CAC
        94B2E390291B6958535FDF684FA2E1C18C8C34D8C9BD49D6B74C31EEDDF005F1
        D12F678899BF6553349A65DAFF56BF8D25B85526FA461660678F91FD9EC58C87
        46232C74588BEED22F15E25C563EAE9290FF464925B1A655282DA94215D1005B
        1647A23B21DE8C4F15C8BA70159E44489E447376F67021B2704288BF171EE9DB
        1DD60E77FAFB93041D9B4EECC6B63389A82141133C891BE3D851D064DA3EAEF6
        1C0CC1C29AD027D06B59A162B1DCE04343171F24014738F3A77544C72D484864
        17D0A3F3826B7B5B46BE14A153D64D387F2A631723903E12AAF384B5F5D43225
        27CCFA684864A4AC3978399492E218FBF9C969C927D2C721D06B306A88A63C7B
        4591B075EC6831172BCC4BD1689E9C88E949DB8CC954A72D340F478298FEBD1E
        C1F33D1F45F83D4FE08180BEA6AEA54E145614E260DAAFF82E231907FFFC9598
        E7AB42CAC5C9ED0EF98C8D5D97ABD1863EA14790F7CAE2838B0C9F1D3F1E7510
        75F5E1ECC3337A763C37AC6D4948352125979D6D328EAD7858D79082C23ED894
        9B5B3493E581738AD0E7E13E151776CE7135367FCBE709B517CFD89BD49A91FA
        64A54486B5C48773ED846EBE3DD0DB2308A1E4772FA2B182DC7CE0E3EC0E177B
        2738DBDAC1D3C98B58002B94D594A2EC76256A1AEA515455863C42862C6262CF
        165E467A5136D28A72D050942504486E3437E97CC7EC1A1BBB0CFA379A66B999
        794296D3DB74249B257A899697393A289449CB0D9FBD3E304709E283B1EF5C32
        F3B170D1CB6E2BA73F5DA6AED626A17F0FBFE8BCBDEF7DA4DD4D0B12EA0B4CD4
        9A901E69DADAE825E18C7589833F5FBDF7243B191302CB0A24C5B62109C5F880
        FACA60A00DF53BEAC98EAB2164ACAB16FE6D632BF86C768E8CB0368D8D38376F
        1F7A9340E2A1B8A9387DFE67E14C97901175B5C23394D8F68E02E91C9CD0CC18
        6DD740CCD88CB5375313CABF4A748D89DE53869EFE827F995DA44858F9B45E53
        264F48728E99BFB302219D85F15C29C4177B66D84D1F782718B03809FD55C96A
        03249CB862DFD3BB3E4FFC9E6D26E124AA02BFAD680312EA0B4C742D9AAE727D
        7586226B1A8991408669CBBA1A32B96A9C5B988850BF10046F9C80CB1792887F
        172844E054E35959E9EE57DF78F58D47ECA66A541DDBB592840CF47EA08F7B38
        CB06DC28856F80D79282234B3FD0D5D4EDA9E855A565D5F359F68012A3AE5181
        9496F70F5B4542638149B561734CC6B5A7B4B2760CBBE348DABA78385754242E
        6D474DA8B970627AD717C418EBBBB18E69BB0B6FEFC53D3E3DD07FCB1B484DFF
        0D70F7D3FDACB13E21A24C732EBAC66DA626A4F01DBBE2FD82D42BCB9AF37A39
        371401BD024EBCBF64C45AB5864B48386FF7D68EBD8B8AB20AEE4350A770F6E0
        F91C0C1E3D242C79C3D47F6AF6D78284C58484C1666842350969EACCCE3AF9D0
        AA31C39E1F30807D4BF3CB2FB03A5B9EECB9FCB3A36B8AAE16752791E1602693
        3FB2F1C21B232A0E7C38A18D49A8DD83AE05124B0A430BAF8906232434A52F63
        63D29523D4D5DE0224942B955631DE13F7A3875F38E8F935BB955422683A3767
        A111D1682C394D0943DF4DEBAB6B15C88CBBCB7FB4A8395627ABD579427A8155
        A99A3CB302D5C2A9572721FF8AFC62D2E6B6025971A2EE145A2630D14538B18B
        2F460B6AF6A38F846E7EE2D24310F93E5D63D7A729CD0C4CD498F7C521AF358B
        E2B7C2DD391C815E422298E63EEB54A73776C4DDB0B61672A5592C10567CB17F
        E6584D5F508D969AB0027EC19DA3F3CDF509D537ABE9FB3593D5744CB48A9293
        9EA6D8DB119F764EA4D89313CB1DDB193375DA7586CCB1A13295394E2324ECA3
        4D42403FD9C4BE5BEC46D2ACB3802654232929C966C6A7C7275D3C97158E7A65
        38FB5E477D62A426A48B83E2910742B69CF87ADE117DF7005F58BCF3BE031F7E
        7D065DFD85CB1A7D0215387DF7772B0EC3976CABFDF58F298C64D9F9E8F3CAB0
        291776CEDFA1AE5F1DFFAF0EF3C7C556EBFDC6846537647483281C3B7BE68D7C
        3064F3BE8F5F4B8309308F84A6E4070D2DBAAE91E8EBDB983936F5B443ECD80D
        91D582246C16B55C6975DBEB807BCECD1AEFF2DBF54ED64A5993A7834D59909B
        63F1D2B91165C6BE70A31714966EFAC5C9D9B58EB5B3F36A6CD075AB856ABAEB
        C915F6B45D65B99DAC6FA7A21AEDA85CBE31C959DD8F2ED0BE678F1C59D7DAAF
        EE2C7B62A2531A7ADED65AB2D4D7B16F3CF46A4231B3D30EA2C444F2867C5B0B
        99E3FF5658E62A97BA275DA64CEC5BF4F96B9A6562A263CD67C59A55EDA85EAC
        94D4CF70129A05F35334865218A6406C7F620213E878D61029C5A4660CCDAD0D
        CCF17F13CCFBDA4E17CC4DCD18CB351A33C7A6F8A8A66E187D1A9593D02CB4CF
        D9B1BEC4B3B164B6F6284D4D568BD57886A25F6352E23EA1D968FDB15D6B7A12
        EBF719FABB414F8AC6DDCFF0498B18B36A4AB25DF3194E42B3601A09631E579A
        1C70A82156F319EBB3B5291A53CA4DED839B63B3602A09F3D06482396E0B34D5
        32BFF0FC6C4AC26E18B8651A21E12F8484FE120E8A90B0A400F27599FCFFDEDF
        0A5832ADCBC1D12A701272480E4E420EC9C149C821393809392407272187E4E0
        24E4901C9C841C928393904372701272480E4E420EC9C149C821393809392407
        272187E4E024E4901C9C841C928393904372701272480E4E420EC9F17FDC7C85
        E2CB10E32B0000000049454E44AE426082}
      Proportional = True
    end
    object JvHTLabel3: TJvHTLabel
      Left = 24
      Top = 517
      Width = 124
      Height = 31
      Caption = 'CPD / UnB'
      Font.Charset = ANSI_CHARSET
      Font.Color = 1795864
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object btnSair: TJvExpressButton
      Left = 0
      Top = 300
      Width = 172
      Height = 100
      Caption = '&Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HighlightFont.Charset = ANSI_CHARSET
      HighlightFont.Color = clGreen
      HighlightFont.Height = -13
      HighlightFont.Name = 'Tahoma'
      HighlightFont.Style = [fsBold]
      ImageIndex = 19
      LargeImages = ImageList1
      Spacing = 18
      OnClick = btnSairClick
    end
  end
  object Panel7: TPanel
    Left = 1128
    Top = 13
    Width = 5
    Height = 562
    Align = alRight
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 3
    object Panel8: TPanel
      Left = 2
      Top = 0
      Width = 3
      Height = 562
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object TabBarContato: TJvTabBar
    Left = 184
    Top = 553
    Width = 943
    Height = 22
    Align = alNone
    Orientation = toBottom
    CloseButton = False
    Images = ImageList1
    Tabs = <
      item
        Caption = 'Listagem'
        Selected = True
        ImageIndex = 11
      end
      item
        Caption = 'Edi'#231#227'o'
        ImageIndex = 17
      end>
    OnClick = TabBarContatoClick
  end
  object PainelAgendaRamais: TGroupBox
    Left = 182
    Top = 8
    Width = 946
    Height = 545
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object Label1: TLabel
      Left = 12
      Top = 48
      Width = 374
      Height = 16
      Caption = '&Informe o nome do contato ou parte dele para pesquisar:'
      FocusControl = edtNome
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvHTLabel2: TJvHTLabel
      Left = 10
      Top = 13
      Width = 344
      Height = 31
      Caption = 'Lista de Ramais / Telefones'
      Font.Charset = ANSI_CHARSET
      Font.Color = 1795864
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object SpeedButton1: TSpeedButton
      Left = 655
      Top = 68
      Width = 103
      Height = 26
      Caption = '&Novo Contato'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      Transparent = False
    end
    object grdItens: TJvDBGrid
      Left = 0
      Top = 101
      Width = 946
      Height = 445
      Ctl3D = False
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = grdItensDrawColumnCell
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 20
      TitleRowHeight = 17
      UseXPThemes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'matricula'
          Title.Alignment = taCenter
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Width = 261
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone1'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone2'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ramal'
          Title.Alignment = taCenter
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'setor'
          Title.Alignment = taCenter
          Title.Caption = 'Setor / Local'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Alignment = taCenter
          Width = 191
          Visible = True
        end>
    end
    object edtNome: TEdit
      Left = 10
      Top = 70
      Width = 607
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      TabOrder = 1
      OnChange = edtNomeChange
      OnKeyDown = edtNomeKeyDown
    end
  end
  object PainelEdicaoContato: TGroupBox
    Left = 182
    Top = 8
    Width = 946
    Height = 546
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 10
    object JvHTLabel5: TJvHTLabel
      Left = 10
      Top = 13
      Width = 168
      Height = 31
      Caption = 'Novo Contato'
      Font.Charset = ANSI_CHARSET
      Font.Color = 1795864
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object btnSalvar: TSpeedButton
      Left = 23
      Top = 492
      Width = 103
      Height = 26
      Caption = 'Salvar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      Transparent = False
    end
    object Label8: TLabel
      Left = 10
      Top = 88
      Width = 45
      Height = 13
      Caption = 'Matr'#237'cula'
      FocusControl = DBEdit2
    end
    object Label9: TLabel
      Left = 10
      Top = 128
      Width = 83
      Height = 13
      Caption = 'Nome do Contato'
      FocusControl = DBEdit3
    end
    object Label10: TLabel
      Left = 10
      Top = 168
      Width = 51
      Height = 13
      Caption = 'Telefone 1'
      FocusControl = DBEdit4
    end
    object Label11: TLabel
      Left = 194
      Top = 168
      Width = 51
      Height = 13
      Caption = 'Telefone 2'
      FocusControl = DBEdit5
    end
    object Label12: TLabel
      Left = 10
      Top = 208
      Width = 30
      Height = 13
      Caption = 'Ramal'
      FocusControl = DBEdit6
    end
    object Label13: TLabel
      Left = 10
      Top = 248
      Width = 25
      Height = 13
      Caption = 'Setor'
      FocusControl = DBEdit7
    end
    object Label14: TLabel
      Left = 10
      Top = 288
      Width = 28
      Height = 13
      Caption = 'Cargo'
      FocusControl = DBEdit8
    end
    object Label15: TLabel
      Left = 10
      Top = 328
      Width = 45
      Height = 13
      Caption = 'Admiss'#227'o'
      FocusControl = DBEdit9
    end
    object Label16: TLabel
      Left = 10
      Top = 368
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = DBEdit10
    end
    object Label17: TLabel
      Left = 200
      Top = 552
      Width = 26
      Height = 13
      Caption = 'Local'
      FocusControl = DBEdit11
    end
    object Label18: TLabel
      Left = 200
      Top = 592
      Width = 62
      Height = 13
      Caption = 'Setor / Local'
      FocusControl = DBEdit12
    end
    object Label19: TLabel
      Left = 200
      Top = 632
      Width = 21
      Height = 13
      Caption = 'Foto'
      FocusControl = DBImage1
    end
    object Label20: TLabel
      Left = 200
      Top = 760
      Width = 52
      Height = 13
      Caption = 'Anivers'#225'rio'
      FocusControl = DBEdit13
    end
    object DBEdit2: TDBEdit
      Left = 10
      Top = 104
      Width = 130
      Height = 19
      DataField = 'matricula'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 10
      Top = 144
      Width = 399
      Height = 19
      DataField = 'nome'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 10
      Top = 184
      Width = 175
      Height = 19
      DataField = 'telefone1'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 194
      Top = 184
      Width = 175
      Height = 19
      DataField = 'telefone2'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 10
      Top = 224
      Width = 169
      Height = 19
      DataField = 'ramal'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 10
      Top = 264
      Width = 271
      Height = 19
      DataField = 'setor'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 10
      Top = 304
      Width = 271
      Height = 19
      DataField = 'cargo'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 10
      Top = 344
      Width = 135
      Height = 19
      DataField = 'admissao'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit10: TDBEdit
      Left = 10
      Top = 384
      Width = 415
      Height = 19
      DataField = 'email'
      DataSource = DataSource1
      MaxLength = 150
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 200
      Top = 568
      Width = 780
      Height = 19
      DataField = 'local'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 200
      Top = 608
      Width = 1300
      Height = 19
      DataField = 'setor_local'
      DataSource = DataSource1
      TabOrder = 10
    end
    object DBImage1: TDBImage
      Left = 200
      Top = 648
      Width = 105
      Height = 105
      DataField = 'foto'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBEdit13: TDBEdit
      Left = 200
      Top = 776
      Width = 130
      Height = 19
      DataField = 'aniversario'
      DataSource = DataSource1
      TabOrder = 12
    end
  end
  object cds: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'telefone1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'telefone2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ramal'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'setor'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'cargo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'admissao'
        DataType = ftDateTime
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'local'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'foto'
        DataType = ftGraphic
      end
      item
        Name = 'aniversario'
        DataType = ftDate
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'nome'
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 200
    Data = {
      6D0100009619E0BD01000000180000000D0000000000030000006D0102696404
      00010000000000096D6174726963756C610400010000000000046E6F6D650100
      4900000001000557494454480200020064000974656C65666F6E653101004900
      00000100055749445448020002001E000974656C65666F6E6532010049000000
      0100055749445448020002001E000572616D616C010049000000010005574944
      5448020002000500057365746F72010049000000010005574944544802000200
      3C0005636172676F0100490000000100055749445448020002003C000861646D
      697373616F080008000000000005656D61696C01004900000001000557494454
      48020002007800056C6F63616C0100490000000100055749445448020002003C
      0004666F746F04004B0000000100075355425459504502004900090047726170
      68696373000B616E69766572736172696F040006000000000001000D44454641
      554C545F4F524445520200820000000000}
    object cdsid: TIntegerField
      FieldName = 'id'
    end
    object cdsmatricula: TIntegerField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'matricula'
    end
    object cdsnome: TStringField
      DisplayLabel = 'Nome do Contato'
      DisplayWidth = 56
      FieldName = 'nome'
      Size = 100
    end
    object cdstelefone1: TStringField
      DisplayLabel = 'Telefone 1'
      DisplayWidth = 24
      FieldName = 'telefone1'
      Size = 30
    end
    object cdstelefone2: TStringField
      DisplayLabel = 'Telefone 2'
      FieldName = 'telefone2'
      Size = 30
    end
    object cdsramal: TStringField
      DisplayLabel = 'Ramal'
      DisplayWidth = 13
      FieldName = 'ramal'
      Size = 5
    end
    object cdssetor: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'setor'
      Size = 60
    end
    object cdscargo: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'cargo'
      Size = 60
    end
    object cdsadmissao: TDateTimeField
      DisplayLabel = 'Admiss'#227'o'
      FieldName = 'admissao'
    end
    object cdsemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 120
    end
    object cdslocal: TStringField
      DisplayLabel = 'Local'
      FieldName = 'local'
      Size = 60
    end
    object cdssetor_local: TStringField
      DisplayLabel = 'Setor / Local'
      FieldKind = fkCalculated
      FieldName = 'setor_local'
      OnGetText = cdssetor_localGetText
      Size = 100
      Calculated = True
    end
    object cdsfoto: TGraphicField
      DisplayLabel = 'Foto'
      FieldName = 'foto'
      BlobType = ftGraphic
    end
    object cdsaniversario: TDateField
      DisplayLabel = 'Anivers'#225'rio'
      FieldName = 'aniversario'
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = cds
    Left = 104
    Top = 200
  end
  object IdHTTP: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 2301
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'application/json'
    Request.CustomHeaders.Strings = (
      'Content-Type: application/json')
    Request.Accept = 'application/json'
    Request.AcceptCharSet = 'UTF-8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'AgendaTelefone'
    HTTPOptions = [hoForceEncodeParams]
    Left = 80
    Top = 352
  end
  object ImageList1: TImageList
    Left = 144
    Top = 344
    Bitmap = {
      494C010115001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000FFFFFF0000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F0000000000FFFFFF00000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000007F7F7F0000000000FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F007F7F7F000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000FFFFFF007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F00FFFFFF00000000000000
      00000000000000000000FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000007F7F7F00FFFFFF00000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF0000000000000000007F7F7F007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F007F7F7F00000000000000000000000000000000000000
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
      FF00000000007F7F7F00FFFFFF0000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      80000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00007F7F7F0000000000000000000000000000000000000000007F7F7F000000
      0000FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      8000000080000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF0000000000000000007F7F7F007F7F7F007F7F7F00000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF0000000000000000007F7F7F00FFFFFF0000000000000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF00000000007F7F7F007F7F7F007F7F7F007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000000000007F7F
      7F00000000007F7F7F00FFFFFF00000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000007F7F7F007F7F7F007F7F
      7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00007F7F7F0000000000FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F000000
      0000000000007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
      FF00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000007F7F7F00FFFFFF00000000007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      8000000080000000800000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF000000000000000000000000007F7F7F00FFFFFF007F7F7F007F7F
      7F00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00000000007F7F
      7F007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F00000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      00007F7F7F007F7F7F00FFFFFF00FFFFFF000000000000000000000000000000
      8000FFFF0000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
      7F00000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF0000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      0000000000007F7F7F007F7F7F00000000000000000000000000000000000000
      8000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F0000000000000000000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000007F7F7F00FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF000000
      00007F7F7F00FFFFFF00000000007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF007F7F7F000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000BFBFBF00FFFFFF00FFFFFF00FFFFFF00BFBFBF0000000000FFFF
      FF00FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF007F7F
      7F00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF007F7F
      7F00FFFFFF000000000000000000000000007F7F7F00FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFF
      FF007F7F7F007F7F7F00FFFFFF007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      800000008000000080000000800000008000000080000000800000FFFF000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000007F7F7F00FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF007F7F
      7F00BFBFBF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00BFBFBF007F7F
      7F00FFFFFF000000000000000000000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFF
      FF007F7F7F007F7F7F00FFFFFF007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000BFBFBF00FFFFFF0000000000FFFFFF00BFBFBF0000000000FFFF
      FF00FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF007F7F7F000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000007F7F7F00FFFFFF00000000000000
      000000000000000000007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFFFF000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFF
      FF007F7F7F007F7F7F00FFFFFF007F7F7F000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000FFFF
      FF00000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF007F7F
      7F00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F00FFFFFF007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F
      7F00000000007F7F7F00FFFFFF00000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FFFFFF0000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F00000000007F7F7F007F7F7F00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF00000000007F7F
      7F0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF007F7F7F00000000007F7F7F00000000007F7F7F007F7F
      7F00FFFFFF00000000000000000000000000000000000000FF00FFFFFF007F7F
      7F000000FF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF00FFFFFF00FFFF
      FF007F7F7F00FFFFFF007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FF00
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF007F7F
      7F007F7F7F007F7F7F000000000000000000000000007F7F7F00000000007F7F
      7F007F7F7F00FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FF0000000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000FFFFFF00000000000000000000000000000000007F7F7F000000
      00007F7F7F007F7F7F00FFFFFF000000000000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF0000000000000000007F7F7F00FFFFFF000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00FFFFFF0000000000000000007F7F7F00FF0000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FF000000000000007F7F7F00FFFFFF007F7F7F000000
      00007F7F7F0000000000FFFFFF00000000000000000000000000000000007F7F
      7F00000000007F7F7F007F7F7F00FFFFFF00000000000000FF00FFFFFF007F7F
      7F000000FF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F000000FF00FFFF
      FF007F7F7F000000FF00FFFFFF0000000000000000007F7F7F0000000000FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000007F7F
      7F000000000000000000000000007F7F7F000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FF0000007F7F7F007F7F7F00000000000000
      0000000000007F7F7F0000000000FFFFFF000000000000000000000000000000
      00007F7F7F00000000007F7F7F007F7F7F00000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000007F7F7F0000000000FFFFFF000000
      000000000000000000007F7F7F0000000000FFFFFF0000000000000000000000
      0000000000007F7F7F00000000007F7F7F0000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000007F7F7F0000000000FFFF
      FF000000000000000000000000007F7F7F0000000000FFFFFF00000000000000
      000000000000FFFFFF007F7F7F0000000000000000000000FF00FFFFFF007F7F
      7F000000FF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F000000FF00FFFF
      FF007F7F7F000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F000000
      0000FFFFFF000000000000000000000000007F7F7F0000000000FFFFFF00FFFF
      FF007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F
      7F000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000FFFFFF00FFFFFF007F7F7F0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F000000FF00FFFF
      FF007F7F7F000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000FF000000800000008000000080000000800000008000000080000000
      80000000800000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F00000000007F7F7F00000000007F7F7F007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00000000007F7F7F007F7F7F000000000000008000000080000000
      00000000FF00BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000800000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF00007F7F7F00FFFFFF0000000000FFFF
      FF000000000000000000000000007F7F7F00FFFFFF00FFFFFF00FFFFFF000000
      0000000000007F7F7F007F7F7F007F7F7F000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000800000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00FFFFFF00000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00007F7F7F00FFFFFF007F7F7F000000
      0000FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00000000000000
      000000000000000000007F7F7F007F7F7F000000800000000000000000000000
      0000000000000000FF00BFBFBF0000000000BFBFBF0000000000BFBFBF000000
      FF000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00007F7F7F00FFFFFF00000000007F7F
      7F007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000007F7F7F007F7F7F000000800000000000000000000000
      000000008000000000000000FF000000FF000000FF000000FF000000FF000000
      00000000800000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00007F7F7F00FFFFFF00000000007F7F
      7F00000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      00000000800000008000000080000000000000000000000000007F7F7F00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00007F7F7F00FFFFFF00000000000000
      00007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000007F7F7F007F7F7F0000000000000000000000FF000000
      FF000000FF000000000000008000000080000000800000008000000080000000
      00000000FF000000FF000000FF000000000000000000000000007F7F7F00FFFF
      FF007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00007F7F7F00FFFFFF00000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000000000007F7F7F007F7F7F000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000000000007F7F7F00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF000000000000000000000000007F7F7F00FFFFFF00000000000000
      000000000000000000007F7F7F00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF00FFFFFF007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000008000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00000000000000
      00000000000000000000000000007F7F7F00000000007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000007F7F7F00000000007F7F7F000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000007F7F7F007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F
      7F0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF00000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000000000000000FF
      FF0000000000000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F0000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF00000000000000000000000000000000007F7F7F00000000007F7F
      7F00000000007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F0000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000A6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FF00000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000A6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FF00000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF00000000000000000000000000000000000000000000000000A6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FF00000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F00FFFFFF0000000000000000000000
      0000000000007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000A6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FF00000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F00FFFFFF0000000000000000000000
      0000000000007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000000000000A6A5A6FFA6A5
      A6FF0000000000000000A6A5A6FF0000000000000000A6A5A6FF000000000000
      0000A6A5A6FFA6A5A6B000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000A6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FF0000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000A6A5
      A6FFA6A5A6FF00000000A6A5A6FF0000000000000000A6A5A6FF00000000A6A5
      A6FFA6A5A6FF0000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000A6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FF000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000FFFFFF00000000007F7F7F000000
      0000FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF007F7F7F007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000000000000000000000000000000000000000A6A5A6FFA6A5A6FF0000
      0000A6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FF00000000A6A5A6FFA6A5A6FF000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000007F7F7F000000
      0000FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F00000000007F7F7F00000000007F7F7F007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000000000000000000000000000A6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FF0000
      0000A6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FF0000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF007F7F
      7F0000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000A6A5A6BEA6A5A6FFA6A5A6FF0000
      0000A6A5A6FFA6A5A6FF00000000000000000000000000000000A6A5A6FF0000
      000000000000A6A5A6FFA6A5A6FFA6A5A6640000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF0000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF0000000000000000000000000000000000A6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FF00000000000000000000000000000000000000000000000000000000A6A5
      A6BFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFF
      FF00000000007F7F7F000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000A6A5A646A6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FF000000000000000000000000A6A5A66FA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FF0000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000FFFF
      FF0000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F00000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000A6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6FFA6A5A6FFA6A5A6FFA6A5A6C2000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000A6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5A6FFA6A5
      A6EE000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00C003000000000000CBF3000000000000
      C5F3000000000000CAF3000000000000CCF3000000000000CCF3000000000000
      CCF3000000000000CCF3000000000000CCF3000000000000CC73000000000000
      CCF3000000000000CCF3000000000000C8F3000000000000C0F3000000000000
      C003000000000000C0070000000000008001FF7ECF3CC0079C1990018001C007
      9829C003C003C00797D1E003E7F3C00787E1E003E7F3C0078701E003E7F3C007
      8621E00387F0C0078661000107F0C0078A6980008780C0079419E007E707C007
      9821E00FE727C0079FC1E00FE703C007800BE027E021C0078007C073C030C007
      800F9E799E79C007801F7EFE7EFEC0078000C007C00380030000C007CFF38003
      0012C007CFF380030000C007CFF380030000C007CFF380030000C007CFF38003
      0000C007CFE380030000C007CFD380030000C007CFF380030000C007CC138003
      0000C007C81380033C00C007C81380030000C007C83380030000C007CFF38007
      0000C007C003800F0000C007C007801FE001FFFFFF3FFFFFC551FE3FFC1F0000
      82A9F81FF88F00002AABF40FF14700000150E007C3A30000000080038BD10000
      9806400115E80000ABEE00003AF40000D00100005D7A0000E0038001AEB90000
      FFFFC003D7430000FFFFE00FEB8F0000FFFFF07FF47F0000FFFFF8FFF8FF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000E00B803F802FE003CA83001F3F82E003
      C51300043F048003CAA300002E186003C5530000123C7007CAA30000241C0000
      C5530000283C0000CAA3000034048000C5530000380CC001C80300003D00E003
      C00300073E87FFFFC003001F1557FFFFC013000F000BFFFFCFF380078011FFFF
      D0078023AAA3FFFFE00F55775577FFFFC00380038001C007C00380039E39C007
      C00380039C79C007C00380039E79C007C00380039C79C007CDB380039EF9C007
      E00780038551C007E5A780038001C007F00F80038001C007900980038281C007
      001080038DA1C00713D880039FC1C0070FE08003800BC007038180078007C007
      8001800F800FC007F00F801F801FC00700000000000000000000000000000000
      000000000000}
  end
  object cdsReservasEm: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'nome'
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 344
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
  end
end
