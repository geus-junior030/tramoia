unit UDescarte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmDescarte = class(TForm)
    PanelBottom: TPanel;
    BtnGravar: TBitBtn;
    BtnSair: TBitBtn;
    BtnNovo: TBitBtn;
    PanelClient: TPanel;
    LabelId: TLabel;
    LabelData: TLabel;
    LabelResponsavel: TLabel;
    GroupBoxSangue: TGroupBox;
    LabelVolume: TLabel;
    LabelAboSangue: TLabel;
    LabelNumeroBolsa: TLabel;
    LabelTipo: TLabel;
    Label2: TLabel;
    EdtAboBolsa: TEdit;
    EdtNumeroBolsa: TEdit;
    EdtTipo: TEdit;
    EdtVolume: TEdit;
    EdtId: TEdit;
    EdtDataDescarte: TDateTimePicker;
    ComboBoxResponsavel: TComboBox;
    LabelHospital: TLabel;
    GroupBox1: TGroupBox;
    RadioGroupIrradiada: TRadioGroup;
    RadioGroupFiltrada: TRadioGroup;
    RadioGroupFracionada: TRadioGroup;
    RadioGroupFenotipada: TRadioGroup;
    EdtMotivoDescarte: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtNumeroBolsaExit(Sender: TObject);
    procedure EdtVolumeExit(Sender: TObject);
  private
    FForeignFormKey: SmallInt;
    FIdUsuario: Integer;

    FId: Integer;
    FIdBolsa: Integer;
    FNumBolsa: string;

    procedure CarregaUsuarios;

    function getObjeto: Boolean;

    procedure setIndexByIdUsuario(const pIDUSUARIO: Integer);

    procedure CarregaDadosBolsa(const pID_BOLSA: Integer);
  public
    class function getDescarte(const pFOREIGNFORMKEY: SmallInt; const pID_USUARIO: Integer;
      const pID: Integer = -1): Boolean;

  end;

var
  FrmDescarte: TFrmDescarte;

implementation

{$R *.dfm}
{ TForm2 }

uses System.Generics.Collections, UClassUsuario, UClassUsuarioDao, UDMConexao, UClassBiblioteca, UClassMensagem,
  UClassSaida, UClassSaidaDao, UClassBolsaDao, UClassBolsa, System.Math, UClassDescarte, UClassDescarteDao, USelBolsa,
  UClassForeignKeyForms;

procedure TFrmDescarte.BtnGravarClick(Sender: TObject);
var
  lDescarte: TDescarte;
  lDescarteDao: TDescarteDAO;
begin

  lDescarte := TDescarte.Create;
  try

    lDescarte.Id := Self.FId;
    lDescarte.Id_Bolsa := Self.FIdBolsa;
    lDescarte.Id_Usuario := TBiblioteca.getIdUsuarioOnString(ComboBoxResponsavel.Items[ComboBoxResponsavel.ItemIndex]);
    lDescarte.Data_Coleta := now;
    lDescarte.Motivo := EdtMotivoDescarte.Text;
    lDescarte.Volume := StrToInt(EdtVolume.Text);
    lDescarte.Data_Descarte := EdtDataDescarte.Date;

    lDescarteDao := TDescarteDAO.Create(DataModuleConexao.Conexao);
    try

      try

        if (lDescarteDao.Salvar(lDescarte)) then
        begin
          EdtId.Text := lDescarte.Id.ToString;

          TBiblioteca.AtivaDesativaCompontes(Self, False);

          Application.MessageBox(PChar(TMensagem.getMensagem(28)), 'Informa��o', MB_ICONINFORMATION + MB_OK);

          BtnGravar.Enabled := False;

          TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'Descarte', 'FrmDescarte.EdtMotivoDescarte',
            Trim(EdtMotivoDescarte.Text));

          BtnNovo.SetFocus;
        end;

      except
        on E: Exception do
        begin
          Application.MessageBox(pWideChar(Format(TMensagem.getMensagem(4), ['retirada de sangue', E.Message])),
            'Aviso', MB_ICONWARNING + MB_OK);
        end;
      end;

    finally
      lDescarteDao.Destroy;
    end;

  finally
    lDescarte.Destroy;
  end;

end;

procedure TFrmDescarte.BtnNovoClick(Sender: TObject);
begin
  TBiblioteca.AtivaDesativaCompontes(Self, true);

  EdtId.Enabled := False;
  EdtAboBolsa.Enabled := False;
  EdtTipo.Enabled := False;
  EdtVolume.Enabled := False;
  EdtId.Clear;
  EdtDataDescarte.Date := now;
  EdtNumeroBolsa.Clear;
  EdtAboBolsa.Clear;
  EdtTipo.Clear;
  EdtVolume.Clear;
  RadioGroupIrradiada.ItemIndex := 1;
  RadioGroupFiltrada.ItemIndex := 1;
  RadioGroupFracionada.ItemIndex := 1;
  RadioGroupFenotipada.ItemIndex := 1;
  EdtMotivoDescarte.Clear;
  ComboBoxResponsavel.SetFocus;

  EdtMotivoDescarte.Text := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'Descarte',
    'FrmDescarte.EdtMotivoDescarte', '');

  BtnGravar.Enabled := true;

  Self.FId := -1;
  Self.FIdBolsa := -1;
  Self.FNumBolsa := '-1';
