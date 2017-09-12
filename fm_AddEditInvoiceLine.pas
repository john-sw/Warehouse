unit fm_AddEditInvoiceLine;

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
  Vcl.ExtCtrls, AdvPanel, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Uni, MemDS, DBAccess, System.Actions, Vcl.ActnList, RzPanel, RzButton, Vcl.ImgList, AdvMenus, dxmdaset,
  cxSpinEdit, cxDBNavigator, AdvGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxButtonEdit, HTMLabel,
  dm_main;

const
  WM_ShowRefBook = WM_USER + 1;

type
  TfmAddEditInvoiceLine = class(TForm)
    pnlClient: TAdvPanel;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    ilRefBookActionImages: TcxImageList;
    PricePercent: TcxCalcEdit;
    ProdID: TcxButtonEdit;
    qSprRef: TUniQuery;
    spRefBookFieldsBrowse: TUniStoredProc;
    dsDescrGood: TUniDataSource;
    lblLabel3: THTMLabel;
    lblLabel5: THTMLabel;
    lblLabel2: THTMLabel;
    lblLabel6: THTMLabel;
    lblLabel9: THTMLabel;
    ProdDescrID: TcxLookupComboBox;
    lbl1: THTMLabel;
    SalePrice: TcxCalcEdit;
    Qty: TcxCalcEdit;
    lblLabel4: THTMLabel;
    CountryCode: TcxLookupComboBox;
    lbl2: THTMLabel;
    ContractPrice: TcxCalcEdit;
    qCountries: TUniQuery;
    dsCountries: TUniDataSource;
    lbl3: THTMLabel;
    spDescrGood: TUniStoredProc;
    Tax: TcxComboBox;
    GtdNumber: TcxTextEdit;
    btnAddDescr: TcxButton;
    mdDescr: TdxMemData;
    mdDescrProdDescrID: TIntegerField;
    mdDescrProdDescription: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ProdIDPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ContractPricePropertiesChange(Sender: TObject);
    procedure btnAddDescrClick(Sender: TObject);
  private
    IsModified: Boolean;
    function CheckReqControls: TWinControl;
    procedure AppendUpdateRecordSet;
    procedure WMShowRefBook(var msg: TMessage); message WM_ShowRefBook;
    { Private declarations }
  public
    { Public declarations }
    FormMode: TRefBookFormMode;
    CurrentID: Integer;
    ParentID: Integer;
    RefBookName: string;
    rsRefBookDataSet: TDataSet;
  end;

var
  fmAddEditInvoiceLine: TfmAddEditInvoiceLine;

implementation

{$R *.dfm}

uses fm_AddEditLinkedRefBook, fm_ShowRefBookGoods;

procedure TfmAddEditInvoiceLine.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TfmAddEditInvoiceLine.CheckReqControls: TWinControl;
var
   i: Integer;
begin
  Result := nil;

  dmMain.spGetReferenceFieldList.Close;
  dmMain.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 16; //invoice list
  dmMain.spGetReferenceFieldList.Open;

  for i := pnlClient.ControlCount - 1 downto 0 do
    if (pnlClient.Controls[i] is TcxCustomEdit) then
      if not CheckControl(TcxCustomEdit(pnlClient.Controls[i]), dmMain.spGetReferenceFieldList) then
        Result := TWinControl(pnlClient.Controls[i]);

  dmMain.spGetReferenceFieldList.Close;
end;

procedure TfmAddEditInvoiceLine.ContractPricePropertiesChange(Sender: TObject);
begin
  if (fsShowing in Self.FormState) or
     VarIsNull(ContractPrice.EditingValue) or VarIsNull(PricePercent.EditingValue) then
    Exit;

  SalePrice.Value := ContractPrice.EditingValue * (PricePercent.EditingValue / 100) + ContractPrice.EditingValue;
end;

procedure TfmAddEditInvoiceLine.btnAddDescrClick(Sender: TObject);
var
  sp1: TUniStoredProc;
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    mdDescr.Open;
    fmAddEditLinkedRefBook.RefBookName := 'Описание товара';
    fmAddEditLinkedRefBook.FormMode := fmAdd;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 8; //descriptions
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdDescr;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
    try
      sp1 := TUniStoredProc.Create(Nil);
      sp1.Connection := dmMain.MainConnection;
      sp1.CreateProcCall('insProdDescription');
      mdDescr.First;
      sp1.ParamByName('ProdID').AsInteger := ProdID.Properties.Buttons.Items[0].Tag;
      sp1.ParamByName('ProdDescription').AsString := mdDescr.FieldByName('ProdDescription').AsString;
      sp1.ParamByName('IsReadOnly').AsInteger := 0;
      sp1.Execute;

      spDescrGood.Close;
      spDescrGood.Open;
      spDescrGood.Locate('name', mdDescr.FieldByName('ProdDescription').AsString, []);
      ProdDescrID.ItemIndex := spDescrGood.RecNo - 1;

      mdDescr.Close;
      IsModified := True;
    finally
      FreeAndNil(sp1);
    end;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditInvoiceLine.AppendUpdateRecordSet;
