unit fm_AddEditInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxPC, cxDropDownEdit, cxCalc, cxGroupBox, cxCheckBox, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel,
  Vcl.ExtCtrls, AdvPanel, dm_RefBooks, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Uni, MemDS, DBAccess, System.Actions, Vcl.ActnList, RzPanel, RzButton, Vcl.ImgList, AdvMenus, dxmdaset,
  cxSpinEdit, cxDBNavigator, AdvGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxButtonEdit, HTMLabel,
  cxCurrencyEdit;

type
  TfmAddEditInvoice = class(TForm)
    pnlClient: TAdvPanel;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    ilRefBookActionImages: TcxImageList;
    alRefBook: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    dsInvoiceList: TUniDataSource;
    spInvoiceList: TUniStoredProc;
    pmDescr: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    pmBarcode: TAdvPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    DocNumber: TcxTextEdit;
    mdInvoiceList: TdxMemData;
    AdvGroupBox1: TAdvGroupBox;
    GridInvoiceList: TcxGrid;
    tvInvoiceList: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    tbInvoiceList: TRzToolbar;
    RzToolButton4: TRzToolButton;
    RzSpacer5: TRzSpacer;
    RzToolButton5: TRzToolButton;
    RzSpacer6: TRzSpacer;
    RzToolButton6: TRzToolButton;
    DocDate: TcxDateEdit;
    PricePercent: TcxCalcEdit;
    Consignor: TcxButtonEdit;
    Consignee: TcxButtonEdit;
    Supplier: TcxButtonEdit;
    Payer: TcxButtonEdit;
    tvInvoiceListPartID: TcxGridDBColumn;
    tvInvoiceListInvoiceID: TcxGridDBColumn;
    tvInvoiceListCountryCode: TcxGridDBColumn;
    tvInvoiceListProdID: TcxGridDBColumn;
    tvInvoiceListProdDescrID: TcxGridDBColumn;
    tvInvoiceListQty: TcxGridDBColumn;
    tvInvoiceListContractPrice: TcxGridDBColumn;
    tvInvoiceListSalePrice: TcxGridDBColumn;
    tvInvoiceListTax: TcxGridDBColumn;
    tvInvoiceListGtdNumber: TcxGridDBColumn;
    tvInvoiceListContractSumma: TcxGridDBColumn;
    tvInvoiceListPricePercent: TcxGridDBColumn;
    tvInvoiceListOrigPartID: TcxGridDBColumn;
    tvInvoiceListCountryName: TcxGridDBColumn;
    tvInvoiceListProdName: TcxGridDBColumn;
    tvInvoiceListProdDescription: TcxGridDBColumn;
    qSprRef: TUniQuery;
    spRefBookFieldsBrowse: TUniStoredProc;
    qWarehouse: TUniQuery;
    dsWarehouse: TUniDataSource;
    WhouseID: TcxLookupComboBox;
    lblLabel1: THTMLabel;
    lblLabel4: THTMLabel;
    lblLabel3: THTMLabel;
    lblLabel5: THTMLabel;
    lblLabel2: THTMLabel;
    lblLabel6: THTMLabel;
    lblLabel9: THTMLabel;
    lblLabel7: THTMLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mdDescrAfterPost(DataSet: TDataSet);
    procedure RzToolButton1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    IsModified: Boolean;
    procedure SetParamsAndExecStoredProc(sp: TUniStoredProc);
    function CheckReqControls: TWinControl;
    { Private declarations }
  public
    { Public declarations }
    FormMode: TRefBookFormMode;
    CurrentID: Integer;
    ParentID: Integer;
    RefBookName: string;
    spParentRefBook: TUniStoredProc;
  end;

var
  fmAddEditInvoice: TfmAddEditInvoice;

implementation

{$R *.dfm}

uses dm_main, fm_AddEditLinkedRefBook, fm_ShowRefBookClients, fm_AddEditInvoiceLine;

