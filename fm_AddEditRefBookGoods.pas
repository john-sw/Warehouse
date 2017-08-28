unit fm_AddEditRefBookGoods;

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
  cxSpinEdit, cxDBNavigator, HTMLabel;

type
  TfmAddEditRefBookGoods = class(TForm)
    pnlClient: TAdvPanel;
    ProdDescription: TcxTextEdit;
    CountryID: TcxLookupComboBox;
    ArticleNumber: TcxTextEdit;
    OnlyIntSales: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    BruttoWeight: TcxCalcEdit;
    ProdVolume: TcxCalcEdit;
    Comment: TcxTextEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    NettoWeight: TcxCalcEdit;
    GridDescr: TcxGrid;
    tvDescriptions: TcxGridDBTableView;
    GridDescrLevel1: TcxGridLevel;
    GridBarcode: TcxGrid;
    tvBarcodes: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    spRefBookFieldsAddEditView: TUniStoredProc;
    dsCountries: TUniDataSource;
    qCountries: TUniQuery;
    qUnit: TUniQuery;
    dsUnit: TUniDataSource;
    ilRefBookActionImages: TcxImageList;
    tbBarcode: TRzToolbar;
    RzToolButton4: TRzToolButton;
    RzSpacer5: TRzSpacer;
    RzToolButton5: TRzToolButton;
    RzSpacer6: TRzSpacer;
    RzToolButton6: TRzToolButton;
    alRefBook: TActionList;
    actAddBarcode: TAction;
    actEditBarcode: TAction;
    actDeleteBarcode: TAction;
    spDescriptions: TUniStoredProc;
    dsDescriptions: TUniDataSource;
    dsBarcodes: TUniDataSource;
    spBarcodes: TUniStoredProc;
    tvBarcodesColumn1: TcxGridDBColumn;
    tbDescr: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton2: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzToolButton3: TRzToolButton;
    actAddDescr: TAction;
    actEditDescr: TAction;
    actDeleteDescr: TAction;
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
    UnitID: TcxLookupComboBox;
    ThermoTypeID: TcxLookupComboBox;
    dsThermoType: TUniDataSource;
    qThermoType: TUniQuery;
    ProdName: TcxTextEdit;
    mdDescr: TdxMemData;
    mdDescrProdDescrID: TIntegerField;
    mdDescrProdDescription: TStringField;
    tvDescriptionsColumn1: TcxGridDBColumn;
    mdBarcode: TdxMemData;
    mdBarcodeBarCodeID: TIntegerField;
    mdBarcodeBarCode: TStringField;
    mdBarcodeUnitQty: TIntegerField;
    tvBarcodesColumn2: TcxGridDBColumn;
    tvDescriptionsRecId: TcxGridDBColumn;
    lblLabel1: THTMLabel;
    lblLabel2: THTMLabel;
    lblLabel4: THTMLabel;
    lblLabel7: THTMLabel;
    lblLabel9: THTMLabel;
    lblLabel12: THTMLabel;
    lblLabel13: THTMLabel;
    lblLabel8: THTMLabel;
    lblLabel3: THTMLabel;
    lblLabel5: THTMLabel;
    lbl1: THTMLabel;
    procedure FormShow(Sender: TObject);
    procedure actAddBarcodeExecute(Sender: TObject);
    procedure actEditBarcodeExecute(Sender: TObject);
    procedure actDeleteBarcodeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure actAddDescrExecute(Sender: TObject);
    procedure actEditDescrExecute(Sender: TObject);
    procedure actDeleteDescrExecute(Sender: TObject);
    procedure mdDescrAfterPost(DataSet: TDataSet);
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
  fmAddEditRefBookGoods: TfmAddEditRefBookGoods;

implementation

{$R *.dfm}

uses dm_main, fm_AddEditLinkedRefBook;

procedure TfmAddEditRefBookGoods.actAddBarcodeExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Штрих-коды товара';
    fmAddEditLinkedRefBook.FormMode := fmAdd;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 9; //barcodes
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdBarcode;

    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    begin
      GridBarcode.SetFocus;
      tvBarcodesColumn1.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookGoods.actAddDescrExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Описание товара';
    fmAddEditLinkedRefBook.FormMode := fmAdd;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 8; //descriptions
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdDescr;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    begin
      GridDescr.SetFocus;
      tvDescriptionsColumn1.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookGoods.actDeleteBarcodeExecute(Sender: TObject);
begin
  if tvBarcodes.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvBarcodes.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditRefBookGoods.actDeleteDescrExecute(Sender: TObject);
begin
  if tvDescriptions.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvDescriptions.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditRefBookGoods.actEditBarcodeExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Штрих-коды товара';
    fmAddEditLinkedRefBook.FormMode := fmEdit;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 9; //barcodes
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdBarcode;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    begin
      GridBarcode.SetFocus;
      tvBarcodesColumn1.FocusWithSelection;
    end
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookGoods.actEditDescrExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Описание товара';
    fmAddEditLinkedRefBook.FormMode := fmEdit;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 8; //descriptions
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdDescr;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    begin
      GridDescr.SetFocus;
      tvDescriptionsColumn1.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookGoods.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditRefBookGoods.SetParamsAndExecStoredProc(sp: TUniStoredProc);
