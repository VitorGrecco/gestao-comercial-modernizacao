unit uClienteCadastro;

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
  Vcl.StdCtrls;

type
  TfrmClienteCadastro = class(TForm)
    lblTitulo: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblDocumento: TLabel;
    edtDocumento: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    chkAtivo: TCheckBox;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    FIdCliente: Integer;
  public
    procedure PrepararEdicao(AIdCliente: Integer);
  end;

var
  frmClienteCadastro: TfrmClienteCadastro;

implementation

uses
  uDMConexao,
  uClienteRepository,
  uClienteApiService;

{$R *.dfm}

procedure TfrmClienteCadastro.PrepararEdicao(AIdCliente: Integer);
var
  clienteRepository: TClienteRepository;
  nome: string;
  documento: string;
  email: string;
  telefone: string;
  ativo: Boolean;
begin
  FIdCliente := AIdCliente;

  clienteRepository := TClienteRepository.Create(dmConexao.conPrincipal);
  try
    if not clienteRepository.BuscarClientePorId(
      FIdCliente,
      nome,
      documento,
      email,
      telefone,
      ativo
    ) then
    begin
      ShowMessage('Cliente não encontrado.');
      Exit;
    end;

    edtNome.Text := nome;
    edtDocumento.Text := documento;
    edtEmail.Text := email;
    edtTelefone.Text := telefone;
    chkAtivo.Checked := ativo;

    Caption := 'Editar cliente';
    lblTitulo.Caption := 'Editar cliente';
  finally
    clienteRepository.Free;
  end;
end;

procedure TfrmClienteCadastro.btnSalvarClick(Sender: TObject);
var
  clienteApiService: TClienteApiService;
begin
  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Favor informar o nome do cliente!');
    edtNome.SetFocus;
    Exit;
  end;

  clienteApiService := TClienteApiService.Create;
  try
    if FIdCliente = 0 then
    begin
      clienteApiService.InserirCliente(Trim(edtNome.Text),Trim(edtDocumento.Text),Trim(edtEmail.Text),Trim(edtTelefone.Text),chkAtivo.Checked);
    end
    else
    begin
      clienteApiService.AtualizarCliente(FIdCliente,Trim(edtNome.Text),Trim(edtDocumento.Text),Trim(edtEmail.Text),Trim(edtTelefone.Text),chkAtivo.Checked);
    end;

    ModalResult := mrOk;
  finally
    clienteApiService.Free;
  end;
end;

end.
