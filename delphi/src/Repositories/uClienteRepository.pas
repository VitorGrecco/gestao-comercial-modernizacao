unit uClienteRepository;

interface

uses
  Data.Win.ADODB;

type
  TClienteRepository = class
  private
    FConnection: TADOConnection;
  public
    constructor Create(AConnection: TADOConnection);

    procedure ListarClientes(AQuery: TADOQuery);

    function BuscarClientePorId(
      AIdCliente: Integer;
      out ANome: string;
      out ADocumento: string;
      out AEmail: string;
      out ATelefone: string;
      out AAtivo: Boolean
    ): Boolean;

    procedure InserirCliente(
      ANome: string;
      ADocumento: string;
      AEmail: string;
      ATelefone: string;
      AAtivo: Boolean
    );

    procedure AtualizarCliente(
      AIdCliente: Integer;
      ANome: string;
      ADocumento: string;
      AEmail: string;
      ATelefone: string;
      AAtivo: Boolean
    );
  end;

implementation

constructor TClienteRepository.Create(AConnection: TADOConnection);
begin
  FConnection := AConnection;
end;

procedure TClienteRepository.ListarClientes(AQuery: TADOQuery);
begin
  AQuery.Close;
  AQuery.Connection := FConnection;

  AQuery.SQL.Text :=
    'SELECT ID_CLIENTE, NOME, DOCUMENTO, EMAIL, TELEFONE, ATIVO, ' +
    'CASE WHEN ATIVO = 1 THEN ''Sim'' ELSE ''Não'' END AS ATIVO_DESC, ' +
    'DTH_CADASTRO ' +
    'FROM CLIENTE ' +
    'ORDER BY NOME';

  AQuery.Open;
end;

function TClienteRepository.BuscarClientePorId(
  AIdCliente: Integer;
  out ANome: string;
  out ADocumento: string;
  out AEmail: string;
  out ATelefone: string;
  out AAtivo: Boolean
): Boolean;
var
  qryCliente: TADOQuery;
begin
  Result := False;

  ANome := '';
  ADocumento := '';
  AEmail := '';
  ATelefone := '';
  AAtivo := False;

  qryCliente := TADOQuery.Create(nil);
  try
    qryCliente.Connection := FConnection;

    qryCliente.SQL.Text :=
      'SELECT NOME, DOCUMENTO, EMAIL, TELEFONE, ATIVO ' +
      'FROM CLIENTE ' +
      'WHERE ID_CLIENTE = :ID_CLIENTE';

    qryCliente.Parameters.ParamByName('ID_CLIENTE').Value := AIdCliente;
    qryCliente.Open;

    if not qryCliente.Eof then
    begin
      ANome := qryCliente.FieldByName('NOME').AsString;
      ADocumento := qryCliente.FieldByName('DOCUMENTO').AsString;
      AEmail := qryCliente.FieldByName('EMAIL').AsString;
      ATelefone := qryCliente.FieldByName('TELEFONE').AsString;
      AAtivo := qryCliente.FieldByName('ATIVO').AsBoolean;
      Result := True;
    end;
  finally
    qryCliente.Free;
  end;
end;

procedure TClienteRepository.InserirCliente(
  ANome: string;
  ADocumento: string;
  AEmail: string;
  ATelefone: string;
  AAtivo: Boolean
);
var
  qryCliente: TADOQuery;
begin
  qryCliente := TADOQuery.Create(nil);
  try
    qryCliente.Connection := FConnection;
    qryCliente.SQL.Text :=
      'INSERT INTO CLIENTE (NOME, DOCUMENTO, EMAIL, TELEFONE, ATIVO) ' +
      'VALUES (:NOME, :DOCUMENTO, :EMAIL, :TELEFONE, :ATIVO)';

    qryCliente.Parameters.ParamByName('NOME').Value := ANome;
    qryCliente.Parameters.ParamByName('DOCUMENTO').Value := ADocumento;
    qryCliente.Parameters.ParamByName('EMAIL').Value := AEmail;
    qryCliente.Parameters.ParamByName('TELEFONE').Value := ATelefone;
    qryCliente.Parameters.ParamByName('ATIVO').Value := AAtivo;
    qryCliente.ExecSQL;
  finally
    qryCliente.Free;
  end;
end;

procedure TClienteRepository.AtualizarCliente(
  AIdCliente: Integer;
  ANome: string;
  ADocumento: string;
  AEmail: string;
  ATelefone: string;
  AAtivo: Boolean
);
var
  qryCliente: TADOQuery;
begin
  qryCliente := TADOQuery.Create(nil);
  try
    qryCliente.Connection := FConnection;
    qryCliente.SQL.Text :=
      'UPDATE CLIENTE SET ' +
      'NOME = :NOME, ' +
      'DOCUMENTO = :DOCUMENTO, ' +
      'EMAIL = :EMAIL, ' +
      'TELEFONE = :TELEFONE, ' +
      'ATIVO = :ATIVO ' +
      'WHERE ID_CLIENTE = :ID_CLIENTE';

    qryCliente.Parameters.ParamByName('NOME').Value := ANome;
    qryCliente.Parameters.ParamByName('DOCUMENTO').Value := ADocumento;
    qryCliente.Parameters.ParamByName('EMAIL').Value := AEmail;
    qryCliente.Parameters.ParamByName('TELEFONE').Value := ATelefone;
    qryCliente.Parameters.ParamByName('ATIVO').Value := AAtivo;
    qryCliente.Parameters.ParamByName('ID_CLIENTE').Value := AIdCliente;
    qryCliente.ExecSQL;
  finally
    qryCliente.Free;
  end;
end;

end.
