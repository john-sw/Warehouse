unit dm_RefBooks;

interface

uses
  System.SysUtils, System.Classes, dm_main, Uni, Data.DB, MemDS, DBAccess, Vcl.Controls, Vcl.Graphics,
  cxEdit, cxTextEdit, cxDateUtils, cxCalendar, cxCheckBox, cxDBLookupComboBox;

type
  TRefBookFormMode = (fmAdd, fmEdit, fmView);

type
  TdmRefBooks = class(TDataModule)
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    qSprRefForMainMenu: TUniQuery;
    dsShowRefBookGoods: TUniDataSource;
    spShowRefBookGoods: TUniStoredProc;
    spGetGoodsForProdCat: TUniStoredProc;
    dsGetGoodsForProdCat: TUniDataSource;
    procedure spShowRefBookGoodsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRefBooks: TdmRefBooks;

function IsControlsModified(AControl: TWinControl): Boolean;
function CheckReqControls(AControl: TWinControl; AspCheck: TUniStoredProc): TWinControl;
procedure SetControlsReadOnly(AControl: TWinControl; AReadOnly: Boolean);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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

function CheckControl(AControl: TcxCustomEdit; AspCheck: TUniStoredProc): Boolean;
begin
  Result := True;
  if AspCheck.Locate('RefFieldName', AControl.Name, []) and
     (AspCheck.FieldByName('IsRequired').AsInteger = 1) then
    case AControl.Tag of
      1: Result := (AControl as TcxTextEdit).Text <> ''; // DBTextEdit
      2: Result := (AControl as TcxDateEdit).Date = 0; // DBDateEdit
  //          3	DBCalcEdit
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

procedure TdmRefBooks.spShowRefBookGoodsAfterScroll(DataSet: TDataSet);
begin
  spGetGoodsForProdCat.Close;
  spGetGoodsForProdCat.ParamByName('ProdCatID').AsInteger := spShowRefBookGoods.FieldByName('ProdCatID').AsInteger;
  spGetGoodsForProdCat.Open;
end;

end.
