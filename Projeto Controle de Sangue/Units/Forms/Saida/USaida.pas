unit USaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Vcl.Mask,
  UCadPaciente, UClassPacienteDao;

type
  TFrmSaida = class(TForm)
    PanelClient: TPanel;
    GroupBoxSangue: TGroupBox;
    GroupBoxPaciente: TGroupBox;
    LabelRegistroPaciente: TLabel;
    EdtNomePaciente: TEdit;
    EdtAboBolsa: TEdit;
    EdtNumeroBolsa: TEdit;
    EdtHospital: TEdit;
    EdtTipo: TEdit;
    LabelVolume: TLabel;
    LabelAboSangue: TLabel;
    LabelNumeroBolsa: TLabel;
    LabelHospital: TLabel;
    LabelTipo: TLabel;
    LabelNomePaciente: TLabel;
    RadioGroupPai: TRadioGroup;
    GroupBoxProvaCompatibilidade: TGroupBox;
    RadioGroupTA: TRadioGroup;
    RadioGroupAGH: TRadioGroup;
    RadioGroup37: TRadioGroup;
    PanelBottom: TPanel;
    BtnGravar: TBitBtn;
    BtnSair: TBitBtn;
    EdtId: TEdit;
    LabelId: TLabel;
    EdtVolume: TEdit;
    BtnConsPaciente: TSpeedButton;
    EdtRegistroPaciente: TEdit;
    DateTimePickerData: TDateTimePicker;
    LabelData: TLabel;
    BtnNovo: TBitBtn;
    LabelResponsavel: TLabel;
    btnCadPaciente: TSpeedButton;
    Label1: TLabel;
    EdtAboPaciente: TEdit;
    ComboBoxResponsavel: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RadioGroupIrradiada: TRadioGroup;
    RadioGroupFiltrada: TRadioGroup;
    RadioGroupFracionada: TRadioGroup;
    RadioGroupFenotipada: TRadioGroup;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtNumeroBolsaExit(Sender: TObject);
    procedure BtnConsPacienteClick(Sender: TObject);
    procedure EdtRegistroPacienteExit(Sender: TObject);
    procedure EdtRegistroPacienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnCadPacienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtVolumeExit(Sender: TObject);
  private
    FForeignFormKey: SmallInt;
    FIdUsuario: Integer;

    FId: Integer;
    FIdBolsa: Integer;
    FNumBolsa: string;

    procedure CarregaSaida;

    procedure CarregaUsuarios;

    procedure setIndexByIdUsuario(const pIdUsuario: Integer);

    procedure CarregaDadosBolsa(const pID_BOLSA: Integer);

    function SalvaSaida: Boolean;

    function AlteraProcedimentosEspeciais: Boolean;

  public
    class function getSaida(const pFOREIGNFORMKEY: SmallInt; const pID_USUARIO: Integer;
      const pID: Integer = -1): Boolean;
  end;

var
  FrmSaida: TFrmSaida;

implementation

uses System.Math, UDMConexao, UClassMensagem, UClassEntrada, UClassEntradaDAO, UClassSaida, UClassSaidaDAO,
  UClassBiblioteca,
  UClassBibliotecaDao, UConsPaciente, UClassForeignKeyForms, UClassBolsa, UClassBolsaDao,
  System.Generics.Collections, UClassUsuario, UClassUsuarioDAO, UAutenticacao, USelBolsa;

{$R *.dfm}
{ TFrmSaida }

function TFrmSaida.AlteraProcedimentosEspeciais: Boolean;
var
  lBolsaDao: TBolsaDAO;
begin

  lBolsaDao := TBolsaDAO.Create(DataModuleConexao.Conexao);
  try

    try
      Result := lBolsaDao.AlteraProcessoEspeciais(Self.FIdBolsa,
        Copy(RadioGroupIrradiada.Items[RadioGroupIrradiada.ItemIndex], 1, 1),
        Copy(RadioGroupFiltrada.Items[RadioGroupFiltrada.ItemIndex], 1, 1),
        Copy(RadioGroupFracionada.Items[RadioGroupFracionada.ItemIndex], 1, 1),
        Copy(RadioGroupFenotipada.Items[RadioGroupFenotipada.ItemIndex], 1, 1));
    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    lBolsaDao.Destroy;
  end;

