unit UClassDescarteDAO;

interface

uses System.Classes, System.SysUtils, UInterfaceDao, UClassConexao, UClassPersistencia, UClassDescarte;

type
  TDescarteDAO = class(TInterfacedPersistent, IInterfaceDao<TDescarte>)
  private
    FConexao: TConexao;

  public
    function getExiste(const pID: Integer): Boolean;
    function Excluir(const pID: Integer): Boolean;
    function Salvar(var pObjeto: TDescarte): Boolean;
    function getObjeto(const pID: Integer; var pObjeto: TDescarte): Boolean;

    function getConsulta(const pCHAVE: string; const pDATAINI, pDATAFIM: TDate; const pTIPOCONS: SmallInt;
      var pPersistencia: TPersistencia): Boolean;

    constructor Create(const pCONEXAO: TConexao); overload;
    destructor Destroy; override;

  end;

implementation

constructor TDescarteDAO.Create(const pCONEXAO: TConexao);
begin
  Self.FConexao := pCONEXAO;
end;

destructor TDescarteDAO.Destroy;
begin

  inherited;
end;

function TDescarteDAO.Excluir(const pID: Integer): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try

    try
      lPersistencia.IniciaTransacao;

      lPersistencia.Query.SQL.Add('DELETE');
      lPersistencia.Query.SQL.Add('FROM descarte');
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

function TDescarteDAO.getConsulta(const pCHAVE: string; const pDATAINI, pDATAFIM: TDate; const pTIPOCONS: SmallInt;
  var pPersistencia: TPersistencia): Boolean;
begin
  try

    pPersistencia.IniciaTransacao;

    pPersistencia.Query.SQL.Add('SELECT');
    pPersistencia.Query.SQL.Add('  d.id,');
    pPersistencia.Query.SQL.Add('  u.nome AS responsavel,');
    pPersistencia.Query.SQL.Add('  d.data_descarte,');
    pPersistencia.Query.SQL.Add('  b.numero_da_bolsa,');
    pPersistencia.Query.SQL.Add('  CONCAT(b.abo, b.rh) tipo_sangue,');
    pPersistencia.Query.SQL.Add('  b.id id_bolsa,');
    pPersistencia.Query.SQL.Add('  CONCAT(b.volume,' + QuotedStr(' mL') + ') AS volume,');

    pPersistencia.Query.SQL.Add('  if(b.irradiada = ' + QuotedStr('S') + ',' + QuotedStr('Sim') + ',' + QuotedStr('N�o')
      + ') AS irradiada,');

    pPersistencia.Query.SQL.Add('  if(b.filtrada = ' + QuotedStr('S') + ',' + QuotedStr('Sim') + ',' + QuotedStr('N�o')
      + ') AS filtrada,');

    pPersistencia.Query.SQL.Add('  if(b.fracionada = ' + QuotedStr('S') + ',' + QuotedStr('Sim') + ',' +
      QuotedStr('N�o') + ') AS fracionada,');

    pPersistencia.Query.SQL.Add('  if(b.fenotipada = ' + QuotedStr('S') + ',' + QuotedStr('Sim') + ',' +
      QuotedStr('N�o') + ') AS fenotipada');

    pPersistencia.Query.SQL.Add('FROM descarte d');

    pPersistencia.Query.SQL.Add('INNER JOIN bolsa b');
    pPersistencia.Query.SQL.Add('ON (d.id_bolsa = b.id)');

    pPersistencia.Query.SQL.Add('INNER JOIN usuario u');
    pPersistencia.Query.SQL.Add('ON (d.id_usuario = u.id)');

    pPersistencia.Query.SQL.Add('WHERE 0=0');

    case (pTIPOCONS) of
      0: // C�digo(Id)
        begin

          if (not pCHAVE.Trim.IsEmpty) then
          begin

            pPersistencia.Query.SQL.Add('AND d.id = :pChave');
            pPersistencia.setParametro('pChave', pCHAVE);

          end;

          pPersistencia.Query.SQL.Add('ORDER BY d.id');

        end;

      1: // N�mero da Bolsa
        begin

          if (not pCHAVE.Trim.IsEmpty) then
          begin
            pPersistencia.Query.SQL.Add('AND b.numero_da_bolsa = :pNumero_Da_Bolsa');
            pPersistencia.setParametro('pNumero_Da_Bolsa', pCHAVE);
          end;

        end;

      2: // Per�odo
        begin
          pPersistencia.Query.SQL.Add('AND d.data_descarte BETWEEN :pDataIni AND :pDataFim');
          pPersistencia.setParametro('pDataIni', pDATAINI);
          pPersistencia.setParametro('pDataFim', pDATAFIM);

          pPersistencia.Query.SQL.Add('ORDER BY');
          pPersistencia.Query.SQL.Add('  d.data_descarte,');
          pPersistencia.Query.SQL.Add('  d.id');
        end;

    end;

    pPersistencia.Query.SQL.Add('LIMIT 500;');

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

