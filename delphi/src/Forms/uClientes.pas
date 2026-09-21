unit uClientes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.Win.ADODB;

type
  TfrmClientes = class(TForm)
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    btnNovo: TButton;
    btnEditar: TButton;
    pnlLista: TPanel;
    grdClientes: TDBGrid;
    dsClientes: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    FQryClientes: TADOQuery;
    procedure AtualizarClientes;
    procedure AjustarColunas;
  public
  end;

var
  frmClientes: TfrmClientes;

implementation

uses
  System.UITypes,
  uDMConexao,
  uClienteRepository,
  uClienteCadastro;

{$R *.dfm}

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  FQryClientes := TADOQuery.Create(nil);
  FQryClientes.Connection := dmConexao.conPrincipal;
  dsClientes.DataSet := FQryClientes;
  AtualizarClientes;
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  FQryClientes.Free;
end;

procedure TfrmClientes.FormResize(Sender: TObject);
begin
  AjustarColunas;
end;

procedure TfrmClientes.AtualizarClientes;
var
  clienteRepository: TClienteRepository;
begin
  clienteRepository := TClienteRepository.Create(dmConexao.conPrincipal);
  try
    clienteRepository.ListarClientes(FQryClientes);
    TDateTimeField(FQryClientes.FieldByName('DTH_CADASTRO')).DisplayFormat :=
      'dd/MM/yyyy HH:mm';
    AjustarColunas;
  finally
    clienteRepository.Free;
  end;
end;

procedure TfrmClientes.AjustarColunas;
var
  larguraDisponivel: Integer;
begin
  if grdClientes.Columns.Count < 6 then
    Exit;

  larguraDisponivel := grdClientes.ClientWidth - 30;

  grdClientes.Columns[0].Width := Round(larguraDisponivel * 0.23);
  grdClientes.Columns[1].Width := Round(larguraDisponivel * 0.14);
  grdClientes.Columns[2].Width := Round(larguraDisponivel * 0.22);
  grdClientes.Columns[3].Width := Round(larguraDisponivel * 0.16);
  grdClientes.Columns[4].Width := Round(larguraDisponivel * 0.08);

  grdClientes.Columns[5].Width :=
    larguraDisponivel
    - grdClientes.Columns[0].Width
    - grdClientes.Columns[1].Width
    - grdClientes.Columns[2].Width
    - grdClientes.Columns[3].Width
    - grdClientes.Columns[4].Width;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  frmClienteCadastro := TfrmClienteCadastro.Create(nil);
  try
    if frmClienteCadastro.ShowModal = mrOk then
      AtualizarClientes;
  finally
    frmClienteCadastro.Free;
  end;
end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
var
  idCliente: Integer;
begin
  if FQryClientes.IsEmpty then
  begin
    ShowMessage('Não há cliente selecionado para edição.');
    Exit;
  end;

  idCliente := FQryClientes.FieldByName('ID_CLIENTE').AsInteger;

  frmClienteCadastro := TfrmClienteCadastro.Create(nil);
  try
    frmClienteCadastro.PrepararEdicao(idCliente);
    if frmClienteCadastro.ShowModal = mrOk then
      AtualizarClientes;
  finally
    frmClienteCadastro.Free;
  end;
end;

end.
