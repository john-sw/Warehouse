unit fm_ShowRefBookGoods;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxClasses, cxLookAndFeels, dxSkinsForm, cxGraphics, cxControls,
  cxLookAndFeelPainters, dxSkinscxPCPainter, dxLayoutLookAndFeels,
  dxLayoutContainer, dxLayoutControl, Vcl.Menus, cxContainer, cxEdit,
  cxGroupBox, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, AdvPanel, dxBarBuiltInMenu, cxCalc, cxPC, cxSplitter,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ImgList, RzPanel, RzButton,
  cxTreeView, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, dm_RefBooks, Uni,
  MemDS, DBAccess, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxPgsDlg, dxPSCore, dxPScxCommon, AdvMenus;

type
  TfmShowRefBookGoods = class(TForm)
    pnlClient: TAdvPanel;
    cxGroupBox1: TcxGroupBox;
    cxSplitter1: TcxSplitter;
    cxGroupBox2: TcxGroupBox;
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton2: TRzToolButton;
    RzSpacer2: TRzSpacer;
    ilRefBookActionImages: TcxImageList;
    pnlBottom: TAdvPanel;
    btnAdd: TcxButton;
    btnEdit: TcxButton;
    btnView: TcxButton;
    btnDel: TcxButton;
    btnClose: TcxButton;
    pnlTop: TAdvPanel;
    btnRefresh: TcxButton;
    GridRefBook: TcxGrid;
    tvRefBook: TcxGridDBTableView;
    GridRefBookLevel1: TcxGridLevel;
    tlGridProdCat: TcxDBTreeList;
    cxDBTreeList1ProdCatName: TcxDBTreeListColumn;
    spRefBookFieldsBrowse: TUniStoredProc;
    qSprRef: TUniQuery;
    ExportToExcelSaveDialog: TSaveDialog;
    prnRefBook: TdxComponentPrinter;
    prnRefBookLink1: TdxGridReportLink;
    prnStyleManager: TdxPrintStyleManager;
    alRefBook: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actView: TAction;
    actDelete: TAction;
    actRefresh: TAction;
    actExport: TAction;
    actPrint: TAction;
    actClose: TAction;
    actCopyCell: TAction;
    actRefreshProdCat: TAction;
    pmDefaultPopupMenu: TAdvPopupMenu;
    N14: TMenuItem;
    N6: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    miExportToExcel: TMenuItem;
    miPrint: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    actAddProdCat: TAction;
    actEditProdCat: TAction;
    actDeleteProdCat: TAction;
    actViewProdCat: TAction;
    RzToolButton5: TRzToolButton;
    RzSpacer4: TRzSpacer;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzSpacer3: TRzSpacer;
    pmAddProdCat: TAdvPopupMenu;
    miAddProdCat: TMenuItem;
    miAddProdCatSub: TMenuItem;
    actAddProdCatSub: TAction;
    pmProdCat: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actCopyCellExecute(Sender: TObject);
    procedure actRefreshProdCatExecute(Sender: TObject);
    procedure actAddProdCatExecute(Sender: TObject);
    procedure actEditProdCatExecute(Sender: TObject);
    procedure actViewProdCatExecute(Sender: TObject);
    procedure actDeleteProdCatExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    OriginalSettings: TMemoryStream;
  public
    { Public declarations }
  end;

var
  fmShowRefBookGoods: TfmShowRefBookGoods;

implementation

{$R *.dfm}

uses fm_AddEditRefBookGoods, Vcl.Clipbrd, cxGridExportLink, fm_AddEditProdCat, fm_MainForm;

procedure TfmShowRefBookGoods.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookGoods, fmAddEditRefBookGoods);
  try
    fmAddEditRefBookGoods.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookGoods.spParentRefBook := dmRefBooks.spShowRefBookGoods;
    fmAddEditRefBookGoods.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookGoods.ParentID := dmRefBooks.spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditRefBookGoods.ShowModal = mrOk then
    begin
      dmRefBooks.spGetGoodsForProdCat.Refresh;
      dmRefBooks.spGetGoodsForProdCat.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBookGoods.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBookGoods);
  end;
end;

procedure TfmShowRefBookGoods.actAddProdCatExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditProdCat, fmAddEditProdCat);
  try
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    fmAddEditProdCat.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditProdCat.spParentRefBook := dmRefBooks.spShowRefBookGoods;
    fmAddEditProdCat.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    if (Sender = actAddProdCatSub) then //добавление подченной группы товаров
      fmAddEditProdCat.ParentID := dmRefBooks.spShowRefBookGoods.FieldByName('ProdCatID').AsInteger
    else
      fmAddEditProdCat.ParentID := dmRefBooks.spShowRefBookGoods.FieldByName('ParentID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditProdCat.ShowModal = mrOk then
    begin
      dmRefBooks.spShowRefBookGoods.Refresh;
      dmRefBooks.spShowRefBookGoods.Locate(tlGridProdCat.DataController.KeyField, fmAddEditProdCat.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditProdCat);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 7; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookGoods.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmShowRefBookGoods.actCopyCellExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvRefBook.Controller.FocusedRecord.Values[tvRefBook.Controller.FocusedColumn.Index];
end;

procedure TfmShowRefBookGoods.actDeleteExecute(Sender: TObject);
begin
  if MessageBox(0,'”далить запись?', 'ѕодтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  {with dmRefBooks.spInsertUpdateDeleteRefBook do
  try
//    DisableControls;
    CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
    ParamByName('ID').Value := spShowRefBook.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    Execute;
    spShowRefBook.Refresh;
  finally
    EnableControls;
  end;   }
end;

procedure TfmShowRefBookGoods.actDeleteProdCatExecute(Sender: TObject);
begin
  if MessageBox(0,'”далить запись?', 'ѕодтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;

  try
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    with dmRefBooks.spInsertUpdateDeleteRefBook do
    begin
      CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
      ParamByName('ID').Value := dmRefBooks.spShowRefBookGoods.FieldByName(tlGridProdCat.DataController.KeyField).AsInteger;
      Execute;
    end;
    dmRefBooks.spShowRefBookGoods.Refresh;
  finally
    FreeAndNil(fmAddEditProdCat);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 7; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookGoods.actEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookGoods, fmAddEditRefBookGoods);
  try
    fmAddEditRefBookGoods.FormMode := fmEdit;
    fmAddEditRefBookGoods.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookGoods.spParentRefBook := dmRefBooks.spGetGoodsForProdCat;
    fmAddEditRefBookGoods.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookGoods.CurrentID := dmRefBooks.spGetGoodsForProdCat.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    fmAddEditRefBookGoods.ParentID := dmRefBooks.spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    dmRefBooks.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditRefBookGoods.CurrentID;
    if fmAddEditRefBookGoods.ShowModal = mrOk then
    begin
      dmRefBooks.spGetGoodsForProdCat.Refresh;
      dmRefBooks.spGetGoodsForProdCat.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBookGoods.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBookGoods);
  end;
