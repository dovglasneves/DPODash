unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
