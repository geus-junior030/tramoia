inherited FrmConsMunicipio: TFrmConsMunicipio
  Caption = 'Consulta de munic'#237'pios'
  ClientHeight = 323
  ClientWidth = 494
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 500
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelGrid: TPanel
    Width = 494
    Height = 209
    ExplicitWidth = 494
    ExplicitHeight = 209
    inherited DBGrid: TDBGrid
      Width = 492
      Height = 207
      DataSource = DataSource
      OnDblClick = DBGridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_ibge'
          Title.Caption = 'C'#243'digo IBGE'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 342
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Title.Caption = 'UF'
          Width = 37
          Visible = True
        end>
    end
  end
  inherited PanelBotoes: TPanel
    Top = 281
    Width = 494
    Visible = False
    ExplicitTop = 281
    ExplicitWidth = 494
  end
  inherited PanelConsulta: TPanel
    Width = 494
    ExplicitWidth = 494
    inherited GroupBoxConsulta: TGroupBox
      Width = 474
      ExplicitWidth = 474
      inherited EdtCons: TSearchBox
        Top = 20
        Width = 328
        OnExit = EdtConsExit
        OnInvokeSearch = EdtConsInvokeSearch
        ExplicitTop = 20
        ExplicitWidth = 328
      end
    end
  end
  object DataSource: TDataSource
    Left = 48
    Top = 104
  end
end
