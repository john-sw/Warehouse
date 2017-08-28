unit fm_AddEditRefBook;

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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel,
  cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, AdvPanel,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvOfficePager, dm_RefBooks, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxDBExtLookupComboBox, cxDBEdit, AdvCombo, AdvDBComboBox, Vcl.DBGrids, Uni,
  AdvDBLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckBox,
  Data.DB, DBAccess, MemDS, fm_ShowRefBooks, HTMLabel, cxCalc;

type
  TfmAddEditRefBook = class(TForm)
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    pnlClient: TAdvPanel;
    spRefBookFieldsAddEditView: TUniStoredProc;
    dsForeignRefBook: TUniDataSource;
    spForeignRefBook: TUniStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pnlBottomClick(Sender: TObject);
  private
    function InsertFieldControlPanel: TAdvPanel;
    procedure InsertFieldLabel(APanel: TAdvPanel);
    procedure InsertFieldEdit(APanel: TAdvPanel);
    procedure InsertFieldCalc(APanel: TAdvPanel);
    procedure InsertFieldLookup(APanel: TAdvPanel);
    procedure InsertFieldCheck(APanel: TAdvPanel);
    procedure InsertFieldDate(APanel: TAdvPanel);
    procedure FillForm;
    procedure SetParamsAndExecStoredProc(sp: TUniStoredProc);
    function CheckControl(AControl: TcxCustomEdit): Boolean;
    function CheckReqControls: TWinControl;
    { Private declarations }
  public
    { Public declarations }
    FormMode: TRefBookFormMode;
    CurrentID: Integer;
    RefBookName: string;
    spParentRefBook: TUniStoredProc;
  end;

var
  fmAddEditRefBook: TfmAddEditRefBook;

implementation

uses dm_main;

{$R *.dfm}

procedure TfmAddEditRefBook.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfmAddEditRefBook.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

function TfmAddEditRefBook.InsertFieldControlPanel: TAdvPanel;
begin
  Result := TAdvPanel.Create(pnlClient);
  Result.Parent := pnlClient;
  Result.Styler := dmMain.AdvPanelStyler1;
  Result.Height := 30;
  Result.Top := (pnlClient.ControlCount - 1) * 30;
  Result.Width := pnlClient.Width;
  Result.Left := 0;
  Result.Anchors := [akLeft, akTop, akRight];
end;

procedure TfmAddEditRefBook.InsertFieldLabel(APanel: TAdvPanel);
var
  c: THTMLabel;
  s: string;
begin
  c := THTMLabel.Create(APanel);
  c.Parent := APanel;
  c.Width := 200;
  c.Left := 10;
  c.Top := 1;
  c.Height := APanel.Height - 2;

  c.VAlignment := tvaCenter;
  c.Transparent := True;
  if spRefBookFieldsAddEditView.FieldByName('IsRequired').AsInteger = 1 then
    s := '<b><font color="#FF0000">*</font></b>';
  c.HTMLText.Text := spRefBookFieldsAddEditView.FieldByName('RefFieldRUSName').AsString + s;
end;

procedure TfmAddEditRefBook.InsertFieldEdit(APanel: TAdvPanel);
var
  c: TcxTextEdit;
begin
  c := TcxTextEdit.Create(APanel);
  c.Parent := APanel;
  c.AutoSize := False;
  c.Top := 4;
  c.Left := 210;
  c.Style.BorderStyle := ebsSingle;
  c.Width := APanel.Width - c.Left - 10;
  c.Anchors := [akLeft, akTop, akRight];
  c.Tag := 1;
  c.Name := spRefBookFieldsAddEditView.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      c.Text := ''
    else
      c.Text := spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsString
  else
    c.Text := spParentRefBook.FieldByName(c.Name).AsString;
end;

procedure TfmAddEditRefBook.InsertFieldCalc(APanel: TAdvPanel);
var
  c: TcxCalcEdit;
