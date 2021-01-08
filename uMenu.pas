unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, Data.Bind.GenData,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Ani, FMX.WebBrowser, System.iOUtils, Math,
  {$IFDEF MSWINDOWS}
  System.Win.Registry, FMX.Edit, Data.Bind.DBScope, FMX.Layouts
  {$ENDIF};

type
  TfrmMain = class(TForm)
    rectIcon: TRoundRect;
    lbInitial: TLabel;
    rectTitle: TRectangle;
    rectUser: TRectangle;
    imgTitle: TImage;
    rectBG: TRectangle;
    TabControl: TTabControl;
    tbDashboard: TTabItem;
    rectDashBG: TRectangle;
    rectNavBar: TRectangle;
    sbDash: TSpeedButton;
    StyleBook1: TStyleBook;
    sbCli: TSpeedButton;
    lbDescDash: TLabel;
    tbClientes: TTabItem;
    rectCliBG: TRectangle;
    lbDescCli: TLabel;
    sbUsername: TSpeedButton;
    sbProd: TSpeedButton;
    tbProdutos: TTabItem;
    rectProBG: TRectangle;
    lbDescPro: TLabel;
    rectBorder: TRectangle;
    lbSize: TLabel;
    sbNotas: TSpeedButton;
    tbEmitirNotas: TTabItem;
    rectNotasBG: TRectangle;
    lbDescNotas: TLabel;
    lineSeparator1: TLine;
    rectPopupExit: TRectangle;
    sbLogout: TSpeedButton;
    FloatAnimation1: TFloatAnimation;
    rectBtnBG1: TRectangle;
    rectBtnBG2: TRectangle;
    sbQuit: TSpeedButton;
    rectBtnBG3: TRectangle;
    sbConfig: TSpeedButton;
    RectPopupTitle: TRectangle;
    lbNomeP: TLabel;
    rectPopupMail: TRectangle;
    lbMail: TLabel;
    Line1: TLine;
    rectAcessLevel: TRectangle;
    lbAcessLevel: TLabel;
    lineSeparator2: TLine;
    sbConPag: TSpeedButton;
    sbConRec: TSpeedButton;
    lineSeparator3: TLine;
    sbMovimento: TSpeedButton;
    tbContasPagar: TTabItem;
    rectConPagBG: TRectangle;
    lbDescConPag: TLabel;
    tbContasReceber: TTabItem;
    rectConRecBG: TRectangle;
    lbDescConRec: TLabel;
    tbMovDiario: TTabItem;
    rectMovDiarioBG: TRectangle;
    lbDescMovDiario: TLabel;
    rectGraph1: TRectangle;
    lbTilteGraph1: TLabel;
    lbFoorterGraph1: TLabel;
    rectLastRecords: TRectangle;
    lbDescLastRec: TLabel;
    Rect: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    rectSearch: TRectangle;
    edtSearch: TEdit;
    rectGraph2: TRectangle;
    lbTItleGraph2: TLabel;
    lbFooterGraph2: TLabel;
    rectData: TRectangle;
    sbCloseBtn: TSpeedButton;
    lbDados: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    rectClientesList: TRectangle;
    Text1: TText;
    ListView1: TListView;
    LinkListControlToField1: TLinkListControlToField;
    lblListTitleCli: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbDashClick(Sender: TObject);
    procedure sbCliClick(Sender: TObject);
    procedure sbProdClick(Sender: TObject);
    procedure sbNotasClick(Sender: TObject);
    procedure sbUsernameClick(Sender: TObject);
    procedure sbQuitClick(Sender: TObject);
    procedure sbConPagClick(Sender: TObject);
    procedure sbConRecClick(Sender: TObject);
    procedure sbMovimentoClick(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure edtSearchExit(Sender: TObject);
    procedure sbCloseBtnClick(Sender: TObject);
    procedure rectGraph1Click(Sender: TObject);
    procedure lbTilteGraph1Click(Sender: TObject);
    procedure rectDataClick(Sender: TObject);
    procedure lbTItleGraph2Click(Sender: TObject);
    procedure rectGraph2Click(Sender: TObject);
    procedure RectClick(Sender: TObject);
    procedure lbDescLastRecClick(Sender: TObject);
    procedure rectLastRecordsClick(Sender: TObject);
    procedure rectDashBGClick(Sender: TObject);
    procedure imgTitleClick(Sender: TObject);
    procedure rectUserClick(Sender: TObject);
    procedure rectTitleClick(Sender: TObject);
    procedure lbFoorterGraph1Click(Sender: TObject);
    procedure lbFooterGraph2Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
    procedure ResetAFocus(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uChart, uDM;

{$R *.fmx}

procedure TfrmMain.edtSearchEnter(Sender: TObject);
begin
rectSearch.Width := 248;
edtSearch.TextPrompt := 'Digite sua busca';
edtSearch.ShowHint := True;
ResetAFocus(Sender);
end;

procedure TfrmMain.edtSearchExit(Sender: TObject);
begin
rectSearch.Width := 72;
edtSearch.TextPrompt := 'Pesquisa';
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmMain.FormDeactivate(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
frmMain.Width := 980;
frmMain.Height := 680;
rectGraph1.ChartCircular('', 63, $FFE04242);
rectGraph2.ChartBarHorizontal('', '60:Jan;45:Fev;23:Mar;50:Abr;20:Mai;35:Jun;'
+'12:Jul;65:Ago;56:Set;34:Out;35:Nov;50:Dez', $FFE04242);
end;

procedure TfrmMain.imgTitleClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.lbDescLastRecClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.lbFoorterGraph1Click(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.lbFooterGraph2Click(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.lbTilteGraph1Click(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.lbTItleGraph2Click(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.RectClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectDashBGClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectDataClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectGraph1Click(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectGraph2Click(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectLastRecordsClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectTitleClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.rectUserClick(Sender: TObject);
begin
ResetAFocus(Sender);
end;

procedure TfrmMain.ResetAFocus(Sender: TObject);
begin
edtSearch.ResetFocus;
rectPopupExit.Visible := False;
if (Sender is TSpeedButton) then
  begin
    sbDash.IsPressed := False;
    sbCli.IsPressed := False;
    sbProd.IsPressed := False;
    sbNotas.IsPressed := False;
    sbConPag.IsPressed := False;
    sbConRec.IsPressed := False;
    sbMovimento.IsPressed := False;
    TSpeedButton(Sender).IsPressed := True;
  end;
end;

procedure TfrmMain.sbCliClick(Sender: TObject);
begin
TabControl.ActiveTab := tbClientes;
ResetAFocus(Sender);
end;

procedure TfrmMain.sbCloseBtnClick(Sender: TObject);
begin
ResetAFocus(Sender);
Close;
end;

procedure TfrmMain.sbConPagClick(Sender: TObject);
begin
TabControl.ActiveTab := tbContasPagar;
ResetAFocus(Sender);
end;

procedure TfrmMain.sbConRecClick(Sender: TObject);
begin
TabControl.ActiveTab := tbContasReceber;
ResetAFocus(Sender);
end;

procedure TfrmMain.sbDashClick(Sender: TObject);
begin
TabControl.ActiveTab := tbDashboard;
ResetAFocus(Sender);
end;

procedure TfrmMain.sbNotasClick(Sender: TObject);
begin
TabControl.ActiveTab := tbEmitirNotas;
ResetAFocus(Sender);
end;

procedure TfrmMain.sbProdClick(Sender: TObject);
begin
TabControl.ActiveTab := tbProdutos;
ResetAFocus(Sender);
end;

procedure TfrmMain.sbQuitClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMain.sbUsernameClick(Sender: TObject);
var
PosDiff, PopupPos: Single;
begin
rectPopupExit.Visible := not rectPopupExit.Visible;
if rectPopupExit.Visible = True then
  begin
    PopupPos := rectUser.Position.X + sbUsername.Position.X + sbUsername.Width;
    PosDiff := PopupPos - rectPopupExit.Width;
    rectPopupExit.Position.X := PosDiff;
  end;
end;

procedure TfrmMain.sbMovimentoClick(Sender: TObject);
begin
TabControl.ActiveTab := tbMovDiario;
ResetAFocus(Sender);
end;

end.