end;

procedure TfmShowRefBookGoods.actEditProdCatExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditProdCat, fmAddEditProdCat);
  try
    fmAddEditProdCat.FormMode := fmEdit;
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    fmAddEditProdCat.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditProdCat.spParentRefBook := dmRefBooks.spShowRefBookGoods;
    fmAddEditProdCat.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditProdCat.CurrentID := dmRefBooks.spShowRefBookGoods.FieldByName(tlGridProdCat.DataController.KeyField).AsInteger;
    fmAddEditProdCat.ParentID := dmRefBooks.spShowRefBookGoods.FieldByName('ParentID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    dmRefBooks.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditProdCat.CurrentID;
    if fmAddEditProdCat.ShowModal = mrOk then
    begin
      dmRefBooks.spShowRefBookGoods.Refresh;
      dmRefBooks.spShowRefBookGoods.Locate(tlGridProdCat.DataController.KeyField, fmAddEditProdCat.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditProdCat);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 7; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookGoods.actExportExecute(Sender: TObject);
begin
  if ExportToExcelSaveDialog.Execute(Self.Handle) then
    if AnsiLowerCase(ExtractFileExt(ExportToExcelSaveDialog.FileName)) = '.xls' then
      ExportGridToExcel(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '')
    else
      ExportGridToXLSX(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '');
end;

procedure TfmShowRefBookGoods.actPrintExecute(Sender: TObject);
begin
  prnRefBook.Preview();
end;

procedure TfmShowRefBookGoods.actRefreshExecute(Sender: TObject);
begin
  dmRefBooks.spGetGoodsForProdCat.Close;
  dmRefBooks.spGetGoodsForProdCat.Open;
end;

procedure TfmShowRefBookGoods.actRefreshProdCatExecute(Sender: TObject);
begin
  dmRefBooks.spShowRefBookGoods.Close;
  dmRefBooks.spShowRefBookGoods.Open;
end;

procedure TfmShowRefBookGoods.actViewExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookGoods, fmAddEditRefBookGoods);
  try
    fmAddEditRefBookGoods.FormMode := fmView;
    fmAddEditRefBookGoods.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookGoods.spParentRefBook := dmRefBooks.spGetGoodsForProdCat;
    fmAddEditRefBookGoods.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookGoods.ShowModal;
  finally
    FreeAndNil(fmAddEditRefBookGoods);
  end;
end;

procedure TfmShowRefBookGoods.actViewProdCatExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditProdCat, fmAddEditProdCat);
  try
    fmAddEditProdCat.FormMode := fmView;
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    fmAddEditProdCat.FormMode := fmView;
    fmAddEditProdCat.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditProdCat.spParentRefBook := dmRefBooks.spShowRefBookGoods;
    fmAddEditProdCat.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditProdCat.CurrentID := dmRefBooks.spShowRefBookGoods.FieldByName(tlGridProdCat.DataController.KeyField).AsInteger;
    fmAddEditProdCat.ParentID := dmRefBooks.spShowRefBookGoods.FieldByName('ParentID').AsInteger;
    fmAddEditProdCat.ShowModal;
  finally
    FreeAndNil(fmAddEditProdCat);
  end;
end;

procedure TfmShowRefBookGoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PostMessage(MainForm.Handle,WM_USER + 1, UIntPtr(Self), 0);
end;

procedure TfmShowRefBookGoods.FormShow(Sender: TObject);
var
  i: Integer;
begin
  dmRefBooks.spShowRefBookGoods.Open;

  qSprRef.ParamByName('ID').AsInteger := 7; // код справочника!
  qSprRef.Open;

  Caption := '—правочник - ' + qSprRef.FieldByName('ReferenceRUSName').AsString;

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
  actEdit.Enabled := (tvRefBook.DataController.KeyFieldNames <> '');

  tvRefBook.StoreToStream(OriginalSettings);
  tvRefBook.RestoreFromRegistry('Software\Warehouse\GridsSettings\RefBooks\' + qSprRef.FieldByName('ReferenceTableName').AsString);
//  tvRefBook.OptionsView.Footer := (tvRefBook.DataController.Summary.FooterSummaryItems.Count > 0);

end;

end.
