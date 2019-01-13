unit URlRelDescarte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Datasnap.DBClient, Data.DB, UClassPersistencia, RLFilters,
  RLPDFFilter, UClassRelDescarte;

type
  TFrmRlRelDescarte = class(TForm)
    RLReport: TRLReport;
    RLBandHeader: TRLBand;
    RLLabel: TRLLabel;
    RLBandTitle: TRLBand;
    RLLabelDataColeta: TRLLabel;
    RLPanel1: TRLPanel;
    RLLabelNumeroBolsa: TRLLabel;
    RLPanel2: TRLPanel;
    RLLabelTipo: TRLLabel;
    RLPanel4: TRLPanel;
    RLLabelVolume: TRLLabel;
    RLPanel5: TRLPanel;
    RLLabelAboRh: TRLLabel;
    RLPanel6: TRLPanel;
    DataSource: TDataSource;
    RLBand1: TRLBand;
    RLDBTextDataDescarte: TRLDBText;
    RLDBTextNumeroBolsa: TRLDBText;
    RLDBTextTipo: TRLDBText;
    RLDBTextVolume: TRLDBText;
    RLDBTextAboRh: TRLDBText;
    RLPanel13: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel16: TRLPanel;
    RLPanel17: TRLPanel;
    RLPanel18: TRLPanel;
    RLBand2: TRLBand;
    RLLabelTotalDescartes: TRLLabel;
    RLDBResultTotalDescartes: TRLDBResult;
    RLPDFFilter: TRLPDFFilter;
    RLLabelResponsavel: TRLLabel;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    RLDBText1: TRLDBText;
    RLPanel9: TRLPanel;
    RLPanel10: TRLPanel;
    RLLabel2: TRLLabel;
    RLPanel26: TRLPanel;
    RLLabel8: TRLLabel;
    RLPanel27: TRLPanel;
    RLDBText7: TRLDBText;
    RLPanel15: TRLPanel;
    RLPanel3: TRLPanel;
    RLLabel10: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel5: TRLLabel;
    RLPanel32: TRLPanel;
    RLLabelProcedimentos: TRLLabel;
    RLPanel33: TRLPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

    FForeignFormKey: SmallInt;
    FCodUsu: Integer;
    FRelDescarte: TRelDescarte;
    FPersistencia: TPersistencia;
    FClientDataSet: TClientDataSet;

    function PreparaRelatorio: Boolean;

  public
    class function getRlRelDescarte(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer;
      const pRELDESCARTE: TRelDescarte): Boolean;
  end;

var
  FrmRlRelDescarte: TFrmRlRelDescarte;

implementation

uses UClassMensagem, UDMConexao, UClassRelDescarteDAO;

{$R *.dfm}
{ TFrmRelDescarte }

procedure TFrmRlRelDescarte.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Self.FClientDataSet.Close;
  Self.FClientDataSet.Active := False;

  DataSource.DataSet := nil;

end;

procedure TFrmRlRelDescarte.FormCreate(Sender: TObject);
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

procedure TFrmRlRelDescarte.FormDestroy(Sender: TObject);
begin

  Self.FPersistencia.Destroy;
  Self.FClientDataSet.Destroy;

end;

class function TFrmRlRelDescarte.getRlRelDescarte(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer;
  const pRELDESCARTE: TRelDescarte): Boolean;
begin

  Application.CreateForm(TFrmRlRelDescarte, FrmRlRelDescarte);
  try

    try

      FrmRlRelDescarte.FForeignFormKey := pFOREIGNFORMKEY;
      FrmRlRelDescarte.FCodUsu := pCOD_USU;
      FrmRlRelDescarte.FRelDescarte := pRELDESCARTE;

      Result := False;

      if (FrmRlRelDescarte.PreparaRelatorio) then
      begin

        if (pRELDESCARTE.Visualizar) then
        begin

          Result := FrmRlRelDescarte.RLReport.PreviewModal;

        end
        else
        begin

          FrmRlRelDescarte.RLReport.Print;
          Result := True;

        end;

      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de relat�rio de descarte', E.Message]));
      end;
    end;

  finally
    FreeAndNil(FrmRlRelDescarte);
  end;

end;

function TFrmRlRelDescarte.PreparaRelatorio: Boolean;
var
  lRelDescarteDAO: TRelDescarteDAO;
begin

  lRelDescarteDAO := TRelDescarteDAO.Create(DataModuleConexao.Conexao);
  try

    try

      if (lRelDescarteDAO.getRelatorio(Self.FPersistencia, Self.FRelDescarte)) then
      begin

        Result := not Self.FPersistencia.Query.IsEmpty;

        if (Result) then
        begin

          // Usa o ClientDataSet pra n�o dar erro com o TSQLQuery qnd for gerar o relat�rio.
          DataSource.DataSet := Self.FPersistencia.Query;

        end
        else
        begin

          MessageBox(Self.Handle, 'N�o h� registros na sua busca', 'Aviso', mb_Ok);

        end;

      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(1), ['descartes para gerar o relat�rio', E.Message]));
      end;
    end;

  finally
    lRelDescarteDAO.Destroy;
  end;

end;

procedure TFrmRlRelDescarte.RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  lTexto: string;
begin

  if (Self.FPersistencia.Query.FieldByName('irradiada').AsString = 'S') then
  begin
    lTexto := lTexto + 'I';
  end;

  if (Self.FPersistencia.Query.FieldByName('filtrada').AsString = 'S') then
  begin

    if (lTexto.Trim.IsEmpty) then
    begin
      lTexto := lTexto + 'FI';
    end
    else
    begin
      lTexto := lTexto + ',FI';
    end;

  end;

  if (Self.FPersistencia.Query.FieldByName('fracionada').AsString = 'S') then
  begin

    if (lTexto.Trim.IsEmpty) then
    begin
      lTexto := lTexto + 'FR';
    end
    else
    begin
      lTexto := lTexto + ',FR';
    end;

  end;

  if (Self.FPersistencia.Query.FieldByName('fenotipada').AsString = 'S') then
  begin

    if (lTexto.Trim.IsEmpty) then
    begin
      lTexto := lTexto + 'FE';
    end
    else
    begin
      lTexto := lTexto + ',FE';
    end;

  end;

  if (lTexto.Trim.IsEmpty) then
  begin
    lTexto := 'NH';
  end;

  RLLabelProcedimentos.Caption := lTexto;

end;

procedure TFrmRlRelDescarte.RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin

  SelectedFilter := RLPDFFilter;

end;

end.
