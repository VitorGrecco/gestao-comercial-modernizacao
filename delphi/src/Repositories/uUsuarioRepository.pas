unit uUsuarioRepository;

interface

uses
  Data.Win.ADODB;

type
  TUsuarioRepository = class
  private
    FConnection: TADOConnection;
  public
    constructor Create(AConnection: TADOConnection);

    function BuscarHashPorLogin(ALogin: string; out ASenhaHash: string): Boolean;

    procedure ListarUsuarios(AQuery: TADOQuery);

    procedure InserirUsuario(ANome: string; ALogin: string; ASenhaHash: string; AAtivo: Boolean);

    function BuscarUsuarioPorId(AIdUsuario: Integer; out ANome: string; out ALogin: string; out AAtivo: Boolean): Boolean;

    procedure AtualizarUsuario(AIdUsuario: Integer; ANome: string; ALogin: string; AAtivo: Boolean);
  end;

implementation

  constructor TUsuarioRepository.Create(AConnection: TADOConnection);
  begin
    FConnection := AConnection;
  end;

  function TUsuarioRepository.BuscarHashPorLogin(ALogin: string; out ASenhaHash: string): Boolean;
  var
    qryUsuario: TADOQuery;
  begin
    Result := False;
    ASenhaHash := '';

    qryUsuario := TADOQuery.Create(nil);
    try
      qryUsuario.Connection := FConnection;

      qryUsuario.SQL.Text := 'SELECT SENHA_HASH FROM USUARIO WHERE LOGIN = :LOGIN AND ATIVO = 1';
      qryUsuario.Parameters.ParamByName('LOGIN').Value := ALogin;
      qryUsuario.Open;

      if not qryUsuario.Eof then
      begin
        ASenhaHash := qryUsuario.FieldByName('SENHA_HASH').AsString;
        Result := True;
      end;
    finally
      qryUsuario.Free;
    end;
  end;

  procedure TUsuarioRepository.ListarUsuarios(AQuery: TADOQuery);
  begin
    AQuery.Close;
    AQuery.Connection := FConnection;

    AQuery.SQL.Text := 'SELECT ID_USUARIO, NOME, LOGIN, ATIVO, CASE WHEN ATIVO = 1 THEN ''Sim'' ELSE ''Não'' END AS ATIVO_DESC, ' +
                       'DTH_CADASTRO FROM USUARIO ORDER BY NOME';
    AQuery.Open;
  end;

  procedure TUsuarioRepository.InserirUsuario(ANome: string; ALogin: string; ASenhaHash: string; AAtivo: Boolean);
  var
    qryUsuario: TADOQuery;
  begin
    qryUsuario := TADOQuery.Create(nil);
    try
      qryUsuario.Connection := FConnection;

      qryUsuario.SQL.Text := 'INSERT INTO USUARIO (NOME, LOGIN, SENHA_HASH, ATIVO) VALUES (:NOME, :LOGIN, :SENHA_HASH, :ATIVO)';

      qryUsuario.Parameters.ParamByName('NOME').Value := ANome;
      qryUsuario.Parameters.ParamByName('LOGIN').Value := ALogin;
      qryUsuario.Parameters.ParamByName('SENHA_HASH').Value := ASenhaHash;
      qryUsuario.Parameters.ParamByName('ATIVO').Value := AAtivo;

      qryUsuario.ExecSQL;
    finally
      qryUsuario.Free;
    end;
  end;

  function TUsuarioRepository.BuscarUsuarioPorId(AIdUsuario: Integer; out ANome: string; out ALogin: string; out AAtivo: Boolean): Boolean;
var
  qryUsuario: TADOQuery;
begin
  Result := False;

  ANome := '';
  ALogin := '';
  AAtivo := False;

  qryUsuario := TADOQuery.Create(nil);
  try
    qryUsuario.Connection := FConnection;

    qryUsuario.SQL.Text := 'SELECT NOME, LOGIN, ATIVO FROM USUARIO WHERE ID_USUARIO = :ID_USUARIO';

    qryUsuario.Parameters.ParamByName('ID_USUARIO').Value := AIdUsuario;

    qryUsuario.Open;

    if not qryUsuario.Eof then
    begin
      ANome := qryUsuario.FieldByName('NOME').AsString;
      ALogin := qryUsuario.FieldByName('LOGIN').AsString;
      AAtivo := qryUsuario.FieldByName('ATIVO').AsBoolean;

      Result := True;
    end;
  finally
    qryUsuario.Free;
  end;
end;

procedure TUsuarioRepository.AtualizarUsuario(AIdUsuario: Integer; ANome: string; ALogin: string; AAtivo: Boolean);
var
  qryUsuario: TADOQuery;
begin
  qryUsuario := TADOQuery.Create(nil);
  try
    qryUsuario.Connection := FConnection;

    qryUsuario.SQL.Text := 'UPDATE USUARIO SET NOME = :NOME, LOGIN = :LOGIN, ATIVO = :ATIVO WHERE ID_USUARIO = :ID_USUARIO';

    qryUsuario.Parameters.ParamByName('NOME').Value := ANome;
    qryUsuario.Parameters.ParamByName('LOGIN').Value := ALogin;
    qryUsuario.Parameters.ParamByName('ATIVO').Value := AAtivo;
    qryUsuario.Parameters.ParamByName('ID_USUARIO').Value := AIdUsuario;

    qryUsuario.ExecSQL;
  finally
    qryUsuario.Free;
  end;
end;

end.
