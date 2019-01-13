unit UConsSaidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UConsGenerico, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UClassPersistencia, Vcl.ComCtrls;

type
  TFrmConsSaidas = class(TFrmCons)
    DataSource: TDataSource;
    BtnLocalizar: TSpeedButton;
    EdtDataFinal: TDateTimePicker;
    EdtDataIni: TDateTimePicker;
    LabelAte: TLabel;
    LabelDe: TLabel;
    procedure EdtConsInvokeSearch(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxTipoConsChange(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure EdtDataFinalExit(Sender: TObject);
  private
    FForeignFormKey: SmallInt;
    FIdUsuario: Integer;

    function getAdmin: Boolean;
  public
    class function getConsSaida(const pFOREIGNFORMKEY: SmallInt; const pID_USUARIO: Integer): Boolean;
  end;

var
  FrmConsSaidas: TFrmConsSaidas;

implementation

{$R *.dfm}

uses UClassMensagem, UClassUsuarioDao, UDMConexao, UClassSaidaDao, UClassBiblioteca, USaida, UClassForeignKeyForms;
{ TFrmConsSaidas }

procedure TFrmConsSaidas.BtnAlterarClick(Sender: TObject);
var
  lPosicaoQuery: Integer;
begin
  inherited;

  if (not Self.FPersistencia.Query.IsEmpty) then
  begin
    TFrmSaida.getSaida(TForeignKeyForms.FIdUConsEntrada, Self.FIdUsuario, Self.FPersistencia.Query.FieldByName('id')
      .AsInteger);

    lPosicaoQuery := Self.FPersistencia.Query.RecNo;

    EdtConsInvokeSearch(Self);

    Self.FPersistencia.Query.RecNo := lPosicaoQuery;
  end;

end;

procedure TFrmConsSaidas.BtnExcluirClick(Sender: TObject);
var
  lSaidaDao: TSaidaDAO;
  lPosicaoQuery: Integer;
begin
  inherited;

  if (not Self.FPersistencia.Query.IsEmpty) then
  begin

    if (Self.getAdmin) then
    begin

      if (Application.MessageBox(PChar(Format(TMensagem.getMensagem(9), ['sa�da'])), PChar('Cuidado'),
        MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin

        lSaidaDao := TSaidaDAO.Create(DataModuleConexao.Conexao);
        try

          try

            if (lSaidaDao.excluir(Self.FPersistencia.Query.FieldByName('id').AsInteger)) then
            begin
              lPosicaoQuery := Self.FPersistencia.Query.RecNo;

              EdtConsInvokeSearch(Self);

              Self.FPersistencia.Query.RecNo := lPosicaoQuery - 1;
            end;

          except
            on E: Exception do
            begin
              Application.MessageBox(PChar(Format(TMensagem.getMensagem(2), ['sa�da', E.Message])), '1',
                MB_OK + MB_ICONSTOP);
            end;
          end;

        finally
          lSaidaDao.Destroy;
        end;

      end;

    end
    else
    begin
      Application.MessageBox(PChar(TMensagem.getMensagem(12)), PChar('Aviso'), MB_OK + MB_ICONINFORMATION);
    end;

  end;

end;

procedure TFrmConsSaidas.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  EdtConsInvokeSearch(Self);
end;

procedure TFrmConsSaidas.BtnNovoClick(Sender: TObject);
begin
  inherited;
  TFrmSaida.getSaida(TForeignKeyForms.FIdUConsSaida, Self.FIdUsuario);
  EdtConsInvokeSearch(Self);
end;

procedure TFrmConsSaidas.ComboBoxTipoConsChange(Sender: TObject);
begin
  inherited;

  case (ComboBoxTipoCons.ItemIndex) of
    0: // N�mero da bolsa
      begin
        BtnLocalizar.Visible := False;
        EdtCons.NumbersOnly := True;
        EdtCons.MaxLength := 20;
        EdtCons.Visible := True;
        EdtDataIni.Visible := False;
        EdtDataFinal.Visible := False;
      end;

    1: // Ordem
      begin
        BtnLocalizar.Visible := False;
        EdtCons.NumbersOnly := True;
        EdtCons.MaxLength := 11;
        EdtCons.Visible := True;
        EdtDataIni.Visible := False;
        EdtDataFinal.Visible := False;
      end;

    2: // Paciente
      begin
        BtnLocalizar.Visible := False;
        EdtCons.NumbersOnly := False;
        EdtCons.MaxLength := 100;
        EdtCons.Visible := True;
        EdtDataIni.Visible := False;
        EdtDataFinal.Visible := False;
      end;

    3: // Per�odo
      begin
        BtnLocalizar.Visible := True;
        EdtCons.Visible := False;
        EdtDataIni.Visible := True;
        EdtDataFinal.Visible := True;
        EdtDataIni.Date := TBiblioteca.getPrimeiroDiaMes(now);
        EdtDataFinal.Date := TBiblioteca.getUltimoDiaMes(now);
      end;
  end;

end;

procedure TFrmConsSaidas.DBGridDblClick(Sender: TObject);
begin
  inherited;
  BtnAlterarClick(Self);
end;

procedure TFrmConsSaidas.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case (Key) of
    VK_RETURN:
      begin
        DBGridDblClick(Self);
      end;

    VK_DELETE:
      begin
        BtnExcluirClick(Self);
      end;

  end;

end;

procedure TFrmConsSaidas.EdtConsInvokeSearch(Sender: TObject);
var
  lSaidaDao: TSaidaDAO;
begin
  inherited;

  lSaidaDao := TSaidaDAO.Create(DataModuleConexao.Conexao);
  try

    try

      if (lSaidaDao.getConsulta(EdtCons.Text, EdtDataIni.Date, EdtDataFinal.Date, ComboBoxTipoCons.ItemIndex,
        Self.FPersistencia)) then
      begin

        Self.FPersistencia.Query.Last;
        DataSource.DataSet := Self.FPersistencia.Query;
        if (not Self.FPersistencia.Query.IsEmpty) then
        begin
          DBGrid.SetFocus;
        end
        else
        begin
          if (EdtCons.CanFocus) then
          begin
            EdtCons.SetFocus;
            BtnLocalizar.Visible := False;
          end
          else
          begin
            EdtDataIni.SetFocus;
            BtnLocalizar.Visible := True;
          end;
        end

      end;

    except
      on E: Exception do
      begin
        Application.MessageBox(PChar(Format(TMensagem.getMensagem(1), ['sa�das(s)', E.Message])), PChar('Erro'),
          MB_OK + MB_ICONERROR);
      end;
    end;

  finally
    lSaidaDao.Destroy;
  end;

end;

procedure TFrmConsSaidas.EdtDataFinalExit(Sender: TObject);
begin
  inherited;

  if (GetKeyState(VK_RETURN) < 0) then
  begin
    BtnLocalizarClick(Self);
  end;

end;

procedure TFrmConsSaidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'IndexCombobox', 'FrmConsSaidas.ComboBoxTipoCons',
    ComboBoxTipoCons.ItemIndex.ToString);
end;

procedure TFrmConsSaidas.FormShow(Sender: TObject);
begin
  inherited;
  ComboBoxTipoCons.ItemIndex := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'IndexCombobox',
    'FrmConsSaidas.ComboBoxTipoCons', '0').ToInteger;
  ComboBoxTipoConsChange(Self);

  EdtConsInvokeSearch(Self);

  if (EdtCons.CanFocus) then
  begin
    EdtCons.SetFocus
  end
  else
  begin
    EdtDataIni.SetFocus;
  end;

end;

function TFrmConsSaidas.getAdmin: Boolean;
var
  lUsuaioDao: TUsuarioDAO;
begin

  lUsuaioDao := TUsuarioDAO.Create(DataModuleConexao.Conexao);
  try

    try
      Result := lUsuaioDao.getAdmin(Self.FIdUsuario);
    except
      on E: Exception do
      begin
        Result := True;
        Application.MessageBox(PChar(Format(TMensagem.getMensagem(12), ['informa��o do usu�rio', E.Message])),
          PChar('Erro'), MB_OK + MB_ICONERROR);
      end;
    end;

  finally
    lUsuaioDao.Destroy;
  end;

end;

class function TFrmConsSaidas.getConsSaida(const pFOREIGNFORMKEY: SmallInt; const pID_USUARIO: Integer): Boolean;
begin

  Application.CreateForm(TFrmConsSaidas, FrmConsSaidas);
  try

    try

      FrmConsSaidas.FForeignFormKey := pFOREIGNFORMKEY;
      FrmConsSaidas.FIdUsuario := pID_USUARIO;

      Result := FrmConsSaidas.ShowModal = mrOk;

    except
      on E: Exception do
      begin
        Result := False;
        Application.MessageBox(PChar(Format(TMensagem.getMensagem(0), [FrmConsSaidas.Caption, E.Message])), 'Erro',
          MB_ICONERROR + MB_OK);
      end;
    end;

  finally
    FreeAndNil(FrmConsSaidas);
  end;

end;

end.
