program DPO21;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogon in 'uLogon.pas' {frmLogon},
  uMenu in 'uMenu.pas' {frmMain},
  uChart in 'uChart.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogon, frmLogon);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
