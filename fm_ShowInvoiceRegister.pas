unit fm_ShowInvoiceRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dm_main, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxInplaceContainer, cxTLData, cxDBTL, Vcl.ExtCtrls, AdvPanel, Data.DB, MemDS,
  DBAccess, Uni, cxMaskEdit, cxCalendar, Vcl.Grids, Vcl.DBGrids,
  dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxContainer,
  cxLocalization, cxGroupBox, Vcl.StdCtrls, cxButtons, AdvMenus, cxCheckBox,
  dxPSGlbl, dxPSUtl, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPgsDlg, dxPSEngn,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxPSCore, dxPScxCommon, System.Actions, Vcl.ActnList, Vcl.ImgList, RzPanel, RzButton, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDropDownEdit, cxLabel, cxTextEdit, cxButtonEdit,
  dxSkinsdxRibbonPainter, frxClass;

type
  TfmShowInvoiceRegister = class(TForm)
    spShowInvoiceRegister: TUniStoredProc;
    dsShowRefBook: TUniDataSource;
    tvRefBook: TcxGridDBTableView;
    GridRefBookLevel1: TcxGridLevel;
    GridRefBook: TcxGrid;
    pmDefaultPopupMenu: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    miExportToExcel: TMenuItem;
    miPrint: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    spRefBookFieldsBrowse: TUniStoredProc;
    qSprRef: TUniQuery;
    N10: TMenuItem;
    ExportToExcelSaveDialog: TSaveDialog;
    prnStyleManager: TdxPrintStyleManager;
    prnRefBook: TdxComponentPrinter;
    prnRefBookLink1: TdxGridReportLink;
    alRefBook: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actView: TAction;
    actDelete: TAction;
    ilRefBookActionImages: TcxImageList;
    actRefresh: TAction;
    N6: TMenuItem;
    N14: TMenuItem;
    actExport: TAction;
    actPrint: TAction;
    actClose: TAction;
    actCopyCell: TAction;
    RzToolbar2: TRzToolbar;
    RzToolButton6: TRzToolButton;
    RzSpacer5: TRzSpacer;
    RzToolButton7: TRzToolButton;
    RzSpacer6: TRzSpacer;
    RzToolButton8: TRzToolButton;
    RzSpacer7: TRzSpacer;
    RzToolButton9: TRzToolButton;
    RzSpacer8: TRzSpacer;
    RzToolButton10: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton1: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzToolButton2: TRzToolButton;
    actApprove: TAction;
    actDisApprove: TAction;
    pmApproveDisapprove: TAdvPopupMenu;
    miApprove: TMenuItem;
    miDisapprove: TMenuItem;
    RzSpacer9: TRzSpacer;
    RzToolButton11: TRzToolButton;
    AdvPanel1: TAdvPanel;
    edtDocNumber: TcxButtonEdit;
    cxLabel5: TcxLabel;
    cxLabel1: TcxLabel;
    deDate1: TcxDateEdit;
    deDate2: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnFilter: TcxButton;
    btnClearFilter: TcxButton;
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    actPrintRegister: TAction;
    miPrintDoc: TMenuItem;
    pmPrintDoc: TAdvPopupMenu;
    spGetPrintFormList: TUniStoredProc;
    qrReports: TUniQuery;
    qrReportsReportID: TIntegerField;
    qrReportsReportGroupID: TIntegerField;
    qrReportsReportName: TWideStringField;
    qrReportsReportBinary: TBlobField;
    qrReportsIsActive: TByteField;
    qrReportsDocType: TByteField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N9Click(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actCopyCellExecute(Sender: TObject);
    procedure spShowInvoiceRegisterAfterOpen(DataSet: TDataSet);
    procedure actApproveExecute(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
    procedure actDisApproveExecute(Sender: TObject);
    procedure tvRefBookDblClick(Sender: TObject);
    procedure actPrintRegisterExecute(Sender: TObject);
    procedure RzToolButton1DropDown(Sender: TObject);
    procedure pmDefaultPopupMenuPopup(Sender: TObject);
  private
    { Private declarations }
    OriginalSettings: TMemoryStream;
    procedure miPrintDocClick(Sender: TObject);
  public
    { Public declarations }
    RefBookID: Integer;
  end;

var
  fmShowInvoiceRegister: TfmShowInvoiceRegister;

implementation

{$R *.dfm}

uses fm_MainForm, fm_AddEditRefBook, cxGridExportLink, Vcl.Clipbrd, fm_AddEditInvoice, frxUniDACComponents;

procedure TfmShowInvoiceRegister.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditInvoice, fmAddEditInvoice);

  try
    fmAddEditInvoice.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditInvoice.spParentRefBook := spShowInvoiceRegister;
    fmAddEditInvoice.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditInvoice.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditInvoice.ShowModal = mrOk then
    begin
      spShowInvoiceRegister.Refresh;
      spShowInvoiceRegister.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditInvoice.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditInvoice);
  end;
