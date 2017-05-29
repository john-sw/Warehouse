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
  cxLocalization, cxGroupBox, Vcl.StdCtrls, cxButtons;

type
  TfmShowRefBook = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    spShowRefBook: TUniStoredProc;
    dsShowRefBook: TUniDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShowRefBook: TfmShowRefBook;

implementation

{$R *.dfm}

uses dm_RefBooks, fm_MainForm;

procedure TfmShowRefBook.cxButton5Click(Sender: TObject);
begin
  Close;
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
  cxGrid1DBTableView1.DataController.CreateAllItems;
  dmRefBooks.spRefBookFields.Close;
  dmRefBooks.spRefBookFields.ParamByName('ReferenceID').AsInteger := dmRefBooks.qSprRef.FieldByName('ReferenceID').AsInteger;
  dmRefBooks.spRefBookFields.Open;
  for i:= 0 to cxGrid1DBTableView1.ColumnCount - 1 do
    if dmRefBooks.spRefBookFields.Locate('RefFieldName', cxGrid1DBTableView1.Columns[i].Caption, [loCaseInsensitive]) then
    begin
      cxGrid1DBTableView1.Columns[i].Caption := dmRefBooks.spRefBookFields.FieldByName('RefFieldRUSName').AsString;
      if dmRefBooks.spRefBookFields.FieldByName('IsKeyField').AsInteger = 1 then
        cxGrid1DBTableView1.DataController.KeyFieldNames := dmRefBooks.spRefBookFields.FieldByName('RefFieldName').AsString;
    end;
end;

end.
