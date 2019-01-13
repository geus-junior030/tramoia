unit URelDescarte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmRelDescarte = class(TForm)
    PanelData: TPanel;
    GroupBoxDataDescarte: TGroupBox;
    DateTimePickerDataInicial: TDateTimePicker;
    DateTimePickerDataFinal: TDateTimePicker;
    LabelA: TLabel;
    PanelTipo: TPanel;
    GroupBoxTipo: TGroupBox;
    PanelBotoes: TPanel;
    BtnSair: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnVisualizar: TBitBtn;
    EdtTipo: TEdit;
    BtnAddTipo: TBitBtn;
    RadioGroupFiltroTipo: TRadioGroup;
    ListBoxTipo: TListBox;
    PanelGrupoSanguineo: TPanel;
    GroupBoxGrupoSanguineo: TGroupBox;
    EdtGrupoSanguineo: TEdit;
    BtnAddGrupoSanguineo: TBitBtn;
    RadioGroupFiltroGrupoSanguineo: TRadioGroup;
    ListBoxGrupoSanguineo: TListBox;
    PanelVolume: TPanel;
    GroupBoxVolume: TGroupBox;
    EdtVolume: TEdit;
    BtnAddVolume: TBitBtn;
    RadioGroupFiltroVolume: TRadioGroup;
    ListBoxVolume: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroupFiltroTipoClick(Sender: TObject);
    procedure BtnAddTipoClick(Sender: TObject);
    procedure RadioGroupFiltroGrupoSanguineoClick(Sender: TObject);
    procedure BtnAddGrupoSanguineoClick(Sender: TObject);
    procedure RadioGroupFiltroVolumeClick(Sender: TObject);
    procedure BtnAddVolumeClick(Sender: TObject);
    procedure ListBoxTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxGrupoSanguineoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxVolumeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    FForeignFormKey: SmallInt;
    FCodUsu: Integer;

    procedure ChamaRelatorio(const pSENDER: TObject);

  public
    class function getRelDescarte(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer): Boolean;
  end;

var
  FrmRelDescarte: TFrmRelDescarte;

implementation

uses System.DateUtils, UClassBiblioteca, UBibliotecaRelatorio, UClassMensagem, UEnumsRelatorio,
  UClassForeignKeyForms, UClassRelDescarte, URlRelDescarte;

{$R *.dfm}
{ TFrmRelDescarte }

procedure TFrmRelDescarte.BtnAddGrupoSanguineoClick(Sender: TObject);
begin

  TBibliotecaRelatorio.BtnAddClickGeral(RadioGroupFiltroGrupoSanguineo, ListBoxGrupoSanguineo, GroupBoxGrupoSanguineo,
    EdtGrupoSanguineo, BtnAddGrupoSanguineo);

end;

procedure TFrmRelDescarte.BtnAddTipoClick(Sender: TObject);
begin

  TBibliotecaRelatorio.BtnAddClickGeral(RadioGroupFiltroTipo, ListBoxTipo, GroupBoxTipo, EdtTipo, BtnAddTipo);

end;

procedure TFrmRelDescarte.BtnAddVolumeClick(Sender: TObject);
begin

  TBibliotecaRelatorio.BtnAddClickGeral(RadioGroupFiltroVolume, ListBoxVolume, GroupBoxVolume, EdtVolume, BtnAddVolume);

end;

procedure TFrmRelDescarte.BtnImprimirClick(Sender: TObject);
begin

  Self.ChamaRelatorio(Sender);

end;

procedure TFrmRelDescarte.BtnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmRelDescarte.BtnVisualizarClick(Sender: TObject);
begin

  Self.ChamaRelatorio(Sender);

end;

procedure TFrmRelDescarte.ChamaRelatorio(const pSENDER: TObject);
var
  lRelDescarte: TRelDescarte;

  // Uso esse objeto auxiliar por que o Delphi da erro de compila��o se eu passar a property do StringList.
  lAuxStringList: TStringList;
  lMensagem: string;

begin

  if (not TBibliotecaRelatorio.ValidaFiltro(TTipoFiltro(RadioGroupFiltroTipo.ItemIndex), ListBoxTipo, EdtTipo,
    lMensagem)) then
  begin

    Application.MessageBox(PWideChar(lMensagem), 'Aviso', mb_Ok + mb_IconExclamation);

    Exit;

  end;

  if (not TBibliotecaRelatorio.ValidaFiltro(TTipoFiltro(RadioGroupFiltroGrupoSanguineo.ItemIndex),
    ListBoxGrupoSanguineo, EdtGrupoSanguineo, lMensagem)) then
  begin

    Application.MessageBox(PWideChar(lMensagem), 'Aviso', mb_Ok + mb_IconExclamation);

    Exit;

  end;

  if (not TBibliotecaRelatorio.ValidaFiltro(TTipoFiltro(RadioGroupFiltroVolume.ItemIndex), ListBoxVolume, EdtVolume,
    lMensagem)) then
  begin

    Application.MessageBox(PWideChar(lMensagem), 'Aviso', mb_Ok + mb_IconExclamation);

    Exit;

  end;

  lRelDescarte := TRelDescarte.Create;
  try

    try

      lRelDescarte.DataIni := DateTimePickerDataInicial.Date;
      lRelDescarte.DataFim := DateTimePickerDataFinal.Date;

      lRelDescarte.FiltroTipo := TTipoFiltro(RadioGroupFiltroTipo.ItemIndex);

      lRelDescarte.FiltroGrupoSanguineo := TTipoFiltro(RadioGroupFiltroGrupoSanguineo.ItemIndex);

      lRelDescarte.FiltroVolume := TTipoFiltro(RadioGroupFiltroVolume.ItemIndex);

      lRelDescarte.Visualizar := pSENDER = BtnVisualizar;

      lAuxStringList := TStringList.Create;

      try

        TBibliotecaRelatorio.PreparaStringList(lRelDescarte.FiltroTipo, ListBoxTipo, lAuxStringList);
        lRelDescarte.ListTipo.Text := lAuxStringList.Text;
        lAuxStringList.Clear;

        TBibliotecaRelatorio.PreparaStringList(lRelDescarte.FiltroGrupoSanguineo, ListBoxGrupoSanguineo,
          lAuxStringList);
        lRelDescarte.ListGrupoSanguineo.Text := lAuxStringList.Text;
        lAuxStringList.Clear;

        TBibliotecaRelatorio.PreparaStringList(lRelDescarte.FiltroVolume, ListBoxVolume, lAuxStringList);
        lRelDescarte.ListVolume.Text := lAuxStringList.Text;

      finally
        lAuxStringList.Destroy;
      end;

      TFrmRlRelDescarte.getRlRelDescarte(TForeignKeyForms.FIdURelDescarte, Self.FCodUsu, lRelDescarte);

    except
      on E: Exception do
      begin
        raise Exception.Create(Format(TMensagem.getMensagem(7), ['relat�rio de descarte', E.Message]));
      end;
    end;

  finally
    lRelDescarte.Destroy;
  end;

