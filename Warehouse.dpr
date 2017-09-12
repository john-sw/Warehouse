program Warehouse;

uses
  Vcl.Forms,
  fm_MainForm in 'fm_MainForm.pas' {MainForm},
  dm_main in 'dm_main.pas' {dmMain: TDataModule},
  fm_ShowInvoiceRegister in 'fm_ShowInvoiceRegister.pas' {fmShowInvoiceRegister},
  fm_AddEditRefBook in 'fm_AddEditRefBook.pas' {fmAddEditRefBook},
  fm_ShowRefBookGoods in 'fm_ShowRefBookGoods.pas' {fmShowRefBookGoods},
  fm_AddEditRefBookGoods in 'fm_AddEditRefBookGoods.pas' {fmAddEditRefBookGoods},
  fm_AddEditGroup in 'fm_AddEditGroup.pas' {fmAddEditGroup},
  fm_AddEditLinkedRefBook in 'fm_AddEditLinkedRefBook.pas' {fmAddEditLinkedRefBook},
  fm_AddEditRefBookClients in 'fm_AddEditRefBookClients.pas' {fmAddEditRefBookClients},
  fm_ShowRefBookClients in 'fm_ShowRefBookClients.pas' {fmShowRefBookClients},
  fm_ShowRefBooks in 'fm_ShowRefBooks.pas' {fmShowRefBook},
  fm_AddEditInvoice in 'fm_AddEditInvoice.pas' {fmAddEditInvoice},
  fm_AddEditInvoiceLine in 'fm_AddEditInvoiceLine.pas' {fmAddEditInvoiceLine},
  fm_ShowPriceLists in 'fm_ShowPriceLists.pas' {fmShowPriceLists},
  fm_AddEditPriceListLine in 'fm_AddEditPriceListLine.pas' {fmAddEditPriceListLine},
  fm_AddEditPriceList in 'fm_AddEditPriceList.pas' {fmAddEditPriceList},
  fm_ShowCurrentPriceList in 'fm_ShowCurrentPriceList.pas' {fmShowCurrentPriceList};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
