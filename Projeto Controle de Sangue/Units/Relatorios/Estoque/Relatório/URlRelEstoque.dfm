object FrmRlRelEstoque: TFrmRlRelEstoque
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Estoque'
  ClientHeight = 486
  ClientWidth = 793
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
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    Borders.Style = bsBDiagonal
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.Caption = 'Relat'#243'rio de entrada'
    BeforePrint = RLReportBeforePrint
    object RLBandHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object RLLabel: TRLLabel
        Left = 269
        Top = 17
        Width = 180
        Height = 22
        Alignment = taCenter
        Caption = 'Estoque de Bolsas'
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
      Width = 718
      Height = 56
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabelQuantidade: TRLLabel
        Left = 359
        Top = 20
        Width = 172
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLPanel1: TRLPanel
        Left = 94
        Top = 0
        Width = 1
        Height = 56
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelVolume: TRLLabel
        Left = 123
        Top = 20
        Width = 154
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Volume Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLPanel2: TRLPanel
        Left = 319
        Top = 0
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelABO: TRLLabel
        Left = 19
        Top = 20
        Width = 58
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'ABO/Rh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLPanel3: TRLPanel
        Left = 566
        Top = 0
        Width = 1
        Height = 57
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLLabelTipo: TRLLabel
        Left = 601
        Top = 20
        Width = 74
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 153
      Width = 718
      Height = 30
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedTop = True
      Borders.FixedBottom = True
      object RLDBTextQuantidade: TRLDBText
        Left = 359
        Top = 7
        Width = 172
        Height = 16
        Alignment = taCenter
        DataField = 'quantidade'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextVolume: TRLDBText
        Left = 176
        Top = 7
        Width = 44
        Height = 16
        Alignment = taCenter
        DataField = 'volume'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextABO: TRLDBText
        Left = 19
        Top = 7
        Width = 58
        Height = 16
        Alignment = taCenter
        DataField = 'abo'
        DataSource = DataSource
        Text = ''
      end
      object RLDBTextTipo: TRLDBText
        Left = 602
        Top = 7
        Width = 73
        Height = 16
        Alignment = taCenter
        DataField = 'tipo'
        DataSource = DataSource
        Text = ''
      end
      object RLPanel7: TRLPanel
        Left = 94
        Top = 0
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel8: TRLPanel
        Left = 319
        Top = 0
        Width = 1
        Height = 30
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLPanel9: TRLPanel
        Left = 566
        Top = 0
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
      Width = 718
      Height = 27
      BandType = btColumnFooter
      Borders.Sides = sdAll
      object RLLabelQuantidadeTotal: TRLLabel
        Left = 246
        Top = 6
        Width = 168
        Height = 16
        Caption = 'Quantidade Total de Bolsas:'
      end
      object RLDBResultQuantidadeTotal: TRLDBResult
        Left = 420
        Top = 6
        Width = 43
        Height = 16
        Info = riSum
        Text = ''
        OnCompute = RLDBResultQuantidadeTotalCompute
      end
    end
  end
  object DataSource: TDataSource
    Left = 695
    Top = 48
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 392
    Top = 248
  end
end