procedure TfmAddEditInvoice.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditInvoiceLine, fmAddEditInvoiceLine);
  try
    fmAddEditInvoiceLine.RefBookName := 'позиция документа';
    fmAddEditInvoiceLine.FormMode := fmAdd;
    fmAddEditInvoiceLine.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 16; //invoice line
    fmAddEditInvoiceLine.rsRefBookDataSet := mdInvoiceList;
    fmAddEditInvoiceLine.PricePercent.Value := PricePercent.Value;
    if fmAddEditInvoiceLine.ShowModal = mrOk then
    begin
      GridInvoiceList.SetFocus;
      tvInvoiceListPartID.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditInvoiceLine);
  end;
end;

procedure TfmAddEditInvoice.actDeleteExecute(Sender: TObject);
begin
  if tvInvoiceList.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvInvoiceList.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditInvoice.actEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditInvoiceLine, fmAddEditInvoiceLine);
  try
    fmAddEditInvoiceLine.RefBookName := 'позиция документа';
    fmAddEditInvoiceLine.FormMode := fmEdit;
    fmAddEditInvoiceLine.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 16; //invoice line
    fmAddEditInvoiceLine.rsRefBookDataSet := mdInvoiceList;

    if fmAddEditInvoiceLine.ShowModal = mrOk then
    begin
      GridInvoiceList.SetFocus;
      tvInvoiceListPartID.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditInvoiceLine);
  end;
end;

procedure TfmAddEditInvoice.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditInvoice.SetParamsAndExecStoredProc(sp: TUniStoredProc);
var
  sp1: TUniStoredProc;
begin
  try
    dmMain.MainConnection.StartTransaction;

    sp.ParamByName('DocNumber').Value := DocNumber.Text;
    sp.ParamByName('DocDate').Value := DocDate.Date;
    if Consignor.Properties.Buttons.Items[0].Tag = 0 then
      sp.ParamByName('Consignor').Clear
    else
      sp.ParamByName('Consignor').Value := Consignor.Properties.Buttons.Items[0].Tag;
    if Consignee.Properties.Buttons.Items[0].Tag = 0 then
      sp.ParamByName('Consignee').Clear
    else
      sp.ParamByName('Consignee').Value := Consignee.Properties.Buttons.Items[0].Tag;
    if Supplier.Properties.Buttons.Items[0].Tag = 0 then
      sp.ParamByName('Supplier').Clear
    else
      sp.ParamByName('Supplier').Value := Supplier.Properties.Buttons.Items[0].Tag;
    if Payer.Properties.Buttons.Items[0].Tag = 0 then
      sp.ParamByName('Payer').Clear
    else
      sp.ParamByName('Payer').Value := Payer.Properties.Buttons.Items[0].Tag;
    sp.ParamByName('WhouseID').Value := WhouseID.EditValue;
    sp.ParamByName('PricePercent').Value := PricePercent.Value;
    sp.ParamByName('IsAccept').Value := 0;
    sp.ParamByName('InvoiceTypeID').Value := 1;

    ;
{ @SumTotal NUMERIC(18, 2) = NULL,
  @TaxSumTotal NUMERIC(18, 2) = NULL,
  @SumTotalWithTax NUMERIC(18, 2) = NULL,
  @TotalLine INT = NULL,
  @TotalQty NUMERIC(14, 2) = NULL,
  @Comment VARCHAR(64) = NULL,
 }
    if (FormMode = fmAdd) then
    begin
      sp.Open;
      if not sp.Eof then
        CurrentID := sp.FieldByName('ID').AsInteger;
    end
    else
      sp.Execute;

    try
      sp1 := TUniStoredProc.Create(Nil);
      sp1.Connection := dmMain.MainConnection;

      if (FormMode = fmEdit) then
      begin
        sp1.CreateProcCall('delInvoiceLine');
        spInvoiceList.First;
        while not spInvoiceList.Eof do
        begin
          if not mdInvoiceList.Locate('PartID', spInvoiceList.FieldByName('PartID').AsInteger, []) then
          begin
            sp1.ParamByName('ID').AsInteger := spInvoiceList.FieldByName('PartID').AsInteger;
            sp1.Execute;
          end;
          spInvoiceList.Next;
        end;
      end;
      mdInvoiceList.First;
      while not mdInvoiceList.Eof do
      begin
        if mdInvoiceList.FieldByName('PartID').IsNull then
          sp1.CreateProcCall('insInvoiceLine')
        else
        begin
          sp1.CreateProcCall('updInvoiceLine');
          sp1.ParamByName('ID').AsInteger := mdInvoiceList.FieldByName('PartID').AsInteger;
        end;

        sp1.ParamByName('InvoiceID').Value := CurrentID;
        sp1.ParamByName('ProdID').Value := mdInvoiceList.FieldByName('ProdID').Value;
        sp1.ParamByName('ProdDescrID').Value := mdInvoiceList.FieldByName('ProdDescrID').Value;
        sp1.ParamByName('CountryCode').Value := mdInvoiceList.FieldByName('CountryCode').Value;
        sp1.ParamByName('Qty').Value := mdInvoiceList.FieldByName('Qty').Value;
        sp1.ParamByName('ContractPrice').Value := mdInvoiceList.FieldByName('ContractPrice').Value;
        sp1.ParamByName('SalePrice').Value := mdInvoiceList.FieldByName('SalePrice').Value;
        sp1.ParamByName('Tax').Value := mdInvoiceList.FieldByName('Tax').Value;
        sp1.ParamByName('GtdNumber').Value := mdInvoiceList.FieldByName('GtdNumber').Value;
        sp1.ParamByName('PricePercent').Value := mdInvoiceList.FieldByName('PricePercent').Value;
        sp1.ParamByName('OrigPartID').Clear;

        sp1.Execute;
        mdInvoiceList.Next;
      end;
      dmMain.MainConnection.Commit;
    finally
      FreeAndNil(sp1);
    end;
  except
    if dmMain.MainConnection.InTransaction then
      dmMain.MainConnection.Rollback;
  end;