function TDescarteDAO.getExiste(const pID: Integer): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try

    try
      lPersistencia.IniciaTransacao;

      lPersistencia.Query.SQL.Add('SELECT');
      lPersistencia.Query.SQL.Add('  count(*)');
      lPersistencia.Query.SQL.Add('FROM descarte');
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

function TDescarteDAO.Salvar(var pObjeto: TDescarte): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try
    try
      lPersistencia.IniciaTransacao;

      if (not Self.getExiste(pObjeto.Id)) then
      begin

        pObjeto.Id := lPersistencia.getProximoCodigo('descarte', 'id');
        lPersistencia.Query.SQL.Add('INSERT INTO descarte (');
        lPersistencia.Query.SQL.Add('  id,');
        lPersistencia.Query.SQL.Add('  id_bolsa,');
        lPersistencia.Query.SQL.Add('  id_usuario,');
        lPersistencia.Query.SQL.Add('  data_coleta,');
        lPersistencia.Query.SQL.Add('  motivo,');
        lPersistencia.Query.SQL.Add('  volume,');
        lPersistencia.Query.SQL.Add('  data_descarte');
        lPersistencia.Query.SQL.Add(') VALUES (');
        lPersistencia.Query.SQL.Add('  :pId,');
        lPersistencia.Query.SQL.Add('  :pId_Bolsa,');
        lPersistencia.Query.SQL.Add('  :pId_Usuario,');
        lPersistencia.Query.SQL.Add('  :pData_Coleta,');
        lPersistencia.Query.SQL.Add('  :pMotivo,');
        lPersistencia.Query.SQL.Add('  :pVolume,');
        lPersistencia.Query.SQL.Add('  :pData_Descarte');
        lPersistencia.Query.SQL.Add(');');
      end
      else
      begin
        lPersistencia.Query.SQL.Add('UPDATE descarte SET');
        lPersistencia.Query.SQL.Add('  id_bolsa= :pId_Bolsa,');
        lPersistencia.Query.SQL.Add('  id_usuario= :pId_Usuario,');
        lPersistencia.Query.SQL.Add('  data_coleta= :pData_Coleta,');
        lPersistencia.Query.SQL.Add('  motivo= :pMotivo,');
        lPersistencia.Query.SQL.Add('  volume= :pVolume,');
        lPersistencia.Query.SQL.Add('  data_descarte= :pData_Descarte');
        lPersistencia.Query.SQL.Add('WHERE (id = :pId);');

      end;

      lPersistencia.setParametro('pId', pObjeto.Id);
      lPersistencia.setParametro('pId_Bolsa', pObjeto.Id_Bolsa);
      lPersistencia.setParametro('pId_Usuario', pObjeto.Id_Usuario);
      lPersistencia.setParametro('pData_Coleta', pObjeto.Data_Coleta);
      lPersistencia.setParametro('pMotivo', pObjeto.Motivo);
      lPersistencia.setParametro('pVolume', pObjeto.Volume);
      lPersistencia.setParametro('pData_Descarte', pObjeto.Data_Descarte);

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

function TDescarteDAO.getObjeto(const pID: Integer; var pObjeto: TDescarte): Boolean;
var
  lPersistencia: TPersistencia;
begin
  lPersistencia := TPersistencia.Create(Self.FConexao);
  try
    try
      lPersistencia.IniciaTransacao;

      lPersistencia.Query.SQL.Add('SELECT');
      lPersistencia.Query.SQL.Add('  *');
      lPersistencia.Query.SQL.Add('FROM descarte');
      lPersistencia.Query.SQL.Add('WHERE id= :pId');

      lPersistencia.setParametro('pId', pID);

      lPersistencia.Query.Open;

      pObjeto.Id := lPersistencia.Query.FieldByName('id').AsInteger;
      pObjeto.Id_Bolsa := lPersistencia.Query.FieldByName('id_bolsa').AsInteger;
      pObjeto.Id_Usuario := lPersistencia.Query.FieldByName('id_usuario').AsInteger;
      pObjeto.Data_Coleta := lPersistencia.Query.FieldByName('data_coleta').AsDateTime;
      pObjeto.Motivo := lPersistencia.Query.FieldByName('motivo').Asstring;
      pObjeto.Volume := lPersistencia.Query.FieldByName('volume').AsInteger;
      pObjeto.Data_Descarte := lPersistencia.Query.FieldByName('data_descarte').AsDateTime;

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