end;

procedure TFrmSaida.btnCadPacienteClick(Sender: TObject);
begin
  TFrmCadPaciente.getCadPaciente(TForeignKeyForms.FIdUSaida, Self.FIdUsuario);
end;

procedure TFrmSaida.BtnConsPacienteClick(Sender: TObject);
var
  lRegistro: string;
begin

  if (TFrmConsPaciente.getConsPaciente(TForeignKeyForms.FIdUSaida, Self.FIdUsuario, lRegistro)) then
  begin

    EdtRegistroPaciente.Text := lRegistro;

    // Tratamento para pesquisar o nome do paciente apenas uma vez.
    if (not EdtRegistroPaciente.Focused) then
    begin

      EdtRegistroPacienteExit(Sender);

    end
    else
    begin

      // Se tiver focado no EdtRegistroPaciente, vai disparar o OnExit.
      EdtNumeroBolsa.SetFocus;

    end;

  end
  else
  begin

    EdtRegistroPaciente.SetFocus;

  end;

end;

procedure TFrmSaida.BtnGravarClick(Sender: TObject);
var
  lIdBolsa: Integer;
begin

  if (ComboBoxResponsavel.ItemIndex = -1) then
  begin

    Application.MessageBox(PChar(Format(TMensagem.getMensagem(3), [LabelResponsavel.Caption])), 'Aviso',
      MB_OK + MB_ICONINFORMATION);

    ComboBoxResponsavel.SetFocus;

    exit;

  end;

  if (Trim(EdtRegistroPaciente.Text).IsEmpty) then
  begin

    Application.MessageBox(PChar(Format(TMensagem.getMensagem(3), [LabelRegistroPaciente.Caption])), 'Aviso',
      MB_OK + MB_ICONINFORMATION);

    EdtRegistroPaciente.SetFocus;

    exit;

  end;

  if (Trim(EdtNumeroBolsa.Text).IsEmpty) then
  begin

    Application.MessageBox(PChar(Format(TMensagem.getMensagem(3), [LabelNumeroBolsa.Caption])), 'Aviso',
      MB_OK + MB_ICONINFORMATION);

    EdtNumeroBolsa.SetFocus;

    exit;

  end;

  if (Trim(EdtVolume.Text).IsEmpty) then
  begin

    Application.MessageBox(PChar(Format(TMensagem.getMensagem(3), [LabelVolume.Caption])), 'Aviso',
      MB_OK + MB_ICONINFORMATION);

    EdtVolume.SetFocus;

    exit;

  end;

  if (Trim(EdtHospital.Text).IsEmpty) then
  begin

    Application.MessageBox(PChar(Format(TMensagem.getMensagem(3), [LabelHospital.Caption])), 'Aviso',
      MB_OK + MB_ICONINFORMATION);

    EdtHospital.SetFocus;

    exit;

  end;

  if (TFrmAutenticacao.getAutenticacao(TBiblioteca.getIdUsuarioOnString(ComboBoxResponsavel.Items
    [ComboBoxResponsavel.ItemIndex]))) then
  begin

    if (Self.SalvaSaida) then
    begin

      if (Self.AlteraProcedimentosEspeciais) then
      begin
        TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'Hospital', 'FrmConsSaidas.EdtHospital',
          Trim(EdtHospital.Text));
      end;

    end;

  end;

end;

procedure TFrmSaida.BtnNovoClick(Sender: TObject);
var
  lUltimoUsu: Integer;
begin
  TBiblioteca.AtivaDesativaCompontes(Self, true);

  EdtHospital.Text := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'Hospital', 'FrmConsSaidas.EdtHospital', '');

  EdtId.Enabled := False;
  EdtNomePaciente.Enabled := False;
  EdtAboPaciente.Enabled := False;
  EdtAboBolsa.Enabled := False;
  EdtTipo.Enabled := False;
  EdtVolume.Enabled := False;
  EdtId.Clear;
  DateTimePickerData.Date := now;
  EdtRegistroPaciente.Clear;
  EdtNomePaciente.Clear;
  EdtNumeroBolsa.Clear;
  EdtAboBolsa.Clear;
  EdtTipo.Clear;
  EdtVolume.Clear;
  RadioGroupPai.ItemIndex := 1;
  RadioGroupTA.ItemIndex := 0;
  RadioGroupAGH.ItemIndex := 0;
  RadioGroup37.ItemIndex := 0;
  ComboBoxResponsavel.SetFocus;

  BtnGravar.Enabled := true;

  Self.FId := -1;
  Self.FIdBolsa := -1;
  Self.FNumBolsa := '-1';

