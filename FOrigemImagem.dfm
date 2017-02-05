inherited frmOrigemImagem: TfrmOrigemImagem
  Left = 386
  Top = 203
  Width = 301
  Height = 179
  BorderStyle = bsSizeToolWin
  Caption = 'Selecione de onde deseja obter a imagem'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxFocus1: TGroupBox
    Left = 8
    Top = 8
    Width = 278
    Height = 105
    Caption = 'Selecione de onde deseja obter a imagem:'
    TabOrder = 0
    object rbtArquivo: TRadioButton
      Left = 12
      Top = 26
      Width = 249
      Height = 17
      Caption = 'De um arquivo de imagem salvo no computador.'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbtWebCam: TRadioButton
      Left = 12
      Top = 64
      Width = 213
      Height = 17
      Caption = 'Da Web-Cam conectada ao computador.'
      TabOrder = 1
    end
  end
  object btnOk: TButton
    Left = 115
    Top = 122
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TBitBtn
    Left = 199
    Top = 122
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0077FF77FF700F
      77FFFF77FF77F0B0FF7777FF77FF70B307FF00000007F0B330007777770000B3
      307777770708800330777777000880F03077777702088003307700000A2080B3
      3077AAAAAAA200B3307700000AA080B3307777770A0880B330777777000880BB
      307777770708880BB077777777088880B0777777770000000077}
  end
end
