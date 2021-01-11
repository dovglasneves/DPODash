<<<<<<< HEAD
﻿unit uFunctions;
=======
unit uFunctions;
>>>>>>> 459321da64946831b0722d6306eb23de776933f8

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
<<<<<<< HEAD
  FMX.Types, Math, Data.DB, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Comp.Client, FireDAC.Comp.DataSet;
=======
  FMX.Types, Math;
>>>>>>> 459321da64946831b0722d6306eb23de776933f8

function FormatarTelefone(Value: String): String;
function FormataCEP(Value: String): String;
function FormataNome(sNome: String): string;
<<<<<<< HEAD
function VerificaDuplicidade(CliNome: String; Query: TFDQuery): Boolean;

implementation

function VerificaDuplicidade(CliNome: String; Query: TFDQuery): Boolean;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM clientes WHERE name=' +QuotedStr(CliNome));
  if Query.RecordCount > 0 then
    Result := True
  else
    Result := False;
end;

=======

implementation

>>>>>>> 459321da64946831b0722d6306eb23de776933f8
function FormatarTelefone(Value: String): String;
var
CA, Num1, Num2: String;
begin
// Entrada 3334449999 ==> (33) 3444-9999
case Trim(Value).Length of
  10:
  begin
    CA   := Copy(Trim(Value),1,2);
    Num1 := Copy(Trim(Value),3,4);
    Num2  := Copy(Trim(Value),7,4);
    Result := Format('(%2s) %4s-%4s', [CA, Num1, Num2]);
  end;
  11:
  begin
    CA   := Copy(Trim(Value),1,2);
    Num1 := Copy(Trim(Value),3,5);
    Num2  := Copy(Trim(Value),8,4);
    Result := Format('(%2s) %5s-%4s', [CA, Num1, Num2]);
  end;
end;
end;

function FormataCEP(Value: String): String;
var
    Pref, Suff: String;
begin
// comes in like 36010410
if Trim(Value).Length = 8 then
  begin
    Pref  := Copy(Value, 1, 5);
    Suff := Copy(Value, 6, 3);
    Result := Format('%5s/-%3s', [Pref, Suff]);
  end;
end;

function FormataNome(sNome: String): string;
const
<<<<<<< HEAD
  excecao: array[0..8] of string = (' da ', ' de ', ' do ', ' das ', ' dos ', ' e ', ' nº ', ' n° ', ' n ');
=======
  excecao: array[0..8] of string = (' da ', ' de ', ' do ', ' das ', ' dos ', ' e ', ' n� ', ' n� ', ' n ');
>>>>>>> 459321da64946831b0722d6306eb23de776933f8
var
  tamanho, j: integer;
  i: byte;
begin
  Result := AnsiLowerCase(sNome);
  tamanho := Length(Result);

  for j := 1 to tamanho do
    // Se � a primeira letra ou se o caracter anterior � um espa�o
    if (j = 1) or ((j>1) and (Result[j-1]=Chr(32))) then
      Result[j] := AnsiUpperCase(Result[j])[1];
  for i := 0 to Length(excecao)-1 do
    Result := StringReplace(Result,excecao[i],excecao[i],[rfReplaceAll, rfIgnoreCase]);
end;

end.
