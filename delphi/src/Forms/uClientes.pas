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
  Datasnap.DBClient;

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
    FClientes: TClientDataSet;
    procedure AtualizarClientes;
    procedure AjustarColunas;
  public
  end;

var
  frmClientes: TfrmClientes;

implementation

uses
  System.UITypes,
  System.JSON,
  System.DateUtils,
  uClienteApiService,
  uClienteCadastro;

{$R *.dfm}

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  FClientes := TClientDataSet.Create(nil);

  FClientes.FieldDefs.Add('ID_CLIENTE', ftInteger);
  FClientes.FieldDefs.Add('NOME', ftString, 120);
  FClientes.FieldDefs.Add('DOCUMENTO', ftString, 20);
  FClientes.FieldDefs.Add('EMAIL', ftString, 150);
  FClientes.FieldDefs.Add('TELEFONE', ftString, 20);
  FClientes.FieldDefs.Add('ATIVO', ftBoolean);
  FClientes.FieldDefs.Add('ATIVO_DESC', ftString, 3);
  FClientes.FieldDefs.Add('DTH_CADASTRO', ftDateTime);

  FClientes.CreateDataSet;

  dsClientes.DataSet := FClientes;

  AtualizarClientes;
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  FClientes.Free;
end;

procedure TfrmClientes.FormResize(Sender: TObject);
begin
  AjustarColunas;
end;

procedure TfrmClientes.AtualizarClientes;
var
  clienteApiService: TClienteApiService;
  respostaJson: string;
  jsonValue: TJSONValue;
  clientesJson: TJSONArray;
  clienteJson: TJSONObject;
  i: Integer;
  ativo: Boolean;
begin
  clienteApiService := TClienteApiService.Create;
  try
    respostaJson := clienteApiService.ListarClientes;
  finally
    clienteApiService.Free;
  end;

  jsonValue := TJSONObject.ParseJSONValue(respostaJson);
  try
    if not (jsonValue is TJSONArray) then
    begin
      ShowMessage('A API retornou um formato inválido.');
      Exit;
    end;

    clientesJson := TJSONArray(jsonValue);

    FClientes.DisableControls;
    try
      FClientes.EmptyDataSet;

      for i := 0 to clientesJson.Count - 1 do
      begin
        clienteJson := clientesJson.Items[i] as TJSONObject;

        ativo := clienteJson.GetValue<Boolean>('ativo');

        FClientes.Append;

        FClientes.FieldByName('ID_CLIENTE').AsInteger :=
          clienteJson.GetValue<Integer>('idCliente');

        FClientes.FieldByName('NOME').AsString :=
          clienteJson.GetValue<string>('nome');

        FClientes.FieldByName('DOCUMENTO').AsString :=
          clienteJson.GetValue<string>('documento');

        FClientes.FieldByName('EMAIL').AsString :=
          clienteJson.GetValue<string>('email');

        FClientes.FieldByName('TELEFONE').AsString :=
          clienteJson.GetValue<string>('telefone');

        FClientes.FieldByName('ATIVO').AsBoolean := ativo;

        if ativo then
          FClientes.FieldByName('ATIVO_DESC').AsString := 'Sim'
        else
          FClientes.FieldByName('ATIVO_DESC').AsString := 'Não';

        FClientes.FieldByName('DTH_CADASTRO').AsDateTime :=
          ISO8601ToDate(
            clienteJson.GetValue<string>('dataCadastro'),
            False
          );

        FClientes.Post;
      end;

      TDateTimeField(
        FClientes.FieldByName('DTH_CADASTRO')
      ).DisplayFormat := 'dd/MM/yyyy HH:mm';

    finally
      FClientes.EnableControls;
    end;

  finally
    jsonValue.Free;
  end;

  AjustarColunas;
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
  if FClientes.IsEmpty then
  begin
    ShowMessage('Não há cliente selecionado para edição.');
    Exit;
  end;

  idCliente := FClientes.FieldByName('ID_CLIENTE').AsInteger;

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
