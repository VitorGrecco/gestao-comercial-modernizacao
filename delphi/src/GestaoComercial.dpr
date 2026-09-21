program GestaoComercial;

uses
  Vcl.Forms,
  System.UITypes,
  uPrincipal in 'Forms\uPrincipal.pas' {FrmPrincipal},
  uDMConexao in 'DataModules\uDMConexao.pas' {dmConexao: TDataModule},
  uLogin in 'Forms\uLogin.pas' {frmLogin},
  uUsuarioRepository in 'Repositories\uUsuarioRepository.pas',
  uSenhaHelper in 'Utils\uSenhaHelper.pas',
  uUsuarios in 'Forms\uUsuarios.pas' {frmUsuarios},
  uUsuarioCadastro in 'Forms\uUsuarioCadastro.pas' {frmUsuarioCadastro},
  uClientes in 'Forms\uClientes.pas' {frmClientes},
  uClienteCadastro in 'Forms\uClienteCadastro.pas' {frmClienteCadastro},
  uClienteRepository in 'Repositories\uClienteRepository.pas',
  uClienteApiService in 'Services\uClienteApiService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TdmConexao, dmConexao);
  dmConexao.Conectar;

  if dmConexao.conPrincipal.Connected then
  begin
    frmLogin := TfrmLogin.Create(nil);
    try
      if frmLogin.ShowModal = mrOk then
      begin
        Application.CreateForm(TfrmPrincipal, frmPrincipal);
        Application.Run;
      end;
    finally
      frmLogin.Free;
    end;
  end;
end.
