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
  AdvDBLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckBox;

type
  TRefBookFormMode = (fmAdd, fmEdit, fmView);

type
  TfmAddEditRefBook = class(TForm)
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    pnlClient: TAdvPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    function InsertFieldControlPanel: TAdvPanel;
    procedure InsertFieldLabel(APanel: TAdvPanel);
    procedure InsertFieldEdit(APanel: TAdvPanel);
    procedure InsertFieldLookup(APanel: TAdvPanel);
    procedure InsertFieldCheck(APanel: TAdvPanel);
    procedure InsertFieldDate(APanel: TAdvPanel);
    procedure FillForm;
    function IsControlsModified(AControl: TWinControl): Boolean;
    procedure InsertRecord;
    procedure UpdateRecord;
    procedure SetParamsAndExecStoredProc(sp: TUniStoredProc);
    function GetControlValue(AControl: TControl): Variant;
    { Private declarations }
  public
    { Public declarations }
    FormMode: TRefBookFormMode;
    spRefBook: TUniStoredProc;
    CurrentID: Integer;
  end;

var
  fmAddEditRefBook: TfmAddEditRefBook;

implementation

uses
  dm_main;

{$R *.dfm}

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
  c: TcxLabel;
begin
  c := TcxLabel.Create(APanel);
  c.Parent := APanel;
  c.AutoSize := False;
  c.Width := 200;
  c.Align := alLeft;
  c.Properties.WordWrap := True;
  c.Properties.Alignment.Vert := taVCenter;
  c.Transparent := True;
  c.Caption := dmRefBooks.spRefBookFields.FieldByName('RefFieldRUSName').AsString;
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
  c.Style.BorderStyle := ebsThick;
  c.Width := APanel.Width - c.Left - 10;
  c.Anchors := [akLeft, akTop, akRight];
  if dmRefBooks.spRefBookFields.FieldByName('IsRequired').AsInteger = 1 then
    c.Style.BorderColor := clRed
  else
    c.Style.BorderColor := clNavy;
  c.Tag := 1;
  c.Name := dmRefBooks.spRefBookFields.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    c.Text := ''
  else
    c.Text := spRefBook.FieldByName(c.Name).AsString;
end;

procedure TfmAddEditRefBook.InsertFieldDate(APanel: TAdvPanel);
var
  c: TcxDateEdit;
begin
  c := TcxDateEdit.Create(APanel);
  c.Parent := APanel;
  c.Top := 4;
  c.Left := 210;
  c.Style.BorderStyle := ebsThick;
  c.Width := 150;
  c.Anchors := [akLeft, akTop, akRight];
  if dmRefBooks.spRefBookFields.FieldByName('IsRequired').AsInteger = 1 then
    c.Style.BorderColor := clRed
  else
    c.Style.BorderColor := clNavy;
  c.Tag := dmRefBooks.spRefBookFields.RecNo;
  c.Name := dmRefBooks.spRefBookFields.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    c.Date := 0
  else
    c.Date := spRefBook.FieldByName(c.Name).AsDateTime;
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
  c.Style.BorderStyle := ebsThick;
  c.Anchors := [akLeft, akTop];
  if dmRefBooks.spRefBookFields.FieldByName('IsRequired').AsInteger = 1 then
    c.Style.BorderColor := clRed
  else
    c.Style.BorderColor := clNavy;
  c.Transparent := True;
  c.Properties.FullFocusRect := True;
  c.Tag := dmRefBooks.spRefBookFields.RecNo;
  c.Name := dmRefBooks.spRefBookFields.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    c.Checked := False
  else
    c.Checked := Boolean(spRefBook.FieldByName(c.Name).AsInteger);
end;

procedure TfmAddEditRefBook.InsertFieldLookup(APanel: TAdvPanel);
var
  c: TcxLookupComboBox;
