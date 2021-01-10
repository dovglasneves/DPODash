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
    QueryCli: TFDQuery;
    FDConn: TFDConnection;
    MySQLDriverLink: TFDPhysMySQLDriverLink;
    QueryCliid: TFDAutoIncField;
    QueryClinome: TWideStringField;
    QueryClisexo: TWideStringField;
    QueryCliendereco: TWideStringField;
    QueryClibairro: TWideStringField;
    QueryClicidade: TWideStringField;
    QueryCliuf: TWideStringField;
    QueryCliemail: TWideStringField;
    QueryClitelefone: TWideStringField;
    QueryClicelular: TWideStringField;
    QueryClidata_mod: TSQLTimeStampField;
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
    procedure QueryCliAfterScroll(DataSet: TDataSet);
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

procedure TDM.QueryCliAfterScroll(DataSet: TDataSet);
begin
with frmMain do
  begin
    lblCliAtualNome.Text := QueryClinome.Value;
    lblCliAtualEndereco.Text := 'Endere�o: ' +QueryCliendereco.Value +' - '
                                +QueryClibairro.Value;
    lblCliAtualCidade.Text := 'Cidade: ' +QueryClicidade.Value +'/' +QueryCliuf.Value;
    lblCliAtualEmail.Text := 'E-mail: ' +QueryCliemail.Value;
    lblCliAtualTelefones.Text := 'Telefone Comercial: ' +FormatarTelefone(QueryClitelefone.Value) +' - Celular (WhatsApp): ' +FormatarTelefone(QueryClicelular.Value);
    lblCliAtualCadastro.Text := 'Data de Cadastro: ' +SQLTimeStampToStr('', DM.QueryClidata_mod.Value);
  end;
end;

end.