end;

function TfmAddEditInvoice.CheckReqControls: TWinControl;
begin
  Result := nil;

  dmRefBooks.spGetReferenceFieldList.Close;
  dmRefBooks.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 15; //invoice
  dmRefBooks.spGetReferenceFieldList.Open;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(PricePercent), dmRefBooks.spGetReferenceFieldList, 'PricePercent') then
    Result := PricePercent;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(Payer), dmRefBooks.spGetReferenceFieldList, 'Payer') then
    Result := Payer;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(Supplier), dmRefBooks.spGetReferenceFieldList, 'Supplier') then
    Result := Supplier;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(Consignee), dmRefBooks.spGetReferenceFieldList, 'Consignee') then
    Result := Consignee;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(Consignor), dmRefBooks.spGetReferenceFieldList, 'Consignor') then
    Result := Consignor;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(WhouseID), dmRefBooks.spGetReferenceFieldList, 'WhouseID') then
    Result := WhouseID;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(DocDate), dmRefBooks.spGetReferenceFieldList, 'DocDate') then
    Result := DocDate;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(DocNumber), dmRefBooks.spGetReferenceFieldList, 'DocNumber') then
    Result := DocNumber;

  dmRefBooks.spGetReferenceFieldList.Close;
end;

procedure TfmAddEditInvoice.cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  frm: TfmShowRefBookClients;
begin
  if AButtonIndex = 0 then
    try
      Application.CreateForm(TfmShowRefBookClients, frm);
      frm.CurrentID := TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag;
      if frm.ShowModal = mrOk then
      begin
        TcxButtonEdit(Sender).Text := frm.tvRefBook.Controller.FocusedRow.Values[3];
        TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := frm.tvRefBook.Controller.FocusedRow.Values[0];

        if (Sender = Consignor) and (Supplier.Properties.Buttons.Items[0].Tag = 0) then
        begin
          Supplier.Text := frm.tvRefBook.Controller.FocusedRow.Values[3];
          Supplier.Properties.Buttons.Items[0].Tag := frm.tvRefBook.Controller.FocusedRow.Values[0];
        end;
        if (Sender = Consignee) and (Payer.Properties.Buttons.Items[0].Tag = 0) then
        begin
          Payer.Text := frm.tvRefBook.Controller.FocusedRow.Values[3];
          Payer.Properties.Buttons.Items[0].Tag := frm.tvRefBook.Controller.FocusedRow.Values[0];
        end;

        IsModified := True;
      end;
    finally
      FreeAndNil(frm);
    end
  else
    begin
      TcxButtonEdit(Sender).Text := '';
      TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := 0;
      IsModified := True;
    end;
