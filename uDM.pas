unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, SqlTimSt;

type
  TDM = class(TDataModule)
    QuerySelection: TFDQuery;
    FDConn: TFDConnection;
    MySQLDriverLink: TFDPhysMySQLDriverLink;
    QuerySelectionid: TFDAutoIncField;
    QuerySelectionnome: TWideStringField;
    QuerySelectionsexo: TWideStringField;
    QuerySelectionendereco: TWideStringField;
    QuerySelectionbairro: TWideStringField;
    QuerySelectioncidade: TWideStringField;
    QuerySelectionuf: TWideStringField;
    QuerySelectionemail: TWideStringField;
    QuerySelectiontelefone: TWideStringField;
    QuerySelectioncelular: TWideStringField;
    QuerySelectiondata_mod: TSQLTimeStampField;
    QueryUpdate: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    FDQueryProd: TFDQuery;
    FDQueryProdid: TFDAutoIncField;
    FDQueryProdnome: TWideStringField;
    FDQueryProddescricao: TWideStringField;
    FDQueryProdvalor: TBCDField;
    FDQueryProdcusto: TBCDField;
    FDQueryProdtaxas: TFloatField;
    FDQueryProdfornecedor: TWideStringField;
    FDQueryProddata_mod: TSQLTimeStampField;
    FDQueryProdtotal: TBCDField;
    procedure QuerySelectionAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uMenu, uFunctions;

{$R *.dfm}

procedure TDM.QuerySelectionAfterScroll(DataSet: TDataSet);
var
Id: string;
begin
with frmMain do
  begin
    Id := Format('%.3d', [QuerySelectionid.Value]);
    lblCliAtualNome.Text := '(' +Id +') ' +QuerySelectionnome.Value;
    lblCliAtualEndereco.Text := 'Endere�o: ' +QuerySelectionendereco.Value +' - '
                                +QuerySelectionbairro.Value;
    lblCliAtualCidade.Text := 'Cidade: ' +QuerySelectioncidade.Value +'/' +QuerySelectionuf.Value;
    lblCliAtualEmail.Text := 'E-mail: ' +QuerySelectionemail.Value;
    lblCliAtualTelefones.Text := 'Telefone Comercial: ' +FormatarTelefone(QuerySelectiontelefone.Value) +' - Celular (WhatsApp): ' +FormatarTelefone(QuerySelectioncelular.Value);
    lblCliAtualCadastro.Text := 'Data de Cadastro: ' +SQLTimeStampToStr('', DM.QuerySelectiondata_mod.Value);
  end;
end;

end.