end;

procedure TFrmSaida.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSaida.CarregaDadosBolsa(const pID_BOLSA: Integer);
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

procedure TFrmSaida.CarregaSaida;
var
  lSaida: TSaida;
  lSaidaDAO: TSaidaDAO;
begin

  lSaida := TSaida.Create;
  try

    lSaidaDAO := TSaidaDAO.Create(DataModuleConexao.Conexao);
    try

      try

        if (lSaidaDAO.getObjeto(Self.FId, lSaida)) then
        begin

          EdtId.Text := lSaida.Id.ToString;
          EdtRegistroPaciente.Text := TClassBibliotecaDao.getValorAtributo('paciente', 'num_prontuario', 'id',
            lSaida.Id_Paciente, DataModuleConexao.Conexao);
          EdtRegistroPacienteExit(Self);
          Self.CarregaDadosBolsa(lSaida.Id_Bolsa);
          EdtVolume.Text := lSaida.Volume.ToString;
          DateTimePickerData.Date := lSaida.Data_Saida;
          EdtHospital.Text := lSaida.Hospital;
          RadioGroupPai.ItemIndex := IfThen(lSaida.Pai = 'P', 0, 1);
          RadioGroupTA.ItemIndex := IfThen(lSaida.Prova_Compatibilidade_Ta = 'C', 0, 1);
          RadioGroupAGH.ItemIndex := IfThen(lSaida.Prova_Compatibilidade_Agh = 'C', 0, 1);
          RadioGroup37.ItemIndex := IfThen(lSaida.Prova_Compatibilidade_37 = 'C', 0, 1);
          Self.FIdBolsa := lSaida.Id_Bolsa;

          setIndexByIdUsuario(lSaida.Id_Usuario);

          ComboBoxResponsavel.SetFocus;

        end;

      except
        on E: Exception do
        begin
          raise Exception.Create(Format(TMensagem.getMensagem(5), ['Sa�da de sangue', E.Message]));
        end;
      end;

    finally
      lSaidaDAO.Destroy;
    end;

  finally
    lSaida.Destroy;
  end;

end;

procedure TFrmSaida.EdtNumeroBolsaExit(Sender: TObject);
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
        exit;
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

procedure TFrmSaida.EdtRegistroPacienteExit(Sender: TObject);
var
  lNomePaciente: string;
  lAboPaciente: string;
  lPacienteDao: TPacienteDAO;
begin

  if (not Trim(EdtRegistroPaciente.Text).IsEmpty) then
  begin

    lPacienteDao := TPacienteDAO.Create(DataModuleConexao.Conexao);
    try

      if (lPacienteDao.getNomeEABO(Trim(EdtRegistroPaciente.Text), lNomePaciente, lAboPaciente)) then
      begin

        if (lNomePaciente <> '') then
        begin

          EdtNomePaciente.Text := lNomePaciente;
          EdtAboPaciente.Text := lAboPaciente;

        end
        else
        begin

          Application.MessageBox(PChar(Format(TMensagem.getMensagem(6), ['Paciente'])), 'Aviso',
            MB_OK + MB_ICONINFORMATION);

          EdtRegistroPaciente.SetFocus;

        end;

      end;

    finally
      lPacienteDao.Destroy;
    end;

  end
  else
  begin
    EdtRegistroPaciente.Clear;
    EdtNomePaciente.Clear;

    if (GetKeyState(VK_RETURN) < 0) then
    begin
      BtnConsPacienteClick(Self);
    end;

  end;

end;

procedure TFrmSaida.EdtRegistroPacienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case (Key) of
    VK_F2:
      begin
        BtnConsPacienteClick(Self);
      end;

    VK_F3:
      begin
        btnCadPacienteClick(Self);
      end;
  end;

end;

