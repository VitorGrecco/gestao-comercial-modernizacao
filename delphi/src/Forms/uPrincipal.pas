unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    lblSistema: TLabel;
    pnlTopo: TPanel;
    pnlMenu: TPanel;
    pnlAreaPrincipal: TPanel;
    pnlConteudo: TPanel;
    pnlLogo: TPanel;
    pnlUsuarios: TPanel;
    lblUsuarios: TLabel;
    pnlClientes: TPanel;
    lblClientes: TLabel;
    procedure pnlUsuariosClick(Sender: TObject);
    procedure pnlClientesClick(Sender: TObject);
    procedure MenuMouseEnter(Sender: TObject);
    procedure MenuMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uUsuarios, uClientes;

{$R *.dfm}

procedure TfrmPrincipal.pnlClientesClick(Sender: TObject);
begin
  if not Assigned(frmClientes) then
  begin
    frmClientes := TfrmClientes.Create(Self);
    frmClientes.Parent := pnlConteudo;
    frmClientes.BorderStyle := bsNone;
    frmClientes.Align := alClient;
  end;

  frmClientes.Show;
  frmClientes.BringToFront;
end;

procedure TFrmPrincipal.pnlUsuariosClick(Sender: TObject);
begin
  if not Assigned(frmUsuarios) then
  begin
    frmUsuarios := TfrmUsuarios.Create(Self);

    frmUsuarios.Parent := pnlConteudo;
    frmUsuarios.BorderStyle := bsNone;
    frmUsuarios.Align := alClient;
  end;

  frmUsuarios.Show;
  frmUsuarios.BringToFront;
end;

procedure TfrmPrincipal.MenuMouseEnter(Sender: TObject);
var
  painel: TPanel;
begin
  if Sender is TPanel then
    painel := TPanel(Sender)
  else
    painel := TPanel(TControl(Sender).Parent);

  painel.Color := $00A85A00;
end;

procedure TfrmPrincipal.MenuMouseLeave(Sender: TObject);
var
  painel: TPanel;
  posicaoMouse: TPoint;
begin
  if Sender is TPanel then
    painel := TPanel(Sender)
  else
    painel := TPanel(TControl(Sender).Parent);

  posicaoMouse := painel.ScreenToClient(Mouse.CursorPos);

  if not PtInRect(painel.ClientRect, posicaoMouse) then
    painel.Color := $00804000;
end;

end.
