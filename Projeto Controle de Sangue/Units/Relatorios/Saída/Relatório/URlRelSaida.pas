unit URlRelSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Datasnap.DBClient, Data.DB, UClassRelSaida,
  UClassPersistencia, RLFilters, RLPDFFilter;

type
  TFrmRlRelSaida = class(TForm)
    RLReport: TRLReport;
    RLBandHeader: TRLBand;
    RLLabel: TRLLabel;
    RLBandTitle: TRLBand;
    RLLabelDataSaida: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel3: TRLPanel;
    RLLabelPacienteABO: TRLLabel;
    RLBand1: TRLBand;
    RLDBTextDataSaida: TRLDBText;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel9: TRLPanel;
    RLPanel10: TRLPanel;
    RLPanel12: TRLPanel;
    DataSource: TDataSource;
    RLLabelOrdem: TRLLabel;
    RLPanel13: TRLPanel;
    RLPanel14: TRLPanel;
    RLDBTextOrdem: TRLDBText;
    RLLabelPaciente: TRLLabel;
    RLDBTextPacienteNome: TRLDBText;
    RLLabelPacienteNome: TRLLabel;
    RLPanel15: TRLPanel;
    RLLabelBolsa: TRLLabel;
    RLLabelBolsaNumero: TRLLabel;
    RLPanel4: TRLPanel;
    RLLabelBolsaTipo: TRLLabel;
    RLPanel16: TRLPanel;
    RLLabelBolsaVolume: TRLLabel;
    RLPanel17: TRLPanel;
    RLLabelCompatibilidade: TRLLabel;
    RLLabelCompatibilidadeTA: TRLLabel;
    RLLabelCompatibilidadeAGH: TRLLabel;
    RLLabelCompatibilidade37: TRLLabel;
    RLPanel19: TRLPanel;
    RLPanel20: TRLPanel;
    RLPanel5: TRLPanel;
    RLDBTextPacienteABO: TRLDBText;
    RLDBTextBolsaNumero: TRLDBText;
    RLDBTextBolsaTipo: TRLDBText;
    RLDBTextBolsaABO: TRLDBText;
    RLDBTextBolsaVolume: TRLDBText;
    RLDBTextCompatibilidadeTA: TRLDBText;
    RLDBTextCompatibilidadeAGH: TRLDBText;
    RLDBTextCompatibilidade37: TRLDBText;
    RLLabelHospital: TRLLabel;
    RLPanel22: TRLPanel;
    RLPanel23: TRLPanel;
    RLDBTextHospital: TRLDBText;
    RLPanel24: TRLPanel;
    RLPanel26: TRLPanel;
    RLBand2: TRLBand;
    RLLabelTotalSaidas: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLPDFFilter: TRLPDFFilter;
    RLLabelResponsavel: TRLLabel;
    RLPanel21: TRLPanel;
    RLDBTextResponsavel: TRLDBText;
    RLPanel25: TRLPanel;
    RLPanel2: TRLPanel;
    RLPanel28: TRLPanel;
    RLPanel27: TRLPanel;
    RLLabel1: TRLLabel;
    RLDBTextNumeroProntuario: TRLDBText;
    RLPanel29: TRLPanel;
    RLPanel30: TRLPanel;
    RLLabelPai: TRLLabel;
    RLPanel6: TRLPanel;
    RLDBTextPai: TRLDBText;
    RLPanel31: TRLPanel;
    RLPanel18: TRLPanel;
    RLPanel11: TRLPanel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLPanel32: TRLPanel;
    RLPanel33: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabelProcedimentos: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

    FForeignFormKey: SmallInt;
    FCodUsu: Integer;
    FRelSaida: TRelSaida;
    FPersistencia: TPersistencia;

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

  DataSource.DataSet := nil;

end;

procedure TFrmRlRelSaida.FormCreate(Sender: TObject);
begin

  Self.FPersistencia := TPersistencia.Create(DataModuleConexao.Conexao);

end;

procedure TFrmRlRelSaida.FormDestroy(Sender: TObject);
begin

  Self.FPersistencia.Destroy;

end;

class function TFrmRlRelSaida.getRlRelSaida(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer;
  const pRELSAIDA: TRelSaida): Boolean;
begin

  Application.CreateForm(TFrmRlRelSaida, FrmRlRelSaida);
  try

    try

      FrmRlRelSaida.FForeignFormKey := pFOREIGNFORMKEY;
      FrmRlRelSaida.FCodUsu := pCOD_USU;
      FrmRlRelSaida.FRelSaida := pRELSAIDA;

      Result := False;

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

      if (lRelSaidaDAO.getRelatorio(Self.FPersistencia, Self.FRelSaida)) then
      begin

        Result := not Self.FPersistencia.Query.IsEmpty;

        if (Result) then
        begin

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
        raise Exception.Create(Format(TMensagem.getMensagem(1), ['sa�das para gerar o relat�rio', E.Message]));
      end;
    end;

  finally
    lRelSaidaDAO.Destroy;
  end;

end;

procedure TFrmRlRelSaida.RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
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

procedure TFrmRlRelSaida.RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin

  SelectedFilter := RLPDFFilter;

end;

end.
