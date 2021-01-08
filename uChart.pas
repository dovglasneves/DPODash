unit uChart;

interface

uses
  FMX.Objects, System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.PlatForm,FMX.Effects,
  RegularExpressions, FMX.SearchBox,
  FMX.Dialogs,FMX.ListBox;

type
   TRectangleHelper = class helper for TRectangle
   procedure ChartBarHorizontal(Titulo, Rotulos, Valores: String); overload;
   procedure ChartBarHorizontal(Titulo,Valores : String); overload;
   procedure ChartBarHorizontal(Titulo,Valores : String; Cor :TAlphaColor); overload;
   procedure ChartCircular(Titulo:String;Valor :Integer); overload;
   procedure ChartCircular(Titulo:String;Valor :Integer;Cor :TAlphaColor); overload;
end;

type
  TTipo = (vertical,horizontal,circular,calendario,timeline);

type
  TSerie = class
    Valor,
    Cor :Integer;
    Hint :String;
  end;

type
  TGrafico = class

  private
    FValores: TDictionary<String, TSerie>;
    FMax: Integer;
    FTipo: TTipo;
    FTitulo: String;
    FCor: TAlphaColor;
    FCorFundo: TAlphaColor;
    procedure SetValores(const Value: TDictionary<String, TSerie>);
    procedure SetMax(const Value: Integer);
    procedure SetTipo(const Value: TTipo);
    procedure SetTitulo(const Value: String);
    procedure SetCor(const Value: TAlphaColor);
    procedure SetCorFundo(const Value: TAlphaColor);

    procedure Serie(Comp :TVertScrollBox; Texto,Texto2 :String;Tipo :Integer = 1); overload;
    procedure Serie(Comp :THorzScrollBox ;Por1 :Integer;
      Texto :String); overload;

    procedure Serie(Comp :TCircle; Valor :Integer); overload;

  protected
    property Valores : TDictionary<String,TSerie> read FValores write SetValores;
    property Tipo :TTipo read FTipo write SetTipo;
  public
    property Max :Integer read FMax write SetMax;
    property Titulo :String read FTitulo write SetTitulo;
    property Cor :TAlphaColor read FCor write SetCor;
    property CorFundo :TAlphaColor read FCorFundo write SetCorFundo;
    constructor Create(Comp : TRectangle;Tipo :TTipo);
    destructor Destroy; override;
    procedure AddSerie(int1 : Integer ;Hint :string);

    procedure CardMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure CardDragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure CardDragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);

    procedure DiaClick(Sender :TObject);
//    procedure AddSerie()
  end;

implementation

var
  Serie :TSerie;
  i,
  TempValue, MaxValue :Integer;
  Vert : TVertScrollBox;
  horz : THorzScrollBox;
  circ  : TCircle;
  rFundo,
  rBar :  TRectangle;
  sTitulo,
  sValor : TText;
  Sombra: TShadowEffect;
  topo, mes   : TLayout;
  lista :TListBox;
  serc :TSearchBox;

{ TGrafico }

procedure TGrafico.AddSerie(int1 : Integer ;Hint :string);
begin

if Tipo = horizontal then begin
  Serie(Horz,int1,Hint);
end else if Tipo = circular then begin

end;
inc(i)

end;

procedure TGrafico.CardDragDrop(Sender: TObject; const Data: TDragObject;
  const Point: TPointF);
begin
   if Sender is TVertScrollBox then begin
      TControl(Data.Source).Position.Y:= Point.Y;
      TControl(Sender).AddObject(TControl(Data.Source));
   end;
end;

procedure TGrafico.CardDragOver(Sender: TObject; const Data: TDragObject;
  const Point: TPointF; var Operation: TDragOperation);
begin
   Operation := TDragOperation.Copy;
end;

procedure TGrafico.CardMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var Svc: IFMXDragDropService;
    DragData: TDragObject;
    DragImage: TBitmap;
begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXDragDropService, Svc) then begin
      DragImage       := TControl(Sender).MakeScreenshot;
      DragData.Source := Sender;
      DragData.Data   := DragImage;
      try
        Svc.BeginDragDrop(Application.MainForm, DragData, DragImage);
      finally
         DragImage.Free;
      end;
   end;

end;

constructor TGrafico.Create(Comp : TRectangle;Tipo :TTipo);
var Line1: TLine;