var
  sp1: TUniStoredProc;
begin
  try
    dmMain.MainConnection.StartTransaction;

    sp.ParamByName('ProdCatID').Value := ParentID;
    sp.ParamByName('ProdName').Value := ProdName.Text;
    sp.ParamByName('ProdDescription').Value := ProdDescription.Text;
    sp.ParamByName('ArticleNumber').Value := ArticleNumber.Text;
    sp.ParamByName('CountryID').Value := CountryID.EditValue;
    sp.ParamByName('UnitID').Value := UnitID.EditValue;
    sp.ParamByName('ThermoTypeID').Value := ThermoTypeID.EditValue;
    sp.ParamByName('OnlyIntSales').Value := Integer(OnlyIntSales.Checked);
    sp.ParamByName('NettoWeight').Value := NettoWeight.Value;
    sp.ParamByName('BruttoWeight').Value := BruttoWeight.Value;
    sp.ParamByName('ProdVolume').Value := ProdVolume.Value;
    sp.ParamByName('Comment').Value := Comment.Text;
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
      dmMain.MainConnection.Commit;
    finally
      FreeAndNil(sp1);
    end;
  except
    if dmMain.MainConnection.InTransaction then
      dmMain.MainConnection.Rollback;
  end;
end;

function TfmAddEditRefBookGoods.CheckReqControls: TWinControl;
begin
  Result := nil;

  dmRefBooks.spGetReferenceFieldList.Close;
  dmRefBooks.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 7; //prod
  dmRefBooks.spGetReferenceFieldList.Open;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(Comment), dmRefBooks.spGetReferenceFieldList, 'Comment') then
    Result := Comment;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(UnitID), dmRefBooks.spGetReferenceFieldList, 'UnitID') then
    Result := UnitID;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ProdVolume), dmRefBooks.spGetReferenceFieldList, 'ProdVolume') then
    Result := ProdVolume;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(BruttoWeight), dmRefBooks.spGetReferenceFieldList, 'BruttoWeight') then
    Result := BruttoWeight;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(NettoWeight), dmRefBooks.spGetReferenceFieldList, 'NettoWeight') then
    Result := NettoWeight;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(OnlyIntSales), dmRefBooks.spGetReferenceFieldList, 'OnlyIntSales') then
    Result := OnlyIntSales;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ThermoTypeID), dmRefBooks.spGetReferenceFieldList, 'ThermoTypeID') then
    Result := ThermoTypeID;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(CountryID), dmRefBooks.spGetReferenceFieldList, 'CountryID') then
    Result := CountryID;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ArticleNumber), dmRefBooks.spGetReferenceFieldList, 'ArticleNumber') then
    Result := ArticleNumber;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ProdDescription), dmRefBooks.spGetReferenceFieldList, 'ProdDescription') then
    Result := ProdDescription;

  if not dm_RefBooks.CheckControl(TcxCustomEdit(ProdName), dmRefBooks.spGetReferenceFieldList, 'ProdName') then
    Result := ProdName;
end;

procedure TfmAddEditRefBookGoods.btnSaveClick(Sender: TObject);
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

procedure TfmAddEditRefBookGoods.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfmAddEditRefBookGoods.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditRefBookGoods.FormShow(Sender: TObject);
begin
  qCountries.Open;
  qUnit.Open;
  qThermoType.Open;
  if FormMode in [fmEdit, fmView] then
    with dmRefBooks.spGetGoodsForProdCat do
    begin
      ProdName.Text := FieldByName('ProdName').AsString;
      ProdDescription.Text := FieldByName('ProdDescription').AsString;
      ArticleNumber.Text := FieldByName('ArticleNumber').AsString;
      CountryID.EditValue := FieldByName('CountryID').AsInteger;
      UnitID.EditValue := FieldByName('UnitID').AsInteger;
      ThermoTypeID.EditValue := FieldByName('ThermoTypeID').AsInteger;
      OnlyIntSales.Checked := Boolean(FieldByName('OnlyIntSales').AsInteger);
      NettoWeight.Value := FieldByName('NettoWeight').AsFloat;
      BruttoWeight.Value := FieldByName('BruttoWeight').AsFloat;
      ProdVolume.Value := FieldByName('ProdVolume').AsFloat;
      Comment.Text := FieldByName('Comment').AsString;
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

  case FormMode of
    fmAdd: Caption := 'Добавление товара';
    fmEdit: Caption := 'Изменение товара';
    fmView:
      begin
        Caption := 'Просмотр товара';
        SetControlsReadOnly(Self, True);
        tbDescr.Visible := False;
        tbBarcode.Visible := False;
        GridDescr.PopupMenu := nil;
        GridBarcode.PopupMenu := nil;
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;

  DrawRequiredAsterisks(Self, 7); //prod

  IsModified := False;
end;

procedure TfmAddEditRefBookGoods.mdDescrAfterPost(DataSet: TDataSet);
begin
  IsModified := True;
end;

end.
