unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, Data.Bind.GenData,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Ani, System.iOUtils, Math, DateUtils,
  {$IFDEF MSWINDOWS}
  System.Win.Registry, FMX.Edit, Data.Bind.DBScope, FMX.Layouts, FMX.ListBox, SqlTimSt,
  FMX.ComboEdit, FMX.Menus, FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart
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
    StyleBook: TStyleBook;
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
    rectLastRecords: TRectangle;
    PrototypeBindSource: TPrototypeBindSource;
    BindingsList: TBindingsList;
    BindSourceDB: TBindSourceDB;
    rectSearch: TRectangle;
    edtSearch: TEdit;
    rectGraph2: TRectangle;
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
    lblListDescCli: TLabel;
    rectInsertCli: TRectangle;
    Layout5: TLayout;
    lblInsertCliTitle: TLabel;
    Layout6: TLayout;
    rectFirstN: TRectangle;
    lblFirstN: TLabel;
    rectEndereco: TRectangle;
    lblEndereco: TLabel;
    rectSexo: TRectangle;
    lblSexo: TLabel;
    rectBairro: TRectangle;
    lblBairro: TLabel;
    rectCidade: TRectangle;
    lblCidade: TLabel;
    rectUF: TRectangle;
    lblUF: TLabel;
    rectEmail: TRectangle;
    lblEmail: TLabel;
    rectTelComercial: TRectangle;
    lblTelComercial: TLabel;
    rectCelular: TRectangle;
    lblCelular: TLabel;
    edtNome: TEdit;
    cbSexo: TComboBox;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    cbUF: TComboBox;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    edtCelular: TEdit;
    sbSaveCli: TSpeedButton;
    Image1: TImage;
    lblListTItleCli: TLabel;
    lblCliAtualTitle: TLabel;
    lblCliAtualNome: TLabel;
    lblCliAtualEndereco: TLabel;
    lblCliAtualCidade: TLabel;
    lblCliAtualEmail: TLabel;
    lblCliAtualTelefones: TLabel;
    lblCliAtualCadastro: TLabel;
    sbDelCli: TSpeedButton;
    sbEditCli: TSpeedButton;
    lblAst1: TLabel;
    lblAst2: TLabel;
    lblAst3: TLabel;
    lblAst4: TLabel;
    lblAst5: TLabel;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Line2: TLine;
    Line3: TLine;
    Chart2: TChart;
    LineSeries1: TAreaSeries;
    Image2: TImage;
    Image3: TImage;
    lbDescLastRec: TLabel;
    ListView2: TListView;
    rectGraphValues: TRectangle;
    lblGraphMonth: TLabel;
    lblGraphValue: TLabel;
    FloatAnimation2: TFloatAnimation;
    LinkListControlToField2: TLinkListControlToField;
    rectCliDetalhes: TRectangle;
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
    procedure FormDeactivate(Sender: TObject);
    procedure ArrastaJanela(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure sbSaveCliClick(Sender: TObject);
    procedure FormataCamposCliForm(Sender: TObject);
    procedure sbDelCliClick(Sender: TObject);
    procedure edtTelefoneKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtCelularKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Chart2ClickSeries(Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FloatAnimation2Finish(Sender: TObject);
  private
    { Private declarations }
    procedure TempFillGraphs;
    procedure ResetObjectFocus(Sender: TObject);
    procedure UpdateClientPanel;
    procedure UpdateLastReg;
    procedure UpdateClientsTable;
    procedure ClearClientForm;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uFunctions, uChart, uDM;

{$R *.fmx}

procedure TfrmMain.Chart2ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
Meses: Array of string;
begin
Meses := ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto',
          'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
//Captura valor do eixo Y na série em que o usuário clicou
if ValueIndex > 0 then
  begin
    rectGraphValues.Visible := False;
    lblGraphMonth.Text := Meses[ValueIndex-1];
    lblGraphValue.Text := LineSeries1.YValue[ValueIndex].ToString;
    rectGraphValues.Position.X := X.ToSingle-(rectGraphValues.Width/2);
    rectGraphValues.Position.Y := Y.ToSingle+(rectGraphValues.Height/2);
    rectGraphValues.Opacity := 1;
    Application.ProcessMessages;
    rectGraphValues.Visible := True;
  end;
end;

procedure TfrmMain.ClearClientForm;
begin
//Limpa campos da página de clientes
edtNome.Text := EmptyStr;
edtEndereco.Text := EmptyStr;
edtBairro.Text := EmptyStr;
edtCidade.Text := EmptyStr;
edtEmail.Text := EmptyStr;
edtTelefone.Text := EmptyStr;
edtCelular.Text := EmptyStr;
cbSexo.ItemIndex := -1;
cbUF.ItemIndex := -1;
end;

procedure TfrmMain.FloatAnimation2Finish(Sender: TObject);
begin
rectGraphValues.Visible := False;
end;

procedure TfrmMain.FormataCamposCliForm(Sender: TObject);
begin
//Formata edits com iniciais maiúsculas
if Trim(edtNome.Text)<>EmptyStr then edtNome.Text := FormataNome(edtNome.Text);
if Trim(edtEndereco.Text)<>EmptyStr then edtEndereco.Text := FormataNome(edtEndereco.Text);
if Trim(edtBairro.Text)<>EmptyStr then edtBairro.Text := FormataNome(edtBairro.Text);
if Trim(edtCidade.Text)<>EmptyStr then edtCidade.Text := FormataNome(edtCidade.Text);
end;

procedure TfrmMain.edtCelularKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
if not (CharInSet(KeyChar,['0'..'9']))then
begin
  Key := 0;
  KeyChar := #0;
end;
end;

procedure TfrmMain.edtSearchEnter(Sender: TObject);
begin
rectSearch.Width := 234;
edtSearch.Text := EmptyStr;
edtSearch.TextPrompt := 'Digite sua busca';
end;

procedure TfrmMain.edtSearchExit(Sender: TObject);
begin
rectSearch.Width := 72;
edtSearch.Text := EmptyStr;
edtSearch.TextPrompt := 'Pesquisa';
end;

procedure TfrmMain.edtTelefoneKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
if not (CharInSet(KeyChar,['0'..'9']))then
begin
  Key := 0;
  KeyChar := #0;
end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmMain.FormDeactivate(Sender: TObject);
begin
ResetObjectFocus(Sender);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
TempFillGraphs;
frmMain.Width := 980;
frmMain.Height := 680;
rectPopupExit.Visible := False;
rectGraphValues.Visible := False;
UpdateLastReg;
//Posiciona asteriscos em simetria com os labels de título
lblAst1.Position.X := lblFirstN.Position.X +lblFirstN.Width +1;
lblAst1.Position.Y := lblFirstN.Position.Y -1;
lblAst2.Position.X := lblEndereco.Position.X +lblEndereco.Width +1;
lblAst2.Position.Y := lblEndereco.Position.Y -1;
lblAst3.Position.X := lblBairro.Position.X +lblBairro.Width +1;
lblAst3.Position.Y := lblBairro.Position.Y -1;
lblAst4.Position.X := lblCidade.Position.X +lblCidade.Width +1;
lblAst4.Position.Y := lblCidade.Position.Y -1;
lblAst5.Position.X := lblUF.Position.X +lblUF.Width +1;
lblAst5.Position.Y := lblUF.Position.Y -1;
end;

procedure TfrmMain.ArrastaJanela(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
Self.StartWindowDrag;
end;

procedure TfrmMain.ResetObjectFocus(Sender: TObject);
begin
//Redefine obejtos ao seu estado inicial e muda aba ativa
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
//Abre a tela de clientes, atauliza dados e foca no campo nome
TabControl.ActiveTab := tbClientes;
ResetObjectFocus(Sender);
UpdateClientPanel;
UpdateLastReg;
edtNome.SetFocus;
end;

procedure TfrmMain.sbCloseBtnClick(Sender: TObject);
begin
ResetObjectFocus(Sender);
Close;
end;

procedure TfrmMain.sbConPagClick(Sender: TObject);
begin
TabControl.ActiveTab := tbContasPagar;
ResetObjectFocus(Sender);
end;

procedure TfrmMain.sbConRecClick(Sender: TObject);
begin
TabControl.ActiveTab := tbContasReceber;
ResetObjectFocus(Sender);
end;

procedure TfrmMain.sbDashClick(Sender: TObject);
begin
TabControl.ActiveTab := tbDashboard;
ResetObjectFocus(Sender);
TempFillGraphs;
end;

procedure TfrmMain.sbDelCliClick(Sender: TObject);
begin
//Verificar se há cliente selecionado e exibe mensagem de confirmação de exclusão
if ListView1.Selected.Index > -1 then
  if MessageDlg('Deseja mesmo excluir o cadastro selecionado?', TMsgDlgType.mtConfirmation,
  [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
        DM.QueryUpdate.Close;
        DM.QueryUpdate.SQL.Clear;
        DM.QueryUpdate.SQL.Add('DELETE FROM clientes WHERE id=' +IntToStr(DM.QuerySelectionid.Value));
        DM.QueryUpdate.ExecSQL(True);
        UpdateLastReg;
    end;
end;

procedure TfrmMain.sbNotasClick(Sender: TObject);
begin
TabControl.ActiveTab := tbEmitirNotas;
ResetObjectFocus(Sender);
end;

procedure TfrmMain.sbProdClick(Sender: TObject);
begin
TabControl.ActiveTab := tbProdutos;
ResetObjectFocus(Sender);
end;

procedure TfrmMain.sbQuitClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMain.sbSaveCliClick(Sender: TObject);
begin
if (Trim(edtNome.Text) <> EmptyStr) or (Trim(edtEndereco.Text) <> EmptyStr)
or (Trim(edtBairro.Text) <> EmptyStr) or (Trim(edtCidade.Text) <> EmptyStr) then
  begin
  // Verifica duplicidade de cadastro e pergunta se o usuário deseja inserir mesmo assim
    if VerificaEmail(edtEmail.Text) = False then
      begin
        MessageDlg('O valor digitado no campo email é inválido.', TMsgDlgType.mtError,
                [TMsgDlgBtn.mbOK], 0);
        Abort
      end;
    if VerificaDuplicidade(edtNome.Text, DM.QueryUpdate) = True then
      begin
        if MessageDlg('Um cliente com o nome informado já consta cadastrado.' +#13
                      +'Deseja incluir um novo registro com o mesmo nome?', TMsgDlgType.mtWarning,
                      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
          begin
            UpdateClientsTable;
            ClearClientForm;
            DM.QuerySelection.Open('SELECT * FROM clientes ORDER BY nome');
            DM.QuerySelection.First;
          end;
      end else begin
        UpdateClientsTable;
        ClearClientForm;
        DM.QuerySelection.Open('SELECT * FROM clientes ORDER BY nome');
        DM.QuerySelection.First;
      end;
  end else begin
    MessageDlg('Um ou mais campos obrigatórios não foi preenchido.' +#13
                +'Preencha os campos obrigatórios antes de adicionar.', TMsgDlgType.mtError,
                [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TfrmMain.sbUsernameClick(Sender: TObject);
var
PosDiff, PopupPos: Single;
begin
//Ativa popup do Menu de configurações e logout
rectPopupExit.Visible := not rectPopupExit.Visible;
//Verificar tamanho do nome do usuário e alinha popup
if rectPopupExit.Visible = True then
  begin
    PopupPos := rectUser.Position.X + sbUsername.Position.X + sbUsername.Width;
    PosDiff := PopupPos - rectPopupExit.Width;
    rectPopupExit.Position.X := PosDiff;
  end;
end;

procedure TfrmMain.TempFillGraphs;
var
i: integer;
begin
//Procedure temporária que preenche os gráficos
Series1.Clear;
Series2.Clear;
LineSeries1.Clear;
Randomize;
for i := 0 to 12 do
  begin
    with Series1 do
      begin
        if Count > 0 then
          AddXY(Count, RandomRange(10,30), '')
        else
          AddXY(0, RandomRange(10,30), '');
      end;
    with Series2 do
      begin
        if Count > 0 then
          AddXY(Count, RandomRange(10,40), '')
        else
          AddXY(0, RandomRange(20,40), '');
      end;
    with LineSeries1 do
      begin
        if Count > 0 then
          AddXY(Count, RandomRange(30,240), '')
        else
          AddXY(0, 0, '');
      end;
  end;
end;

procedure TfrmMain.UpdateClientPanel;
begin
  //Popular labels com nome do cliente atual
  lblCliAtualNome.Text := DM.QuerySelectionnome.Value;
  lblCliAtualEndereco.Text := 'Endereço: ' +DM.QuerySelectionendereco.Value +' - '
                              +DM.QuerySelectionbairro.Value;
  lblCliAtualCidade.Text := 'Cidade: ' +DM.QuerySelectioncidade.Value +'/' +DM.QuerySelectionuf.Value;
  lblCliAtualEmail.Text := 'E-mail: ' +DM.QuerySelectionemail.Value;
  lblCliAtualTelefones.Text := 'Telefone Comercial: ' +FormatarTelefone(DM.QuerySelectiontelefone.Value)
                              +' - Celular (WhatsApp): ' +FormatarTelefone(DM.QuerySelectioncelular.Value);
  lblCliAtualCadastro.Text := 'Data de Cadastro: ' +SQLTimeStampToStr('', DM.QuerySelectiondata_mod.Value);
end;

procedure TfrmMain.UpdateClientsTable;
const
vCommand = 'INSERT INTO clientes (nome,sexo,endereco,bairro,cidade,uf,email,telefone,celular) VALUES ';
var
vCliente: string;
begin
//Insere cliente no banco de dados
vCliente := vCommand +'(' +QuotedStr(edtNome.Text) +',' +QuotedStr(cbSexo.Items[cbSexo.ItemIndex])
            +',' +QuotedStr(edtEndereco.Text) +',' +QuotedStr(edtBairro.Text) +','
            +QuotedStr(edtCidade.Text) +',' +QuotedStr(cbUF.Items[cbUF.ItemIndex]) +','
            +QuotedStr(edtEmail.Text) +',' +QuotedStr(edtTelefone.Text) +','
            +QuotedStr(edtCelular.Text) +');';
DM.QueryUpdate.Close;
DM.QueryUpdate.SQL.Clear;
DM.QueryUpdate.SQL.Add(vCliente);
DM.QueryUpdate.ExecSQL(True);
UpdateLastReg;
end;

procedure TfrmMain.UpdateLastReg;
var
LastReg, LastDate, TotalReg:  string;
begin
//Atualiza as informações iniciais da tela de cadastro e visualização de clietes
DM.QuerySelection.Open('SELECT * FROM clientes ORDER BY data_mod');
DM.QuerySelection.Last;
LastReg := DM.QuerySelectionnome.Value;
LastDate := SQLTimeStampToStr('', DM.QuerySelectiondata_mod.Value);
TotalReg := IntToStr(DM.QuerySelection.RecordCount);
lblListDescCli.Text := 'Última alteração: ' +LastReg +sLineBreak
                      +'Data da última alteração: ' +LastDate +sLineBreak
                      +'Total de registros: ' +TotalReg;
DM.QuerySelection.Open('SELECT * FROM clientes ORDER BY nome');
DM.QuerySelection.First;
end;

procedure TfrmMain.sbMovimentoClick(Sender: TObject);
begin
TabControl.ActiveTab := tbMovDiario;
ResetObjectFocus(Sender);
end;

end.