begin

   for I := Comp.ComponentCount - 1 downto 0 do
      Comp.Components[I].Free;

   Cor      := TAlphaColors.Cornflowerblue;
   CorFundo := Comp.Fill.Color;
   Max      := 0;

   Sombra := TShadowEffect.Create(Comp);
   Sombra.Distance := 1;
   Sombra.Direction := 45;
   Sombra.Softness := 0.3;
   Sombra.Opacity := 0.1;
   Sombra.ShadowColor := TAlphaColors.Black;
   Sombra.Parent :=  Comp;

   topo := TLayout.Create(Comp);
   topo.Align := TAlignLayout.Top;
   topo.Size.Height := 33;
   topo.Size.PlatformDefault := False;
   topo.Parent := Comp;

   i := 0;
   Self.Tipo := Tipo;
   if Tipo = horizontal then begin
      horz := THorzScrollBox.Create(topo);
      horz.Parent         := Comp;
      horz.Align          := TAlignLayout.Client;
      horz.Margins.Top    := 5;
      horz.Margins.Left   := 5;
      horz.Margins.Right  := 5;
      horz.Margins.Bottom := 0;

   end else if Tipo = circular then begin
      circ := TCircle.Create(Comp);
      circ.Parent := Comp;
      circ.Stroke.Color := Comp.Fill.Color;
      circ.Align := TAlignLayout.Center;
      circ.Size.Width := 120;
      circ.Size.Height := 120;
      circ.Size.PlatformDefault := False
   end;

end;

destructor TGrafico.Destroy;
begin
  inherited;

  Valores.Free;

end;

procedure TGrafico.DiaClick(Sender: TObject);
begin
   serc.Text := (TText(Sender).Text);
end;

procedure TGrafico.Serie(Comp: THorzScrollBox; Por1: Integer; Texto: String);
var
   arr_series,arr_valor :TArray<String>;
begin
   rFundo := TRectangle.Create(Comp);
   rFundo.Parent        := Comp;
   rFundo.Align         := TAlignLayout.Left;
   rFundo.Margins.Left  := 5;
   rFundo.Margins.Top   := 10;
   rFundo.Margins.Right := 5;
   rFundo.Height        := Comp.Height;
   rFundo.Width         := Comp.Width  / Max -10 ;
   rFundo.Position.X    := 0;
   rFundo.Position.Y    := 170;
   rFundo.Size.PlatformDefault := False;
   rFundo.Stroke.Kind   := TBrushKind.None;

   rBar := TRectangle.Create(rFundo);
   rBar.Align      := TAlignLayout.Bottom;
   rBar.Fill.Color := TAlphaColors.Cornflowerblue;
   rBar.Name  := 'Ret_'+Inttostr(i);
   rBar.Size.Height           :=  0;
   rBar.Size.PlatformDefault := False;
   rBar.ClipChildren := True;
   rBar.Parent       := rFundo;
   rBar.Stroke.Kind  := TBrushKind.None;
   rBar.Hint         := IntToStr(Por1);
   rBar.ShowHint     := True;

   { Teste sValor no TBarRect }
   sValor := TText.Create(rFundo);
   sValor.Parent        := rFundo;
   sValor.Align         := TAlignLayout.Contents;
   sValor.Position.X    := 0;
   sValor.Position.Y    := 0;
   sValor.RotationAngle := 0;
   sValor.TextSettings.HorzAlign := TTextAlign.Center;
   sValor.Width         := rFundo.Width;
   sValor.Height        := 22;
   sValor.HitTest       := False;
   sValor.Text := IntToStr(Por1);
   { Fim do Teste }

   rBar.AnimateFloat('Height',(rFundo.Height  / 100 ) * Por1,1, TAnimationType.In,TInterpolationType.Cubic);
   sValor.TextSettings.VertAlign := TTextAlign.Trailing;

end;

procedure TGrafico.Serie(Comp: TCircle; Valor: Integer);
var
  Pie :TPie;
  Cir :TCircle;
begin
// Valor Principal
  Pie              := TPie.Create(Comp);
  Pie.Parent       := Comp;
  Pie.Align        := TAlignLayout.Client;
  Pie.Fill.Color   := Cor;
  Pie.Stroke.Color := CorFundo;
  Pie.Size.Width           := 90;
  Pie.Size.Height          := 90;
  Pie.Size.PlatformDefault := False;
  Pie.StartAngle := 0;
  Pie.RotationAngle := -90;
  Pie.EndAngle := 0;

// Centro do Circulo
  Cir := TCircle.Create(Pie);
  Cir.Parent      := Pie;
  Cir.Fill.Color := TAlphaColors.White;
  Cir.Stroke.Kind := TBrushKind.None;
  Cir.Align       := TAlignLayout.Center;
  Cir.Size.Width  := 70;
  Cir.Size.Height := 70;
  Cir.Size.PlatformDefault := False;

