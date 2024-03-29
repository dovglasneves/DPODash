program DPO21;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogon in 'uLogon.pas' {frmLogon},
  uMenu in 'uMenu.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFunctions in 'uFunctions.pas',
  uAutoCompleteCBox in 'uAutoCompleteCBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogon, frmLogon);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Title := 'DPODash v1.0.0';
  Application.Run;
end.