procedure TFrmSaida.EdtVolumeExit(Sender: TObject);
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

procedure TFrmSaida.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFrmSaida.FormShow(Sender: TObject);
begin
  Self.CarregaUsuarios;

  if (Self.FId <> -1) then
  begin
    Self.CarregaSaida;
  end
  else
  begin
    EdtHospital.Text := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'Hospital', 'FrmConsSaidas.EdtHospital', '');
    DateTimePickerData.Date := now;

    setIndexByIdUsuario(Self.FIdUsuario);
    ComboBoxResponsavel.SetFocus;

    Self.FIdBolsa := -1;
    Self.FNumBolsa := '1';
  end;

end;

procedure TFrmSaida.CarregaUsuarios;
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

procedure TFrmSaida.setIndexByIdUsuario(const pIdUsuario: Integer);
var
  lCount: SmallInt;
begin

  ComboBoxResponsavel.ItemIndex := -1;
  for lCount := 0 to ComboBoxResponsavel.Items.Count - 1 do
  begin

    if (TBiblioteca.getIdUsuarioOnString(ComboBoxResponsavel.Items[lCount]) = pIdUsuario) then
    begin
      ComboBoxResponsavel.ItemIndex := lCount;
    end;

  end;

end;

class function TFrmSaida.getSaida(const pFOREIGNFORMKEY: SmallInt; const pID_USUARIO: Integer;
  const pID: Integer = -1): Boolean;
begin

  Application.CreateForm(TFrmSaida, FrmSaida);
  try

    try

      FrmSaida.FForeignFormKey := pFOREIGNFORMKEY;
      FrmSaida.FIdUsuario := pID_USUARIO;

      FrmSaida.FId := pID;

      Result := FrmSaida.ShowModal = mrOk;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de sa�da de sangue', E.Message]));
      end;
    end;

  finally
    FreeAndNil(FrmSaida);
  end;

end;

function TFrmSaida.SalvaSaida: Boolean;
var
  lSaida: TSaida;
  lSaidaDAO: TSaidaDAO;
begin

  lSaida := TSaida.Create;
  try

    lSaida.Id := StrToIntDef(EdtId.Text, -1);
    lSaida.Id_Paciente := TClassBibliotecaDao.getValorAtributo('paciente', 'id', 'num_prontuario',
      EdtRegistroPaciente.Text, DataModuleConexao.Conexao);

    lSaida.Id_Usuario := TBiblioteca.getIdUsuarioOnString(ComboBoxResponsavel.Items[ComboBoxResponsavel.ItemIndex]);

    lSaida.Id_Bolsa := Self.FIdBolsa;
    lSaida.Data_Saida := now;
    lSaida.Hospital := EdtHospital.Text;
    lSaida.Pai := Copy(RadioGroupPai.Items[RadioGroupPai.ItemIndex], 1, 1);
    lSaida.Prova_Compatibilidade_Ta := Copy(RadioGroupTA.Items[RadioGroupTA.ItemIndex], 1, 1);
    lSaida.Prova_Compatibilidade_Agh := Copy(RadioGroupAGH.Items[RadioGroupAGH.ItemIndex], 1, 1);
    lSaida.Prova_Compatibilidade_37 := Copy(RadioGroup37.Items[RadioGroup37.ItemIndex], 1, 1);
    lSaida.Volume := StrToInt(EdtVolume.Text);

    lSaidaDAO := TSaidaDAO.Create(DataModuleConexao.Conexao);
    try

      try

        Result := lSaidaDAO.Salvar(lSaida);
        if (Result) then
        begin

          EdtId.Text := lSaida.Id.ToString;

          TBiblioteca.AtivaDesativaCompontes(Self, False);

          Application.MessageBox(PChar(TMensagem.getMensagem(24)), 'Informa��o', MB_ICONINFORMATION + MB_OK);

          BtnGravar.Enabled := False;

          BtnNovo.SetFocus;

        end;

      except
        on E: Exception do
        begin
          Result := False;
          raise Exception.Create(Format(TMensagem.getMensagem(4), ['Sa�da de sangue', E.Message]));
        end;
      end;

    finally
      lSaidaDAO.Destroy;
    end;

  finally
    lSaida.Destroy;
  end;

end;

end.
