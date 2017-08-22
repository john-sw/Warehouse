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
  cxSpinEdit, cxDBNavigator, AdvGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxButtonEdit;

type
  TfmAddEditInvoice = class(TForm)
    pnlClient: TAdvPanel;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    ilRefBookActionImages: TcxImageList;
    alRefBook: TActionList;
    actAddInvoiceLine: TAction;
    actEditInvoiceLine: TAction;
    actDeleteInvoiceLine: TAction;
    dsBarcodes: TUniDataSource;
    spBarcodes: TUniStoredProc;
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
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    edtProdName: TcxTextEdit;
    mdBarcode: TdxMemData;
    mdBarcodeBarCodeID: TIntegerField;
    mdBarcodeBarCode: TStringField;
    mdBarcodeUnitQty: TIntegerField;
    AdvGroupBox1: TAdvGroupBox;
    GridInvoiceList: TcxGrid;
    tvInvoiceList: TcxGridDBTableView;
    tvInvoiceListColumn1: TcxGridDBColumn;
    tvInvoiceListColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    tbInvoiceList: TRzToolbar;
    RzToolButton4: TRzToolButton;
    RzSpacer5: TRzSpacer;
    RzToolButton5: TRzToolButton;
    RzSpacer6: TRzSpacer;
    RzToolButton6: TRzToolButton;
    cxDateEdit1: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel9: TcxLabel;
    ceNettoWeight: TcxCalcEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxButtonEdit3: TcxButtonEdit;
    cxButtonEdit4: TcxButtonEdit;
    procedure FormShow(Sender: TObject);
    procedure actAddInvoiceLineExecute(Sender: TObject);
    procedure actEditInvoiceLineExecute(Sender: TObject);
    procedure actDeleteInvoiceLineExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

uses dm_main, fm_AddEditLinkedRefBook, fm_ShowRefBookClients;

procedure TfmAddEditInvoice.actAddInvoiceLineExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Штрих-коды товара';
    fmAddEditLinkedRefBook.FormMode := fmAdd;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 9; //barcodes
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdBarcode;

    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    begin
      GridInvoiceList.SetFocus;
      tvInvoiceListColumn1.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditInvoice.actDeleteInvoiceLineExecute(Sender: TObject);
begin
  if tvInvoiceList.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvInvoiceList.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditInvoice.actEditInvoiceLineExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Штрих-коды товара';
    fmAddEditLinkedRefBook.FormMode := fmEdit;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 9; //barcodes
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdBarcode;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    begin
      GridInvoiceList.SetFocus;
      tvInvoiceListColumn1.FocusWithSelection;
    end
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
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
  {try
    dmMain.MainConnection.StartTransaction;

    sp.ParamByName('ProdCatID').Value := ParentID;
    sp.ParamByName('ProdName').Value := edtProdName.Text;
    sp.ParamByName('ProdDescription').Value := edtProdDescr.Text;
    sp.ParamByName('ArticleNumber').Value := edtArticleNumber.Text;
    sp.ParamByName('CountryID').Value := lcCountry.EditValue;
    sp.ParamByName('UnitID').Value := lcUnit.EditValue;
    sp.ParamByName('ThermoTypeID').Value := lcThermoType.EditValue;
    sp.ParamByName('OnlyIntSales').Value := Integer(cbOnlyIntSales.Checked);
    sp.ParamByName('NettoWeight').Value := ceNettoWeight.Value;
    sp.ParamByName('BruttoWeight').Value := ceBruttoWeight.Value;
    sp.ParamByName('ProdVolume').Value := ceProdVolume.Value;
    sp.ParamByName('Comment').Value := edtComment.Text;
    sp.ParamByName('IsVisible').Value := 1;

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
        sp1.CreateProcCall('delProdDescription');
        spDescriptions.First;
        while not spDescriptions.Eof do
        begin
          if not mdDescr.Locate('ProdDescrID', spDescriptions.FieldByName('ProdDescrID').AsInteger, []) then
          begin
            sp1.ParamByName('ID').AsInteger := spDescriptions.FieldByName('ProdDescrID').AsInteger;
            sp1.Execute;
          end;
          spDescriptions.Next;
        end;
        sp1.CreateProcCall('delBarCode');
        spBarcodes.First;
        while not spBarcodes.Eof do
        begin
          if not mdBarcode.Locate('BarCodeID', spBarcodes.FieldByName('BarCodeID').AsInteger, []) then
          begin
            sp1.ParamByName('ID').AsInteger := spBarcodes.FieldByName('BarCodeID').AsInteger;
            sp1.Execute;
          end;
          spBarcodes.Next;
        end;
      end;
      mdDescr.First;
      while not mdDescr.Eof do
      begin
        if mdDescr.FieldByName('ProdDescrID').IsNull then
          sp1.CreateProcCall('insProdDescription')
        else
        begin
          sp1.CreateProcCall('updProdDescription');
          sp1.ParamByName('ID').AsInteger := mdDescr.FieldByName('ProdDescrID').AsInteger;
        end;
        sp1.ParamByName('ProdID').AsInteger := CurrentID;
        sp1.ParamByName('ProdDescription').AsString := mdDescr.FieldByName('ProdDescription').AsString;
        sp1.ParamByName('IsReadOnly').AsInteger := 0;
        sp1.Execute;
        mdDescr.Next;
      end;

      mdBarcode.First;
      while not mdBarcode.Eof do
      begin
        if mdBarcode.FieldByName('BarCodeID').IsNull then
          sp1.CreateProcCall('insBarCode')
        else
        begin
          sp1.CreateProcCall('updBarCode');
          sp1.ParamByName('ID').AsInteger := mdBarcode.FieldByName('BarCodeID').AsInteger;
        end;
        sp1.ParamByName('ProdID').AsInteger := CurrentID;
        sp1.ParamByName('BarCode').AsString := mdBarcode.FieldByName('BarCode').AsString;
        sp1.ParamByName('UnitQty').AsInteger := mdBarcode.FieldByName('UnitQty').AsInteger;
        sp1.Execute;
        mdBarcode.Next;
      end;

    finally
      FreeAndNil(sp1);
    end;
  except
    if dmMain.MainConnection.InTransaction then
      dmMain.MainConnection.Rollback;
  end;   }
