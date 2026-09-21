unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, System.IOUtils, Vcl.Dialogs, Data.DB, Data.Win.ADODB;

type
  TdmConexao = class(TDataModule)
    conPrincipal: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conectar;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

procedure TdmConexao.Conectar;
var
  ini: TIniFile;
  servidor: string;
  banco: string;
  arquivoConfig: string;
begin
  arquivoConfig := TPath.GetFullPath(TPath.Combine(ExtractFilePath(ParamStr(0)), '..\..\..\config\config.ini'));

  if not FileExists(arquivoConfig) then
  begin
   ShowMessage('Arquivo de configuração não foi encontrado');
   exit;
  end;

  ini := TIniFile.Create(arquivoConfig);
  try
    servidor := ini.ReadString('DATABASE', 'Server', '');
    banco := ini.ReadString('DATABASE', 'Database', '');

    if servidor = '' then
    begin
      ShowMessage('Servidor não informado no config.ini.');
      exit;
    end;

    if banco = '' then
    begin
      ShowMessage('Banco de dados não informado no config.ini.');
      exit;
    end;

    conPrincipal.Close;

    conPrincipal.ConnectionString :=
      'Provider=MSOLEDBSQL19.1;' +
      'Data Source=' + servidor + ';' +
      'Initial Catalog=' + banco + ';' +
      'Integrated Security=SSPI;' +
      'Use Encryption for Data=Mandatory;' +
      'Trust Server Certificate=True;';

    try
      conPrincipal.Open;
    except
      on E: Exception do
      begin
        ShowMessage('Não foi possível conectar ao banco de dados.' + sLineBreak + E.Message);
        Exit;
      end;
    end;
    finally
      ini.Free;
    end;
end;

{$R *.dfm}

end.