end;

procedure TFrmRelDescarte.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup', 'FrmRelDescarte.RadioGroupFiltroTipo',
    RadioGroupFiltroTipo.ItemIndex.ToString);

  TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup', 'FrmRelDescarte.RadioGroupFiltroGrupoSanguineo',
    RadioGroupFiltroGrupoSanguineo.ItemIndex.ToString);

  TBiblioteca.GravaArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup', 'FrmRelDescarte.RadioGroupFiltroVolume',
    RadioGroupFiltroVolume.ItemIndex.ToString);

  Action := caFree;

end;

procedure TFrmRelDescarte.FormDestroy(Sender: TObject);
begin

  FrmRelDescarte := nil;

end;

procedure TFrmRelDescarte.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_ESCAPE) then
  begin
    BtnSairClick(Sender);
  end;

end;

procedure TFrmRelDescarte.FormShow(Sender: TObject);
begin

  DateTimePickerDataInicial.DateTime := TBiblioteca.getPrimeiroDiaMes(Now);
  DateTimePickerDataFinal.DateTime := TBiblioteca.getUltimoDiaMes(Now);

  RadioGroupFiltroTipo.ItemIndex := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup',
    'FrmRelDescarte.RadioGroupFiltroTipo', '3').ToInteger;

  RadioGroupFiltroGrupoSanguineo.ItemIndex := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup',
    'FrmRelDescarte.RadioGroupFiltroGrupoSanguineo', '3').ToInteger;

  RadioGroupFiltroVolume.ItemIndex := TBiblioteca.LeArquivoIni('cnfConfiguracoes.ini', 'IndexRadioGroup',
    'FrmRelDescarte.RadioGroupFiltroVolume', '3').ToInteger;

end;

class function TFrmRelDescarte.getRelDescarte(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer): Boolean;
begin

  if (FrmRelDescarte = nil) then
  begin

    Application.CreateForm(TFrmRelDescarte, FrmRelDescarte);

  end;

  try

    FrmRelDescarte.FForeignFormKey := pFOREIGNFORMKEY;
    FrmRelDescarte.FCodUsu := pCOD_USU;

    FrmRelDescarte.WindowState := wsNormal;
    FrmRelDescarte.BringToFront;
    FrmRelDescarte.Show;

    Result := True;

  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create(Format(TMensagem.getMensagem(0), ['de relat�rio de descarte', E.Message]));
    end;
  end;

end;

procedure TFrmRelDescarte.ListBoxTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  TBibliotecaRelatorio.ListBoxKeyDownGeral(Key, ListBoxTipo, EdtTipo, BtnAddTipo);

end;

procedure TFrmRelDescarte.ListBoxGrupoSanguineoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  TBibliotecaRelatorio.ListBoxKeyDownGeral(Key, ListBoxGrupoSanguineo, EdtGrupoSanguineo, BtnAddGrupoSanguineo);

end;

procedure TFrmRelDescarte.ListBoxVolumeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  TBibliotecaRelatorio.ListBoxKeyDownGeral(Key, ListBoxVolume, EdtVolume, BtnAddVolume);

end;

procedure TFrmRelDescarte.RadioGroupFiltroGrupoSanguineoClick(Sender: TObject);
begin

  TBibliotecaRelatorio.RadioGroupClickGeral(RadioGroupFiltroGrupoSanguineo, ListBoxGrupoSanguineo, EdtGrupoSanguineo,
    BtnAddGrupoSanguineo);

end;

procedure TFrmRelDescarte.RadioGroupFiltroTipoClick(Sender: TObject);
begin

  TBibliotecaRelatorio.RadioGroupClickGeral(RadioGroupFiltroTipo, ListBoxTipo, EdtTipo, BtnAddTipo);

end;

procedure TFrmRelDescarte.RadioGroupFiltroVolumeClick(Sender: TObject);
begin

  TBibliotecaRelatorio.RadioGroupClickGeral(RadioGroupFiltroVolume, ListBoxVolume, EdtVolume, BtnAddVolume);

end;

end.
