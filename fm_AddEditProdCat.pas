unit fm_AddEditProdCat;

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
  Vcl.Menus, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, cxButtons, cxTextEdit, cxLabel,
  Vcl.ExtCtrls, AdvPanel, dm_RefBooks, Data.DB, MemDS, DBAccess, Uni;

type
  TfmAddEditProdCat = class(TForm)
    pnlClient: TAdvPanel;
    cxLabel1: TcxLabel;
    edtProdCatName: TcxTextEdit;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetParamsAndExecStoredProc(sp: TUniStoredProc);
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
  fmAddEditProdCat: TfmAddEditProdCat;

implementation

{$R *.dfm}

procedure TfmAddEditProdCat.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditProdCat.SetParamsAndExecStoredProc(sp: TUniStoredProc);
var
   i: Integer;
   c: TControl;
begin
  sp.ParamByName('ProdCatName').Value := edtProdCatName.Text;
  sp.ParamByName('ParentID').Value := ParentID;
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

procedure TfmAddEditProdCat.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode = fmAdd) or IsControlsModified(pnlClient) then
  begin
    InvalidControl := CheckReqControls(pnlClient, spRefBookFieldsAddEditView);
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

procedure TfmAddEditProdCat.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
    if MessageBox(0,'Вы действительно хотите выйти без сохранения изменений?', 'Подтверждение',
                  MB_YESNO + MB_ICONQUESTION) = ID_YES then
      ModalResult := mrNo
    else
      ModalResult := mrCancel
  else
    ModalResult := mrNo;
  CanClose := (ModalResult <> mrCancel);
end;

procedure TfmAddEditProdCat.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditProdCat.FormShow(Sender: TObject);
begin
  spRefBookFieldsAddEditView.Open; // параметр устанавливается в TfmShowRefBook
  case FormMode of
    fmAdd: Caption := 'Добавление - ' + RefBookName;
    fmEdit: Caption := 'Изменение - ' + RefBookName;
    fmView:
      begin
        Caption := 'Просмотр - ' + RefBookName;
        edtProdCatName.Properties.ReadOnly := True;
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      edtProdCatName.Text := ''
    else
      edtProdCatName.Text := spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsString
  else
    edtProdCatName.Text := spParentRefBook.FieldByName('ProdCatName').AsString;
end;

end.
