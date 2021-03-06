unit fm_AddEditGroup;

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
  Vcl.ExtCtrls, AdvPanel, Data.DB, MemDS, DBAccess, Uni, dm_main;

type
  TfmAddEditGroup = class(TForm)
    pnlClient: TAdvPanel;
    cxLabel1: TcxLabel;
    edtGroupName: TcxTextEdit;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetParamsAndExecStoredProc;
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
  fmAddEditGroup: TfmAddEditGroup;

implementation

{$R *.dfm}

procedure TfmAddEditGroup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditGroup.SetParamsAndExecStoredProc;
var
   i: Integer;
   c: TControl;
begin
  spInsertUpdateDeleteRefBook.ParamByName('GroupName').Value := TcxTextEdit(pnlClient.Controls[1]).Text;
  spInsertUpdateDeleteRefBook.ParamByName('ParentID').Value := ParentID;
  if (FormMode = fmAdd) then
  begin
    spInsertUpdateDeleteRefBook.Open;
    if not spInsertUpdateDeleteRefBook.Eof then
      CurrentID := spInsertUpdateDeleteRefBook.FieldByName('ID').AsInteger;
  end
  else
    spInsertUpdateDeleteRefBook.Execute;
end;

procedure TfmAddEditGroup.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode = fmAdd) or IsControlsModified(pnlClient) then
  begin
    InvalidControl := CheckReqControls(pnlClient, spRefBookFieldsAddEditView);
    if InvalidControl = nil then
    begin
      SetParamsAndExecStoredProc;
      ModalResult := mrOk;
    end
    else
    begin
      MessageBox(Self.Handle,'���������� ��������� ������������ ����', '������', MB_OK + MB_ICONERROR);
      InvalidControl.SetFocus;
    end;
  end
  else
    ModalResult := mrCancel;
end;

procedure TfmAddEditGroup.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // ModalResult ����� ���� ���������� � btnSaveClick
  if (FormMode = fmView) then
    ModalResult := mrOk;
  if ModalResult = mrOk then
  begin
    CanClose := True;
    Exit;
  end;
  if IsControlsModified(pnlClient) then
    if MessageBox(0,'�� ������������� ������ ����� ��� ���������� ���������?', '�������������',
                  MB_YESNO + MB_ICONQUESTION) = ID_YES then
      ModalResult := mrNo
    else
      ModalResult := mrCancel
  else
    ModalResult := mrNo;
  CanClose := (ModalResult <> mrCancel);
end;

procedure TfmAddEditGroup.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditGroup.FormShow(Sender: TObject);
begin
  spRefBookFieldsAddEditView.Open; // �������� ��������������� � TfmShowRefBook
  case FormMode of
    fmAdd: Caption := '���������� - ' + RefBookName;
    fmEdit: Caption := '��������� - ' + RefBookName;
    fmView:
      begin
        Caption := '�������� - ' + RefBookName;
        TcxTextEdit(pnlClient.Controls[1]).Properties.ReadOnly := True;
        btnSave.Visible := False;
        btnCancel.Caption := '�������';
      end;
  end;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      TcxTextEdit(pnlClient.Controls[1]).Text := ''
    else
      TcxTextEdit(pnlClient.Controls[1]).Text := spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsString
  else
    TcxTextEdit(pnlClient.Controls[1]).Text := spParentRefBook.FieldByName(pnlClient.Controls[1].Name).AsString;
end;

end.