begin
  c := TcxCalcEdit.Create(APanel);
  c.Parent := APanel;
  c.AutoSize := False;
  c.Top := 4;
  c.Left := 210;
  c.Style.BorderStyle := ebsSingle;
  c.Width := APanel.Width - c.Left - 10;
  c.Anchors := [akLeft, akTop, akRight];
  c.Tag := 1;
  c.Name := spRefBookFieldsAddEditView.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      c.Value := 0
    else
      c.Value := spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsFloat
  else
    c.Value := spParentRefBook.FieldByName(c.Name).AsFloat;
end;

procedure TfmAddEditRefBook.InsertFieldDate(APanel: TAdvPanel);
var
  c: TcxDateEdit;
begin
  c := TcxDateEdit.Create(APanel);
  c.Parent := APanel;
  c.Top := 4;
  c.Left := 210;
  c.Style.BorderStyle := ebsSingle;
  c.Width := 150;
  c.Anchors := [akLeft, akTop, akRight];
  c.Tag := spRefBookFieldsAddEditView.RecNo;
  c.Name := spRefBookFieldsAddEditView.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      c.Date := NullDate
    else
      c.Date := spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsDateTime
  else
    c.Date := spParentRefBook.FieldByName(c.Name).AsDateTime;
end;

procedure TfmAddEditRefBook.InsertFieldCheck(APanel: TAdvPanel);
var
  c: TcxCheckBox;
begin
  c := TcxCheckBox.Create(APanel);
  c.Parent := APanel;
  c.Top := 4;
  c.Caption := '';
  c.Width := c.Height;
  c.Left := 210;
  c.Style.BorderStyle := ebsSingle;
  c.Anchors := [akLeft, akTop];
  c.Transparent := True;
  c.Properties.FullFocusRect := True;
  c.Tag := spRefBookFieldsAddEditView.RecNo;
  c.Name := spRefBookFieldsAddEditView.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      c.Checked := False
    else
      c.Checked := Boolean(spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsInteger)
  else
    c.Checked := Boolean(spParentRefBook.FieldByName(c.Name).AsInteger);
end;

procedure TfmAddEditRefBook.InsertFieldLookup(APanel: TAdvPanel);
var
  c: TcxLookupComboBox;
begin
  c := TcxLookupComboBox.Create(APanel);
  c.Parent := APanel;
  c.Top := 4;
  c.Left := 210;
  c.Style.BorderStyle := ebsSingle;
  c.Width := APanel.Width - c.Left - 10;
  c.Anchors := [akLeft, akTop, akRight];

  spForeignRefBook.StoredProcName := spRefBookFieldsAddEditView.FieldByName('ReferenceProcName').AsString;
  spForeignRefBook.Open;

  c.Properties.ListSource := dsForeignRefBook;
  c.Properties.ListColumns.Add.FieldName := 'Name';
  c.Properties.ListFieldNames := 'Name';
  c.Properties.KeyFieldNames := 'ID';
  c.Properties.ListOptions.ShowHeader := False;
  c.Tag := spRefBookFieldsAddEditView.RecNo;
  c.Name := spRefBookFieldsAddEditView.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    if spRefBookFieldsAddEditView.FieldByName('DefaultValue').IsNull then
      c.EditValue := -1
    else
      c.EditValue := spRefBookFieldsAddEditView.FieldByName('DefaultValue').AsInteger
  else
    c.EditValue := spParentRefBook.FieldByName(c.Name).AsInteger;
end;

procedure TfmAddEditRefBook.pnlBottomClick(Sender: TObject);
begin
  TWinControl(TAdvPanel(pnlClient.Controls[0]).Controls[1]).SetFocus;
end;

procedure TfmAddEditRefBook.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditRefBook.SetParamsAndExecStoredProc(sp: TUniStoredProc);
var
   i: Integer;
   c: TControl;
