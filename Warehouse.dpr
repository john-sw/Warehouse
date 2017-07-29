program Warehouse;

uses
  Vcl.Forms,
  fm_MainForm in 'fm_MainForm.pas' {MainForm},
  dm_main in 'dm_main.pas' {dmMain: TDataModule},
  dm_RefBooks in 'dm_RefBooks.pas' {dmRefBooks: TDataModule},
  fm_ShowRefBooks in 'fm_ShowRefBooks.pas' {fmShowRefBook},
  fm_AddEditRefBook in 'fm_AddEditRefBook.pas' {fmAddEditRefBook},
  fm_ShowRefBookGoods in 'fm_ShowRefBookGoods.pas' {fmShowRefBookGoods},
  fm_AddEditRefBookGoods in 'fm_AddEditRefBookGoods.pas' {fmAddEditRefBookGoods},
  fm_AddEditGroup in 'fm_AddEditGroup.pas' {fmAddEditGroup},
  fm_AddEditLinkedRefBook in 'fm_AddEditLinkedRefBook.pas' {fmAddEditLinkedRefBook},
  fm_AddEditRefBookClients in 'fm_AddEditRefBookClients.pas' {fmAddEditRefBookClients},
  fm_ShowRefBookClients in 'fm_ShowRefBookClients.pas' {fmShowRefBookClients};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdmRefBooks, dmRefBooks);
  Application.Run;
end.
