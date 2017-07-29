unit fm_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, dxRibbonSkins,
  dxBarApplicationMenu, dxRibbon, dxBar, cxClasses, dxStatusBar, Vcl.Menus,
  AdvMenus, dxRibbonStatusBar, Vcl.StdCtrls, cxButtons;

const
  WM_CloseForm = WM_USER + 1;

type
  TMainForm = class(TForm)
    AdvMainMenu1: TAdvMainMenu;
    N3: TMenuItem;
    N6: TMenuItem;
    miRefBooks: TMenuItem;
    miWindow: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnShowRefBookGoods: TdxBarLargeButton;
    btnShowClients: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure btnShowRefBookGoodsClick(Sender: TObject);
    procedure btnShowClientsClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMainMenu;
    procedure WMCloseForm(var msg: TMessage); message WM_CloseForm;
    procedure AddFormToMainMenu(AForm: TCustomForm);
    function FindFormInMainMenu(ACaption: String): TMenuItem;
    procedure miRefBookClick(Sender: TObject);
    procedure miWindowClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  dm_RefBooks, dm_main, fm_ShowRefBooks, fm_ShowRefBookGoods, fm_ShowRefBookClients;

{$R *.dfm}

function TMainForm.FindFormInMainMenu(ACaption: String): TMenuItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 2 to miWindow.Count - 1 do
    if TMenuItem(miWindow.Items[i]).Caption = ACaption then
    begin
      Result := miWindow.Items[i];
      Break;
    end;
end;

procedure TMainForm.AddFormToMainMenu(AForm: TCustomForm);
var
  i: Integer;
  mi: TMenuItem;
begin
  mi := FindFormInMainMenu(AForm.Caption);

  if mi <> nil then
    Exit;

  mi := TMenuItem.Create(Nil);
  mi.Caption := AForm.Caption;
  mi.Tag := UIntPtr(AForm);
  mi.OnClick := miWindowClick;
  miWindow.Add(mi);
end;

procedure TMainForm.CreateMainMenu;
var
  mi: TMenuItem;
begin
  dmRefBooks.qSprRefForMainMenu.Close;
  dmRefBooks.qSprRefForMainMenu.Open;

  while not dmRefBooks.qSprRefForMainMenu.Eof do
  begin
    mi := TMenuItem.Create(Nil);
    mi.Caption := dmRefBooks.qSprRefForMainMenu.FieldByName('ReferenceRUSName').AsString;
    mi.Tag := dmRefBooks.qSprRefForMainMenu.FieldByName('ReferenceID').AsInteger;
    mi.OnClick := miRefBookClick;
    miRefBooks.Add(mi);
    dmRefBooks.qSprRefForMainMenu.Next;
  end;
end;

procedure TMainForm.btnShowClientsClick(Sender: TObject);
var
  mi: TMenuItem;
begin
  mi := FindFormInMainMenu('Справочник - Контрагенты');
  if (mi <> nil) then
    TCustomForm(mi.Tag).BringToFront
  else
  begin
    Application.CreateForm(TfmShowRefBookClients, fmShowRefBookClients);
    AddFormToMainMenu(fmShowRefBookClients);
  end;
end;

procedure TMainForm.btnShowRefBookGoodsClick(Sender: TObject);
var
  mi: TMenuItem;
begin
  mi := FindFormInMainMenu('Справочник - Товары');
  if (mi <> nil) then
    TCustomForm(mi.Tag).BringToFront
  else
  begin
    Application.CreateForm(TfmShowRefBookGoods, fmShowRefBookGoods);
    AddFormToMainMenu(fmShowRefBookGoods);
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  dmMain.MainConnection.Connect;
  CreateMainMenu;
end;

procedure TMainForm.miRefBookClick(Sender: TObject);
var
  mi: TMenuItem;
begin
  if not dmRefBooks.qSprRefForMainMenu.Locate('ReferenceID', (Sender as TMenuItem).Tag, []) then
    raise Exception.Create('Ошибка открытия справочника ' + (Sender as TMenuItem).Caption);
  mi := FindFormInMainMenu('Справочник - ' + dmRefBooks.qSprRefForMainMenu.FieldByName('ReferenceRUSName').AsString);
  if (mi <> nil) then
    TCustomForm(mi.Tag).BringToFront
  else
  begin
    Application.CreateForm(TfmShowRefBook, fmShowRefBook);
    AddFormToMainMenu(fmShowRefBook);
  end;
end;

procedure TMainForm.miWindowClick(Sender: TObject);
begin
  TCustomForm((Sender as TMenuItem).Tag).BringToFront;
end;

procedure TMainForm.WMCloseForm(var msg: TMessage);
var
  mi: TMenuItem;
begin
  if msg.WParam <> 0 then
  begin
    mi := FindFormInMainMenu(TCustomForm(msg.WParam).Caption);
    if mi <> nil then
      mi.Free;
    TCustomForm(msg.WParam).Free;
  end;
end;

end.
