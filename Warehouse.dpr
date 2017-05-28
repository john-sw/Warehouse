program Warehouse;

uses
  Vcl.Forms,
  main in 'main.pas' {MainForm},
  dm_main in 'dm_main.pas' {dmMain: TDataModule},
  dm_RefBooks in 'dm_RefBooks.pas' {dmRefBooks: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdmRefBooks, dmRefBooks);
  Application.Run;
end.
