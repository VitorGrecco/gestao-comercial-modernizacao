unit uClienteApiService;

interface

type
  TClienteApiService = class
  public
    function ListarClientes: string;

    procedure InserirCliente(
      const ANome: string;
      const ADocumento: string;
      const AEmail: string;
      const ATelefone: string;
      AAtivo: Boolean
    );

    procedure AtualizarCliente(
      AIdCliente: Integer;
      const ANome: string;
      const ADocumento: string;
      const AEmail: string;
      const ATelefone: string;
      AAtivo: Boolean
    );
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Net.URLClient,
  System.Net.HttpClient;

const
  BASE_URL_API = 'http://localhost:5250';

function TClienteApiService.ListarClientes: string;
var
  httpClient: THTTPClient;
  resposta: IHTTPResponse;
begin
  httpClient := THTTPClient.Create;
  try
    resposta := httpClient.Get(BASE_URL_API + '/api/clientes');

    if resposta.StatusCode <> 200 then
      raise Exception.CreateFmt(
        'Erro ao consultar clientes na API. HTTP %d',
        [resposta.StatusCode]
      );

    Result := resposta.ContentAsString;
  finally
    httpClient.Free;
  end;
end;

procedure TClienteApiService.InserirCliente(
  const ANome: string;
  const ADocumento: string;
  const AEmail: string;
  const ATelefone: string;
  AAtivo: Boolean
);
var
  httpClient: THTTPClient;
  resposta: IHTTPResponse;
  json: TJSONObject;
  conteudo: TStringStream;
  headers: TNetHeaders;
begin
  httpClient := THTTPClient.Create;
  json := TJSONObject.Create;

  try
    json.AddPair('nome', ANome);
    json.AddPair('documento', ADocumento);
    json.AddPair('email', AEmail);
    json.AddPair('telefone', ATelefone);
    json.AddPair('ativo', TJSONBool.Create(AAtivo));

    conteudo := TStringStream.Create(
      json.ToJSON,
      TEncoding.UTF8
    );

    try
      SetLength(headers, 1);

      headers[0].Name := 'Content-Type';
      headers[0].Value := 'application/json';

      resposta := httpClient.Post(
        BASE_URL_API + '/api/clientes',
        conteudo,
        nil,
        headers
      );

      if resposta.StatusCode <> 201 then
        raise Exception.CreateFmt(
          'Erro ao cadastrar cliente na API. HTTP %d',
          [resposta.StatusCode]
        );

    finally
      conteudo.Free;
    end;

  finally
    json.Free;
    httpClient.Free;
  end;
end;

procedure TClienteApiService.AtualizarCliente(
  AIdCliente: Integer;
  const ANome: string;
  const ADocumento: string;
  const AEmail: string;
  const ATelefone: string;
  AAtivo: Boolean
);
var
  httpClient: THTTPClient;
  resposta: IHTTPResponse;
  json: TJSONObject;
  conteudo: TStringStream;
  headers: TNetHeaders;
begin
  httpClient := THTTPClient.Create;
  json := TJSONObject.Create;

  try
    json.AddPair('nome', ANome);
    json.AddPair('documento', ADocumento);
    json.AddPair('email', AEmail);
    json.AddPair('telefone', ATelefone);
    json.AddPair('ativo', TJSONBool.Create(AAtivo));

    conteudo := TStringStream.Create(
      json.ToJSON,
      TEncoding.UTF8
    );

    try
      SetLength(headers, 1);

      headers[0].Name := 'Content-Type';
      headers[0].Value := 'application/json';

      resposta := httpClient.Put(
        BASE_URL_API + '/api/clientes/' + IntToStr(AIdCliente),
        conteudo,
        nil,
        headers
      );

      if resposta.StatusCode <> 204 then
        raise Exception.CreateFmt(
          'Erro ao atualizar cliente na API. HTTP %d',
          [resposta.StatusCode]
        );

    finally
      conteudo.Free;
    end;

  finally
    json.Free;
    httpClient.Free;
  end;
end;

end.