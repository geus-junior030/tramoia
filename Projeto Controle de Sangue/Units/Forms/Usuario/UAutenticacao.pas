unit UAutenticacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, acPNG, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFrmAutenticacao = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    EdtUsuario: TLabeledEdit;
    BtnAutenticar: TBitBtn;
    BtnCancelar: TBitBtn;
    EdtSenha: TMaskEdit;
    Label2: TLabel;
    procedure EdtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnAutenticarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FIdUsuario: Integer;
    FNumTentativas: Byte;
  public
    class function getAutenticacao(pIdUsuario: SmallInt): Boolean;
  end;

var
  FrmAutenticacao: TFrmAutenticacao;

implementation

{$R *.dfm}

uses UClassUsuarioDao, UDMConexao, UClassMensagem, UClassBibliotecaDao;

procedure TFrmAutenticacao.BtnAutenticarClick(Sender: TObject);
var
  lUsuarioDAO: TUsuarioDAO;
  lId: Integer;
begin

  lUsuarioDAO := TUsuarioDAO.Create(DataModuleConexao.Conexao);
  try

    try

      if (lUsuarioDAO.getLogin(Trim(EdtUsuario.Text), Trim(EdtSenha.Text), lId)) then
      begin

        Self.FIdUsuario := lId;
        ModalResult := mrOk;

      end
      else
      begin

        Self.FNumTentativas := Self.FNumTentativas + 1;

        Application.MessageBox(PChar(TMensagem.getMensagem(13)), PChar('Aviso'), MB_OK + MB_ICONINFORMATION);

        if (Self.FNumTentativas = 3) then
        begin
          Application.Terminate;
        end;

        EdtSenha.SetFocus;

      end;

    except
      on E: Exception do
      begin
        Application.MessageBox(PChar(TMensagem.getMensagem(27)), PChar('Erro'), MB_OK + MB_ICONERROR);
      end;
    end;

  finally
    lUsuarioDAO.Destroy;
  end;

end;

procedure TFrmAutenticacao.EdtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case (Key) of

    VK_RETURN:
      begin
        BtnAutenticarClick(Sender);
      end;

  end;

end;

procedure TFrmAutenticacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case (Key) of
    VK_ESCAPE:
      begin
        BtnCancelar.Click;
      end;
  end;
end;

procedure TFrmAutenticacao.FormShow(Sender: TObject);
begin
  EdtUsuario.Text := TClassBibliotecaDAO.getNomeUsuario(Self.FIdUsuario, DataModuleConexao.Conexao);
end;

class function TFrmAutenticacao.getAutenticacao(pIdUsuario: SmallInt): Boolean;
begin
  Result := False;

  Application.CreateForm(TFrmAutenticacao, FrmAutenticacao);
  try

    try

      FrmAutenticacao.FIdUsuario := pIdUsuario;
      Result := FrmAutenticacao.ShowModal = mrOk;

    except
      on E: Exception do
      begin
        Result := False;
        Application.MessageBox(PChar(Format(TMensagem.getMensagem(0), ['de autenticação', E.Message])), PChar('Erro'));
      end;

    end;

  finally
    FrmAutenticacao.Free;
  end;

end;

end.
