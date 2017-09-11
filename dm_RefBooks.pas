unit dm_RefBooks;

interface

uses
  System.SysUtils, System.Classes, dm_main, Uni, Data.DB, MemDS, DBAccess, Vcl.Controls, Vcl.Graphics,
  cxEdit, cxTextEdit, cxDateUtils, cxCalendar, cxCheckBox, cxDBLookupComboBox, HTMLabel, cxCalc, cxButtonEdit;

type
  TRefBookFormMode = (fmAdd, fmEdit, fmView, fmCopy);

type
  TdmRefBooks = class(TDataModule)
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    qSprRefForMainMenu: TUniQuery;
    dsShowRefBookGoods: TUniDataSource;
    spShowRefBookGoods: TUniStoredProc;
    spGetGoodsForProdCat: TUniStoredProc;
    dsGetGoodsForProdCat: TUniDataSource;
    spGetReferenceFieldList: TUniStoredProc;
    spShowRefBookClients: TUniStoredProc;
    dsShowRefBookClients: TUniDataSource;
    spGetClientsForGroup: TUniStoredProc;
    dsGetClientsForGroup: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRefBooks: TdmRefBooks;

function GetControlValue(AControl: TControl): Variant;
procedure SetControlValue(aControl: TControl; aValue: Variant);

function IsControlsModified(AControl: TWinControl): Boolean;
function CheckControl(AControl: TcxCustomEdit; AspCheck: TUniStoredProc): Boolean; overload;
function CheckControl(AControl: TcxCustomEdit; AspCheck: TUniStoredProc; AFieldName: String): Boolean; overload;
function CheckReqControls(AControl: TWinControl; AspCheck: TUniStoredProc): TWinControl;
procedure SetControlsReadOnly(AControl: TWinControl; AReadOnly: Boolean);
procedure DrawRequiredAsterisks(aControl: TControl; aRefBookCode: Integer = -1);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses System.Variants;

procedure SetControlValue(aControl: TControl; aValue: Variant);
begin
  if aControl is TcxCustomEdit then
    case AControl.Tag of
     -1: TcxTextEdit(AControl).Text := VarToStr(aValue); // ButtonEdit
      1: TcxTextEdit(AControl).Text := VarToStr(aValue); // DBTextEdit
      2: TcxDateEdit(AControl).Date := aValue; // DBDateEdit
      3: TcxCalcEdit(AControl).EditValue := aValue; // DBCalcEdit
  //          4	DBMaskEdit
      5: TcxCheckBox(AControl).Checked := Boolean(aValue); // DBCheckBox
      6: TcxLookupComboBox(AControl).EditValue := aValue; // DBLookupEdit
  //          7	DBImageEdit
    end;
end;

function GetControlValue(AControl: TControl): Variant;
begin
  Result := varNull;
  if aControl is TcxCustomEdit then
    case AControl.Tag of
     -1: Result := TcxButtonEdit(AControl).Properties.Buttons.Items[0].Tag; // ButtonEdit
      1: Result := TcxTextEdit(AControl).Text; // DBTextEdit
      2: Result := TcxDateEdit(AControl).Date; // DBDateEdit
      3: Result := TcxCalcEdit(AControl).Value; // DBCalcEdit
  //          4	DBMaskEdit
      5: Result := Integer(TcxCheckBox(AControl).Checked); // DBCheckBox
      6: Result := TcxLookupComboBox(AControl).EditingValue; // DBLookupEdit
  //          7	DBImageEdit
    end;
end;

procedure SetControlsReadOnly(AControl: TWinControl; AReadOnly: Boolean);
var
   i: Integer;
begin
  if (AControl is TcxCustomTextEdit) then
  begin
    TcxCustomTextEdit(AControl).Properties.ReadOnly := AReadOnly;
    Exit;
  end;

  for i:= 0 to AControl.ControlCount - 1 do
    if (AControl.Controls[i] is TWinControl) then
      SetControlsReadOnly(TWinControl(AControl.Controls[i]), AReadOnly);

end;

function IsControlsModified(AControl: TWinControl): Boolean;
var
   i: Integer;
begin
  if (AControl is TcxCustomEdit) and TcxCustomEdit(AControl).EditModified then
  begin
    Result := True;
    Exit;
  end
  else
    Result := False;

  for i:= 0 to AControl.ControlCount - 1 do
  begin
    if (AControl.Controls[i] is TWinControl) then
      Result := IsControlsModified(TWinControl(AControl.Controls[i]));
    if Result then
      Break;
  end;
end;

procedure DrawRequiredAsterisk(AControl: THTMLabel; AspCheck: TUniStoredProc);
var
   s: string;
begin
  if (AControl.FocusControl <> nil) and
      AspCheck.Locate('RefFieldName', AControl.FocusControl.Name, [loCaseInsensitive]) and
     (AspCheck.FieldByName('IsRequired').AsInteger = 1) then
  begin
    s := '<b><font color="#FF0000">*</font></b>';
    AControl.HTMLText.Text := AControl.HTMLText.Text + s;
  end;
end;

procedure DrawRequiredAsterisks(aControl: TControl; aRefBookCode: Integer = -1);
var
   i: Integer;
begin
  if (aRefBookCode <> -1) then
  begin
    dmRefBooks.spGetReferenceFieldList.Close;
    dmRefBooks.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := aRefBookCode;
    dmRefBooks.spGetReferenceFieldList.Open;
  end;
  if (aControl is THTMLabel) then
    DrawRequiredAsterisk(THTMLabel(aControl), dmRefBooks.spGetReferenceFieldList);

  if (aControl is TWinControl) then
    for i := 0 to TWinControl(aControl).ControlCount - 1 do
      DrawRequiredAsterisks(TWinControl(aControl).Controls[i]);

  if (aRefBookCode <> -1) then
    dmRefBooks.spGetReferenceFieldList.Close;
end;

function CheckControl(AControl: TcxCustomEdit; AspCheck: TUniStoredProc; AFieldName: String): Boolean; overload;
begin
  Result := True;
  if not (AControl is TcxCustomEdit) then
    Exit;

  if AspCheck.Locate('RefFieldName', AFieldName, [loCaseInsensitive]) and
     (AspCheck.FieldByName('IsRequired').AsInteger = 1) then
    case AControl.Tag of
      -1, 1: Result := (AControl as TcxCustomTextEdit).Text <> ''; // DBTextEdit
      2: Result := (AControl as TcxDateEdit).Date <> NullDate; // DBDateEdit
      3: Result := (AControl as TcxCalcEdit).Value <> 0;       //	DBCalcEdit
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

function CheckControl(AControl: TcxCustomEdit; AspCheck: TUniStoredProc): Boolean;
begin
  Result := CheckControl(AControl, AspCheck, AControl.Name);
end;

function CheckReqControls(AControl: TWinControl; AspCheck: TUniStoredProc): TWinControl;
var
   i: Integer;
begin
  if (AControl is TcxCustomEdit) and not CheckControl(TcxCustomEdit(AControl), AspCheck) then
  begin
    Result := AControl;
    Exit;
  end
  else
    Result := Nil;

  for i := 0 to AControl.ControlCount - 1 do
    if (AControl.Controls[i] is TcxCustomEdit) and not CheckControl(TcxCustomEdit(AControl.Controls[i]), AspCheck) then
      if Result = nil then
        Result := TWinControl(AControl.Controls[i]);
end;

end.
