unit uSenhaHelper;

interface

function GerarHash(const ASenha: string): string;

implementation

uses
  System.Hash,
  System.SysUtils;

function GerarHash(const ASenha: string): string;
begin
  Result := UpperCase(THashSHA2.GetHashString(ASenha));
end;

end.
