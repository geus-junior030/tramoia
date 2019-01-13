unit UClassRelEstoqueDAO;

interface

uses System.Classes, System.SysUtils, UClassConexao, UClassPersistencia, UClassRelEstoque;

type
  TRelEstoqueDAO = class(TPersistent)
  private
    FConexao: TConexao;

    function getSqlQuantidade: string;
  public

    function getRelatorio(var pPersistencia: TPersistencia; const pRELESTOQUE: TRelEstoque): Boolean;

    constructor Create(const pCONEXAO: TConexao); overload;
    destructor Destroy; override;

  end;

implementation

uses System.StrUtils, UEnumsRelatorio, UBibliotecaRelatorio;

{ TRelEstoqueDAO }

constructor TRelEstoqueDAO.Create(const pCONEXAO: TConexao);
begin

end;

destructor TRelEstoqueDAO.Destroy;
begin

  inherited;
end;

function TRelEstoqueDAO.getRelatorio(var pPersistencia: TPersistencia; const pRELESTOQUE: TRelEstoque): Boolean;
begin

  try

    pPersistencia.IniciaTransacao;

    pPersistencia.Query.SQL.Add('SELECT');
    pPersistencia.Query.SQL.Add(Self.getSqlQuantidade);
    pPersistencia.Query.SQL.Add('  CONCAT(SUM(volume_atual), ' + QuotedStr(' mL') + ') AS volume,');
    pPersistencia.Query.SQL.Add('  CONCAT(b.abo, b.rh) AS abo,');
    pPersistencia.Query.SQL.Add('  b.tipo');
    pPersistencia.Query.SQL.Add('FROM bolsa b');

    pPersistencia.Query.SQL.Add('WHERE 0=0');

    TBibliotecaRelatorio.setSqlFiltro('b.tipo', pRELESTOQUE.FiltroTipo, pRELESTOQUE.ListTipo, pPersistencia);

    TBibliotecaRelatorio.setSqlFiltro('b.abo', pRELESTOQUE.FiltroGrupoSanguineo, pRELESTOQUE.ListGrupoSanguineo,
      pPersistencia);

    TBibliotecaRelatorio.setSqlFiltro('b.volume_atual', pRELESTOQUE.FiltroVolume, pRELESTOQUE.ListVolume,
      pPersistencia);

    pPersistencia.Query.SQL.Add('GROUP BY');
    pPersistencia.Query.SQL.Add('  b.abo,');
    pPersistencia.Query.SQL.Add('  b.rh,');
    pPersistencia.Query.SQL.Add('  b.tipo');

    pPersistencia.Query.SQL.Add('ORDER BY');
    pPersistencia.Query.SQL.Add('  quantidade DESC,');
    pPersistencia.Query.SQL.Add('  volume_atual DESC');

    pPersistencia.Query.SQL.SaveToFile('c:\teste.txt');

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

function TRelEstoqueDAO.getSqlQuantidade: string;
var
  lSql: TStringList;
begin

  lSql := TStringList.Create;
  try

    lSql.Add('(SELECT');
    lSql.Add('  COUNT(bo.id)');
    lSql.Add('FROM bolsa bo');

    lSql.Add('WHERE bo.volume_atual > 0');
    lSql.Add('AND bo.abo = b.abo');
    lSql.Add('AND bo.rh = b.rh');
    lSql.Add('AND bo.tipo = b.tipo)AS quantidade,');

    Result := lSql.Text;

  finally
    FreeAndNil(lSql);
  end;
end;

end.
