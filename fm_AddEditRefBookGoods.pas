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
  cxGrid, Uni, MemDS, DBAccess, System.Actions, Vcl.ActnList, RzPanel, RzButton, Vcl.ImgList, AdvMenus;

type
  TfmAddEditRefBookGoods = class(TForm)
    pnlClient: TAdvPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    edtProdName: TcxTextEdit;
    lcCountry: TcxLookupComboBox;
    edtArticleNumber: TcxTextEdit;
    lcUnit: TcxLookupComboBox;
    cbOnlyIntSales: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel9: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    ceBruttoWeight: TcxCalcEdit;
    ceProdVolume: TcxCalcEdit;
    edtComment: TcxTextEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    ceNettoWeight: TcxCalcEdit;
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
    tvDescriptionsColumn1: TcxGridDBColumn;
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
    procedure FormShow(Sender: TObject);
    procedure actAddBarcodeExecute(Sender: TObject);
    procedure actEditBarcodeExecute(Sender: TObject);
    procedure actDeleteBarcodeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
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

procedure TfmAddEditRefBookGoods.actAddBarcodeExecute(Sender: TObject);
begin
  spBarcodes.Insert;
end;

procedure TfmAddEditRefBookGoods.actDeleteBarcodeExecute(Sender: TObject);
begin
  spBarcodes.Delete;
end;

procedure TfmAddEditRefBookGoods.actEditBarcodeExecute(Sender: TObject);
begin
  spBarcodes.Edit;
end;

procedure TfmAddEditRefBookGoods.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditRefBookGoods.SetParamsAndExecStoredProc(sp: TUniStoredProc);
var
   i: Integer;
   c: TControl;
begin
  {for i := 0 to pnlClient.ControlCount - 1 do
  begin
    c := TAdvPanel(pnlClient.Controls[i]).Controls[1];
    sp.ParamByName(c.Name).Value := GetControlValue(c);
  end; }
  sp.ParamByName('ProdCatID').Value := ParentID;
  sp.ParamByName('ProdName').Value := edtProdName.Text;
//  sp.ParamByName('ProdDescription').Value := edtComment.Text;
  sp.ParamByName('ArticleNumber').Value := edtArticleNumber.Text;
  sp.ParamByName('CountryID').Value := lcCountry.EditValue;
  sp.ParamByName('UnitID').Value := lcUnit.EditValue;
  //sp.ParamByName('ThermoTypeID').Value := ParentID;
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

end;

function TfmAddEditRefBookGoods.CheckReqControls: TWinControl;
begin
  if Trim(edtComment.Text) <> '' then
    edtComment.Style.BorderColor := clWindowFrame
  else
  begin
    edtComment.Style.BorderColor := clRed;
    Result := edtComment;
  end;

  if ceProdVolume.Value <> 0 then
    ceProdVolume.Style.BorderColor := clWindowFrame
  else
  begin
    ceProdVolume.Style.BorderColor := clRed;
    Result := ceProdVolume;
  end;

  if ceBruttoWeight.Value <> 0 then
    ceBruttoWeight.Style.BorderColor := clWindowFrame
  else
  begin
    ceBruttoWeight.Style.BorderColor := clRed;
    Result := ceBruttoWeight;
  end;

  if ceNettoWeight.Value <> 0 then
    ceNettoWeight.Style.BorderColor := clWindowFrame
  else
  begin
    ceNettoWeight.Style.BorderColor := clRed;
    Result := ceNettoWeight;
  end;

  if Trim(VarToStr(lcUnit.EditValue)) <> '' then
    lcUnit.Style.BorderColor := clWindowFrame
  else
  begin
    lcUnit.Style.BorderColor := clRed;
    Result := lcUnit;
  end;

  if Trim(VarToStr(lcCountry.EditValue)) <> '' then
    lcCountry.Style.BorderColor := clWindowFrame
  else
  begin
    lcCountry.Style.BorderColor := clRed;
    Result := lcCountry;
  end;

  if Trim(edtArticleNumber.Text) <> '' then
    edtArticleNumber.Style.BorderColor := clWindowFrame
  else
  begin
    edtArticleNumber.Style.BorderColor := clRed;
    Result := edtArticleNumber;
  end;

  if Trim(edtProdName.Text) <> '' then
    edtProdName.Style.BorderColor := clWindowFrame
  else
  begin
    edtProdName.Style.BorderColor := clRed;
    Result := edtProdName;
  end;

end;

procedure TfmAddEditRefBookGoods.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode = fmAdd) or IsControlsModified(pnlClient) then
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
  if IsControlsModified(pnlClient) then
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
  if FormMode in [fmEdit, fmView] then
    with dmRefBooks.spGetGoodsForProdCat do
    begin
      edtProdName.Text := FieldByName('ProdName').AsString;
      edtArticleNumber.Text := FieldByName('ArticleNumber').AsString;
      lcCountry.EditValue := FieldByName('CountryID').AsInteger;
      lcUnit.EditValue := FieldByName('UnitID').AsInteger;
      cbOnlyIntSales.Checked := Boolean(FieldByName('OnlyIntSales').AsInteger);
      ceNettoWeight.Value := FieldByName('NettoWeight').AsFloat;
      ceBruttoWeight.Value := FieldByName('BruttoWeight').AsFloat;
      ceProdVolume.Value := FieldByName('ProdVolume').AsFloat;
      edtComment.Text := FieldByName('Comment').AsString;
      spDescriptions.ParamByName('ProdID').Value := FieldByName('ProdID').AsInteger;
      spDescriptions.Open;
      spBarcodes.ParamByName('ProdID').Value := FieldByName('ProdID').AsInteger;
      spBarcodes.Open;
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
      end;
  end;
end;

end.