var
   i: Integer;
begin
  if not (rsRefBookDataSet.State in [dsEdit, dsInsert]) then
    if FormMode = fmAdd then
      rsRefBookDataSet.Append
    else
      rsRefBookDataSet.Edit;

  for i := 0 to pnlClient.ControlCount - 1 do
    if pnlClient.Controls[i] is TcxCustomEdit then
      rsRefBookDataSet.FieldByName(pnlClient.Controls[i].Name).Value := GetControlValue(pnlClient.Controls[i]);

  rsRefBookDataSet.FieldByName('ProdName').Value := ProdID.Text;
  rsRefBookDataSet.FieldByName('ProdDescription').Value := ProdDescrID.Text;
  rsRefBookDataSet.FieldByName('CountryName').Value := CountryCode.Text;

  rsRefBookDataSet.Post;
end;

procedure TfmAddEditInvoiceLine.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode = fmAdd) or IsModified or IsControlsModified(pnlClient) then
  begin
    InvalidControl := CheckReqControls;
    if InvalidControl = nil then
    begin
      AppendUpdateRecordSet;
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

procedure TfmAddEditInvoiceLine.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfmAddEditInvoiceLine.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditInvoiceLine.FormShow(Sender: TObject);
var
  i: Integer;
begin
  qCountries.Open;

  qSprRef.ParamByName('ID').AsInteger := 16; // код справочника!
  qSprRef.Open;

  if FormMode in [fmEdit, fmView] then
    with rsRefBookDataSet do
    begin
      ProdID.Text := FieldByName('ProdName').Value;
      ProdID.Properties.Buttons.Items[0].Tag := FieldByName('ProdID').Value;
      spDescrGood.Close;
      spDescrGood.ParamByName('ProdID').Value := FieldByName('ProdID').Value;
      spDescrGood.Open;
      btnAddDescr.Enabled := True;
      for i := 0 to pnlClient.ControlCount - 1 do
        if pnlClient.Controls[i] is TcxCustomEdit then
          if pnlClient.Controls[i].Tag <> - 1 then
            SetControlValue(pnlClient.Controls[i], FieldByName(pnlClient.Controls[i].Name).Value);
    end;
  case FormMode of
    fmAdd: Caption := 'Добавление позиции документа';
    fmEdit: Caption := 'Изменение позиции документа';
    fmView:
      begin
        Caption := 'Просмотр позиции документа';
        SetControlsReadOnly(Self, True);
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;

  DrawRequiredAsterisks(Self, 16); //invoice list

  IsModified := False;
  if FormMode = fmAdd then
    PostMessage(Handle, WM_ShowRefBook, 0, 0);
end;

procedure TfmAddEditInvoiceLine.ProdIDPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  frm: TfmShowRefBookGoods;
begin
  if AButtonIndex = 0 then
    try
      Application.CreateForm(TfmShowRefBookGoods, frm);
      frm.CurrentID := TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag;
      if frm.ShowModal = mrOk then
      begin
        TcxButtonEdit(Sender).Text := frm.tvRefBook.Controller.FocusedRow.Values[2];
        TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := frm.tvRefBook.Controller.FocusedRow.Values[0];

        spDescrGood.Close;
        spDescrGood.ParamByName('ProdID').Value := frm.tvRefBook.Controller.FocusedRow.Values[0];
        spDescrGood.Open;

        ProdDescrID.ItemIndex := 0;
        btnAddDescr.Enabled := True;
        IsModified := True;
      end;
    finally
      FreeAndNil(frm);
    end
  else
    begin
      TcxButtonEdit(Sender).Text := '';
      TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := 0;
      spDescrGood.Close;
      btnAddDescr.Enabled := False;
      IsModified := True;
    end;

end;

procedure TfmAddEditInvoiceLine.WMShowRefBook(var msg: TMessage);
begin
  ProdIDPropertiesButtonClick(ProdID, 0);
end;

end.