end;

procedure TfmAddEditInvoice.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode = fmAdd) or IsModified or IsControlsModified(pnlClient) then
  begin
    InvalidControl := CheckReqControls;
    if InvalidControl = nil then
    begin
      SetParamsAndExecStoredProc(dmRefBooks.spInsertUpdateDeleteRefBook);
      ModalResult := mrOk;
    end
    else
    begin
      MessageBox(Self.Handle,'Необходимо заполнить обязательные поля', 'Ошибка', MB_OK + MB_ICONERROR);
      InvalidControl.SetFocus;
    end;
  end
  else
    ModalResult := mrCancel;
end;

procedure TfmAddEditInvoice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // ModalResult может быть установлен в btnSaveClick
  if (FormMode = fmView) then
    ModalResult := mrOk;
  if ModalResult = mrOk then
  begin
    CanClose := True;
    Exit;
  end;
  if IsModified or IsControlsModified(pnlClient) then
    if MessageBox(0,'Вы действительно хотите выйти без сохранения изменений?',
                  'Подтверждение', MB_YESNO + MB_ICONQUESTION) = ID_YES then
      ModalResult := mrNo
    else
      ModalResult := mrCancel
  else
    ModalResult := mrNo;
  CanClose := (ModalResult <> mrCancel);
end;

procedure TfmAddEditInvoice.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditInvoice.FormShow(Sender: TObject);
var
  i: Integer;
