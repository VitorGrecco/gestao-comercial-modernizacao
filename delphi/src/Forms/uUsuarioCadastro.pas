unit uUsuarioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmUsuarioCadastro = class(TForm)
    lblTitulo: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblLogin: TLabel;
    edtLogin: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    chkAtivo: TCheckBox;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnAlterarSenha: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FIdUsuario: Integer;
  public
    { Public declarations }
    procedure PrepararEdicao(AIdUsuario: Integer);
  end;

var
  frmUsuarioCadastro: TfrmUsuarioCadastro;

implementation

uses
  uDMConexao, uUsuarioRepository, uSenhaHelper;
{$R *.dfm}

procedure TfrmUsuarioCadastro.btnSalvarClick(Sender: TObject);
var
  usuarioRepository: TUsuarioRepository;
begin
  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Favor informar o nome do usuário!');
    edtNome.SetFocus;
    Exit;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    ShowMessage('Favor informar o login do usuário!');
    edtLogin.SetFocus;
    Exit;
  end;

  if (FIdUsuario = 0) and (Trim(edtSenha.Text) = '') then
  begin
    ShowMessage('Favor informar a senha do usuário!');
    edtSenha.SetFocus;
    Exit;
  end;

  usuarioRepository := TUsuarioRepository.Create(dmConexao.conPrincipal);
  try
    if FIdUsuario = 0 then
    begin
      usuarioRepository.InserirUsuario(Trim(edtNome.Text), LowerCase(Trim(edtLogin.Text)), GerarHash(edtSenha.Text), chkAtivo.Checked);
    end
    else
    begin
      usuarioRepository.AtualizarUsuario(FIdUsuario, Trim(edtNome.Text), LowerCase(Trim(edtLogin.Text)), chkAtivo.Checked);
    end;

    ModalResult := mrOk;
  finally
    usuarioRepository.Free;
  end;
end;

procedure TfrmUsuarioCadastro.PrepararEdicao(AIdUsuario: Integer);
var
  usuarioRepository: TUsuarioRepository;
  nome: string;
  login: string;
  ativo: Boolean;
begin
  FIdUsuario := AIdUsuario;

  usuarioRepository := TUsuarioRepository.Create(dmConexao.conPrincipal);
  try
    if not usuarioRepository.BuscarUsuarioPorId(FIdUsuario, nome, login, ativo) then
    begin
      ShowMessage('Usuário não encontrado.');
      Exit;
    end;

    edtNome.Text := nome;
    edtLogin.Text := login;
    chkAtivo.Checked := ativo;

    lblSenha.Visible := False;
    edtSenha.Visible := False;
    btnAlterarSenha.Visible := True;

    Caption := 'Editar usuário';
    lblTitulo.Caption := 'Editar usuário';
  finally
    usuarioRepository.Free;
  end;
end;

end.
