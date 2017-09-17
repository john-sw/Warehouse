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
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, Uni,
  MemDS, DBAccess, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxPgsDlg, dxPSCore, dxPScxCommon, AdvMenus,
  dxSkinsdxRibbonPainter, cxButtonEdit, AdvToolBtn;

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
    RzToolbar2: TRzToolbar;
    RzToolButton6: TRzToolButton;
    RzSpacer5: TRzSpacer;
    RzToolButton7: TRzToolButton;
    RzSpacer6: TRzSpacer;
    RzToolButton8: TRzToolButton;
    RzSpacer7: TRzSpacer;
    RzToolButton9: TRzToolButton;
    RzSpacer8: TRzSpacer;
    RzSpacer3: TRzSpacer;
    RzToolButton4: TRzToolButton;
    RzToolButton10: TRzToolButton;
    RzSpacer9: TRzSpacer;
    RzToolButton11: TRzToolButton;
    actCopyCellProdCat: TAction;
    actShowGrouped: TAction;
    AdvPanel1: TAdvPanel;
    tbShowGrouped: TAdvToolButton;
    edtSearchString: TcxButtonEdit;
    actClearFilter: TAction;
    actSelect: TAction;
    RzSpacer10: TRzSpacer;
    RzToolButton12: TRzToolButton;
    spShowRefBookGoods: TUniStoredProc;
    spGetGoodsForProdCat: TUniStoredProc;
    dsGetGoodsForProdCat: TUniDataSource;
    dsShowRefBookGoods: TUniDataSource;
    spInsertUpdateDeleteRefBook: TUniStoredProc;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

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
    procedure actCopyCellProdCatExecute(Sender: TObject);
    procedure actShowGroupedExecute(Sender: TObject);
    procedure edtSearchStringPropertiesChange(Sender: TObject);
    procedure actClearFilterExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure tvRefBookDblClick(Sender: TObject);
    procedure tvRefBookFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure tlGridProdCatFocusedNodeChanged(Sender: TcxCustomTreeList; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure tlGridProdCatGetNodeImageIndex(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
      AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  private
    { Private declarations }
    OriginalSettings: TMemoryStream;
    OldAfterScroll: TDataSetNotifyEvent;
  public
    { Public declarations }
    CurrentID: Integer;
    constructor CreateMDI(AOwner: TComponent);
  end;

var
  fmShowRefBookGoods: TfmShowRefBookGoods;

implementation

{$R *.dfm}

uses fm_AddEditRefBookGoods, Vcl.Clipbrd, cxGridExportLink, fm_AddEditGroup, fm_MainForm, dm_main, cxCurrencyEdit;

constructor TfmShowRefBookGoods.CreateMDI(AOwner: TComponent);
begin
  Create(AOwner);

  tbShowGrouped.Down := True;
  actSelect.Visible := False;
  FormStyle := fsMDIChild;
end;

procedure TfmShowRefBookGoods.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookGoods, fmAddEditRefBookGoods);
  try
    fmAddEditRefBookGoods.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookGoods.ParentRefBookForm := Self;
    fmAddEditRefBookGoods.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookGoods.ParentID := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
    fmAddEditRefBookGoods.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditRefBookGoods.ShowModal = mrOk then
    begin
      spGetGoodsForProdCat.Refresh;
      spGetGoodsForProdCat.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBookGoods.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBookGoods);
  end;
end;

procedure TfmShowRefBookGoods.actAddProdCatExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditGroup, fmAddEditGroup);
  try
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    fmAddEditGroup.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditGroup.spParentRefBook := spShowRefBookGoods;
    fmAddEditGroup.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditGroup.edtGroupName.Name := 'ProdCatName';
    if (Sender = actAddProdCatSub) then //добавление подченной группы товаров
      fmAddEditGroup.ParentID := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger
    else
      fmAddEditGroup.ParentID := spShowRefBookGoods.FieldByName('ParentID').AsInteger;
    fmAddEditGroup.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditGroup.ShowModal = mrOk then
    begin
      spShowRefBookGoods.Refresh;
      spShowRefBookGoods.Locate(tlGridProdCat.DataController.KeyField, fmAddEditGroup.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditGroup);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 7; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookGoods.actClearFilterExecute(Sender: TObject);
