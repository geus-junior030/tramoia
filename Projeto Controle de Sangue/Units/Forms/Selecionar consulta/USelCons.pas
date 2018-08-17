unit USelCons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmSelCons = class(TForm)
    PanelBotoes: TPanel;
    BtnSair: TBitBtn;
    PanelRelatorios: TPanel;
    BtnConsEstoque: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsEstoqueClick(Sender: TObject);
  private
    FForeignFormKey: SmallInt;
    FCodUsu: Integer;
  public
    class function getSelCons(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer): Boolean;
  end;

var
  FrmSelCons: TFrmSelCons;

implementation

uses UClassMensagem, UClassForeignKeyForms, UConsEstoque;

{$R *.dfm}

procedure TFrmSelCons.BtnConsEstoqueClick(Sender: TObject);
begin

  TFrmConsEstoque.getConsEstoque(Self.FForeignFormKey, Self.FCodUsu);

end;

procedure TFrmSelCons.BtnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmSelCons.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_ESCAPE) then
  begin

    BtnSairClick(Sender);

  end;

end;

class function TFrmSelCons.getSelCons(const pFOREIGNFORMKEY: SmallInt; const pCOD_USU: Integer): Boolean;
begin

  try

    try

      Application.CreateForm(TFrmSelCons, FrmSelCons);

      FrmSelCons.FForeignFormKey := pFOREIGNFORMKEY;
      FrmSelCons.FCodUsu := pCOD_USU;

      FrmSelCons.ShowModal;

      Result := True;

    except
      on E: Exception do
      begin

        Result := False;
        raise Exception.Create(Format(TMensagem.getMensagem(0), ['de selecionar a consulta', E.Message]));

      end;
    end;

  finally
    FrmSelCons.Destroy;
  end;

end;

end.
