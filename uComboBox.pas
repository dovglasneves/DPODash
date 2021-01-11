unit uComboBox;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, Math, FMX.ListBox, DateUtils;

type
TCombobox = class(FMX.ListBox.TComboBox)
  private
    LastTimeKeydown:TDatetime;
    Keys:string;
  protected
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);override;
  end;

implementation

{ TCombobox }

procedure TCombobox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
aStr:string;
I: Integer;
begin
  inherited;
if Key=vkReturn then Exit;
  if (KeyChar in [chr(48)..chr(57)]) or (KeyChar in [chr(65)..chr(90)]) or (KeyChar in [chr(97)..chr(122)]) then
    begin
      //combination of keys? (500) is personal reference
      if MilliSecondsBetween(LastTimeKeydown,Now)<500 then
        Keys:=Keys+KeyChar
      else // start new combination
        Keys:=KeyChar;
        //last time key was pressed
        LastTimeKeydown:=Now;
        //lookup item
      for I := 0 to Count-1 do
      if UpperCase(Copy(Items[i],0,Keys.length))=UpperCase(Keys) then begin
        ItemIndex:=i;
        Exit; //first item found is good
      end;
    end;
end;

end.
