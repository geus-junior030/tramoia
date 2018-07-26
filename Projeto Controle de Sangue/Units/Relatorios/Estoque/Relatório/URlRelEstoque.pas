unit URlRelEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Datasnap.DBClient, Data.DB, UClassRelEstoque,
  UClassPersistencia;

type
  TFrmRlRelEstoque = class(TForm)
    DataSource: TDataSource;
    RLReport: TRLReport;
    RLBandHeader: TRLBand;
    RLLabel: TRLLabel;
    RLBandTitle: TRLBand;
    RLLabelQuantidade: TRLLabel;
    RLPanel1: TRLPanel;
    RLLabelVolume: TRLLabel;
    RLPanel2: TRLPanel;
    RLLabelABO: TRLLabel;
    RLPanel3: TRLPanel;
    RLLabelTipo: TRLLabel;
    RLPanel4: TRLPanel;
    RLLabelSorologia: TRLLabel;
    RLBand1: TRLBand;
    RLDBTextQuantidade: TRLDBText;
    RLDBTextVolume: TRLDBText;
    RLDBTextABO: TRLDBText;
    RLDBTextTipo: TRLDBText;
    RLDBTextSorologia: TRLDBText;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel9: TRLPanel;
    RLPanel10: TRLPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    FForeignFormKey: SmallInt;
    FCodUsu: Integer;
    FRelEstoque: TRelEstoque;
    FPersistencia: TPersistencia;
    FClientDataSet: TClientDataSet;

    function PreparaRelatorio: Boolean;

  public
    class function getRlRelEstoque(const pFOREIGNFORMKEY: SmallInt;
      const pCOD_USU: Integer; const pRELESTOQUE: TRelEstoque): Boolean; static;

  end;

var
  FrmRlRelEstoque: TFrmRlRelEstoque;

implementation

uses UClassMensagem, UDMConexao, UClassRelEstoqueDAO;

{$R *.dfm}

{ TFrmRlRelEstoque }

procedure TFrmRlRelEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Self.FClientDataSet.Close;
  Self.FClientDataSet.Active := False;

  DataSource.DataSet := nil;

end;

procedure TFrmRlRelEstoque.FormCreate(Sender: TObject);
begin

  Self.FPersistencia := TPersistencia.Create(DataModuleConexao.Conexao);

  Self.FClientDataSet := TClientDataSet.Create(nil);
  Self.FClientDataSet.Aggregates.Clear;
  Self.FClientDataSet.Params.Clear;
  Self.FClientDataSet.AggregatesActive := False;
  Self.FClientDataSet.AutoCalcFields := True;
  Self.FClientDataSet.FetchOnDemand := True;
  Self.FClientDataSet.ObjectView := True;

end;

procedure TFrmRlRelEstoque.FormDestroy(Sender: TObject);
begin

  Self.FPersistencia.Destroy;
  Self.FClientDataSet.Destroy;

end;

class function TFrmRlRelEstoque.getRlRelEstoque(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer;
  const pRELESTOQUE: TRelEstoque): Boolean;
begin

  Application.CreateForm(TFrmRlRelEstoque, FrmRlRelEstoque);
  try

    try

      FrmRlRelEstoque.FForeignFormKey := pFOREIGNFORMKEY;
      FrmRlRelEstoque.FCodUsu := pCOD_USU;
      FrmRlRelEstoque.FRelEstoque := pRELESTOQUE;

      Result := False;

      if (FrmRlRelEstoque.PreparaRelatorio) then
      begin

        if (pRELESTOQUE.Visualizar) then
        begin

          Result := FrmRlRelEstoque.RLReport.PreviewModal;

        end
        else
        begin

          FrmRlRelEstoque.RLReport.Print;
          Result := True;

        end;

      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de relat�rio de estoque', E.Message]));
      end;
    end;

  finally
    FreeAndNil(FrmRlRelEstoque);
  end;

end;

function TFrmRlRelEstoque.PreparaRelatorio: Boolean;
var
  lRelEstoqueDAO: TRelEstoqueDAO;
begin

  lRelEstoqueDAO := TRelEstoqueDAO.Create(DataModuleConexao.Conexao);
  try

    try

      if(lRelEstoqueDAO.getRelatorio(Self.FPersistencia, Self.FRelEstoque))then
      begin

        Result := not Self.FPersistencia.Query.IsEmpty;

        if (Result) then
        begin

          // Usa o ClientDataSet pra n�o dar erro com o TSQLQuery qnd for gerar o relat�rio.
          Self.FClientDataSet.SetProvider(Self.FPersistencia.DataSetProvider);
          Self.FClientDataSet.Open;
          Self.FClientDataSet.Active := True;

          DataSource.DataSet := Self.FClientDataSet;

        end;

      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(1), ['estoque para gerar o relat�rio', E.Message]));
      end;
    end;

  finally
    lRelEstoqueDAO.Destroy;
  end;

end;

end.
