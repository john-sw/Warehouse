unit fm_AddEditPriceListLine;

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
  cxSpinEdit, cxDBNavigator, AdvGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxButtonEdit, HTMLabel;

const
  WM_ShowRefBook = WM_USER + 1;

type
  TfmAddEditPriceListLine = class(TForm)
    pnlClient: TAdvPanel;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    ilRefBookActionImages: TcxImageList;
    qSprRef: TUniQuery;
    spRefBookFieldsBrowse: TUniStoredProc;
    cxGroupBox1: TcxGroupBox;
    lbl6: THTMLabel;
    SuppProdName: TcxTextEdit;
    lbl5: THTMLabel;
    SuppArticle: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    lblLabel3: THTMLabel;
    lblLabel5: THTMLabel;
    ProdID: TcxButtonEdit;
    ProdDescription: TcxTextEdit;
    lbl4: THTMLabel;
    ArticleNumber: TcxTextEdit;
    SuppProdComment: TcxTextEdit;
    lbl7: THTMLabel;
    SuppVolume: TcxCalcEdit;
    SuppPrice: TcxCalcEdit;
    lblLabel9: THTMLabel;
    lblLabel2: THTMLabel;
    lblLabel4: THTMLabel;
    SuppKvant: TcxTextEdit;
    lbl8: THTMLabel;
    lbl2: THTMLabel;
    Comment: TcxTextEdit;
    pmCountry: TAdvPopupMenu;
    SuppCountry: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ProdIDPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    IsModified: Boolean;
    function CheckReqControls(aControl: TWinControl = nil): TWinControl;
    procedure AppendUpdateRecordSet(aControl: TWinControl = nil);
    procedure WMShowRefBook(var msg: TMessage); message WM_ShowRefBook;
    procedure FillForm(aControl: TWinControl = Nil);
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
  fmAddEditPriceListLine: TfmAddEditPriceListLine;

implementation

{$R *.dfm}

uses dm_main, fm_AddEditLinkedRefBook, fm_ShowRefBookGoods;

procedure TfmAddEditPriceListLine.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TfmAddEditPriceListLine.CheckReqControls(aControl: TWinControl = nil): TWinControl;
var
   i: Integer;
   b: Boolean;
begin
  Result := nil;

  b := False;
  if aControl = nil then
  begin
    aControl := pnlClient;
    dmRefBooks.spGetReferenceFieldList.Close;
    dmRefBooks.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 18; //price list
    dmRefBooks.spGetReferenceFieldList.Open;
    b := True;
  end;
  for i := aControl.ControlCount - 1 downto 0 do
    if (aControl.Controls[i] is TcxGroupBox) then
    begin
      if CheckReqControls(TWinControl(aControl.Controls[i])) <> nil then
        Result := TWinControl(aControl.Controls[i]);
    end
    else
      if (aControl.Controls[i] is TcxCustomEdit) then
        if not dm_RefBooks.CheckControl(TcxCustomEdit(aControl.Controls[i]), dmRefBooks.spGetReferenceFieldList) then
          Result := TWinControl(aControl.Controls[i]);

  if b then
    dmRefBooks.spGetReferenceFieldList.Close;
end;

procedure TfmAddEditPriceListLine.AppendUpdateRecordSet(aControl: TWinControl = nil);
var
   i: Integer;
   b: Boolean;
begin
  if aControl = nil then
  begin
    aControl := pnlClient;
    if not (rsRefBookDataSet.State in [dsEdit, dsInsert]) then
      if FormMode = fmAdd then
        rsRefBookDataSet.Append
      else
        rsRefBookDataSet.Edit;
    b := True;
  end;
  for i := 0 to aControl.ControlCount - 1 do
    if (aControl.Controls[i] is TcxGroupBox) then
      AppendUpdateRecordSet(TWinControl(aControl.Controls[i]))
    else
      if aControl.Controls[i] is TcxCustomEdit then
        rsRefBookDataSet.FieldByName(aControl.Controls[i].Name).Value := GetControlValue(aControl.Controls[i]);

  if b then
  begin
    rsRefBookDataSet.FieldByName('ProdName').Value := ProdID.Text;
    //rsRefBookDataSet.FieldByName('CountryName').Value := SuppCountry.Text;
    rsRefBookDataSet.Post;
  end;
end;

procedure TfmAddEditPriceListLine.btnSaveClick(Sender: TObject);
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

procedure TfmAddEditPriceListLine.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfmAddEditPriceListLine.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditPriceListLine.FillForm(aControl: TWinControl);
var
   i: Integer;
begin
  if aControl = nil then
    aControl := pnlClient;

  with rsRefBookDataSet do
    for i := 0 to aControl.ControlCount - 1 do
      if (aControl.Controls[i] is TcxGroupBox) then
        FillForm(TWinControl(aControl.Controls[i]))
      else
        if aControl.Controls[i] is TcxCustomEdit then
          if aControl.Controls[i].Tag <> - 1 then
            SetControlValue(aControl.Controls[i], FieldByName(aControl.Controls[i].Name).Value);
end;

procedure TfmAddEditPriceListLine.FormShow(Sender: TObject);
var
  i: Integer;
begin
  qSprRef.ParamByName('ID').AsInteger := 18; // код справочника!
  qSprRef.Open;

  if FormMode in [fmEdit, fmView] then
    with rsRefBookDataSet do
    begin
      ProdID.Text := FieldByName('ProdName').Value;
      ProdID.Properties.Buttons.Items[0].Tag := FieldByName('ProdID').Value;
      FillForm;
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

  DrawRequiredAsterisks(Self, 18); //price list

  IsModified := False;
  if FormMode = fmAdd then
    PostMessage(Handle, WM_ShowRefBook, 0, 0);
end;

procedure TfmAddEditPriceListLine.ProdIDPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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

        ProdDescription.Text := frm.tvRefBook.Controller.FocusedRow.Values[3];
        ArticleNumber.Text := frm.tvRefBook.Controller.FocusedRow.Values[4];
        IsModified := True;
      end;
    finally
      FreeAndNil(frm);
    end
  else
    begin
      TcxButtonEdit(Sender).Text := '';
      TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := 0;
      ProdDescription.Text := '';
      ArticleNumber.Text := '';
      IsModified := True;
    end;

end;

procedure TfmAddEditPriceListLine.WMShowRefBook(var msg: TMessage);
begin
  ProdIDPropertiesButtonClick(ProdID, 0);
end;

end.
