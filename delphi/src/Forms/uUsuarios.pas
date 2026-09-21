unit uUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmUsuarios = class(TForm)
    lblTitulo: TLabel;
    grdUsuarios: TDBGrid;
    dsUsuarios: TDataSource;
    pnlCabecalho: TPanel;
    lblSubtitulo: TLabel;
    pnlLista: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlNovoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pnlEditarClick(Sender: TObject);
  private
    { Private declarations }
    FQryUsuarios: TADOQuery;
    procedure AjustarColunas;
    procedure AtualizarUsuarios;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  uDMConexao,  uUsuarioRepository, uUsuarioCadastro;
{$R *.dfm}

procedure TfrmUsuarios.FormCreate(Sender: TObject);
var
  usuarioRepository: TUsuarioRepository;
begin
  FQryUsuarios := TADOQuery.Create(nil);
  FQryUsuarios.Connection := dmConexao.conPrincipal;

  dsUsuarios.DataSet := FQryUsuarios;

  AtualizarUsuarios;
end;

procedure TfrmUsuarios.FormDestroy(Sender: TObject);
begin
  FQryUsuarios.Free;
end;

procedure TfrmUsuarios.FormResize(Sender: TObject);
begin
  AjustarColunas;
end;

procedure TfrmUsuarios.pnlEditarClick(Sender: TObject);
var
  idUsuario: Integer;
begin
  if FQryUsuarios.IsEmpty then
  begin
    ShowMessage('Não há usuário selecionado para edição.');
    Exit;
  end;

  idUsuario := FQryUsuarios.FieldByName('ID_USUARIO').AsInteger;

  frmUsuarioCadastro := TfrmUsuarioCadastro.Create(nil);
  try
    frmUsuarioCadastro.PrepararEdicao(idUsuario);

    if frmUsuarioCadastro.ShowModal = mrOk then
      AtualizarUsuarios;
  finally
    frmUsuarioCadastro.Free;
  end;

end;

procedure TfrmUsuarios.pnlNovoClick(Sender: TObject);
begin
  frmUsuarioCadastro := TfrmUsuarioCadastro.Create(nil);
  try
    if frmUsuarioCadastro.ShowModal = mrOk then
      AtualizarUsuarios;
  finally
    frmUsuarioCadastro.Free;
  end;
end;

procedure TfrmUsuarios.AjustarColunas;
var
  larguraDisponivel: Integer;
begin
  larguraDisponivel := grdUsuarios.ClientWidth - 25;

  grdUsuarios.Columns[0].Width := Round(larguraDisponivel * 0.35);
  grdUsuarios.Columns[1].Width := Round(larguraDisponivel * 0.30);
  grdUsuarios.Columns[2].Width := Round(larguraDisponivel * 0.10);

  grdUsuarios.Columns[3].Width :=
    larguraDisponivel
    - grdUsuarios.Columns[0].Width
    - grdUsuarios.Columns[1].Width
    - grdUsuarios.Columns[2].Width;
end;

procedure TfrmUsuarios.AtualizarUsuarios;
var
  usuarioRepository: TUsuarioRepository;
begin
  usuarioRepository := TUsuarioRepository.Create(dmConexao.conPrincipal);
  try
    usuarioRepository.ListarUsuarios(FQryUsuarios);

    TDateTimeField(FQryUsuarios.FieldByName('DTH_CADASTRO')).DisplayFormat := 'dd/MM/yyyy HH:mm';

    AjustarColunas;
  finally
    usuarioRepository.Free;
  end;
end;

end.
