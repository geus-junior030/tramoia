object FrmSelBolsa: TFrmSelBolsa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione a bolsa desejada.'
  ClientHeight = 151
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 115
    Align = alClient
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 387
      Height = 113
      Align = alClient
      Color = clSkyBlue
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      OnKeyDown = DBGridKeyDown
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'numero_da_bolsa'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero da bolsa'
          Width = 165
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'grupo_sanguineo'
          Title.Alignment = taCenter
          Title.Caption = 'ABO/Rh'
          Width = 57
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tipo'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 33
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'volume_atual'
          Title.Alignment = taCenter
          Title.Caption = 'Volume'
          Visible = True
        end>
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 115
    Width = 389
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object BtnConfirmar: TBitBtn
      Left = 75
      Top = 5
      Width = 110
      Height = 27
      Caption = 'Confirmar - F6'
      Glyph.Data = {
        E6040000424DE6040000000000003600000028000000140000000F0000000100
        200000000000B004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000550003006D00A5007B005B0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000055
        0003006F00A7007E00FE007B00FB002700530000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000550003007000A7008100FE008300FF008300FF007F
        00FA0027004E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000550003278827B02597
        25FE038903FF008800FF008800FF008800FF008500F90025004A000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000005500032A8B2AB04CAB4CFE4AAD4AFF44AA44FF239B23FF098F09FF068E
        06FF068E06FF068906F803240345000000000000000000000000000000000000
        0000000000000000000000000000005500032F8D2FB155AF55FE54B154FF52B1
        52FF51B051FF50B050FF4AAD4AFF32A232FF1A971AFF119311FF0F8E0FF60323
        034100000000000000000000000000000000000000000000000000550003328C
        32B05FB45FFE5DB55DFF5CB55CFF5AB45AFF59B459FF3F9C3FD14CA64CE456B2
        56FF54B154FF49AD49FF39A539FF2A972AF51B361B4100000000000000000000
        000000000000000000001370134F61B661F567BA67FF65B965FF64B964FF62B8
        62FF439D43CC006D000E1075103F50A850E45CB55CFF5CB55CFF5BB45BFF59B4
        59FF55AB55F5394F394300000000000000000000000000000000000000002982
        297B6AB96AF56DBD6DFF6DBC6DFF48A048CC006D000E00000000000000001475
        143F58AC58E465B965FF64B864FF62B862FF61B761FF5DAE5DF4354A353E0000
        000000000000000000000000000000000000277F277A70BB70F54FA14FCD006D
        000E000000000000000000000000000000001475143F5BAE5BE46CBC6CFF6BBB
        6BFF6ABB6AFF68BA68FF63B063F1354735390000000000000000000000000000
        0000000000001B791B65006D000E000000000000000000000000000000000000
        0000000000001475143F63B063E473BF73FF72BF72FF71BE71FF70BE70FF6BB2
        6BF0344834350000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001475143F69B3
        69E37CC47CFF7AC37AFF7AC37AFF79C279FF70BC70EE227B223C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001475143F70B870E383C783FF82C782FF82C6
        82FF5BA85BD10068001600000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00001879183F77BA77E38BCA8BFF61AC61D10068001600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001879183F529E52C60068
        00160000000000000000}
      TabOrder = 0
      OnClick = BtnConfirmarClick
    end
    object BtnCancelar: TBitBtn
      Left = 192
      Top = 5
      Width = 110
      Height = 27
      Caption = 'Cancelar - Esc'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000A113110FB0DA00009C3E000000000000000000000000000000000000
        0000000000000400993F110FB0D700009F100000000000000000000000000000
        A1131713BAEB2821D2FF1F1AC6FB00009C3E0000000000000000000000000000
        00000400993F201AC6FC2821D2FF1712B9E800009F100000000000009B121612
        BCEA2720D6FF2720D6FF2720D6FF1F19C9FB00009C3E00000000000000000000
        993F1F19C9FC2720D6FF2720D6FF2720D6FF1511BBE800009F10110DB7DB261F
        DAFF261FDAFF261FDAFF261FDAFF261FDAFF1E19CDFB00009C3E00009D3F1E19
        CDFC261FDAFF261FDAFF261FDAFF261FDAFF261FDAFF100EB5D703039D441F18
        D0FC261EDDFF261EDDFF261EDDFF261EDDFF261EDDFF1E18CFFC1E18CFFC261E
        DDFF261EDDFF261EDDFF261EDDFF261EDDFF1E18CFFC00009D3F000000000303
        9B451E18D4FC251DE1FF251DE1FF251DE1FF251DE1FF251DE1FF251DE1FF251D
        E1FF251DE1FF251DE1FF251DE1FF1D17D2FC00009D3F00000000000000000000
        000003039C461D18D6FC241DE5FF241DE5FF241DE5FF241DE5FF241DE5FF241D
        E5FF241DE5FF241DE5FF1D17D4FC00009D3F0000000000000000000000000000
        0000000000000303A1471D17D9FC241CE9FF241CE9FF241CE9FF241CE9FF241C
        E9FF241CE9FF1D16D7FC00009D3F000000000000000000000000000000000000
        0000000000000707A041231FD9FC2722EBFF2722EBFF2722EBFF2722EBFF2722
        EBFF2722EBFF1F1BD9FC00009D3F000000000000000000000000000000000000
        00000B0BA0413535DCFC4343EEFF3E3EEDFF3636EDFF3030ECFF2F2FECFF2F2F
        ECFF2F2FECFF2F2FECFF2424DBFB04049A3D0000000000000000000000000B0B
        A0413A3DDDFC4A4EEFFF4A4EEFFF4A4EEFFF4A4EEFFF494DEFFF4348EEFF3F43
        EEFF3C40EDFF393EEDFF383DEDFF2B2FDBFB08089C3E000000000B0BA0413F47
        DDFC515AF0FF515AF0FF515AF0FF515AF0FF515AF0FF3F47DDFC4148DFFC515A
        F0FF515AF0FF515AF0FF515AF0FF515AF0FF4149DEFB08089E3D2B32C4DE5766
        F1FF5766F1FF5766F1FF5766F1FF5766F1FF4551DEFC0B0BA0410A0EA6484652
        E0FC5766F1FF5766F1FF5766F1FF5766F1FF5766F1FF2A32C3DA0000A1133B48
        CFED5E70F1FF5E70F1FF5E70F1FF4A5BDEFC0B0BA04100000000000000000E0E
        A5474C5DE0FC5E70F1FF5E70F1FF5E70F1FF3945CFEB00009B12000000000000
        A1133F4DD0ED657CF1FF5065DFFC0B0FA0410000000000000000000000000000
        00000E0EA2455166E0FC657CF1FF3C4DCFEB00009B1200000000000000000000
        00000000A1133442C4DE0B0FA041000000000000000000000000000000000000
        0000000000000E0EA2453644C5DD00009B120000000000000000}
      ModalResult = 8
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object DataSource: TDataSource
    Left = 208
    Top = 88
  end
end
