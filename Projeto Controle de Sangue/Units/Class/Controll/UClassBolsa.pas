unit UClassBolsa;

interface

uses System.SysUtils, System.Classes;

type
  TBolsa = class(TPersistent)
  private

    FId: Integer;
    FNumeroBolsa: string[20];
    FTipo: string[4];
    FAbo: string[2];
    FRh: string[1];
    FOrigem: string[15];
    FVolume: Integer;
    FPossuiEstoque: string[1];
    FPai: string[1];
    FSifilis: string[1];
    FChagas: string[1];
    FHepatiteB: string[1];
    FHepatiteC: string[1];
    FHiv: string[1];
    FHtlv: string[1];
    FHemoglobinas: string[1];
    FIrradiada: string[1];
    FFiltrada: string[1];
    FFracionada: string[1];
    FFenotipada: string[1];
    FDataVencimento: TDate;
    FVolumeAtual: Integer;

    function getAbo: string;
    function getId: Integer;
    function getNumeroBolsa: string;
    function getOrigem: string;
    function getPossuiEstoque: string;
    function getRh: string;
    function getTipo: string;
    function getVolume: Integer;
    function getPai: string;
    function getSifilis: string;
    function getChagas: string;
    function getHepatiteb: string;
    function getHepatitec: string;
    function getHiv: string;
    function getHtlv: string;
    function getHemoglobinas: string;
    function getIrradiada: string;
    function getFiltrada: string;
    function getFracionada: string;
    function getFenotipada: string;
    function getDataVencimento: TDate;
    function getVolumeAtual: Integer;

    procedure setAbo(const pABO: string);
    procedure setId(const pID: Integer);
    procedure setNumeroBolsa(const pNUMERO_DA_BOLSA: string);
    procedure setOrigem(const pORIGEM: string);
    procedure setPossuiEstoque(const pPOSSUI_ESTOQUE: string);
    procedure setRh(const pRH: string);
    procedure setTipo(const pTIPO: string);
    procedure setVolume(const pVOLUME: Integer);
    procedure setPai(const pPAI: string);
    procedure setSifilis(const pSIFILIS: string);
    procedure setChagas(const pCHAGAS: string);
    procedure setHepatiteB(const pHEPATITEB: string);
    procedure setHepatiteC(const pHEPATITEC: string);
    procedure setHiv(const pHIV: string);
    procedure setHtlv(const pHTLV: string);
    procedure setHemoglobinas(const pHEMOGLOBINAS: string);
    procedure setIrradiada(const pIRRADIADA: string);
    procedure setFiltrada(const pFILTRADA: string);
    procedure setFracionada(const pFRACIONADA: string);
    procedure setFenotipada(const pFENOTIPADA: string);
    procedure setDataVencimento(const pDATAVENCIMENTO: TDate);
    procedure setVolumeAtual(const pVOLUMEATUAL: Integer);

  public

    property Id: Integer read getId write setId;
    property NumeroBolsa: string read getNumeroBolsa write setNumeroBolsa;
    property Tipo: string read getTipo write setTipo;
    property Abo: string read getAbo write setAbo;
    property Rh: string read getRh write setRh;
    property Origem: string read getOrigem write setOrigem;
    property Volume: Integer read getVolume write setVolume;
    property PossuiEstoque: string read getPossuiEstoque write setPossuiEstoque;
    property Pai: string read getPai write setPai;
    property Sifilis: string read getSifilis write setSifilis;
    property Chagas: string read getChagas write setChagas;
    property HepatiteB: string read getHepatiteb write setHepatiteB;
    property HepatiteC: string read getHepatitec write setHepatiteC;
    property Hiv: string read getHiv write setHiv;
    property Htlv: string read getHtlv write setHtlv;
    property Hemoglobinas: string read getHemoglobinas write setHemoglobinas;
    property Irradiada: string read getIrradiada write setIrradiada;
    property Filtrada: string read getFiltrada write setFiltrada;
    property Fracionada: string read getFracionada write setFracionada;
    property Fenotipada: string read getFenotipada write setFenotipada;
    property DataVencimento: TDate read getDataVencimento write setDataVencimento;
    property VolumeAtual: Integer read getVolumeAtual write setVolumeAtual;

    constructor Create; overload;
    destructor Destroy; override;

  end;

implementation

{ TBolsa }

constructor TBolsa.Create;
begin
  inherited;

end;

destructor TBolsa.Destroy;
begin

  inherited;
end;

function TBolsa.getAbo: string;
begin
  Result := Self.FAbo;
end;

function TBolsa.getChagas: string;
begin
  Result := Self.FChagas;
end;

function TBolsa.getDataVencimento: TDate;
begin
  Result := Self.FDataVencimento;
end;

