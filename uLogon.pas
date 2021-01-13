unit uLogon;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, FireDAC.Comp.DataSet, System.Hash, FMX.WebBrowser;

type
  TfrmLogon = class(TForm)
    img_bg: TImage;
    rectPositionBtns: TRectangle;
    sbQuit: TSpeedButton;
    sbLogin: TSpeedButton;
    StyleBook1: TStyleBook;
    rectCenterAlign: TRectangle;
    edtLogin: TEdit;
    edtPass: TEdit;
    FDConnection: TFDConnection;
    MySQLDriverLink: TFDPhysMySQLDriverLink;
    Query1: TFDQuery;
    Query1id: TFDAutoIncField;
    Query1usuario: TWideStringField;
    Query1senha: TWideStringField;
    Query1prioridade_acesso: TIntegerField;
    Query1nome_user: TWideStringField;
    Query1email_user: TWideStringField;
    procedure sbQuitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbLoginClick(Sender: TObject);
    procedure FocusNext(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtPassKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure img_bgMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Single);
  private
    { Private declarations }
    Login, HashMD5: string;
    AcessLevel: integer;
  public
    { Public declarations }
  end;

var
  frmLogon: TfrmLogon;
  Attempts: integer;

implementation

{$R *.fmx}

uses uMenu;

procedure TfrmLogon.edtPassKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if Key = vkReturn then
 begin
   sbLoginClick(Sender);
 end;
end;

procedure TfrmLogon.FocusNext(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if Key = vkReturn then
 begin
 Key := vkTab;
 KeyDown(Key, KeyChar, Shift);
 end;
end;

procedure TfrmLogon.FormShow(Sender: TObject);
begin
Attempts := 0;
AcessLevel := 0;
edtLogin.SetFocus;
end;

procedure TfrmLogon.img_bgMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
Self.StartWindowDrag;
end;

procedure TfrmLogon.sbLoginClick(Sender: TObject);
var
InitialL, User, Mail: string;
SizeDiff: Single;
begin
try
  FDConnection.Connected := True;
  if (Trim(edtLogin.Text)=EmptyStr) or (Trim(edtPass.Text)=EmptyStr) then
    begin
      MessageDlg('Os campos login e/ou senha n�o podem estar vazios.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      Abort;
    end;
  Login := edtLogin.Text;
  HashMD5 := THashMD5.GetHashString(edtPass.Text);
  Query1.SQL.Clear;
  Query1.SQL.Text := 'select * from dpousers where usuario=' +QuotedStr(Login) +' and senha=' +QuotedStr(HashMD5);
  Query1.Open;
  if not Query1.Eof then
    begin
      User := Query1.FieldByName('nome_user').Value;
      Mail := Query1.FieldByName('email_user').Value;
      AcessLevel := Query1.FieldByName('prioridade_acesso').Value;
      with frmMain do
      begin
        sbUsername.Text := User;
        lbSize.Text := User;
        lbNomeP.Text := User;
        lbMail.Text := Mail;
          case AcessLevel of
            0: lbAcessLevel.Text := 'Acesso Restrito';
            1: lbAcessLevel.Text := 'Administrador';
            2: lbAcessLevel.Text := 'Usu�rio';
          end;
        if lbMail.Width > lbNomeP.Width then
          begin
            SizeDiff := lbMail.Width+20;
            rectPopupExit.Width := SizeDiff;
            rectPopupExit.Position.X := frmMain.Width-(SizeDiff+40);
          end;
        sbUsername.Width := lbSize.Width + 29;
        InitialL := Copy(User,0,1);
        lbInitial.Text := InitialL;
      end;
      frmMain.Show;
    end else
    begin
      MessageDlg('Login ou senha incorreta! Tente novamente.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtPass.Text := '';
      edtPass.SetFocus;
      Attempts:=Attempts+1;
      if Attempts >= 3 then
      begin
        MessageDlg('Caso n�o se lembre da senha entre em contato com o admin do sistema.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
        edtLogin.Text := '';
        edtLogin.SetFocus;
        Attempts := 0;
      end;
    end;
finally
  FDConnection.Connected := False;
  frmMain.Parent := Self;
  Application.MainForm := frmMain;
  frmLogon.Close;
end;
end;

procedure TfrmLogon.sbQuitClick(Sender: TObject);
begin
Close;
end;

end.
