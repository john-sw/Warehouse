unit fm_ShowRefBooks;

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
  dxPSCore, dxPScxCommon, System.Actions, Vcl.ActnList, Vcl.ImgList, RzPanel, RzButton, dxSkinsdxRibbonPainter;

type
  TfmShowRefBook = class(TForm)
    spShowRefBook: TUniStoredProc;
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
    RzSpacer9: TRzSpacer;
    RzToolButton11: TRzToolButton;
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
    procedure actPrintExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actCopyCellExecute(Sender: TObject);
    procedure spShowRefBookAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    OriginalSettings: TMemoryStream;
  public
    { Public declarations }
    RefBookID: Integer;
  end;

var
  fmShowRefBook: TfmShowRefBook;

implementation

{$R *.dfm}

uses dm_RefBooks, fm_MainForm, fm_AddEditRefBook, cxGridExportLink, Vcl.Clipbrd;

procedure TfmShowRefBook.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBook, fmAddEditRefBook);
  try
    fmAddEditRefBook.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBook.spParentRefBook := spShowRefBook;
    fmAddEditRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditRefBook.ShowModal = mrOk then
    begin
      spShowRefBook.Refresh;
      spShowRefBook.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBook.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBook);
  end;
end;

procedure TfmShowRefBook.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmShowRefBook.actCopyCellExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvRefBook.Controller.FocusedRecord.Values[tvRefBook.Controller.FocusedColumn.Index];
end;

procedure TfmShowRefBook.actDeleteExecute(Sender: TObject);
begin
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  with dmRefBooks.spInsertUpdateDeleteRefBook do
  try
//    DisableControls;
    CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
    ParamByName('ID').Value := spShowRefBook.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    Execute;
    spShowRefBook.Refresh;
  finally
    EnableControls;
  end;
end;

procedure TfmShowRefBook.actEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBook, fmAddEditRefBook);
  try
    fmAddEditRefBook.FormMode := fmEdit;
    fmAddEditRefBook.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBook.spParentRefBook := spShowRefBook;
    fmAddEditRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBook.CurrentID := spShowRefBook.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    dmRefBooks.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditRefBook.CurrentID;
    if fmAddEditRefBook.ShowModal = mrOk then
    begin
      spShowRefBook.Refresh;
      spShowRefBook.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBook.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBook);
  end;
end;

procedure TfmShowRefBook.actExportExecute(Sender: TObject);
begin
  if ExportToExcelSaveDialog.Execute(Self.Handle) then
    if AnsiLowerCase(ExtractFileExt(ExportToExcelSaveDialog.FileName)) = '.xls' then
      ExportGridToExcel(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '')
    else
      ExportGridToXLSX(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '');
end;

procedure TfmShowRefBook.actPrintExecute(Sender: TObject);
begin
  prnRefBook.Preview();
end;

procedure TfmShowRefBook.actRefreshExecute(Sender: TObject);
begin
  spShowRefBook.Close;
  spShowRefBook.Open;
end;

procedure TfmShowRefBook.actViewExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBook, fmAddEditRefBook);
  try
    fmAddEditRefBook.FormMode := fmView;
    fmAddEditRefBook.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBook.spParentRefBook := spShowRefBook;
    fmAddEditRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBook.ShowModal;
  finally
    FreeAndNil(fmAddEditRefBook);
  end;
end;

procedure TfmShowRefBook.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tvRefBook.StoreToRegistry('Software\Warehouse\GridsSettings\RefBooks\' + qSprRef.FieldByName('ReferenceTableName').AsString);
  FreeAndNil(OriginalSettings);
  PostMessage(MainForm.Handle,WM_USER + 1, UIntPtr(Self), 0);
end;

procedure TfmShowRefBook.FormCreate(Sender: TObject);
begin
  OriginalSettings := TMemoryStream.Create;
end;

procedure TfmShowRefBook.FormShow(Sender: TObject);
var
  i: Integer;
begin
  qSprRef.ParamByName('ID').AsInteger := dmRefBooks.qSprRefForMainMenu.FieldByName('ReferenceID').AsInteger;
  qSprRef.Open;
  Caption := 'Справочник - ' + qSprRef.FieldByName('ReferenceRUSName').AsString;
  spShowRefBook.StoredProcName := qSprRef.FieldByName('BrowserProcName').AsString;
  spShowRefBook.Open;
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
      if not spRefBookFieldsBrowse.FieldByName('DisplayFormat').IsNull then
      begin
        tvRefBook.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
        (tvRefBook.Columns[i].Properties as TcxCurrencyEditProperties).DisplayFormat := spRefBookFieldsBrowse.FieldByName('DisplayFormat').AsString;
      end;
    end
    else
      tvRefBook.Columns[i].Visible := False;
  actEdit.Enabled := (tvRefBook.DataController.KeyFieldNames <> '');

  tvRefBook.StoreToStream(OriginalSettings);
  tvRefBook.RestoreFromRegistry('Software\Warehouse\GridsSettings\RefBooks\' + qSprRef.FieldByName('ReferenceTableName').AsString);
  tvRefBook.OptionsView.Footer := (tvRefBook.DataController.Summary.FooterSummaryItems.Count > 0);
end;

procedure TfmShowRefBook.N9Click(Sender: TObject);
begin
  OriginalSettings.Position := 0;
  tvRefBook.RestoreFromStream(OriginalSettings, True, True, [], '');
end;

procedure TfmShowRefBook.spShowRefBookAfterOpen(DataSet: TDataSet);
begin
  actEdit.Enabled := (not spShowRefBook.Eof);
  actView.Enabled := actEdit.Enabled;
  actDelete.Enabled := actEdit.Enabled;
  actExport.Enabled := actEdit.Enabled;
  actPrint.Enabled := actEdit.Enabled;
end;

end.
