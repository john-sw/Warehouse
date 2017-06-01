unit fm_ShowRefBooks;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dm_main, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxInplaceContainer, cxTLData, cxDBTL, Vcl.ExtCtrls, AdvPanel, Data.DB, MemDS,
  DBAccess, Uni, cxMaskEdit, cxCalendar, Vcl.Grids, Vcl.DBGrids,
  dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxContainer,
  cxLocalization, cxGroupBox, Vcl.StdCtrls, cxButtons, AdvMenus;

type
  TfmShowRefBook = class(TForm)
    pnlTop: TAdvPanel;
    pnlBottom: TAdvPanel;
    spShowRefBook: TUniStoredProc;
    dsShowRefBook: TUniDataSource;
    tvRefBook: TcxGridDBTableView;
    GridRefBookLevel1: TcxGridLevel;
    GridRefBook: TcxGrid;
    btnAdd: TcxButton;
    btnEdit: TcxButton;
    btnView: TcxButton;
    btnDel: TcxButton;
    btnClose: TcxButton;
    btnRefresh: TcxButton;
    pmDefaultPopupMenu: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Excel1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShowRefBook: TfmShowRefBook;

implementation

{$R *.dfm}

uses dm_RefBooks, fm_MainForm, fm_AddEditRefBook;

procedure TfmShowRefBook.btnAddClick(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBook, fmAddEditRefBook);
  try
    fmAddEditRefBook.spRefBook := spShowRefBook;
    if fmAddEditRefBook.ShowModal = mrOk then
    begin
      spShowRefBook.Refresh;
      spShowRefBook.Locate(tvRefBook.DataController.KeyFieldNames, fmAddEditRefBook.CurrentID,[]);
    end;
  finally
    FreeAndNil(fmAddEditRefBook);
  end;
end;

procedure TfmShowRefBook.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmShowRefBook.btnDelClick(Sender: TObject);
begin
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  with dmRefBooks.spInsertUpdateDeleteRefBook do
  try
//    DisableControls;
    CreateProcCall(dmRefBooks.qSprRef.FieldByName('DeleteProcName').AsString);
    ParamByName('ID').Value := spShowRefBook.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    Execute;
    spShowRefBook.Refresh;
  finally
    EnableControls;
  end;
end;

procedure TfmShowRefBook.btnEditClick(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBook, fmAddEditRefBook);
  try
    fmAddEditRefBook.FormMode := fmEdit;
    fmAddEditRefBook.spRefBook := spShowRefBook;
    fmAddEditRefBook.CurrentID := spShowRefBook.FieldByName(tvRefBook.DataController.KeyFieldNames).AsInteger;
    if fmAddEditRefBook.ShowModal = mrOk then
      spShowRefBook.RefreshRecord;
  finally
    FreeAndNil(fmAddEditRefBook);
  end;
end;

procedure TfmShowRefBook.btnRefreshClick(Sender: TObject);
begin
  spShowRefBook.Close;
  spShowRefBook.Open;
end;

procedure TfmShowRefBook.btnViewClick(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditRefBook, fmAddEditRefBook);
  fmAddEditRefBook.FormMode := fmView;
  try
    fmAddEditRefBook.spRefBook := spShowRefBook;
    fmAddEditRefBook.ShowModal;
  finally
    FreeAndNil(fmAddEditRefBook);
  end;
end;

procedure TfmShowRefBook.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PostMessage(MainForm.Handle,WM_USER + 1, UIntPtr(Self), 0);
end;

procedure TfmShowRefBook.FormCreate(Sender: TObject);
begin
{  Localizer.Active=true;
  Localizer
	Localizer.LanguageIndex=1049;}
end;

procedure TfmShowRefBook.FormShow(Sender: TObject);
var
  i: Integer;
begin
  Caption := 'Справочник - ' + dmRefBooks.qSprRef.FieldByName('ReferenceRUSName').AsString;
  spShowRefBook.StoredProcName := dmRefBooks.qSprRef.FieldByName('BrowserProcName').AsString;
  spShowRefBook.Open;
  tvRefBook.DataController.CreateAllItems;
  dmRefBooks.spRefBookFields.Close;
  dmRefBooks.spRefBookFields.ParamByName('ReferenceID').AsInteger := dmRefBooks.qSprRef.FieldByName('ReferenceID').AsInteger;
  dmRefBooks.spRefBookFields.Open;
  for i:= 0 to tvRefBook.ColumnCount - 1 do
    if dmRefBooks.spRefBookFields.Locate('RefFieldName', tvRefBook.Columns[i].Caption, [loCaseInsensitive]) then
    begin
      tvRefBook.Columns[i].Caption := dmRefBooks.spRefBookFields.FieldByName('RefFieldRUSName').AsString;
      if dmRefBooks.spRefBookFields.FieldByName('IsKeyField').AsInteger = 1 then
        tvRefBook.DataController.KeyFieldNames := dmRefBooks.spRefBookFields.FieldByName('RefFieldName').AsString;
    end;
end;

end.