end;

procedure TfmShowInvoiceRegister.actApproveExecute(Sender: TObject);
var
  sp1: TUniStoredProc;
begin
  sp1 := TUniStoredProc.Create(Nil);
  try
    sp1.Connection := dmMain.MainConnection;
    sp1.CreateProcCall('spChangeFieldValue');
    sp1.ParamByName('TableName').AsString := 'Invoice';
    sp1.ParamByName('FieldName').AsString := 'IsAccept';
    sp1.ParamByName('FieldValue').Value := 1;
    sp1.ParamByName('KeyFieldValue').Value := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;;
    sp1.Execute;
  finally
    FreeAndNil(sp1);
    actRefreshExecute(nil);
  end;
end;

procedure TfmShowInvoiceRegister.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmShowInvoiceRegister.actCopyCellExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvRefBook.Controller.FocusedRecord.Values[tvRefBook.Controller.FocusedColumn.Index];
end;

procedure TfmShowInvoiceRegister.actDeleteExecute(Sender: TObject);
begin
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  with spInsertUpdateDeleteRefBook do
  try
//    DisableControls;
    CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
    ParamByName('ID').Value := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    Execute;
    spShowInvoiceRegister.Refresh;
  finally
    EnableControls;
  end;
end;

procedure TfmShowInvoiceRegister.actDisApproveExecute(Sender: TObject);
var
  sp1: TUniStoredProc;
begin
  sp1 := TUniStoredProc.Create(Nil);
  try
    sp1.Connection := dmMain.MainConnection;
    sp1.CreateProcCall('spChangeFieldValue');
    sp1.ParamByName('TableName').AsString := 'Invoice';
    sp1.ParamByName('FieldName').AsString := 'IsAccept';
    sp1.ParamByName('FieldValue').Value := 0;
    sp1.ParamByName('KeyFieldValue').Value := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;;
    sp1.Execute;
  finally
    FreeAndNil(sp1);
    actRefreshExecute(nil);
  end;
end;

procedure TfmShowInvoiceRegister.actEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditInvoice, fmAddEditInvoice);
  try
    fmAddEditInvoice.FormMode := fmEdit;
    fmAddEditInvoice.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditInvoice.spParentRefBook := spShowInvoiceRegister;
    fmAddEditInvoice.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditInvoice.CurrentID := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    fmAddEditInvoice.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    fmAddEditInvoice.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditInvoice.CurrentID;
    if fmAddEditInvoice.ShowModal = mrOk then
    begin
      spShowInvoiceRegister.Refresh;
      spShowInvoiceRegister.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditInvoice.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditInvoice);
  end;
end;

procedure TfmShowInvoiceRegister.actExportExecute(Sender: TObject);
begin
  if ExportToExcelSaveDialog.Execute(Self.Handle) then
    if AnsiLowerCase(ExtractFileExt(ExportToExcelSaveDialog.FileName)) = '.xls' then
      ExportGridToExcel(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '')
    else
      ExportGridToXLSX(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '');
end;

procedure TfmShowInvoiceRegister.actPrintRegisterExecute(Sender: TObject);
begin
  prnRefBook.Preview();
end;

procedure TfmShowInvoiceRegister.actRefreshExecute(Sender: TObject);
begin
  spShowInvoiceRegister.Close;
  spShowInvoiceRegister.Open;
end;

procedure TfmShowInvoiceRegister.actViewExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditInvoice, fmAddEditInvoice);
  try
    fmAddEditInvoice.FormMode := fmView;
    fmAddEditInvoice.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditInvoice.spParentRefBook := spShowInvoiceRegister;
    fmAddEditInvoice.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditInvoice.ShowModal;
  finally
    FreeAndNil(fmAddEditInvoice);
  end;