// Título e porcentagem
  sTitulo := TText.Create(Cir);
  sTitulo.Parent        := Cir;
  sTitulo.Align         := TAlignLayout.Client;
  sTitulo.Position.X    := 0;
  sTitulo.Position.Y    := 0;
  sTitulo.RotationAngle := 90;
  sTitulo.TextSettings.HorzAlign := TTextAlign.Center;
  sTitulo.TextSettings.Font.Style := [TFontStyle.fsBold];
  sTitulo.TextSettings.Font.Size := 15;
  sTitulo.Width         := Cir.Width;
  sTitulo.HitTest       := False;
  sTitulo.Text := Inttostr(Valor)+'%';

// Animação
  Pie.AnimateFloat('StartAngle',Valor*3.6,1, TAnimationType.In,TInterpolationType.Cubic);


end;

procedure TGrafico.Serie(Comp: TVertScrollBox; Texto,Texto2: String;Tipo :Integer = 1);
var
   Layout : TLayout;
   Circle: TCircle;
   CalloutRectangle: TCalloutRectangle;
   Label2,Label1 : TLabel;
   Rectangle  : TRectangle;
   Shaddow    :TShadowEffect;
begin
   Layout:= TLayout.Create(Comp);
   Layout.Parent  := Vert;
   Layout.Align   := TAlignLayout.Top;
   Layout.Height  := 73;
   Layout.Width   := Comp.Width;
   Layout.Padding.Right := 10;

   Layout.Position.Y := 2000;

   Circle:= TCircle.Create(Layout);
   Circle.Parent := Layout;

   CalloutRectangle:= TCalloutRectangle.Create(Layout);
   CalloutRectangle.Parent := Layout;
   CalloutRectangle.Align := TAlignLayout.None;
   CalloutRectangle.Fill.Color := TAlphaColors.White;
   CalloutRectangle.Anchors := [TAnchorKind.akLeft,TAnchorKind.akBottom,TAnchorKind.akTop,TAnchorKind.akTop];
   CalloutRectangle.Margins.Top := 2;
   CalloutRectangle.Margins.Right := 2;
   CalloutRectangle.Margins.Bottom := 2;
   CalloutRectangle.Position.X := 46;
   CalloutRectangle.Position.Y := 2;
   CalloutRectangle.Size.Width := Layout.Width - 50;
   CalloutRectangle.Size.Height := Layout.Height - 6;
   CalloutRectangle.Stroke.Kind := TBrushKind.None;
   CalloutRectangle.CalloutWidth := 10;
   CalloutRectangle.CalloutLength := 10;
   CalloutRectangle.CalloutPosition := TCalloutPosition.Left;

   Label2 := TLabel.Create(Layout);
   Label2.Align := TAlignLayout.Center;
   Label2.TextSettings.VertAlign := TTextAlign.Center;
   Label2.TextSettings.HorzAlign := TTextAlign.Center;
   Label2.Size.Width := 34;
   Label2.Size.Height := 17;
   Label2.Text := '';
   Label2.Text := Texto;
   Label2.TabOrder := 0;
   Label2.Parent := Circle;

   if Tipo = 1 then begin
      Circle.Fill.Color := Cor;
      Circle.Position.X := 17;
      Circle.Position.Y := 8;
      Circle.Size.Width := 16;
      Circle.Size.Height := 17;
      Circle.Stroke.Kind :=TBrushKind.None;
      CalloutRectangle.CalloutOffset := 10;
      Label2.Visible := False;
   end else begin
      Circle.Fill.Color := TAlphaColors.White;
      Circle.Position.X := 4;
      Circle.Position.Y := 12;
      Circle.Size.Width := 40;
      Circle.Size.Height := 40;
      Circle.Stroke.Color :=Cor;
      Circle.Stroke.Thickness := 3;
      CalloutRectangle.CalloutOffset := 0;
   end;

   Label1 := TLabel.Create(Layout);
   Label1.Align := TAlignLayout.Client;
   Label1.Margins.Left := 15;
   Label1.Margins.Top := 5;
   Label1.Margins.Bottom := 5;
   Label1.TextSettings.VertAlign := TTextAlign.Leading;
   Label1.TabOrder := 0;
   Label1.Text := Texto2;
   Label1.Parent := CalloutRectangle;

   Rectangle := TRectangle.Create(Layout);
   Rectangle.Parent := Layout;
   Rectangle.SendToBack;
   Rectangle.Fill.Color := Cor;
   Rectangle.Position.X := 24;
   Rectangle.Position.Y := 0;
   Rectangle.Size.Width := 3;
   Rectangle.Size.Height := Layout.Height;
   Rectangle.Stroke.Kind := TBrushKind.None;

   Shaddow :=TShadowEffect.Create(Layout);
   Shaddow.Distance := 1;
   Shaddow.Direction := 45;
   Shaddow.Softness := 0.3;
   Shaddow.Opacity := 0.1;
   Shaddow.ShadowColor := TAlphaColors.Black;
   Shaddow.Parent := CalloutRectangle;

