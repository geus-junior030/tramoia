unit UConsEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UClassPersistencia;

type
  TFrmConsEstoque = class(TForm)
    PanelBotoes: TPanel;
    BtnSair: TSpeedButton;
    PanelConsulta: TPanel;
    GroupBoxConsulta: TGroupBox;
    GroupBoxTipoCons: TGroupBox;
    ComboBoxTipoCons: TComboBox;
    EdtCons: TSearchBox;
    PanelGrid: TPanel;
    DBGridComEstoque: TDBGrid;
    DataSource: TDataSource;
    RadioGroupFiltrarPor: TRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure ComboBoxTipoConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtConsInvokeSearch(Sender: TObject);
    procedure ComboBoxListarEstoqueChange(Sender: TObject);
  private
    FForeignFormKey: Smallint;
    FCodUsu: Integer;

    FPersistencia: TPersistencia;

  public
    class function getConsEstoque(const pFOREIGNFORMKEY: Smallint; const pCOD_USU: Integer): Boolean;
  end;

var
  FrmConsEstoque: TFrmConsEstoque;

implementation

uses System.Math, UClassBiblioteca, UClassMensagem, UDMConexao, UClassConsEstoqueDAO;

{$R *.dfm}

procedure TFrmConsEstoque.BtnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmConsEstoque.ComboBoxListarEstoqueChange(Sender: TObject);
begin
  EdtCons.Clear;

  EdtCons.MaxLength := IfThen(ComboBoxTipoCons.ItemIndex = 0, 3, 2);

  EdtConsInvokeSearch(Sender);

  EdtCons.SetFocus;
end;

procedure TFrmConsEstoque.ComboBoxTipoConsChange(Sender: TObject);
begin

  EdtCons.Clear;

  EdtCons.MaxLength := IfThen(ComboBoxTipoCons.ItemIndex = 0, 3, 2);

  EdtCons.SetFocus;

end;

procedure TFrmConsEstoque.EdtConsInvokeSearch(Sender: TObject);
var
  lConsEstoqueDAO: TConsEstoqueDAO;
begin

  lConsEstoqueDAO := TConsEstoqueDAO.Create;
  try

    try

      if (lConsEstoqueDAO.getConsulta(ComboBoxTipoCons.ItemIndex, RadioGroupFiltrarPor.ItemIndex, EdtCons.Text,
        Self.FPersistencia)) then
      begin

        DataSource.DataSet := Self.FPersistencia.Query;

        DBGridComEstoque.SetFocus;

      end;

    except
      on E: Exception do
      begin
        raise Exception.Create(Format(TMensagem.getMensagem(1), ['estoque', E.Message]));
      end;
    end;

  finally
    lConsEstoqueDAO.Destroy;
  end;

end;

procedure TFrmConsEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'IndexCombobox', 'FrmConsEstoque.ComboBoxTipoCons',
    ComboBoxTipoCons.ItemIndex.ToString);

  TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup', 'FrmConsEstoque.RadioGroupFiltrarPor',
    RadioGroupFiltrarPor.ItemIndex.ToString);

  Action := caFree;

end;

procedure TFrmConsEstoque.FormCreate(Sender: TObject);
begin

  Self.FPersistencia := TPersistencia.Create(DataModuleConexao.Conexao);

end;

procedure TFrmConsEstoque.FormDestroy(Sender: TObject);
begin

  Self.FPersistencia.Destroy;

  FrmConsEstoque := nil;

end;

procedure TFrmConsEstoque.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_ESCAPE) then
  begin

    BtnSairClick(Sender);

  end;

end;

procedure TFrmConsEstoque.FormShow(Sender: TObject);
begin

  ComboBoxTipoCons.ItemIndex := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'IndexCombobox',
    'FrmConsEstoque.ComboBoxTipoCons', '0').ToInteger;

  RadioGroupFiltrarPor.ItemIndex := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup',
    'FrmConsEstoque.RadioGroupFiltrarPor', '0').ToInteger;

  EdtConsInvokeSearch(Sender);

end;

class function TFrmConsEstoque.getConsEstoque(const pFOREIGNFORMKEY: Smallint; const pCOD_USU: Integer): Boolean;
begin

  try

    if (FrmConsEstoque = nil) then
    begin

      Application.CreateForm(TFrmConsEstoque, FrmConsEstoque);

    end;

    FrmConsEstoque.FForeignFormKey := pFOREIGNFORMKEY;

    FrmConsEstoque.FCodUsu := pCOD_USU;

    FrmConsEstoque.WindowState := wsNormal;
    FrmConsEstoque.BringToFront;
    FrmConsEstoque.Show;

    Result := True;

  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create(Format(TMensagem.getMensagem(0), ['de consulta de estoque', E.Message]));
    end;
  end;

end;

end.