begin
  edtSearchString.Clear;
  actRefreshExecute(Nil);
end;

procedure TfmShowRefBookGoods.actCloseExecute(Sender: TObject);
begin
  if FormStyle = fsMDIChild then
    Close
  else
    ModalResult := mrCancel;
end;

procedure TfmShowRefBookGoods.actCopyCellExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvRefBook.Controller.FocusedRecord.Values[tvRefBook.Controller.FocusedColumn.Index];
end;

procedure TfmShowRefBookGoods.actCopyCellProdCatExecute(Sender: TObject);
begin
  tlGridProdCat.CopySelectedToClipboard;
end;

procedure TfmShowRefBookGoods.actSelectExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmShowRefBookGoods.actShowGroupedExecute(Sender: TObject);
begin
  if tbShowGrouped.Down then
  begin
    tlGridProdCat.OnFocusedNodeChanged := tlGridProdCatFocusedNodeChanged;
    tlGridProdCat.Enabled := True;
    tbShowGrouped.Caption := 'Группировка';
  end
  else
  begin
    tlGridProdCat.OnFocusedNodeChanged := nil;
    tlGridProdCat.Enabled := False;
    tbShowGrouped.Caption := 'Без групп';
  end;
  actRefreshExecute(Nil);
end;

procedure TfmShowRefBookGoods.actDeleteExecute(Sender: TObject);
begin
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  with spInsertUpdateDeleteRefBook do
  try
//    DisableControls;
    CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
    ParamByName('ID').Value := spGetGoodsForProdCat.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    Execute;
    spGetGoodsForProdCat.Refresh;
  finally
    EnableControls;
  end;
end;

procedure TfmShowRefBookGoods.actDeleteProdCatExecute(Sender: TObject);
begin
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;

  try
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    with spInsertUpdateDeleteRefBook do
    begin
      CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
      ParamByName('ID').Value := spShowRefBookGoods.FieldByName(tlGridProdCat.DataController.KeyField).AsInteger;
      Execute;
    end;
    spShowRefBookGoods.Refresh;
  finally
    FreeAndNil(fmAddEditGroup);
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
    fmAddEditRefBookGoods.ParentRefBookForm := Self;
    fmAddEditRefBookGoods.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookGoods.CurrentID := spGetGoodsForProdCat.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    fmAddEditRefBookGoods.ParentID := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
    fmAddEditRefBookGoods.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    fmAddEditRefBookGoods.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditRefBookGoods.CurrentID;
    if fmAddEditRefBookGoods.ShowModal = mrOk then
    begin
      spGetGoodsForProdCat.Refresh;
      spGetGoodsForProdCat.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBookGoods.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBookGoods);
  end;
end;

procedure TfmShowRefBookGoods.actEditProdCatExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditGroup, fmAddEditGroup);
  try
    fmAddEditGroup.FormMode := fmEdit;
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    fmAddEditGroup.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditGroup.spParentRefBook := spShowRefBookGoods;
    fmAddEditGroup.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditGroup.CurrentID := spShowRefBookGoods.FieldByName(tlGridProdCat.DataController.KeyField).AsInteger;
    fmAddEditGroup.ParentID := spShowRefBookGoods.FieldByName('ParentID').AsInteger;
    fmAddEditGroup.edtGroupName.Name := 'ProdCatName';
    fmAddEditGroup.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    fmAddEditGroup.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditGroup.CurrentID;
    if fmAddEditGroup.ShowModal = mrOk then
    begin
      spShowRefBookGoods.Refresh;
      spShowRefBookGoods.Locate(tlGridProdCat.DataController.KeyField, fmAddEditGroup.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditGroup);
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
  if tbShowGrouped.Down then
    spGetGoodsForProdCat.ParamByName('ProdCatID').AsInteger := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger
  else
    spGetGoodsForProdCat.ParamByName('ProdCatID').Clear;
  if (Sender = nil) and (Length(edtSearchString.Text) < 4) then //nil - автовызов при вводе строки
    spGetGoodsForProdCat.ParamByName('SearchString').Clear
  else
    spGetGoodsForProdCat.ParamByName('SearchString').AsString := edtSearchString.Text;

  spGetGoodsForProdCat.Close;
  spGetGoodsForProdCat.Open;