begin
  c := TcxLookupComboBox.Create(APanel);
  c.Parent := APanel;
  c.Top := 4;
  c.Left := 210;
  c.Style.BorderStyle := ebsThick;
  c.Width := APanel.Width - c.Left - 10;
  c.Anchors := [akLeft, akTop, akRight];
  if dmRefBooks.spRefBookFields.FieldByName('IsRequired').AsInteger = 1 then
    c.Style.BorderColor := clRed
  else
    c.Style.BorderColor := clNavy;

  dmRefBooks.spForeignRefBook.StoredProcName := dmRefBooks.spRefBookFields.FieldByName('ReferenceProcName').AsString;
  dmRefBooks.spForeignRefBook.Open;

  c.Properties.ListSource := dmRefBooks.dsForeignRefBook;
  c.Properties.ListColumns.Add.FieldName := 'Name';
  c.Properties.ListFieldNames := 'Name';
  c.Properties.KeyFieldNames := 'ID';
  c.Properties.ListOptions.ShowHeader := False;
  c.Tag := dmRefBooks.spRefBookFields.RecNo;
  c.Name := dmRefBooks.spRefBookFields.FieldByName('RefFieldName').AsString;
  if (FormMode = fmAdd) then
    c.EditValue := -1
  else
    c.EditValue := spRefBook.FieldByName(c.Name).AsInteger;
end;

function TfmAddEditRefBook.IsControlsModified(AControl: TWinControl): Boolean;
begin
  Result := True; // ModifiedAfterEnter
end;

procedure TfmAddEditRefBook.btnCancelClick(Sender: TObject);
begin
  if (FormMode = fmView) then
    ModalResult := mrCancel
  else
    if IsControlsModified(pnlClient) then
      case MessageBox(0,'Сохранить изменения?', 'Подтверждение', MB_YESNOCANCEL + MB_ICONQUESTION) of
        id_yes: btnSaveClick(Nil);
        id_no: ModalResult := mrCancel;
      end;
end;

function TfmAddEditRefBook.GetControlValue(AControl: TControl): Variant;
begin
  case AControl.Tag of
    1: Result := (AControl as TcxTextEdit).Text; // DBTextEdit
    2: Result := (AControl as TcxDateEdit).Date; // DBDateEdit
//          3	DBCalcEdit
//          4	DBMaskEdit
    5: Result := Integer((AControl as TcxCheckBox).Checked); // DBCheckBox
    6: Result := (AControl as TcxLookupComboBox).EditingValue; // DBLookupEdit
//          7	DBImageEdit
  end;
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

procedure TfmAddEditRefBook.InsertRecord;
begin
//  dmRefBooks.spInsertRefBook.StoredProcName := dmRefBooks.qSprRef.FieldByName('InsertProcName').AsString;
  dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(dmRefBooks.qSprRef.FieldByName('InsertProcName').AsString);
  SetParamsAndExecStoredProc(dmRefBooks.spInsertUpdateDeleteRefBook);
end;

procedure TfmAddEditRefBook.UpdateRecord;
begin
  dmRefBooks.spInsertUpdateDeleteRefBook.CreateProcCall(dmRefBooks.qSprRef.FieldByName('UpdateProcName').AsString);
  dmRefBooks.spInsertUpdateDeleteRefBook.ParamByName('ID').Value := CurrentID;
  SetParamsAndExecStoredProc(dmRefBooks.spInsertUpdateDeleteRefBook);
end;

procedure TfmAddEditRefBook.btnSaveClick(Sender: TObject);
begin
  case FormMode of
    fmAdd: InsertRecord;
    fmEdit: UpdateRecord;
  end;
  ModalResult := mrOk;
end;

procedure TfmAddEditRefBook.FillForm;
var
  FieldPanel: TAdvPanel;
  FirstControl: TWinControl;
begin
  FirstControl := nil;
  with dmRefBooks.spRefBookFields do
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
//          3	DBCalcEdit
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
end;

procedure TfmAddEditRefBook.FormShow(Sender: TObject);
begin
  case FormMode of
    fmAdd: Caption := 'Добавление - ' + dmRefBooks.qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmEdit: Caption := 'Изменение - ' + dmRefBooks.qSprRef.FieldByName('ReferenceRUSName').AsString;
    fmView:
      begin
        Caption := 'Просмотр - ' + dmRefBooks.qSprRef.FieldByName('ReferenceRUSName').AsString;
        btnSave.Visible := False;
      end;
  end;
  FillForm;
end;

end.