end;

procedure TFrmDescarte.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDescarte.CarregaDadosBolsa(const pID_BOLSA: Integer);
var
  lBolsa: TBolsa;
  lBolsaDao: TBolsaDAO;
begin

  lBolsa := TBolsa.Create;
  try

    lBolsaDao := TBolsaDAO.Create(DataModuleConexao.Conexao);
    try

      try

        if (lBolsaDao.getObjeto(pID_BOLSA, lBolsa)) then
        begin

          EdtNumeroBolsa.Text := lBolsa.NumeroBolsa;
          Self.FNumBolsa := lBolsa.NumeroBolsa;
          EdtTipo.Text := lBolsa.Tipo;
          EdtVolume.Text := lBolsa.VolumeAtual.ToString;
          EdtAboBolsa.Text := lBolsa.Abo + lBolsa.Rh;
          RadioGroupIrradiada.ItemIndex := IfThen(lBolsa.Irradiada = 'S', 0, 1);
          RadioGroupFiltrada.ItemIndex := IfThen(lBolsa.Filtrada = 'S', 0, 1);
          RadioGroupFracionada.ItemIndex := IfThen(lBolsa.Fracionada = 'S', 0, 1);
          RadioGroupFenotipada.ItemIndex := IfThen(lBolsa.Fenotipada = 'S', 0, 1);
        end;

      except
        on E: Exception do
        begin
          raise Exception.Create(Format(TMensagem.getMensagem(5), ['Dados da bolsa', E.Message]));
        end;
      end;

    finally
      lBolsaDao.Destroy;
    end;

  finally
    lBolsa.Destroy;
  end;

end;

procedure TFrmDescarte.CarregaUsuarios;
var
  lListaUsuario: TObjectList<TUsuario>;
  lUsuarioDAO: TUsuarioDAO;
  lCount: Integer;
begin
  ComboBoxResponsavel.Clear;

  lListaUsuario := TObjectList<TUsuario>.Create();
  try

    lUsuarioDAO := TUsuarioDAO.Create(DataModuleConexao.Conexao);
    try

      if (lUsuarioDAO.getListaObjeto(lListaUsuario)) then
      begin

        for lCount := 0 to lListaUsuario.Count - 1 do
        begin
          ComboBoxResponsavel.Items.Add(lListaUsuario.Items[lCount].Id.ToString + ' - ' + lListaUsuario.Items
            [lCount].Nome);
        end;

      end
      else
      begin
        Application.MessageBox('N�o h� usu�rios cadastrados. Cadastre antes de efetuar uma sa�da.', 'Aviso',
          MB_ICONWARNING + MB_OK);
      end;

    finally
      lUsuarioDAO.Destroy;
    end;

  finally
    lListaUsuario.Free;
  end;
end;

procedure TFrmDescarte.EdtNumeroBolsaExit(Sender: TObject);
var
  lBolsaDao: TBolsaDAO;
  lVerificaNumBolsa: Boolean;
begin

  if (not Trim(EdtNumeroBolsa.Text).IsEmpty) then
  begin

    if (Self.FId > 0) then
    begin
      lVerificaNumBolsa := ((Trim(Self.FNumBolsa) <> (EdtNumeroBolsa.Text)))
    end
    else
    begin
      lVerificaNumBolsa := true;
    end;

    if (lVerificaNumBolsa) then
    begin

      if (not TFrmSelBolsa.getSelBolsa(TForeignKeyForms.FIdUSaida, Self.FIdUsuario, Trim(EdtNumeroBolsa.Text),
        Self.FIdBolsa)) then
      begin
        EdtNumeroBolsa.SetFocus;
        Exit;
      end;

      if (Self.FIdBolsa > 0) then
      begin

        lBolsaDao := TBolsaDAO.Create(DataModuleConexao.Conexao);
        try

          try

            if (lBolsaDao.getPermiteMovimentacao(Self.FIdBolsa)) then
            begin

              Self.CarregaDadosBolsa(Self.FIdBolsa);
              EdtVolume.Enabled := true;
              EdtVolume.SetFocus;

            end
            else
            begin

              Self.FIdBolsa := -1;
              Application.MessageBox('Bolsa j� vinculado a uma sa�da', 'Aviso', MB_ICONWARNING + MB_OK);
              EdtNumeroBolsa.SetFocus;

            end;

          except
            on E: Exception do
            begin
              raise Exception.Create('Erro ao verificar se o n�mero da bolsa j� esta vinculado a uma sa�da. Motivo ' +
                E.Message);
              Self.FIdBolsa := -1;
              EdtNumeroBolsa.SetFocus;
            end;
          end;

        finally
          lBolsaDao.Destroy;
        end;

      end
      else
      begin

        Application.MessageBox('N�mero da bolsa n�o cadastrado', 'Aviso', MB_ICONWARNING + MB_OK);
        EdtNumeroBolsa.SetFocus;

      end;

    end;

  end
  else
  begin
    EdtVolume.Enabled := False;
  end;

