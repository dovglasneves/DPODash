unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, Data.Bind.GenData,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Ani;

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
    lineSeparator: TLine;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbDashClick(Sender: TObject);
    procedure sbCliClick(Sender: TObject);
    procedure sbProdClick(Sender: TObject);
    procedure sbNotasClick(Sender: TObject);
    procedure sbUsernameClick(Sender: TObject);
    procedure sbQuitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
frmMain.Width := 980;
frmMain.Height := 680;
end;

procedure TfrmMain.sbCliClick(Sender: TObject);
begin
TabControl.ActiveTab := tbClientes;
end;

procedure TfrmMain.sbDashClick(Sender: TObject);
begin
TabControl.ActiveTab := tbDashboard;
end;

procedure TfrmMain.sbNotasClick(Sender: TObject);
begin
TabControl.ActiveTab := tbEmitirNotas;
end;

procedure TfrmMain.sbProdClick(Sender: TObject);
begin
TabControl.ActiveTab := tbProdutos;
end;

procedure TfrmMain.sbQuitClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMain.sbUsernameClick(Sender: TObject);
begin
rectPopupExit.Visible := not rectPopupExit.Visible;
end;

end.