unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Mask, acPNG;

type
  TFrmLogin = class(TForm)
    Image: TImage;
    EdtNome: TEdit;
    EdtSenha: TMaskEdit;
    BtnLogin: TBitBtn;
    BtnSair: TBitBtn;
    LabelNovoUsuario: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLoginClick(Sender: TObject);
    procedure EdtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure LabelNovoUsuarioClick(Sender: TObject);
    procedure LabelNovoUsuarioMouseEnter(Sender: TObject);
    procedure LabelNovoUsuarioMouseLeave(Sender: TObject);
    procedure BtnLoginMouseEnter(Sender: TObject);
    procedure BtnLoginMouseLeave(Sender: TObject);
    procedure BtnSairMouseEnter(Sender: TObject);
    procedure BtnSairMouseLeave(Sender: TObject);
  private
    FCodUsu: Integer;
    FNumTentativas: Integer;

    function getExisteUsuariosCadastrados: Boolean;
  public
    class function getLogin(const pIDFORMULARIO: SmallInt; var pCod_Usu: Integer): Boolean;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UDMConexao, UClassUsuarioDao, UBiblioteca, UClassMensagem, UCadUsuario, UClassForeignKeyForms;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);
var
  lUsuarioDAO: TUsuarioDAO;
  lId: Integer;
begin

  lUsuarioDAO := TUsuarioDAO.Create(DataModuleConexao.Conexao);
  try

    try

      if (lUsuarioDAO.getLogin(Trim(EdtNome.Text), Trim(EdtSenha.Text), lId)) then
      begin

        Self.FCodUsu := lId;
        ModalResult := mrOk;

      end
      else
      begin

        Self.FNumTentativas := Self.FNumTentativas + 1;

        ShowMessage('Senha ou usu�rio incorreto.');

        if (Self.FNumTentativas = 3) then
        begin
          Application.Terminate;
        end;

        EdtNome.SetFocus;

      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao fazer login. Motivo: ' + E.Message);
      end;
    end;

  finally
    lUsuarioDAO.Destroy;
  end;

end;

procedure TFrmLogin.BtnLoginMouseEnter(Sender: TObject);
begin

  BtnLogin.Font.Style := [fsBold];

end;

procedure TFrmLogin.BtnLoginMouseLeave(Sender: TObject);
begin

  BtnLogin.Font.Style := [];

end;

procedure TFrmLogin.BtnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmLogin.BtnSairMouseEnter(Sender: TObject);
begin

  BtnSair.Font.Style := [fsBold];

end;

procedure TFrmLogin.BtnSairMouseLeave(Sender: TObject);
begin

  BtnSair.Font.Style := [];

end;

procedure TFrmLogin.EdtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_RETURN) then
  begin

    BtnLoginClick(Sender);

  end;

end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if (not Trim(EdtNome.Text).IsEmpty) then
  begin

    TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'USUARIO', 'nome usuario', Trim(EdtNome.Text));

  end;

end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case (Key) of
    VK_ESCAPE:
      begin
        Close;
      end;
  end;

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  Self.FNumTentativas := 0;
  EdtNome.Text := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'USUARIO', 'nome usuario', '');
  LabelNovoUsuario.Visible := not Self.getExisteUsuariosCadastrados;
end;

function TFrmLogin.getExisteUsuariosCadastrados: Boolean;
var
  lUsuarioDAO: TUsuarioDAO;
begin
  lUsuarioDAO := TUsuarioDAO.Create(DataModuleConexao.Conexao);
  try

    try
      Result := lUsuarioDAO.getExisteUsuariosCadastrados;
    except

    end;

  finally
    FreeAndNil(lUsuarioDAO)
  end;

end;

class function TFrmLogin.getLogin(const pIDFORMULARIO: SmallInt; var pCod_Usu: Integer): Boolean;
begin

  Application.CreateForm(TFrmLogin, FrmLogin);
  try

    try

      Result := FrmLogin.ShowModal = mrOk;
      if (Result) then
      begin
        pCod_Usu := FrmLogin.FCodUsu;
      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de login', E.Message]));
      end;
    end;

  finally
    FreeAndNil(FrmLogin);
  end;

end;

procedure TFrmLogin.LabelNovoUsuarioClick(Sender: TObject);
begin
  TFrmCadUsuario.getCadUsuario(TForeignKeyForms.FIdULogin, -1);
end;

procedure TFrmLogin.LabelNovoUsuarioMouseEnter(Sender: TObject);
begin

  LabelNovoUsuario.Font.Size := 13;

end;

procedure TFrmLogin.LabelNovoUsuarioMouseLeave(Sender: TObject);
begin
  LabelNovoUsuario.Font.Size := 11;

end;

end.
