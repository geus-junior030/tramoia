object FrmRelDescarte: TFrmRelDescarte
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de descarte'
  ClientHeight = 302
  ClientWidth = 970
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelData: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBoxDataDescarte: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 964
      Height = 59
      Align = alClient
      Caption = 'Data de descarte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LabelA: TLabel
        Left = 475
        Top = 28
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object DateTimePickerDataInicial: TDateTimePicker
        Left = 360
        Top = 23
        Width = 97
        Height = 21
        Date = 43295.486990000000000000
        Time = 43295.486990000000000000
        TabOrder = 0
      end
      object DateTimePickerDataFinal: TDateTimePicker
        Left = 499
        Top = 23
        Width = 97
        Height = 21
        Date = 43295.486990000000000000
        Time = 43295.486990000000000000
        TabOrder = 1
      end
    end
  end
  object PanelTipo: TPanel
    Left = 0
    Top = 65
    Width = 330
    Height = 192
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBoxTipo: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 324
      Height = 186
      Align = alClient
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object EdtTipo: TEdit
        Left = 10
        Top = 24
        Width = 223
        Height = 21
        Alignment = taCenter
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 0
      end
      object BtnAddTipo: TBitBtn
        Left = 241
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF000000
          000000000000000000000000000A000000250000003300000033000000330000
          0033000000250000000A000000000000000000000000FFFFFF00FFFFFF000000
          00000000000000000022004F2B5C008347C9008C4BFF008B4AFF008B4AFF008C
          4BFF008347C9004F2B5C0000001E0000000000000000FFFFFF00FFFFFF000000
          00000000001E008046BB009050FF01A169FF01AB76FF01AC79FF01AC79FF01AB
          76FF01A169FF009050FF007C44AA0000001E00000000FFFFFF00FFFFFF000000
          000A007C43AA009152FF02AC77FF00C38CFF00D79BFF00DA9CFF00DA9CFF00D7
          9CFF01C38CFF01AB76FF009253FF007C44AA0000000AFFFFFF00FFFFFF000059
          3151009051FF0FB483FF00D298FF00D598FF00D192FF00CF90FF00D091FF00D3
          96FF00D69BFF00D198FF01AB76FF009050FF005A3151FFFFFF00FFFFFF000083
          45C916AB78FF10C996FF00D397FF00CD8CFFFFFFFFFFFFFFFFFFFFFFFFFF00CC
          8CFF00D195FF00D59BFF01C18CFF01A169FF008447C9FFFFFF00FFFFFF00008A
          48FF39C49DFF00D198FF00CB8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00CA8CFF00CF96FF00D29BFF01AB76FF008C4BFFFFFFFF00FFFFFF000089
          46FF52D2B0FF00CC92FFFFFFFFFFFFFFFFFFFFFFFFFF00C484FFFFFFFFFFFFFF
          FFFFFFFFFFFF00C88DFF00D09AFF00AD79FF008B4AFFFFFFFF00FFFFFF000088
          45FF68DDBEFF00C991FFFFFFFFFFFFFFFFFF00C68CFF00C891FF00C58BFFFFFF
          FFFFFFFFFFFFFFFFFFFF00CC96FF00AD78FF008B4AFFFFFFFF00FFFFFF000088
          46FF76E0C6FF00CB98FF00C590FF00C691FF00C895FF00C997FF00C894FF00C3
          8CFFFFFFFFFFFFFFFFFF00C792FF00AB75FF008C4BFFFFFFFF00FFFFFF000088
          46BE59C9A4FF49DEBCFF00C794FF00C897FF00C998FF00C999FF00C998FF00C7
          94FF00C38EFFFFFFFFFF00BD8AFF00A067FF008B4BBFFFFFFF00FFFFFF00008C
          4B330A9458FFADF8E9FF18D0A7FF00C495FF00C697FF00C698FF00C798FF00C7
          98FF00C697FF00C596FF12B585FF008F50FF008E4D33FFFFFF00FFFFFF000000
          0000008A48AA199C63FFBCFFF7FF5EE4C9FF00C59AFF00C396FF00C497FF00C5
          9AFF22CAA2FF2FC196FF029355FF008D4C9500000000FFFFFF00FFFFFF000000
          000000000000008A48950E9659FF74D5B6FFA0F4E1FF94EFDCFF7CE6CCFF5ED6
          B5FF2EB587FF039152FF008C4CAA0000000000000000FFFFFF00FFFFFF000000
          00000000000000000000008C4A33008946BB008744FF008743FF008744FF0089
          46FF008B49BB008D4C33000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        TabOrder = 1
        OnClick = BtnAddTipoClick
      end
      object RadioGroupFiltroTipo: TRadioGroup
        Left = 15
        Top = 53
        Width = 306
        Height = 38
        Caption = 'Filtro'
        Columns = 4
        Items.Strings = (
          'Entre '
          'Somente '
          'Omitir '
          'Todos')
        TabOrder = 2
        OnClick = RadioGroupFiltroTipoClick
      end
      object ListBoxTipo: TListBox
        Left = 10
        Top = 98
        Width = 306
        Height = 76
        ItemHeight = 13
        Sorted = True
        TabOrder = 3
        OnKeyDown = ListBoxTipoKeyDown
      end
    end
  end
  object PanelBotoes: TPanel
    Left = 0
    Top = 261
    Width = 970
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 2
    object BtnSair: TBitBtn
      Left = 550
      Top = 9
      Width = 79
      Height = 25
      Caption = 'Sair'
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
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object BtnImprimir: TBitBtn
      Left = 448
      Top = 9
      Width = 79
      Height = 25
      Caption = 'Imprimir'
      Glyph.Data = {
        76060000424D7606000000000000360000002800000014000000140000000100
        2000000000004006000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000B0D0D0D26545454151D1D1D3D1D1D
        1D3D1D1D1D3D1D1D1D3D1D1D1D3D1D1D1D3D1D1D1D3D1D1D1D3D1D1D1D3D1D1D
        1D3D1D1D1D3D1D1D1D3D2B2B2B290D0D0D260000000D00000000000000020707
        0724696E6ED77A7D7FD4797A7AE37D8182E3828686E3818383E37D8182E37A80
        81E3797A7DE3787A7AE3737979E3727474E3717273E36E7171E3727373DB6667
        67D4000000260000000400000000919191ACB8BABBFFB6B8B8FFB6B8B8FFB6B8
        B8FFB6B8B8FFB4B6B6FFB2B4B4FFB1B2B3FFAEB0B1FFACAFAFFFAAACADFFA9AB
        ACFFA8A9A9FFA6A8A9FFA4A7A7FFA4A5A6FF7C8181A6000000017F7F7F049D9D
        9DC7D9DBDCFFD6D8D8FFD4D6D6FFD2D4D4FFD0D2D2FFCED0D0FFCCCECEFFCACC
        CCFFC7C9CAFFC5C7C8FFC3C5C6FFC1C3C4FFBFC1C2FFBDBFC0FFBBBDBDFFBABC
        BDFF8C9090C4555555037F7F7F04A6AAAAC1DADCDDFFD5D7D7FFD1D3D3FFCFD1
        D1FFCDCFCFFFCBCDCDFFC9CBCBFFC7C9C9FFC4C6C7FFC2C4C5FFC0C2C3FFBEC0
        C1FFBDBEBFFFBBBDBDFFBABCBCFFBCBEBFFF9A9A9AC0555555037F7F7F04AAAE
        AEC4DCDEDFFFB8B9B9FFB5B6B6FFB4B5B5FFB4B5B5FFB3B5B5FFB3B4B4FFB2B3
        B3FFB2B2B3FFB1B2B2FFB0B2B2FFB0B1B1FFAFB0B0FFAEB0B0FFB4B6B6FFBDBF
        C0FFA0A0A0C2555555037F7F7F04B0B3B3C6C7C9CAFFC5C6C7FFA1A2A3FFF5F6
        F7FFF5F6F7FFF5F6F7FFF5F6F7FFF5F6F7FFF5F6F7FFF5F6F7FFF5F6F7FFF5F6
        F7FFF5F6F7FFF5F6F7FFD7D8D8FFB6B7B8FFA5A5A5C55555550366666605C5C5
        C5D0E8EAEBFFE4E5E6FFE1E1E1FFE9EBEBFFE9E9EAFFE8E9EAFFE8E8E9FFE7E8
        E8FFE5E6E8FFE4E5E6FFE4E4E6FFE3E4E5FFE2E3E4FFE1E2E4FFDEDEDEFFD6D7
        D8FFBABABACD5555550300000000C7C7C7B8FCFCFCFFFCFCFCFFE2E2E2FFDADA
        DAFFD9D9D9FFD9D9D9FFD9D9D9FFD8D8D8FFD8D8D8FFD8D8D8FFD7D7D7FFD7D7
        D7FFD7D7D7FFDFDFDFFFF0F0F0FFF4F4F4FFBEBEC1AE00000000000000007979
        7915D4D4D4EAEEEEEEFFB1B1B1FFADADADFFACACACFFACACACFFACACACFFACAC
        ACFFACACACFFADADADFFADADADFFADADADFFAFAFAFFFB2B2B2FFECECECFFC3C3
        C3E07777770F000000000000000000000000727272148282824EB9B9B9DCCECE
        CEFFBEBEBEFFBEBEBEFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFC0C0C0FFC4C4
        C4FFD3D3D3FFB8B8B8D97F7F7F4C6666660F0000000000000000000000000000
        0000000000009191910ED2D2D2D5F3F3F3FFF1F1F1FFF1F1F1FFF2F2F2FFF2F2
        F2FFF3F3F3FFF3F3F3FFF4F4F4FFF6F6F6FFF8F8F8FFD4D4D4D28B8B8B0B0000
        000000000000000000000000000000000000000000009191910ED7D7D7D5F9F9
        F9FFECECECFFECECECFFECECECFFEBEBEBFFF2F2F2FFF8F8F8FFF8F8F8FFF8F8
        F8FFF8F8F8FFD4D4D4D28B8B8B0B000000000000000000000000000000000000
        0000000000009191910ED2D2D2D5F2F2F2FFE5E5E5FFE5E5E5FFE5E5E5FFE4E4
        E4FFE4E4E4FFE4E4E4FFE4E4E4FFE7E7E7FFF1F1F1FFD2D2D2D28B8B8B0B0000
        000000000000000000000000000000000000000000009191910ED1D1D1D5EAEA
        EAFFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFDCDC
        DCFFEAEAEAFFCECECED28B8B8B0B000000000000000000000000000000000000
        0000000000009191910ECFCFCFD5E3E3E3FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1
        E1FFE1E1E1FFE0E0E0FFE0E0E0FFE0E0E0FFE3E3E3FFCDCDCDD28B8B8B0B0000
        000000000000000000000000000000000000000000008D8D8D09CACACAD1E0E0
        E0FFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
        DFFFE0E0E0FFC9C9C9CD91919107000000000000000000000000000000000000
        00000000000000000000A9A9A927B3B3B36CB3B3B36CB3B3B36CB3B3B36CB3B3
        B36CB3B3B36CB3B3B36CB3B3B36CB3B3B36CB3B3B36CA9A9A924000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 1
      OnClick = BtnImprimirClick
    end
    object BtnVisualizar: TBitBtn
      Left = 344
      Top = 9
      Width = 79
      Height = 25
      Caption = 'Visualizar'
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000100000003000000030000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000003D3D3D11646464446C6C6C64545454410606
        0610000000010000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000002020200FFFFFF00606060285A5A5AA4434343EE5B5B5BFD888888E26C6C
        6C600000000C0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00008181810066666618515151B5272727FF696969FFA5A5A5FFACACACFF9595
        95DA5353533B0000000400000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000202
        02009797970067676765252525FC5C5C5CFFA7A7A7FF989898FF8E8E8EFF7979
        79FF707070920000001000000000000000000000000000000000000000000000
        0000000000000000000000000001000000070000000A00000004000000000C0C
        0C00383838005D5D5D8C232323FF9B9B9BFF888888FF6B6B6BFF656565FF4B4B
        4BFF5E5E5EDF4343433D00000006040404000000000000000000000000000000
        0000858585005757570E7171714D727272795B5B5B540606061E000000080000
        00006A6A6A006A6A6A544F4F4FF37F7F7FFF818181FF8C8C8CFF5A5A5AFF3939
        39FF464646FF555555B02F2F2F27000000020000000000000000000000008080
        80007D7D7D13646464953F3F3FF2535353FF8B8B8BE97C7C7C760404041F0000
        000660606000727272059696967DABABABF6CFCFCFFFB1B1B1FF6B6B6BFF4848
        48FF393939FF393939FC3939397D0606060C000000000000000078787800FFFF
        FF0167676781282828FD5D5D5DFFA5A5A5FFA7A7A7FF969696EA626262620000
        0017000000037A7A7A008E8E8E08A8A8A86CBCBCBCEAC1C1C1FF949494FF6969
        69FF4C4C4CFF242424FF4C4C4CD75656563400000003000000008A8A8A009494
        94203B3B3BDB424242FFAAAAAAFF949494FF7C7C7CFF656565FF6F6F6FD13E3E
        3E42000000150000000F000000084E4E4E1B434343CA838383FFB6B6B6FF8B8B
        8BFF575757FF333333FF565656FE6969698A0000000F00000000858585008989
        8933323232EF757575FF9B9B9BFF626262FF585858FF3D3D3DFF505050FE5F5F
        5FBE5252528759595976303030333939394C0E0E0EF30B0B0BFF3E3E3EFF4C4C
        4CFF555555FF4B4B4BFF424242FF5A5A5ADF52525234000000008D8D8D009797
        97115E5E5EB46C6C6CFF878787FFA5A5A5FF7B7B7BFF424242FF3A3A3AFF4646
        46FF313131FF393939FD393939B050505070373737EC323232FF444444FF6767
        67FF525252FF535353FF3C3C3CFF464646F360606044F1F1F100DCDCDC009E9E
        9E00A5A5A51FABABABA5BFBFBFF7C0C0C0FFA9A9A9FF747474FF454545FF3636
        36FF0D0D0DFF111111FF1C1C1CFC4D4D4DF1404040FD545454FF939393FF6B6B
        6BFF414141FF424242FF414141FF444444D76464642290909000000000000000
        0000AEAEAE00AEAEAE0BB7B7B759B9B9B9CAB0B0B0FDA0A0A0FF717171FF2A2A
        2AFF212121FF2C2C2CFF191919FF444444FF363636FE373737FD6E6E6EFF7878
        78FF5D5D5DFF3C3C3CFF454545FF6969698D0A0A0A0430303000000000000000
        000000000000A3A3A300CCCCCC00BCBCBC17ADADAD8B989898FA626262FF4D4D
        4DFF676767FF555555FF505050FF616161FF363636FE373737FF2A2A2AFF5454
        54FF727272FF616161FF5C5C5CFD78787863FFFFFF0000000000000000000000
        0000000000000000000000000000A0A0A000A4A4A40B9595957A828282EB9D9D
        9DFFAFAFAFFF8B8B8BFF666666FF7B7B7BFF6C6C6CFF3C3C3CFF464646FF4C4C
        4CFC808080F0969696FA797979B27171711A9A9A9A0000000000000000000000
        000000000000000000000000000000000000D3D3D300FFFFFF02AAAAAA438F8F
        8FC5ADADADFEB7B7B7FF868686FF6C6C6CFF6D6D6DFF515151FF5A5A5AFF5151
        51DF9D9D9D54BDBDBD49B6B6B615AAAAAA00F0F0F00000000000000000000000
        00000000000000000000000000000000000000000000FBFBFB007B7B7B00ADAD
        AD1A8C8C8C8D8F8F8FE87D7D7DE9747474C29C9C9CEF939393DF888888878282
        8241AFAFAF029B9B9B0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000B3B3
        B300BEBEBE059292922A9D9D9D2DC7C7C710C4C4C43EBEBEBE2CA7A7A702B4B4
        B400000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
      OnClick = BtnVisualizarClick
    end
  end
  object PanelGrupoSanguineo: TPanel
    Left = 331
    Top = 65
    Width = 316
    Height = 192
    BevelOuter = bvNone
    TabOrder = 3
    object GroupBoxGrupoSanguineo: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 310
      Height = 186
      Align = alClient
      Caption = 'Grupo sangu'#237'neo'
      TabOrder = 0
      object EdtGrupoSanguineo: TEdit
        Left = 11
        Top = 24
        Width = 208
        Height = 21
        Alignment = taCenter
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 0
      end
      object BtnAddGrupoSanguineo: TBitBtn
        Left = 225
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF000000
          000000000000000000000000000A000000250000003300000033000000330000
          0033000000250000000A000000000000000000000000FFFFFF00FFFFFF000000
          00000000000000000022004F2B5C008347C9008C4BFF008B4AFF008B4AFF008C
          4BFF008347C9004F2B5C0000001E0000000000000000FFFFFF00FFFFFF000000
          00000000001E008046BB009050FF01A169FF01AB76FF01AC79FF01AC79FF01AB
          76FF01A169FF009050FF007C44AA0000001E00000000FFFFFF00FFFFFF000000
          000A007C43AA009152FF02AC77FF00C38CFF00D79BFF00DA9CFF00DA9CFF00D7
          9CFF01C38CFF01AB76FF009253FF007C44AA0000000AFFFFFF00FFFFFF000059
          3151009051FF0FB483FF00D298FF00D598FF00D192FF00CF90FF00D091FF00D3
          96FF00D69BFF00D198FF01AB76FF009050FF005A3151FFFFFF00FFFFFF000083
          45C916AB78FF10C996FF00D397FF00CD8CFFFFFFFFFFFFFFFFFFFFFFFFFF00CC
          8CFF00D195FF00D59BFF01C18CFF01A169FF008447C9FFFFFF00FFFFFF00008A
          48FF39C49DFF00D198FF00CB8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00CA8CFF00CF96FF00D29BFF01AB76FF008C4BFFFFFFFF00FFFFFF000089
          46FF52D2B0FF00CC92FFFFFFFFFFFFFFFFFFFFFFFFFF00C484FFFFFFFFFFFFFF
          FFFFFFFFFFFF00C88DFF00D09AFF00AD79FF008B4AFFFFFFFF00FFFFFF000088
          45FF68DDBEFF00C991FFFFFFFFFFFFFFFFFF00C68CFF00C891FF00C58BFFFFFF
          FFFFFFFFFFFFFFFFFFFF00CC96FF00AD78FF008B4AFFFFFFFF00FFFFFF000088
          46FF76E0C6FF00CB98FF00C590FF00C691FF00C895FF00C997FF00C894FF00C3
          8CFFFFFFFFFFFFFFFFFF00C792FF00AB75FF008C4BFFFFFFFF00FFFFFF000088
          46BE59C9A4FF49DEBCFF00C794FF00C897FF00C998FF00C999FF00C998FF00C7
          94FF00C38EFFFFFFFFFF00BD8AFF00A067FF008B4BBFFFFFFF00FFFFFF00008C
          4B330A9458FFADF8E9FF18D0A7FF00C495FF00C697FF00C698FF00C798FF00C7
          98FF00C697FF00C596FF12B585FF008F50FF008E4D33FFFFFF00FFFFFF000000
          0000008A48AA199C63FFBCFFF7FF5EE4C9FF00C59AFF00C396FF00C497FF00C5
          9AFF22CAA2FF2FC196FF029355FF008D4C9500000000FFFFFF00FFFFFF000000
          000000000000008A48950E9659FF74D5B6FFA0F4E1FF94EFDCFF7CE6CCFF5ED6
          B5FF2EB587FF039152FF008C4CAA0000000000000000FFFFFF00FFFFFF000000
          00000000000000000000008C4A33008946BB008744FF008743FF008744FF0089
          46FF008B49BB008D4C33000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        TabOrder = 1
        OnClick = BtnAddGrupoSanguineoClick
      end
      object RadioGroupFiltroGrupoSanguineo: TRadioGroup
        Left = 10
        Top = 51
        Width = 290
        Height = 38
        Caption = 'Filtro'
        Columns = 4
        Items.Strings = (
          'Entre '
          'Somente '
          'Omitir '
          'Todos')
        TabOrder = 2
        OnClick = RadioGroupFiltroGrupoSanguineoClick
      end
      object ListBoxGrupoSanguineo: TListBox
        Left = 10
        Top = 98
        Width = 290
        Height = 76
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        Sorted = True
        TabOrder = 3
        OnKeyDown = ListBoxGrupoSanguineoKeyDown
      end
    end
  end
  object PanelVolume: TPanel
    Left = 646
    Top = 65
    Width = 332
    Height = 192
    BevelOuter = bvNone
    TabOrder = 4
    object GroupBoxVolume: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 310
      Height = 186
      Caption = 'Volume'
      TabOrder = 0
      object EdtVolume: TEdit
        Left = 10
        Top = 24
        Width = 208
        Height = 21
        Alignment = taCenter
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 0
      end
      object BtnAddVolume: TBitBtn
        Left = 225
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF000000
          000000000000000000000000000A000000250000003300000033000000330000
          0033000000250000000A000000000000000000000000FFFFFF00FFFFFF000000
          00000000000000000022004F2B5C008347C9008C4BFF008B4AFF008B4AFF008C
          4BFF008347C9004F2B5C0000001E0000000000000000FFFFFF00FFFFFF000000
          00000000001E008046BB009050FF01A169FF01AB76FF01AC79FF01AC79FF01AB
          76FF01A169FF009050FF007C44AA0000001E00000000FFFFFF00FFFFFF000000
          000A007C43AA009152FF02AC77FF00C38CFF00D79BFF00DA9CFF00DA9CFF00D7
          9CFF01C38CFF01AB76FF009253FF007C44AA0000000AFFFFFF00FFFFFF000059
          3151009051FF0FB483FF00D298FF00D598FF00D192FF00CF90FF00D091FF00D3
          96FF00D69BFF00D198FF01AB76FF009050FF005A3151FFFFFF00FFFFFF000083
          45C916AB78FF10C996FF00D397FF00CD8CFFFFFFFFFFFFFFFFFFFFFFFFFF00CC
          8CFF00D195FF00D59BFF01C18CFF01A169FF008447C9FFFFFF00FFFFFF00008A
          48FF39C49DFF00D198FF00CB8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00CA8CFF00CF96FF00D29BFF01AB76FF008C4BFFFFFFFF00FFFFFF000089
          46FF52D2B0FF00CC92FFFFFFFFFFFFFFFFFFFFFFFFFF00C484FFFFFFFFFFFFFF
          FFFFFFFFFFFF00C88DFF00D09AFF00AD79FF008B4AFFFFFFFF00FFFFFF000088
          45FF68DDBEFF00C991FFFFFFFFFFFFFFFFFF00C68CFF00C891FF00C58BFFFFFF
          FFFFFFFFFFFFFFFFFFFF00CC96FF00AD78FF008B4AFFFFFFFF00FFFFFF000088
          46FF76E0C6FF00CB98FF00C590FF00C691FF00C895FF00C997FF00C894FF00C3
          8CFFFFFFFFFFFFFFFFFF00C792FF00AB75FF008C4BFFFFFFFF00FFFFFF000088
          46BE59C9A4FF49DEBCFF00C794FF00C897FF00C998FF00C999FF00C998FF00C7
          94FF00C38EFFFFFFFFFF00BD8AFF00A067FF008B4BBFFFFFFF00FFFFFF00008C
          4B330A9458FFADF8E9FF18D0A7FF00C495FF00C697FF00C698FF00C798FF00C7
          98FF00C697FF00C596FF12B585FF008F50FF008E4D33FFFFFF00FFFFFF000000
          0000008A48AA199C63FFBCFFF7FF5EE4C9FF00C59AFF00C396FF00C497FF00C5
          9AFF22CAA2FF2FC196FF029355FF008D4C9500000000FFFFFF00FFFFFF000000
          000000000000008A48950E9659FF74D5B6FFA0F4E1FF94EFDCFF7CE6CCFF5ED6
          B5FF2EB587FF039152FF008C4CAA0000000000000000FFFFFF00FFFFFF000000
          00000000000000000000008C4A33008946BB008744FF008743FF008744FF0089
          46FF008B49BB008D4C33000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        TabOrder = 1
        OnClick = BtnAddVolumeClick
      end
      object RadioGroupFiltroVolume: TRadioGroup
        Left = 3
        Top = 51
        Width = 290
        Height = 38
        Caption = 'Filtro'
        Columns = 4
        Items.Strings = (
          'Entre '
          'Somente '
          'Omitir '
          'Todos')
        TabOrder = 2
        OnClick = RadioGroupFiltroVolumeClick
      end
      object ListBoxVolume: TListBox
        Left = 10
        Top = 98
        Width = 290
        Height = 76
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        Sorted = True
        TabOrder = 3
        OnKeyDown = ListBoxVolumeKeyDown
      end
    end
  end
end
