unit URlRelSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Datasnap.DBClient, Data.DB, UClassRelSaida,
  UClassPersistencia;

type
  TFrmRlRelSaida = class(TForm)
    RLReport: TRLReport;
    RLBandHeader: TRLBand;
    RLLabel: TRLLabel;
    RLBandTitle: TRLBand;
    RLLabelDataSaida: TRLLabel;
    RLPanel1: TRLPanel;
    RLLabelNumeroBolsa: TRLLabel;
    RLPanel2: TRLPanel;
    RLLabelOrigem: TRLLabel;
    RLPanel3: TRLPanel;
    RLLabelTipo: TRLLabel;
    RLPanel4: TRLPanel;
    RLLabelVolume: TRLLabel;
    RLPanel5: TRLPanel;
    RLLabelAboRh: TRLLabel;
    RLPanel6: TRLPanel;
    RLLabel1: TRLLabel;
    RLBand1: TRLBand;
    RLDBTextDataSaida: TRLDBText;
    RLDBTextNumeroBolsa: TRLDBText;
    RLDBTextOrigem: TRLDBText;
    RLDBTextTipo: TRLDBText;
    RLDBTextVolume: TRLDBText;
    RLDBTextAboRh: TRLDBText;
    RLDBTextObservacao: TRLDBText;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel9: TRLPanel;
    RLPanel10: TRLPanel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    DataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    FForeignFormKey: SmallInt;
    FCodUsu: Integer;
    FRelSaida: TRelSaida;
    FPersistencia: TPersistencia;
    FClientDataSet: TClientDataSet;

    function PreparaRelatorio: Boolean;

  public
    class function getRlRelSaida(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer;
      const pRELSAIDA: TRelSaida): Boolean;
  end;

var
  FrmRlRelSaida: TFrmRlRelSaida;

implementation

uses UClassMensagem, UDMConexao, UClassRelSaidaDAO;

{$R *.dfm}
{ TFrmRlRelSaida }

procedure TFrmRlRelSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Self.FClientDataSet.Close;
  Self.FClientDataSet.Active := False;

  DataSource.DataSet := nil;

end;

procedure TFrmRlRelSaida.FormCreate(Sender: TObject);
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

procedure TFrmRlRelSaida.FormDestroy(Sender: TObject);
begin

  Self.FPersistencia.Destroy;


  Self.FClientDataSet.Destroy;

end;

class function TFrmRlRelSaida.getRlRelSaida(const pFOREIGNFORMKEY: SmallInt;
  const pCOD_USU: Integer; const pRELSAIDA: TRelSaida): Boolean;
begin

  Application.CreateForm(TFrmRlRelSaida, FrmRlRelSaida);
  try

    try

      FrmRlRelSaida.FForeignFormKey := pFOREIGNFORMKEY;
      FrmRlRelSaida.FCodUsu := pCOD_USU;
      FrmRlRelSaida.FRelSaida := pRELSAIDA;

      if (FrmRlRelSaida.PreparaRelatorio) then
      begin

        if (pRELSAIDA.Visualizar) then
        begin

          Result := FrmRlRelSaida.RLReport.PreviewModal;

        end
        else
        begin

          FrmRlRelSaida.RLReport.Print;
          Result := True;

        end;

      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de relat�rio de sa�da', E.Message]));
      end;
    end;

  finally
    FreeAndNil(FrmRlRelSaida);
  end;

end;

function TFrmRlRelSaida.PreparaRelatorio: Boolean;
var
  lRelSaidaDAO: TRelSaidaDAO;
begin

  lRelSaidaDAO := TRelSaidaDAO.Create(DataModuleConexao.Conexao);
  try

    try

      if(lRelSaidaDAO.getRelatorio(Self.FPersistencia, Self.FRelSaida))then
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
        raise Exception.Create(Format(TMensagem.getMensagem(1), ['entradas para gerar o relat�rio', E.Message]));
      end;
    end;

  finally
    lRelSaidaDAO.Destroy;
  end;

end;

end.
