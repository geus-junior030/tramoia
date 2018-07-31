unit UClassMensagem;

interface

uses System.SysUtils, System.Classes;

type
  TMensagem = class(TComponent)
  public
    class function getMensagem(const pMSG: SmallInt): string;
  end;

implementation

{ TMensagem }

class function TMensagem.getMensagem(const pMSG: SmallInt): string;
begin

  case (pMSG) of
    0:
      begin
        Result := 'Erro ao criar janela %S: %S.';
      end;

    1:
      begin
        Result := 'Erro ao consultar %S: %S.';
      end;

    2:
      begin
        Result := 'Erro ao excluir %s. Motivo: %s.';
      end;

    3:
      begin
        Result := 'Campo "%S" � obrigat�rio e n�o foi informado.';
      end;

    4:
      begin
        Result := 'Erro ao salvar %S. Motivo: %S.';
      end;

    5:
      begin
        Result := 'Erro ao pesquisar %S. Motivo: %S.';
      end;

    6:
      begin
        Result := '%S n�o cadastrado.';
      end;

    7:
      begin
        Result := 'Erro ao preparar %S. Motivo %S.';
      end;

    8:
      begin
        Result := '%s salvo com sucesso!'
      end;

    9:
      begin
        Result := 'Deseja realmente excluir o %s selecionado?'
      end;

    10:
      begin
        Result := 'Munic�pio n�o encontrado.';
      end;

    11:
      begin
        Result := 'CPF inv�lido.';
      end;

    12:
      begin
        Result := 'Voc� n�o possui permiss�o para realizar a opera��o.';
      end;

    13:
      begin
        Result := 'Senha ou usu�rio incorreto.';
      end;

    14:
      begin
        Result := 'Erro ao realizar o login. Motivo: %S';
      end;

    15:
      begin
        Result := 'Erro ao verificar a exist�ncia do CPF no cadastro de pacientes. Motivo %s'
      end;

    16:
      begin
        Result := 'CPF j� cadastrado na base de dados.';
      end;

    17:
      begin
        Result := 'Cart�o SUS inv�lido.';
      end;

    18:
      begin
        Result := 'N�mero de RG inv�lido.';
      end;
  end;

end;

end.