begin
  for i := 0 to pnlClient.ControlCount - 1 do
  begin
    c := TAdvPanel(pnlClient.Controls[i]).Controls[1];
    sp.ParamByName(c.Name).Value := GetControlValue(c);
  end;
  if (FormMode = fmAdd) then
  begin
    sp.Open;
    if not sp.Eof then
      CurrentID := sp.FieldByName('ID').AsInteger;
  end
  else
    sp.Execute;
end;

procedure TfmAddEditRefBook.btnSaveClick(Sender: TObject);
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

function TfmAddEditRefBook.CheckControl(AControl: TcxCustomEdit): Boolean;
begin
  Result := True;
  if spRefBookFieldsAddEditView.Locate('RefFieldName', AControl.Name, []) and
     (spRefBookFieldsAddEditView.FieldByName('IsRequired').AsInteger = 1) then
    case AControl.Tag of
      1: Result := (AControl as TcxTextEdit).Text <> ''; // DBTextEdit
      2: Result := (AControl as TcxDateEdit).Date = 0; // DBDateEdit
      // 3: Result := (AControl as TcxCalcEdit).Value = 0;   //  DBCalcEdit
  //          4	DBMaskEdit
      5: Result := not (AControl as TcxCheckBox).Checked; // DBCheckBox
      6: Result := (AControl as TcxLookupComboBox).EditingValue >= 0 ; // DBLookupEdit
  //          7	DBImageEdit
    end;
  if Result then
    AControl.Style.BorderColor := clWindowFrame
  else
    AControl.Style.BorderColor := clRed
end;

function TfmAddEditRefBook.CheckReqControls: TWinControl;
var
   i: Integer;
begin
  Result := Nil;
  for i:= 0 to pnlClient.ControlCount - 1 do
    if not CheckControl(TcxCustomEdit(TAdvPanel(pnlClient.Controls[i]).Controls[1])) then
      if Result = nil then
        Result := TWinControl(TAdvPanel(pnlClient.Controls[i]).Controls[1]);
end;

procedure TfmAddEditRefBook.FillForm;
var
  FieldPanel: TAdvPanel;
  FirstControl: TWinControl;
begin
  FirstControl := nil;
  with spRefBookFieldsAddEditView do
  begin
    First; // справочник открыт в TfmShowRefBook.FormShow.
    while not eof do
      if FieldByName('IsUpdatedField').AsInteger = 0 then
        Next
      else
      begin
        FieldPanel := InsertFieldControlPanel;
        InsertFieldLabel(FieldPanel);

        case FieldByName('ControlTypeID').AsInteger of
          1: InsertFieldEdit(FieldPanel); // DBTextEdit
          2: InsertFieldDate(FieldPanel); // DBDateEdit
          3: InsertFieldCalc(FieldPanel); // DBCalcEdit
//          4	DBMaskEdit
          5: InsertFieldCheck(FieldPanel); // DBCheckBox
          6: InsertFieldLookup(FieldPanel); // DBLookupEdit
//          7	DBImageEdit
        end;
        if (FieldPanel.ControlCount = 2) then
        begin
          FieldPanel.Controls[1].Tag := FieldByName('ControlTypeID').AsInteger;
          if (FirstControl = nil) then
            FirstControl := TWinControl(FieldPanel.Controls[1]);
        end;
        Next;
      end;
  end;
  if FirstControl <> nil then
    ActiveControl := FirstControl;
  pnlClient.Enabled := (FormMode <> fmView);
  Height := (pnlClient.ControlCount + 1) * 30 + pnlBottom.Height;
end;

procedure TfmAddEditRefBook.FormShow(Sender: TObject);
begin
  spRefBookFieldsAddEditView.Open; // параметр устанавливается в TfmShowRefBook
  case FormMode of
    fmAdd: Caption := 'Добавление - ' + RefBookName;
    fmEdit: Caption := 'Изменение - ' + RefBookName;
    fmView:
      begin
        Caption := 'Просмотр - ' + RefBookName;
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;
  FillForm;
end;

end.