end;

procedure TGrafico.SetCor(const Value: TAlphaColor);
begin
  FCor := Value;
end;

procedure TGrafico.SetCorFundo(const Value: TAlphaColor);
begin
  FCorFundo := Value;
end;

procedure TGrafico.SetMax(const Value: Integer);
begin
  FMax := Value;
end;

procedure TGrafico.SetTipo(const Value: TTipo);
begin
  FTipo := Value;
end;

procedure TGrafico.SetTitulo(const Value: String);
begin
   FTitulo := Value;

   sTitulo := TText.Create(Topo);
   sTitulo.Align  := TAlignLayout.Client;
   sTitulo.Parent := Topo;
   sTitulo.Text   := Titulo;

end;

procedure TGrafico.SetValores(const Value: TDictionary<String, TSerie>);
begin
  FValores := Value;
end;

{ TRectangleHelper }

procedure TRectangleHelper.ChartBarHorizontal(Titulo, Rotulos, Valores: String);
var
  g : TGrafico;
  i : Integer;
  arr_rotulos,arr_series,arr_valor :TArray<String>;
  Max :Integer;
  tit :string;
begin
   for I := Self.ComponentCount - 1 downto 0 do
      Self.Components[I].Free;

   Max :=  TRegEx.Matches(Rotulos,'}').Count;

   if Max > 1 then begin
      arr_rotulos := TRegEx.Split(Rotulos,'}');
      for I := 0 to TRegEx.Matches(Rotulos,'}').Count-1 do begin
         rFundo := TRectangle.Create(Self);
         rFundo.Parent        := Self;
         rFundo.Fill.Color    := Self.Fill.Color;
         rFundo.Stroke.Color    := Self.Fill.Color;
         rFundo.Align         := TAlignLayout.Left;
         rFundo.Margins.Left  := 5;
         rFundo.Margins.Top   := 10;
         rFundo.Margins.Right := 5;
         rFundo.Height        := Self.Height;

         rFundo.Width        := Self.Width  / Max - 10  ;
         rFundo.Size.PlatformDefault := False;

         arr_valor := TRegEx.Split(arr_rotulos[i],':');
         tit := arr_valor[0];

         rFundo.ChartBarHorizontal(tit.Replace('{','') ,arr_rotulos[i].
                                         Replace(Tit+':','').
                                         Replace(Tit+'}','')
                                         ,TAlphaColors.Red)

      end;

   end else begin
      arr_valor := TRegEx.Split(Rotulos,':');
      tit := arr_valor[0];
      Self.ChartBarHorizontal(titulo ,Rotulos.
                                     Replace(Tit+':','').
                                     Replace(Tit+'}','') ,TAlphaColors.Red)
   end;
end;

procedure TRectangleHelper.ChartCircular(Titulo: String;Valor :Integer);
var g : TGrafico;
begin

   g := TGrafico.Create(Self,circular);
   g.Titulo := Titulo;
   g.Serie(circ, Valor);
   g.Free;

end;

procedure TRectangleHelper.ChartBarHorizontal(Titulo, Valores: String);
var
   g : TGrafico;
   i : Integer;
   arr_series,arr_valor :TArray<String>;

begin
   g := TGrafico.Create(Self,horizontal);

   g.Titulo := Titulo;
   arr_series := TRegEx.Split(Valores,';');
   g.Max := TRegEx.Matches(Valores,';').Count +1;

   for I := 0 to TRegEx.Matches(Valores,';').Count do begin
       arr_valor := TRegEx.Split(arr_series[i],':');
       g.AddSerie(strtoint(arr_valor[0]),arr_valor[1]);
   end;

   g.Free;


end;

procedure TRectangleHelper.ChartBarHorizontal(Titulo, Valores: String;
  Cor: TAlphaColor);
var
   g : TGrafico;
   i : Integer;
   arr_series,arr_valor :TArray<String>;
begin
   g := TGrafico.Create(Self,horizontal);

   g.Titulo := Titulo;
   g.Cor := Cor;

   arr_series := TRegEx.Split(Valores,';');

   g.Max := TRegEx.Matches(Valores,';').Count +1;

   for I := 0 to TRegEx.Matches(Valores,';').Count do begin
       arr_valor := TRegEx.Split(arr_series[i],':');
       g.AddSerie(strtoint(arr_valor[0].Replace('}','').Replace('}','') ),arr_valor[1]);
  end;

   g.Free;

end;

procedure TRectangleHelper.ChartCircular(Titulo: String; Valor: Integer;
  Cor: TAlphaColor);
var g : TGrafico;
begin
   g := TGrafico.Create(Self,circular);
   g.Titulo := Titulo;
   g.Cor := Cor;
   g.Serie(circ, Valor);

   g.Free;

end;

end.