begin
  qWarehouse.Open;

  if FormMode in [fmEdit, fmView] then
    with spParentRefBook do
    begin
      DocNumber.Text := FieldByName('DocNumber').AsString;
      DocDate.Date := FieldByName('DocDate').AsDatetime;

      Consignor.Properties.Buttons.Items[0].Tag := FieldByName('Consignor').AsInteger;
      Consignor.Text := FieldByName('ConsignorName').AsString;
      Consignee.Properties.Buttons.Items[0].Tag := FieldByName('Consignee').AsInteger;
      Consignee.Text := FieldByName('ConsigneeName').AsString;
      Supplier.Properties.Buttons.Items[0].Tag := FieldByName('Supplier').AsInteger;
      Supplier.Text := FieldByName('SupplierName').AsString;
      Payer.Properties.Buttons.Items[0].Tag := FieldByName('Payer').AsInteger;
      Payer.Text := FieldByName('PayerName').AsString;

      WhouseID.EditValue := FieldByName('WhouseID').AsInteger;
      PricePercent.Value := FieldByName('PricePercent').AsFloat;

      spInvoiceList.ParamByName('InvoiceID').Value := FieldByName('InvoiceID').AsInteger;
      spInvoiceList.Open;
    end
  else
  begin
    spInvoiceList.ParamByName('InvoiceID').Value := -1;
    spInvoiceList.Open;
  end;

  mdInvoiceList.CopyFromDataSet(spInvoiceList);
  mdInvoiceList.First;

  case FormMode of
    fmAdd: Caption := 'Добавление документа';
    fmEdit: Caption := 'Изменение документа';
    fmView:
      begin
        Caption := 'Просмотр документа';
        SetControlsReadOnly(Self, True);
        tbInvoiceList.Visible := False;
        GridInvoiceList.PopupMenu := nil;
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;

  qSprRef.ParamByName('ID').AsInteger := 16; // код справочника!
  qSprRef.Open;
  tvInvoiceList.ClearItems;
  tvInvoiceList.DataController.CreateAllItems;
  spRefBookFieldsBrowse.Close;
  spRefBookFieldsBrowse.ParamByName('ReferenceID').AsInteger := qSprRef.FieldByName('ReferenceID').AsInteger;
  spRefBookFieldsBrowse.Open;
  for i := 0 to tvInvoiceList.ColumnCount - 1 do
    if (spRefBookFieldsBrowse.Locate('BrowserFieldName', tvInvoiceList.Columns[i].Caption, [loCaseInsensitive])) then
    begin
      if (spRefBookFieldsBrowse.FieldByName('IsVisible').AsInteger = 0) then
        tvInvoiceList.Columns[i].Visible := False;

      tvInvoiceList.Columns[i].Caption := spRefBookFieldsBrowse.FieldByName('BrowserFieldRUSName').AsString;
      if spRefBookFieldsBrowse.FieldByName('IsKeyField').AsInteger = 1 then
        tvInvoiceList.DataController.KeyFieldNames := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
      if spRefBookFieldsBrowse.FieldByName('ColumnTypeID').AsInteger = 5 then
      begin
        tvInvoiceList.Columns[i].PropertiesClass := TcxCheckBoxProperties;
        with tvInvoiceList.Columns[i].Properties as TcxCheckBoxProperties do
        begin
          AllowGrayed := False;
          ValueChecked := 1;
          ValueUnchecked := 0;
        end;
      end;
      if spRefBookFieldsBrowse.FieldByName('HaveFilter').AsInteger = 0 then
        tvInvoiceList.Columns[i].Options.Filtering := False;
      if spRefBookFieldsBrowse.FieldByName('HaveSummary').AsInteger = 1 then
      begin
        tvInvoiceList.Columns[i].Summary.FooterKind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
        tvInvoiceList.Columns[i].Summary.FooterFormat := spRefBookFieldsBrowse.FieldByName('FooterFormat').AsString;
        with TcxGridDBTableSummaryItem(tvInvoiceList.DataController.Summary.FooterSummaryItems.Add) do
        begin
          Kind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
          Column := tvInvoiceList.Columns[i];
          FieldName := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
        end;
      end;

      tvInvoiceList.Columns[i].Width := spRefBookFieldsBrowse.FieldByName('Width').AsInteger;
      if not spRefBookFieldsBrowse.FieldByName('DisplayFormat').IsNull then
      begin
        tvInvoiceList.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
        (tvInvoiceList.Columns[i].Properties as TcxCurrencyEditProperties).DisplayFormat := spRefBookFieldsBrowse.FieldByName('DisplayFormat').AsString;
      end;
    end
    else
      tvInvoiceList.Columns[i].Visible := False;
  actEdit.Enabled := (tvInvoiceList.DataController.KeyFieldNames <> '');

  DrawRequiredAsterisks(Self, 15); //invoice

  IsModified := False;
end;

procedure TfmAddEditInvoice.mdDescrAfterPost(DataSet: TDataSet);
begin
  IsModified := True;
end;

procedure TfmAddEditInvoice.RzToolButton1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfmShowRefBookClients, fmShowRefBookClients);
    fmShowRefBookClients.FormStyle := fsNormal;
    fmShowRefBookClients.Hide;
    fmShowRefBookClients.actSelect.Visible := True;
    if fmShowRefBookClients.ShowModal = mrOk then ;
  finally
    FreeAndNil(fmShowRefBookClients);
  end;
end;

end.
