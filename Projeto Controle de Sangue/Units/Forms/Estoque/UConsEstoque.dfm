object FrmConsEstoque: TFrmConsEstoque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de estoque'
  ClientHeight = 211
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TPanel
    Left = 0
    Top = 169
    Width = 351
    Height = 42
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object BtnSair: TSpeedButton
      Left = 137
      Top = 6
      Width = 75
      Height = 31
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000120B0000120B000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000120000
        0032000000330000003300000033000000330000003300000033000000330000
        0033000000330000003300000033000000330000003300000033365D7B79497B
        A2FC68A4D9FF5C5C5CFF5C5C5CFF5E5B5AFF5E5A59FF5D5A5AFF5B5A5BFF5A5B
        5BFF5A5B5BFF5A5B5BFF5B5A5AFF5C5956FF576876FF4E7EA4FF4C80ACFF5082
        ABFF65A2D5FF5E5B5C005F5A5C00635859003F69A5FF756667FF706869FF6D69
        69FF6C6A69FF6C6A69FF6C6A68FF6E6762FF4C89BAFF4E85B2FF4D83AEFF5D8C
        B2FF629ED1FF66565D0069555C0010866D0013826BFF009346FF715C62FF6A62
        63FF676463FF666463FF676462FF68615BFF4F8ABBFF5086B4FF4F84B1FF6895
        B9FF5F9BCDFF000000300000003300000033008C46FF4FDDB0FF008D43FF6B58
        5EFF655E60FF636160FF62605FFF645D57FF518DBEFF528AB7FF5187B4FF739F
        C2FF5D97C9FF008B4BF2008A47FF008845FF008441FF00DAA2FF60D9B3FF008D
        42FF68545AFF625B5CFF605C5AFF605852FF5490C2FF558CBAFF4E81ADFF7EA6
        C8FF5A94C4FF008A47FF63EDD0FF00D4A0FF00D29EFF00CC9CFF00CD9CFF6FDC
        BDFF009346FF615457FF5C5756FF5B534DFF5794C5FF588EBCFF47749BFF88AF
        CFFF5790C0FF008A47FF61E1D0FF60DDCAFF63DCC8FF00C49BFF00C69CFF82E1
        C8FF009447FF5C5054FF585353FF574F4AFF5A96CAFF5B8FBEFF22B9F7FF95B5
        D3FF548DBCFF008D4CEF008A47FF008844FF00853FFF00C1A0FF97E3D1FF008F
        43FF5A484EFF565051FF53514FFF524B45FF5B9ACDFF5C91C1FF20B7F5FF9EBC
        D7FF5189B8FF008F4E00008F4C00008E4900008B44FFA0E8DAFF009144FF5543
        4AFF524B4DFF4F4D4EFF4F4D4CFF4D4641FF5E9CD2FF5C95C5FF5990C1FFA6C4
        DFFF4E86B5FF00904C00009147001A866E0017866DFF009647FF523F45FF4F47
        49FF4D494AFF4C4A4AFF4C4848FF4A423DFF60A0D5FF5D98C9FF5894C6FFAFCC
        E6FF4B83B0FF009242005276AF004E77AB004D7BB0FF4C3D3BFF4A4343FF4845
        44FF484644FF484644FF474542FF433C36FF5FA1D8FF5C9ACCFF5896C9FFB8D3
        EBFF4980ACFF4F79AB004C7AA7004A7BA6004A7FACFF443831FF433B37FF433D
        38FF433D38FF433D38FF423B36FF3C332CFFB9DAF5FF7FB0DAFF5495CCFFC0DA
        EFFF467CA8FF4B7CA6004A7CA5004A7CA6004A7EA8B04A82AEFF4A83B0FF4A83
        B0FF4A83B0FF4A83B0FF4A82AFFF447DA9FF709CBFFFB9D5EBFFB3D1EAFFC1DB
        F2FF4279A5FF4A7CA5004A7CA5004A7CA5004A7CA5004A7EA7004A7EA8004A7E
        A8004A7EA8004A7EA800497DA7004579A400709BBE00B5D2EA00C3DAEF58CDE3
        F5FB3F75A1FF}
      ParentFont = False
      OnClick = BtnSairClick
    end
  end
  object PanelConsulta: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 72
    Align = alTop
    TabOrder = 1
    object GroupBoxConsulta: TGroupBox
      Left = 1
      Top = 7
      Width = 349
      Height = 64
      Align = alBottom
      TabOrder = 0
      object GroupBoxTipoCons: TGroupBox
        Left = 9
        Top = 7
        Width = 119
        Height = 49
        Caption = 'Consultar por'
        TabOrder = 0
        object ComboBoxTipoCons: TComboBox
          Left = 8
          Top = 17
          Width = 104
          Height = 21
          Cursor = crHandPoint
          Style = csDropDownList
          MaxLength = 3
          TabOrder = 0
          OnChange = ComboBoxTipoConsChange
          Items.Strings = (
            'Tipo'
            'Grupo sangu'#237'neo')
        end
      end
      object EdtCons: TSearchBox
        Left = 136
        Top = 24
        Width = 188
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 1
        OnInvokeSearch = EdtConsInvokeSearch
      end
    end
  end
  object PanelGrid: TPanel
    Left = 0
    Top = 72
    Width = 351
    Height = 97
    Align = alClient
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 349
      Height = 95
      Align = alClient
      Color = clSkyBlue
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'abo'
          Title.Alignment = taCenter
          Title.Caption = 'ABO/Rh'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'volume'
          Title.Alignment = taCenter
          Title.Caption = 'Volume total'
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade total'
          Width = 86
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tipo'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 42
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sorologia'
          Title.Alignment = taCenter
          Title.Caption = 'Sorologia'
          Visible = True
        end>
    end
  end
  object DataSource: TDataSource
    Left = 240
    Top = 104
  end
end
