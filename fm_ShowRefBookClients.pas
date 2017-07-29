unit fm_ShowRefBookClients;

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
  dxSkinsdxBarPainter, dxPgsDlg, dxPSCore, dxPScxCommon, AdvMenus, cxButtonEdit;

type
  TfmShowRefBookClients = class(TForm)
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
    actRefreshGroup: TAction;
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
    actAddGroup: TAction;
    actEditGroup: TAction;
    actDeleteGroup: TAction;
    actViewGroup: TAction;
    RzToolButton5: TRzToolButton;
    RzSpacer4: TRzSpacer;
    RzToolButton3: TRzToolButton;
    pmAddClientsGroup: TAdvPopupMenu;
    miAddProdCat: TMenuItem;
    miAddProdCatSub: TMenuItem;
    actAddGroupSub: TAction;
    pmClientsGroups: TAdvPopupMenu;
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
    tlGridClientsGroups: TcxDBTreeList;
    cxDBTreeList1ClientFolderName: TcxDBTreeListColumn;
    actCopyCellClientsGroups: TAction;
    AdvPanel1: TAdvPanel;
    edtSearchString: TcxButtonEdit;
    cxLabel5: TcxLabel;
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
    procedure actRefreshGroupExecute(Sender: TObject);
    procedure actAddGroupExecute(Sender: TObject);
    procedure actEditGroupExecute(Sender: TObject);
    procedure actViewGroupExecute(Sender: TObject);
    procedure actDeleteGroupExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCopyCellClientsGroupsExecute(Sender: TObject);
    procedure alRefBookUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    OriginalSettings: TMemoryStream;
  public
    { Public declarations }
  end;

var
  fmShowRefBookClients: TfmShowRefBookClients;

implementation

{$R *.dfm}

uses fm_AddEditRefBookGoods, Vcl.Clipbrd, cxGridExportLink, fm_AddEditGroup, fm_MainForm, dm_main,
  fm_AddEditRefBookClients;

procedure TfmShowRefBookClients.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookClients, fmAddEditRefBookClients);
  try
    fmAddEditRefBookClients.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookClients.spParentRefBook := dmRefBooks.spShowRefBookClients;
    fmAddEditRefBookClients.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookClients.ParentID := dmRefBooks.spShowRefBookClients.FieldByName('ClientFolderID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditRefBookClients.ShowModal = mrOk then
    begin
      dmRefBooks.spGetClientsForGroup.Refresh;
      dmRefBooks.spGetClientsForGroup.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBookClients.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBookClients);
  end;
end;

procedure TfmShowRefBookClients.actAddGroupExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditGroup, fmAddEditGroup);
  try
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 10; // код справочника!
    qSprRef.Open;
    fmAddEditGroup.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditGroup.spParentRefBook := dmRefBooks.spShowRefBookClients;
    fmAddEditGroup.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditGroup.edtGroupName.Name := 'ClientFolderName';
    if (Sender = actAddGroupSub) then //добавление подченной группы товаров
      fmAddEditGroup.ParentID := dmRefBooks.spShowRefBookClients.FieldByName('ClientFolderID').AsInteger
    else
      fmAddEditGroup.ParentID := dmRefBooks.spShowRefBookClients.FieldByName('ParentFolderID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('InsertProcName').AsString);
    if fmAddEditGroup.ShowModal = mrOk then
    begin
      dmRefBooks.spShowRefBookClients.Refresh;
      dmRefBooks.spShowRefBookClients.Locate(tlGridClientsGroups.DataController.KeyField, fmAddEditGroup.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditGroup);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 11; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookClients.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmShowRefBookClients.actCopyCellExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvRefBook.Controller.FocusedRecord.Values[tvRefBook.Controller.FocusedColumn.Index];
end;

procedure TfmShowRefBookClients.actCopyCellClientsGroupsExecute(Sender: TObject);
begin
  tlGridClientsGroups.CopySelectedToClipboard;
end;

procedure TfmShowRefBookClients.actDeleteExecute(Sender: TObject);
begin
  if MessageBox(0,'”далить запись?', 'ѕодтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  with dmRefBooks.spInsertUpdateDeleteRefBook do
  try
//    DisableControls;
    CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
    ParamByName('ID').Value := dmRefBooks.spGetClientsForGroup.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    Execute;
    dmRefBooks.spGetClientsForGroup.Refresh;
  finally
    EnableControls;
  end;
end;

procedure TfmShowRefBookClients.actDeleteGroupExecute(Sender: TObject);
begin
  if MessageBox(0,'”далить запись?', 'ѕодтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;

  try
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 10; // код справочника!
    qSprRef.Open;
    with dmRefBooks.spInsertUpdateDeleteRefBook do
    begin
      CreateProcCall(qSprRef.FieldByName('DeleteProcName').AsString);
      ParamByName('ID').Value := dmRefBooks.spShowRefBookClients.FieldByName(tlGridClientsGroups.DataController.KeyField).AsInteger;
      Execute;
    end;
    dmRefBooks.spShowRefBookClients.Refresh;
  finally
    FreeAndNil(fmAddEditGroup);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 11; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookClients.actEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookClients, fmAddEditRefBookClients);
  try
    fmAddEditRefBookClients.FormMode := fmEdit;
    fmAddEditRefBookClients.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookClients.spParentRefBook := dmRefBooks.spGetClientsForGroup;
    fmAddEditRefBookClients.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookClients.CurrentID := dmRefBooks.spGetClientsForGroup.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    fmAddEditRefBookClients.ParentID := dmRefBooks.spShowRefBookClients.FieldByName('ClientFolderID').AsInteger;
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    dmRefBooks.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditRefBookClients.CurrentID;
    if fmAddEditRefBookClients.ShowModal = mrOk then
    begin
      dmRefBooks.spGetClientsForGroup.Refresh;
      dmRefBooks.spGetClientsForGroup.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBookClients.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBookClients);
  end;
end;

procedure TfmShowRefBookClients.actEditGroupExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditGroup, fmAddEditGroup);
  try
    fmAddEditGroup.FormMode := fmEdit;
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 10; // код справочника!
    qSprRef.Open;
    fmAddEditGroup.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditGroup.spParentRefBook := dmRefBooks.spShowRefBookClients;
    fmAddEditGroup.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditGroup.CurrentID := dmRefBooks.spShowRefBookClients.FieldByName(tlGridClientsGroups.DataController.KeyField).AsInteger;
    fmAddEditGroup.ParentID := dmRefBooks.spShowRefBookClients.FieldByName('ParentFolderID').AsInteger;
    fmAddEditGroup.edtGroupName.Name := 'ClientFolderName';
    dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(qSprRef.FieldByName('UpdateProcName').AsString);
    dmRefBooks.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := fmAddEditGroup.CurrentID;
    if fmAddEditGroup.ShowModal = mrOk then
    begin
      dmRefBooks.spShowRefBookClients.Refresh;
      dmRefBooks.spShowRefBookClients.Locate(tlGridClientsGroups.DataController.KeyField, fmAddEditGroup.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditGroup);
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 11; // код справочника!
    qSprRef.Open;
  end;
