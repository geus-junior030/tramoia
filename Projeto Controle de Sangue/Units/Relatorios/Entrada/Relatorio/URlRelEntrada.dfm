object FrmRlRelEntrada: TFrmRlRelEntrada
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de entrada'
  ClientHeight = 486
  ClientWidth = 1122
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport: TRLReport
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    PreviewOptions.Caption = 'Relat'#243'rio de entrada'
    object RLBandHeader: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 59
      BandType = btHeader
      object RLLabel: TRLLabel
        Left = 493
        Top = 17
        Width = 102
        Height = 22
        Alignment = taCenter
        Caption = 'Entrada(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBandTitle: TRLBand
      Left = 38
      Top = 97
      Width = 1047
      Height = 56
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabelDataEntrada: TRLLabel
        Left = 1
        Top = 20
        Width = 96
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Data de entrada'
      end
      object RLPanel1: TRLPanel
        Left = 102
        Top = 0
        Width = 1
        Height = 56
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelNumeroBolsa: TRLLabel
        Left = 158
        Top = 20
        Width = 103
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'N'#250'mero da bolsa'
      end
      object RLPanel2: TRLPanel
        Left = 311
        Top = -1
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelOrigem: TRLLabel
        Left = 324
        Top = 20
        Width = 46
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Origem'
      end
      object RLPanel3: TRLPanel
        Left = 384
        Top = -3
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelTipo: TRLLabel
        Left = 400
        Top = 20
        Width = 27
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Tipo'
      end
      object RLPanel4: TRLPanel
        Left = 446
        Top = -3
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelVolume: TRLLabel
        Left = 464
        Top = 20
        Width = 48
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Volume'
      end
      object RLPanel5: TRLPanel
        Left = 533
        Top = -3
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelAboRh: TRLLabel
        Left = 543
        Top = 20
        Width = 52
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'ABO/Rh'
      end
      object RLPanel6: TRLPanel
        Left = 606
        Top = -1
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 795
        Top = 20
        Width = 72
        Height = 16
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Observa'#231#227'o'
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 153
      Width = 1047
      Height = 30
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedTop = True
      Borders.FixedBottom = True
      object RLDBTextDataEntrada: TRLDBText
        Left = 12
        Top = 7
        Width = 80
        Height = 16
        Alignment = taCenter
        DataField = 'data_entrada'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextNumeroBolsa: TRLDBText
        Left = 156
        Top = 7
        Width = 106
        Height = 16
        Alignment = taCenter
        DataField = 'numero_da_bolsa'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextOrigem: TRLDBText
        Left = 324
        Top = 7
        Width = 44
        Height = 16
        Alignment = taCenter
        DataField = 'origem'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextTipo: TRLDBText
        Left = 400
        Top = 7
        Width = 26
        Height = 16
        Alignment = taCenter
        DataField = 'tipo'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextVolume: TRLDBText
        Left = 466
        Top = 7
        Width = 44
        Height = 16
        Alignment = taCenter
        DataField = 'volume'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextAboRh: TRLDBText
        Left = 551
        Top = 7
        Width = 36
        Height = 16
        Alignment = taCenter
        DataField = 'aborh'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextObservacao: TRLDBText
        Left = 795
        Top = 7
        Width = 70
        Height = 16
        Alignment = taCenter
        DataField = 'observacao'
        DataSource = DataSource
        Text = ''
      end
      object RLPanel13: TRLPanel
        Left = 102
        Top = -2
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel14: TRLPanel
        Left = 311
        Top = -3
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel15: TRLPanel
        Left = 384
        Top = -2
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel16: TRLPanel
        Left = 446
        Top = -2
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel17: TRLPanel
        Left = 533
        Top = -2
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel18: TRLPanel
        Left = 606
        Top = -1
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 183
      Width = 1047
      Height = 27
      BandType = btColumnFooter
      Borders.Sides = sdAll
      object RLLabelTotalEntradas: TRLLabel
        Left = 426
        Top = 5
        Width = 176
        Height = 16
        Caption = 'Total de Entradas no Per'#237'odo:'
      end
      object RLDBResultTotalEntradas: TRLDBResult
        Left = 608
        Top = 5
        Width = 46
        Height = 16
        DataField = 'numero_da_bolsa'
        DataSource = DataSource
        Info = riCount
        Text = ''
      end
    end
  end
  object DataSource: TDataSource
    Left = 944
    Top = 40
  end
end