function TBolsa.getFenotipada: string;
begin
  Result := Self.FFenotipada;
end;

function TBolsa.getFiltrada: string;
begin
  Result := Self.FFiltrada;
end;

function TBolsa.getFracionada: string;
begin
  Result := Self.FFracionada;
end;

function TBolsa.getHemoglobinas: string;
begin
  Result := Self.FHemoglobinas;
end;

function TBolsa.getHepatiteb: string;
begin
  Result := Self.FHepatiteB;
end;

function TBolsa.getHepatitec: string;
begin
  Result := Self.FHepatiteC;
end;

function TBolsa.getHiv: string;
begin
  Result := Self.FHiv;
end;

function TBolsa.getHtlv: string;
begin
  Result := Self.FHtlv;
end;

function TBolsa.getId: Integer;
begin
  Result := Self.FId;
end;

function TBolsa.getIrradiada: string;
begin
  Result := Self.FIrradiada;
end;

function TBolsa.getNumeroBolsa: string;
begin
  Result := Self.FNumeroBolsa;
end;

function TBolsa.getOrigem: string;
begin
  Result := Self.FOrigem;
end;

function TBolsa.getPai: string;
begin
  Result := Self.FPai;
end;

function TBolsa.getPossuiEstoque: string;
begin
  Result := Self.FPossuiEstoque;
end;

function TBolsa.getRh: string;
begin
  Result := Self.FRh;
end;

function TBolsa.getSifilis: string;
begin
  Result := Self.FSifilis;
end;

function TBolsa.getTipo: string;
begin
  Result := Self.FTipo;
end;

function TBolsa.getVolume: Integer;
begin
  Result := Self.FVolume;
end;

function TBolsa.getVolumeAtual: Integer;
begin
  Result := Self.FVolumeAtual;
end;

procedure TBolsa.setAbo(const pABO: string);
begin
  Self.FAbo := pABO;
end;

procedure TBolsa.setChagas(const pCHAGAS: string);
begin
  Self.FChagas := pCHAGAS;
end;

procedure TBolsa.setDataVencimento(const pDATAVENCIMENTO: TDate);
begin
  Self.FDataVencimento := pDATAVENCIMENTO;
end;

procedure TBolsa.setFenotipada(const pFENOTIPADA: string);
begin
  Self.FFenotipada := pFENOTIPADA;
end;

procedure TBolsa.setFiltrada(const pFILTRADA: string);
begin
  Self.FFiltrada := pFILTRADA;
end;

procedure TBolsa.setFracionada(const pFRACIONADA: string);
begin
  Self.FFracionada := pFRACIONADA;
end;

procedure TBolsa.setHemoglobinas(const pHEMOGLOBINAS: string);
begin
  Self.FHemoglobinas := pHEMOGLOBINAS;
end;

procedure TBolsa.setHepatiteB(const pHEPATITEB: string);
begin
  Self.FHepatiteB := pHEPATITEB;
end;

procedure TBolsa.setHepatiteC(const pHEPATITEC: string);
begin
  Self.FHepatiteC := pHEPATITEC;
end;

procedure TBolsa.setHiv(const pHIV: string);
begin
  Self.FHiv := pHIV;
end;

procedure TBolsa.setHtlv(const pHTLV: string);
begin
  Self.FHtlv := pHTLV;
end;

procedure TBolsa.setId(const pID: Integer);
begin
  Self.FId := pID;
end;

procedure TBolsa.setIrradiada(const pIRRADIADA: string);
begin
  Self.FIrradiada := pIRRADIADA;
end;

procedure TBolsa.setNumeroBolsa(const pNUMERO_DA_BOLSA: string);
begin
  Self.FNumeroBolsa := pNUMERO_DA_BOLSA;
end;

procedure TBolsa.setOrigem(const pORIGEM: string);
begin
  Self.FOrigem := pORIGEM;
end;

procedure TBolsa.setPai(const pPAI: string);
begin
  Self.FPai := pPAI;
end;

procedure TBolsa.setPossuiEstoque(const pPOSSUI_ESTOQUE: string);
begin
  Self.FPossuiEstoque := pPOSSUI_ESTOQUE;
end;

procedure TBolsa.setRh(const pRH: string);
begin
  Self.FRh := pRH;
end;

procedure TBolsa.setSifilis(const pSIFILIS: string);
begin
  Self.FSifilis := pSIFILIS;
end;

procedure TBolsa.setTipo(const pTIPO: string);
begin
  Self.FTipo := pTIPO;
end;

procedure TBolsa.setVolume(const pVOLUME: Integer);
begin
  Self.FVolume := pVOLUME;
end;

procedure TBolsa.setVolumeAtual(const pVOLUMEATUAL: Integer);
begin
  Self.FVolumeAtual := pVOLUMEATUAL;
end;

end.
