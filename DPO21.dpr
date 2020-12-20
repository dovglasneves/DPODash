program DPO21;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogon in 'uLogon.pas' {frmLogon},
  uMenu in 'uMenu.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogon, frmLogon);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