end;

procedure TFrmDescarte.EdtVolumeExit(Sender: TObject);
var
  lVolumeAtual: Integer;
  lBolsaDao: TBolsaDAO;
begin

  lBolsaDao := TBolsaDAO.Create(DataModuleConexao.Conexao);
  try

    lVolumeAtual := lBolsaDao.getVolumeAtual(Self.FIdBolsa);

    if (StrToIntDef(EdtVolume.Text, 0) > lVolumeAtual) then
    begin
      Application.MessageBox(pWideChar('Voc� ultrapassou o volume m�ximo da bolsa de ' + lVolumeAtual.ToString + 'mL.'),
        'Aviso', MB_ICONWARNING + MB_OK);
      EdtVolume.SetFocus;
    end;

  finally
    lBolsaDao.Destroy;
  end;

end;

procedure TFrmDescarte.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case (Key) of
    VK_F6:
      begin
        BtnGravarClick(Self);
      end;

    VK_F7:
      begin
        BtnNovoClick(Self);
      end;

    VK_ESCAPE:
      begin
        BtnSairClick(Self);
      end;
  end;

end;

procedure TFrmDescarte.FormShow(Sender: TObject);
begin
  Self.CarregaUsuarios;

  if (Self.FId <> -1) then
  begin
    Self.getObjeto;
  end
  else
  begin

    EdtDataDescarte.Date := now;

    EdtMotivoDescarte.Text := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'Descarte',
      'FrmDescarte.EdtMotivoDescarte', '');

    setIndexByIdUsuario(Self.FIdUsuario);
    ComboBoxResponsavel.SetFocus;

    Self.FIdBolsa := -1;
  end;

end;

class function TFrmDescarte.getDescarte(const pFOREIGNFORMKEY: SmallInt; const pID_USUARIO, pID: Integer): Boolean;
begin

  Application.CreateForm(TFrmDescarte, FrmDescarte);
  try

    try

      FrmDescarte.FForeignFormKey := pFOREIGNFORMKEY;
      FrmDescarte.FIdUsuario := pID_USUARIO;

      FrmDescarte.FId := pID;

      Result := FrmDescarte.ShowModal = mrOk;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de descarte de sangue', E.Message]));
      end;
    end;

  finally
    FreeAndNil(FrmDescarte);
  end;

end;

function TFrmDescarte.getObjeto: Boolean;
var
  lDescarte: TDescarte;
  lDescarteDao: TDescarteDAO;
begin

  lDescarte := TDescarte.Create;
  try

    lDescarteDao := TDescarteDAO.Create(DataModuleConexao.Conexao);
    try

      try

        Result := lDescarteDao.getObjeto(Self.FId, lDescarte);
        if (Result) then
        begin
          EdtId.Text := lDescarte.Id.ToString;
          Self.CarregaDadosBolsa(lDescarte.Id_Bolsa);

          EdtMotivoDescarte.Text := lDescarte.Motivo;
          EdtVolume.Text := lDescarte.Volume.ToString;
          EdtDataDescarte.Date := lDescarte.Data_Descarte;
          Self.FIdBolsa := lDescarte.Id_Bolsa;

          setIndexByIdUsuario(lDescarte.Id_Usuario);

          ComboBoxResponsavel.SetFocus;
        end;

      except
        on E: Exception do
        begin

        end;
      end;

    finally
      lDescarteDao.Destroy;
    end;

  finally
    lDescarte.Destroy;
  end;

end;

procedure TFrmDescarte.setIndexByIdUsuario(const pIDUSUARIO: Integer);
var
  lCount: SmallInt;
begin

  ComboBoxResponsavel.ItemIndex := -1;
  for lCount := 0 to ComboBoxResponsavel.Items.Count - 1 do
  begin

    if (TBiblioteca.getIdUsuarioOnString(ComboBoxResponsavel.Items[lCount]) = pIDUSUARIO) then
    begin
      ComboBoxResponsavel.ItemIndex := lCount;
    end;

  end;

end;

end.