end;

procedure TfmShowInvoiceRegister.btnFilterClick(Sender: TObject);
begin
  spShowInvoiceRegister.Close;
  if edtDocNumber.Text <> '' then
    spShowInvoiceRegister.ParamByName('DocNumber').Value := edtDocNumber.Text
  else
    spShowInvoiceRegister.ParamByName('DocNumber').Clear;
  if deDate1.Text <> '' then
    spShowInvoiceRegister.ParamByName('Date1').Value := deDate1.Date
  else
    spShowInvoiceRegister.ParamByName('Date1').Clear;
  if deDate2.Text <> '' then
    spShowInvoiceRegister.ParamByName('Date2').Value := deDate2.Date
  else
    spShowInvoiceRegister.ParamByName('Date2').Clear;
  spShowInvoiceRegister.Open;
end;

procedure TfmShowInvoiceRegister.btnClearFilterClick(Sender: TObject);
begin
  edtDocNumber.Text := '';
  deDate1.Clear;
  deDate2.Clear;
  btnFilterClick(Nil);
end;

procedure TfmShowInvoiceRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tvRefBook.StoreToRegistry('Software\Warehouse\GridsSettings\RefBooks\' + qSprRef.FieldByName('ReferenceTableName').AsString);
  FreeAndNil(OriginalSettings);
  PostMessage(MainForm.Handle,WM_USER + 1, UIntPtr(Self), 0);
end;

procedure TfmShowInvoiceRegister.FormCreate(Sender: TObject);
begin
  OriginalSettings := TMemoryStream.Create;
end;

procedure TfmShowInvoiceRegister.FormShow(Sender: TObject);
var
  i: Integer;
begin
  qSprRef.ParamByName('ID').AsInteger := 15; // код справочника!
  qSprRef.Open;
  Caption := 'Журнал - ' + qSprRef.FieldByName('ReferenceRUSName').AsString;
  spShowInvoiceRegister.StoredProcName := qSprRef.FieldByName('BrowserProcName').AsString;
  spShowInvoiceRegister.Open;
  tvRefBook.DataController.CreateAllItems;
  spRefBookFieldsBrowse.Close;
  spRefBookFieldsBrowse.ParamByName('ReferenceID').AsInteger := qSprRef.FieldByName('ReferenceID').AsInteger;
  spRefBookFieldsBrowse.Open;
  for i:= 0 to tvRefBook.ColumnCount - 1 do
    if (spRefBookFieldsBrowse.Locate('BrowserFieldName', tvRefBook.Columns[i].Caption, [loCaseInsensitive])) then
    begin
      if (spRefBookFieldsBrowse.FieldByName('IsVisible').AsInteger = 0) then
        tvRefBook.Columns[i].Visible := False;

      tvRefBook.Columns[i].Caption := spRefBookFieldsBrowse.FieldByName('BrowserFieldRUSName').AsString;
      if spRefBookFieldsBrowse.FieldByName('IsKeyField').AsInteger = 1 then
        tvRefBook.DataController.KeyFieldNames := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
      if spRefBookFieldsBrowse.FieldByName('ColumnTypeID').AsInteger = 5 then
      begin
        tvRefBook.Columns[i].PropertiesClass := TcxCheckBoxProperties;
        with tvRefBook.Columns[i].Properties as TcxCheckBoxProperties do
        begin
          AllowGrayed := False;
          ValueChecked := 1;
          ValueUnchecked := 0;
        end;
      end;
      if spRefBookFieldsBrowse.FieldByName('HaveFilter').AsInteger = 0 then
        tvRefBook.Columns[i].Options.Filtering := False;
      if spRefBookFieldsBrowse.FieldByName('HaveSummary').AsInteger = 1 then
      begin
        tvRefBook.Columns[i].Summary.FooterKind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
        tvRefBook.Columns[i].Summary.FooterFormat := spRefBookFieldsBrowse.FieldByName('FooterFormat').AsString;
        with TcxGridDBTableSummaryItem(tvRefBook.DataController.Summary.FooterSummaryItems.Add) do
        begin
          Kind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
          Column := tvRefBook.Columns[i];
          FieldName := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
        end;
      end;

      tvRefBook.Columns[i].Width := spRefBookFieldsBrowse.FieldByName('Width').AsInteger;
    end
    else
      tvRefBook.Columns[i].Visible := False;

  tvRefBook.StoreToStream(OriginalSettings);
  tvRefBook.RestoreFromRegistry('Software\Warehouse\GridsSettings\RefBooks\' + qSprRef.FieldByName('ReferenceTableName').AsString);
  tvRefBook.OptionsView.Footer := (tvRefBook.DataController.Summary.FooterSummaryItems.Count > 0);
end;

procedure TfmShowInvoiceRegister.miPrintDocClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
  if qrReports.Active then qrReports.Close;
  qrReports.ParamByName('ReportID').AsInteger := (Sender as TMenuItem).Tag;
  qrReports.Open;

  if qrReports.IsEmpty then
    Exit;
  Stream := TMemoryStream.Create;
  qrReportsReportBinary.SaveToStream(Stream);
  Stream.Position := 0;
  dmMain.frxReport.LoadFromStream(Stream);
  dmMain.frxReport.Variables['ID'] := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsString;
  dmMain.frxReport.ShowReport;
  Stream.Free;
end;

procedure TfmShowInvoiceRegister.N9Click(Sender: TObject);
begin
  OriginalSettings.Position := 0;
  tvRefBook.RestoreFromStream(OriginalSettings, True, True, [], '');
end;

procedure TfmShowInvoiceRegister.pmDefaultPopupMenuPopup(Sender: TObject);
var
  mi: TMenuItem;
begin
  pmDefaultPopupMenu.BeginUpdate;
  try
    miPrintDoc.Clear;
    spGetPrintFormList.Close;
    spGetPrintFormList.ParamByName('FormName').Value := Self.Name;
    spGetPrintFormList.ParamByName('DocID').Value := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    spGetPrintFormList.Open;
    while not spGetPrintFormList.Eof do
    begin
      mi := TMenuItem.Create(pmPrintDoc);
      mi.Caption := spGetPrintFormList.FieldByName('ReportName').AsString;
      mi.Tag := spGetPrintFormList.FieldByName('ReportID').AsInteger;
      mi.OnClick := miPrintDocClick;
      miPrintDoc.Add(mi);
      spGetPrintFormList.Next;
    end;
  finally
    pmDefaultPopupMenu.EndUpdate;
  end;
end;

procedure TfmShowInvoiceRegister.RzToolButton1DropDown(Sender: TObject);
var
  mi: TMenuItem;
begin
  pmPrintDoc.BeginUpdate;
  try
    pmPrintDoc.Items.Clear;
    spGetPrintFormList.Close;
    spGetPrintFormList.ParamByName('FormName').Value := Self.Name;
    spGetPrintFormList.ParamByName('DocID').Value := spShowInvoiceRegister.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    spGetPrintFormList.Open;
    while not spGetPrintFormList.Eof do
    begin
      mi := TMenuItem.Create(pmPrintDoc);
      mi.Caption := spGetPrintFormList.FieldByName('ReportName').AsString;
      mi.Tag := spGetPrintFormList.FieldByName('ReportID').AsInteger;
      mi.OnClick := miPrintDocClick;
      pmPrintDoc.Items.Add(mi);
      spGetPrintFormList.Next;
    end;
  finally
    pmPrintDoc.EndUpdate;
  end;
end;

procedure TfmShowInvoiceRegister.spShowInvoiceRegisterAfterOpen(DataSet: TDataSet);
begin
  actEdit.Enabled := (not spShowInvoiceRegister.Eof);
  actView.Enabled := actEdit.Enabled;
  actDelete.Enabled := actEdit.Enabled;
  actExport.Enabled := actEdit.Enabled;
  actPrint.Enabled := actEdit.Enabled;
  actCopyCell.Enabled := actEdit.Enabled;
  actApprove.Enabled := actEdit.Enabled;
  actDisApprove.Enabled := actEdit.Enabled;
  actPrintRegister.Enabled := actEdit.Enabled;
end;

procedure TfmShowInvoiceRegister.tvRefBookDblClick(Sender: TObject);
begin
  actViewExecute(nil);
end;

end.
