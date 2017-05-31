program Warehouse;

uses
  Vcl.Forms,
  fm_MainForm in 'fm_MainForm.pas' {MainForm},
  dm_main in 'dm_main.pas' {dmMain: TDataModule},
  dm_RefBooks in 'dm_RefBooks.pas' {dmRefBooks: TDataModule},
  fm_ShowRefBooks in 'fm_ShowRefBooks.pas' {fmShowRefBook},
  fm_AddEditRefBook in 'fm_AddEditRefBook.pas' {fmAddEditRefBook};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdmRefBooks, dmRefBooks);
  Application.Run;
end.