end;

procedure TfmShowRefBookGoods.actRefreshProdCatExecute(Sender: TObject);
begin
  spShowRefBookGoods.Close;
  spShowRefBookGoods.Open;
end;

procedure TfmShowRefBookGoods.actViewExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookGoods, fmAddEditRefBookGoods);
  try
    fmAddEditRefBookGoods.FormMode := fmView;
    fmAddEditRefBookGoods.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookGoods.ParentRefBookForm := Self;
    fmAddEditRefBookGoods.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookGoods.ShowModal;
  finally
    FreeAndNil(fmAddEditRefBookGoods);
  end;
end;

procedure TfmShowRefBookGoods.actViewProdCatExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditGroup, fmAddEditGroup);
  try
    fmAddEditGroup.FormMode := fmView;
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 6; // код справочника!
    qSprRef.Open;
    fmAddEditGroup.FormMode := fmView;
    fmAddEditGroup.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditGroup.spParentRefBook := spShowRefBookGoods;
    fmAddEditGroup.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditGroup.CurrentID := spShowRefBookGoods.FieldByName(tlGridProdCat.DataController.KeyField).AsInteger;
    fmAddEditGroup.ParentID := spShowRefBookGoods.FieldByName('ParentID').AsInteger;
    fmAddEditGroup.edtGroupName.Name := 'ProdCatName';
    fmAddEditGroup.ShowModal;
  finally
    FreeAndNil(fmAddEditGroup);
  end;
end;

procedure TfmShowRefBookGoods.edtSearchStringPropertiesChange(Sender: TObject);
begin
  actRefreshExecute(Nil);
end;

procedure TfmShowRefBookGoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    PostMessage(MainForm.Handle,WM_USER + 1, UIntPtr(Self), 0)
end;

procedure TfmShowRefBookGoods.FormCreate(Sender: TObject);
begin
  CurrentID := -1;
end;

procedure TfmShowRefBookGoods.FormShow(Sender: TObject);
var
  i: Integer;
begin
  spShowRefBookGoods.Open;

  spGetGoodsForProdCat.Close;
  spGetGoodsForProdCat.ParamByName('ProdCatID').AsInteger := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
  spGetGoodsForProdCat.Open;

  qSprRef.ParamByName('ID').AsInteger := 7; // код справочника!
  qSprRef.Open;

  Caption := 'Справочник - ' + qSprRef.FieldByName('ReferenceRUSName').AsString;

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

  actShowGroupedExecute(Nil);

  if CurrentID <> -1 then
    tvRefBook.DataController.FocusedRecordIndex := tvRefBook.DataController.FindRecordIndexByKey(CurrentID);
end;

procedure TfmShowRefBookGoods.tlGridProdCatFocusedNodeChanged(Sender: TcxCustomTreeList; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
begin
  spGetGoodsForProdCat.Close;
  spGetGoodsForProdCat.ParamByName('ProdCatID').AsInteger := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
  spGetGoodsForProdCat.Open;
end;

procedure TfmShowRefBookGoods.tlGridProdCatGetNodeImageIndex(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
  AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
begin
  if AIndexType = tlitStateIndex then
    if ANode.Expanded then
      AIndex := 13
    else
      AIndex := 12;
end;

procedure TfmShowRefBookGoods.tvRefBookDblClick(Sender: TObject);
begin
  if actSelect.Visible then
    actSelectExecute(nil)
  else
    actViewExecute(nil);
end;

procedure TfmShowRefBookGoods.tvRefBookFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  i: TcxDBTreeListNode;
begin
  if tbShowGrouped.Down then
    Exit;
  i := tlGridProdCat.FindNodeByKeyValue(spGetGoodsForProdCat.FieldByName('ProdCatID').AsInteger);

  if i <> nil then
  begin
    i.Selected := True;
    i.Focused := True;
    tlGridProdCat.TopVisibleNode := i;
  end;
end;

end.