end;

procedure TfmShowRefBookClients.actExportExecute(Sender: TObject);
begin
  if ExportToExcelSaveDialog.Execute(Self.Handle) then
    if AnsiLowerCase(ExtractFileExt(ExportToExcelSaveDialog.FileName)) = '.xls' then
      ExportGridToExcel(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '')
    else
      ExportGridToXLSX(ExportToExcelSaveDialog.FileName, GridRefBook, True, True, True, '');
end;

procedure TfmShowRefBookClients.actPrintExecute(Sender: TObject);
begin
  prnRefBook.Preview();
end;

procedure TfmShowRefBookClients.actRefreshExecute(Sender: TObject);
begin
  dmRefBooks.spGetClientsForGroup.ParamByName('SearchString').AsString := edtSearchString.Text;

  dmRefBooks.spGetClientsForGroup.Close;
  dmRefBooks.spGetClientsForGroup.Open;
end;

procedure TfmShowRefBookClients.actRefreshGroupExecute(Sender: TObject);
begin
  dmRefBooks.spShowRefBookClients.Close;
  dmRefBooks.spShowRefBookClients.Open;
end;

procedure TfmShowRefBookClients.actViewExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBookClients, fmAddEditRefBookClients);
  try
    fmAddEditRefBookClients.FormMode := fmView;
    fmAddEditRefBookClients.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditRefBookClients.spParentRefBook := dmRefBooks.spGetClientsForGroup;
    fmAddEditRefBookClients.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditRefBookClients.ShowModal;
  finally
    FreeAndNil(fmAddEditRefBookClients);
  end;
end;

procedure TfmShowRefBookClients.actViewGroupExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditGroup, fmAddEditGroup);
  try
    fmAddEditGroup.FormMode := fmView;
    qSprRef.Close;
    qSprRef.ParamByName('ID').AsInteger := 10; // код справочника!
    qSprRef.Open;
    fmAddEditGroup.FormMode := fmView;
    fmAddEditGroup.RefBookName := qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmAddEditGroup.spParentRefBook := dmRefBooks.spShowRefBookClients;
    fmAddEditGroup.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := qSprRef.ParamByName('ID').AsInteger;
    fmAddEditGroup.CurrentID := dmRefBooks.spShowRefBookClients.FieldByName(tlGridClientsGroups.DataController.KeyField).AsInteger;
    fmAddEditGroup.ParentID := dmRefBooks.spShowRefBookClients.FieldByName('ParentFolderID').AsInteger;
    fmAddEditGroup.edtGroupName.Name := 'ClientFolderName';
    fmAddEditGroup.ShowModal;
  finally
    FreeAndNil(fmAddEditGroup);
  end;
end;

procedure TfmShowRefBookClients.alRefBookUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  actEdit.Enabled := (tvRefBook.Controller.FocusedRow <> nil);
  actDelete.Enabled := actEdit.Enabled;
  actView.Enabled := actEdit.Enabled;
  actCopyCell.Enabled := actEdit.Enabled;

  actEditGroup.Enabled := (tlGridClientsGroups.FocusedNode <> nil);
  actDeleteGroup.Enabled := actEditGroup.Enabled;
  actViewGroup.Enabled := actEditGroup.Enabled;
  actCopyCellClientsGroups.Enabled := actEditGroup.Enabled;

end;

procedure TfmShowRefBookClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PostMessage(MainForm.Handle,WM_USER + 1, UIntPtr(Self), 0);
end;

procedure TfmShowRefBookClients.FormShow(Sender: TObject);
var
  i: Integer;
begin
  dmRefBooks.spShowRefBookClients.Open;

  qSprRef.ParamByName('ID').AsInteger := 11; // код справочника!
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
