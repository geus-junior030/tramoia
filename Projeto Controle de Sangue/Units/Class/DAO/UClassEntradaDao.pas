unit UClassEntradaDAO;

interface

uses System.Classes, System.SysUtils, UInterfaceDao, UClassConexao, UClassPersistencia, UClassEntrada;

type
  TEntradaDAO = class(TInterfacedPersistent, IInterfaceDao<TEntrada>)
  private
    FConexao: TConexao;

  public
    function getExiste(const pID: Integer): Boolean;
    function Excluir(const pID: Integer): Boolean;
    function Salvar(var pObjeto: TEntrada): Boolean;
    function getObjeto(const pID: Integer; var pObjeto: TEntrada): Boolean;

    function getConsulta(const pCHAVE: string; const pTIPOCONS: SmallInt; var pPersistencia: TPersistencia): Boolean;

    constructor Create(const pCONEXAO: TConexao); overload;
    destructor Destroy; override;

  end;

implementation

constructor TEntradaDAO.Create(const pCONEXAO: TConexao);
begin
  Self.FConexao := pCONEXAO;
end;

destructor TEntradaDAO.Destroy;
begin

  inherited;
end;

function TEntradaDAO.Excluir(const pID: Integer): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try

    try
      lPersistencia.IniciaTransacao;

      lPersistencia.Query.SQL.Add('DELETE');
      lPersistencia.Query.SQL.Add('FROM entrada');
      lPersistencia.Query.SQL.Add('WHERE id = :pId');

      lPersistencia.setParametro('pId', pID);

      lPersistencia.Query.ExecSQL;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    lPersistencia.Destroy;
  end;

end;

function TEntradaDAO.getConsulta(const pCHAVE: string; const pTIPOCONS: SmallInt;
  var pPersistencia: TPersistencia): Boolean;
begin

  try

    pPersistencia.IniciaTransacao;

    pPersistencia.Query.SQL.Add('SELECT');
    pPersistencia.Query.SQL.Add('  e.id,');
    pPersistencia.Query.SQL.Add('  e.data_entrada,');
    pPersistencia.Query.SQL.Add('  b.numero_da_bolsa,');
    pPersistencia.Query.SQL.Add('  CONCAT(b.abo, b.rh) tipo_sangue,');
    pPersistencia.Query.SQL.Add('  b.origem,');
    pPersistencia.Query.SQL.Add('  b.volume,');
    pPersistencia.Query.SQL.Add('  b.sorologia,');
    pPersistencia.Query.SQL.Add('  e.observacao');
    pPersistencia.Query.SQL.Add('FROM entrada e');

    pPersistencia.Query.SQL.Add('INNER JOIN bolsa b');
    pPersistencia.Query.SQL.Add('ON (e.id_bolsa = b.id)');

    pPersistencia.Query.SQL.Add('WHERE 0=0');

    { case (pTIPOCONS) of
      0, 1: // Palavra chave e Nome
      begin

      if (not pCHAVE.Trim.IsEmpty) then
      begin

      pPersistencia.Query.SQL.Add('AND nome LIKE :pChave');
      pPersistencia.setParametro('pChave', IfThen(pTIPOCONS = 0, '%', '') + pCHAVE + '%');

      end;

      pPersistencia.Query.SQL.Add('ORDER BY nome');

      end;

      2: // Id
      begin

      if (not pCHAVE.Trim.IsEmpty) then
      begin

      pPersistencia.Query.SQL.Add('AND id = :pChave');
      pPersistencia.setParametro('pChave', pCHAVE);

      end;

      pPersistencia.Query.SQL.Add('ORDER BY id');

      end;
      end; }

    pPersistencia.Query.Open;

    Result := True;

  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;

end;

function TEntradaDAO.getExiste(const pID: Integer): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try

    try
      lPersistencia.IniciaTransacao;

      lPersistencia.Query.SQL.Add('SELECT');
      lPersistencia.Query.SQL.Add('  count(*)');
      lPersistencia.Query.SQL.Add('FROM entrada');
      lPersistencia.Query.SQL.Add('WHERE id = :pId');

      lPersistencia.setParametro('pId', pID);

      lPersistencia.Query.Open;

      Result := lPersistencia.Query.Fields[0].AsInteger > 0;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    lPersistencia.Destroy;
  end;

end;

function TEntradaDAO.Salvar(var pObjeto: TEntrada): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try
    try
      lPersistencia.IniciaTransacao;

      if (not Self.getExiste(pObjeto.Id)) then
      begin

        pObjeto.Id := lPersistencia.getProximoCodigo('entrada', 'id');

        lPersistencia.Query.SQL.Add('INSERT INTO entrada (');
        lPersistencia.Query.SQL.Add('  id,');
        lPersistencia.Query.SQL.Add('  id_usuario,');
        lPersistencia.Query.SQL.Add('  id_bolsa,');
        lPersistencia.Query.SQL.Add('  data_entrada,');
        lPersistencia.Query.SQL.Add('  observacao');
        lPersistencia.Query.SQL.Add(') VALUES (');
        lPersistencia.Query.SQL.Add('  :pId,');
        lPersistencia.Query.SQL.Add('  :pId_Usuario,');
        lPersistencia.Query.SQL.Add('  :pId_Bolsa,');
        lPersistencia.Query.SQL.Add('  :pData_Entrada,');
        lPersistencia.Query.SQL.Add('  :pObservacao');
        lPersistencia.Query.SQL.Add(');');
      end
      else
      begin
        lPersistencia.Query.SQL.Add('UPDATE entrada SET');
        lPersistencia.Query.SQL.Add('  id_usuario= :pId_Usuario,');
        lPersistencia.Query.SQL.Add('  id_bolsa= :pId_Bolsa,');
        lPersistencia.Query.SQL.Add('  data_entrada= :pData_Entrada,');
        lPersistencia.Query.SQL.Add('  observacao= :pObservacao');
        lPersistencia.Query.SQL.Add('WHERE (id = :pId);');

      end;

      lPersistencia.setParametro('pId', pObjeto.Id);
      lPersistencia.setParametro('pId_Usuario', pObjeto.IdUsuario);
      lPersistencia.setParametro('pId_Bolsa', pObjeto.IdBolsa);
      lPersistencia.setParametro('pData_Entrada', pObjeto.DataEntrada);
      lPersistencia.setParametro('pObservacao', pObjeto.Observacao);

      lPersistencia.Query.ExecSQL;

      Result := True;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    lPersistencia.Destroy;
  end;

end;

function TEntradaDAO.getObjeto(const pID: Integer; var pObjeto: TEntrada): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try
    try
      lPersistencia.IniciaTransacao;

      lPersistencia.Query.SQL.Add('SELECT');
      lPersistencia.Query.SQL.Add('  *');
      lPersistencia.Query.SQL.Add('FROM entrada');
      lPersistencia.Query.SQL.Add('WHERE id= :pId');

      lPersistencia.setParametro('pId', pID);

      lPersistencia.Query.Open;

      pObjeto.Id := lPersistencia.Query.FieldByName('id').AsInteger;
      pObjeto.IdUsuario := lPersistencia.Query.FieldByName('id_usuario').AsInteger;
      pObjeto.IdBolsa := lPersistencia.Query.FieldByName('id_bolsa').AsInteger;
      pObjeto.DataEntrada := lPersistencia.Query.FieldByName('data_entrada').AsDateTime;
      pObjeto.Observacao := lPersistencia.Query.FieldByName('observacao').Asstring;

      Result := True;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    lPersistencia.Destroy;
  end;

end;

end.
