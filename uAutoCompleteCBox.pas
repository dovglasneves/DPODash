unit uAutoCompleteCBox;

interface

uses
   System.SysUtils, System.Classes, System.UITypes, FMX.Types,
FMX.Controls, FMX.ListBox;

type
   TAutoCompleteComboBox = class(TComboBox)
   private
     FLastKeyPress: TDateTime;
     FKeyPressSearchDelay: Integer;
     FSearchText: string;
   protected
     procedure SetKeyPressSearchDelay(AValue: Integer);
     function GetKeyPressSearchDelay: Integer;
     procedure KeyDown(var Key: Word; var KeyChar: System.WideChar;
       Shift: TShiftState); override;
   public
     function SearchDropDown(AText: string;
       AShowDropDown: Boolean = True): Integer;
   published
     property KeyPressSearchDelay: Integer read GetKeyPressSearchDelay
       write SetKeyPressSearchDelay default 2;
   end;

procedure Register;

implementation

uses
   DateUtils, StrUtils;

function TAutoCompleteComboBox.SearchDropDown(AText: string;
   AShowDropDown: Boolean = True): Integer;

function FindStartsTextIndex(Strings: TStrings; const SubStr: string):
integer;
begin
   for Result := 0 to Strings.Count - 1 do
     if StartsText(SubStr, Strings[Result]) then
       exit;
   Result := -1;
end;

begin
   Result := FindStartsTextIndex(Self.Items, FSearchText);
   if (Result <> -1) then
   begin
     if (not Self.DroppedDown) and (AShowDropDown) then
     begin
       Self.DropDown;
     end;
     Self.ItemIndex := Result;
   end;
end;

procedure TAutoCompleteComboBox.SetKeyPressSearchDelay(AValue: Integer);
begin
   if (AValue > 0) and (AValue <= 10) then
   begin
     FKeyPressSearchDelay := AValue;
   end
   else
   begin
     FKeyPressSearchDelay := 2;
   end;
end;

function TAutoCompleteComboBox.GetKeyPressSearchDelay: Integer;
begin
   SetKeyPressSearchDelay(FKeyPressSearchDelay);
   Result := FKeyPressSearchDelay;
end;

procedure TAutoCompleteComboBox.KeyDown(var Key: Word; var KeyChar:
System.WideChar;
   Shift: TShiftState);
begin
   if KeyChar in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', #32] then
   begin

     if SecondsBetween(TimeOf(Now), FLastKeyPress) <=
FKeyPressSearchDelay then
     begin
       FSearchText := FSearchText + KeyChar;
     end
     else
     begin
       FSearchText := KeyChar;
     end;

     if SearchDropDown(FSearchText) <> -1 then
     begin
       FLastKeyPress := TimeOf(Now);
       KeyChar := #0;
     end;
   end
   else
   begin
     inherited;
   end;
end;

procedure Register;
begin
   RegisterComponents('Auto Complete', [TAutoCompleteComboBox]);
end;

end.