end;

function TfmAddEditInvoice.CheckReqControls: TWinControl;
begin
  Result := nil;

  {dmRefBooks.spGetReferenceFieldList.Close;
  dmRefBooks.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 7; //prod
  dmRefBooks.spGetReferenceFieldList.Open;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(edtComment), dmRefBooks.spGetReferenceFieldList, 'Comment') then
    Result := edtComment;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(lcUnit), dmRefBooks.spGetReferenceFieldList, 'UnitID') then
    Result := lcUnit;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ceProdVolume), dmRefBooks.spGetReferenceFieldList, 'ProdVolume') then
    Result := ceProdVolume;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ceBruttoWeight), dmRefBooks.spGetReferenceFieldList, 'BruttoWeight') then
    Result := ceBruttoWeight;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ceNettoWeight), dmRefBooks.spGetReferenceFieldList, 'NettoWeight') then
    Result := ceNettoWeight;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(lcThermoType), dmRefBooks.spGetReferenceFieldList, 'ThermoTypeID') then
    Result := lcThermoType;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(lcCountry), dmRefBooks.spGetReferenceFieldList, 'CountryID') then
    Result := lcCountry;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(edtArticleNumber), dmRefBooks.spGetReferenceFieldList, 'ArticleNumber') then
    Result := edtArticleNumber;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(edtProdName), dmRefBooks.spGetReferenceFieldList, 'ProdName') then
    Result := edtProdName;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(edtProdDescr), dmRefBooks.spGetReferenceFieldList, 'ProdDescription') then
    Result := edtProdDescr;  }
end;


procedure TfmAddEditInvoice.cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  frm: TfmShowRefBookClients;
begin
  try
    Application.CreateForm(TfmShowRefBookClients, frm);

    if frm.ShowModal = mrOk then
      TcxButtonEdit(Sender).Text := frm.tvRefBook.Controller.FocusedRow.Values[3];
  finally
    FreeAndNil(frm);
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
begin
  {qCountries.Open;
  qUnit.Open;
  qThermoType.Open;
  if FormMode in [fmEdit, fmView] then
    with dmRefBooks.spGetGoodsForProdCat do
    begin
      edtProdName.Text := FieldByName('ProdName').AsString;
      edtProdDescr.Text := FieldByName('ProdDescription').AsString;
      edtArticleNumber.Text := FieldByName('ArticleNumber').AsString;
      lcCountry.EditValue := FieldByName('CountryID').AsInteger;
      lcUnit.EditValue := FieldByName('UnitID').AsInteger;
      lcThermoType.EditValue := FieldByName('ThermoTypeID').AsInteger;
      cbOnlyIntSales.Checked := Boolean(FieldByName('OnlyIntSales').AsInteger);
      ceNettoWeight.Value := FieldByName('NettoWeight').AsFloat;
      ceBruttoWeight.Value := FieldByName('BruttoWeight').AsFloat;
      ceProdVolume.Value := FieldByName('ProdVolume').AsFloat;
      edtComment.Text := FieldByName('Comment').AsString;
      spDescriptions.ParamByName('ProdID').Value := FieldByName('ProdID').AsInteger;
      spDescriptions.Open;
      spBarcodes.ParamByName('ProdID').Value := FieldByName('ProdID').AsInteger;
      spBarcodes.Open;
    end
  else
  begin
    spDescriptions.ParamByName('ProdID').Value := 0;
    spDescriptions.Open;
    spBarcodes.ParamByName('ProdID').Value := 0;
    spBarcodes.Open;
  end;
  mdDescr.FieldByName('ProdDescription').Size := spDescriptions.FieldByName('ProdDescription').Size;
  mdDescr.Open;
  while not spDescriptions.Eof do
  begin
    mdDescr.Insert;
    mdDescr.FieldByName('ProdDescrID').AsString := spDescriptions.FieldByName('ProdDescrID').AsString;
    mdDescr.FieldByName('ProdDescription').AsString := spDescriptions.FieldByName('ProdDescription').AsString;
    mdDescr.Post;
    spDescriptions.Next;
  end;

  mdBarcode.FieldByName('BarCode').Size := spBarcodes.FieldByName('BarCode').Size;
  mdBarcode.Open;
  while not spBarcodes.Eof do
  begin
    mdBarcode.Insert;
    mdBarcode.FieldByName('BarCodeID').AsString := spBarcodes.FieldByName('BarCodeID').AsString;
    mdBarcode.FieldByName('BarCode').AsString := spBarcodes.FieldByName('BarCode').AsString;
    mdBarcode.FieldByName('UnitQty').AsInteger := spBarcodes.FieldByName('UnitQty').AsInteger;
    mdBarcode.Post;
    spBarcodes.Next;
  end;
  }
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
