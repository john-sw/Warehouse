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
  AdvMenus;

const
  WM_CloseForm = WM_USER + 1;

type
  TMainForm = class(TForm)
    dxStatusBar1: TdxStatusBar;
    MainBarManager: TdxBarManager;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarGroup1: TdxBarGroup;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab3: TdxRibbonTab;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    N1: TdxBarButton;
    N2: TdxBarButton;
    N5: TdxBarButton;
    N7: TdxBarButton;
    dxRibbonPopupMenu2: TdxRibbonPopupMenu;
    dxBarButton1: TdxBarButton;
    pmRefBooks: TdxBarPopupMenu;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMainMenu;
    procedure WMCloseForm(var msg: TMessage); message WM_CloseForm;
    procedure ActiveFormChange(Sender: TObject);
    procedure AddFormToMainMenu(AForm: TCustomForm);
    function FindFormInMainMenu(AForm: TCustomForm): TMenuItem;
    procedure miRefBookClick(Sender: TObject);
    procedure miWindowClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  dm_RefBooks, dm_main, fm_ShowRefBooks;

{$R *.dfm}

function TMainForm.FindFormInMainMenu(AForm: TCustomForm): TMenuItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 2 to miWindow.Count - 1 do
    if TMenuItem(miWindow.Items[i]).Caption = AForm.Caption then
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
  mi := FindFormInMainMenu(AForm);

  if mi <> nil then
    Exit;

  mi := TMenuItem.Create(Nil);
  mi.Caption := AForm.Caption;
  mi.Tag := UIntPtr(AForm);
  mi.OnClick := miWindowClick;
  miWindow.Add(mi);
end;

procedure TMainForm.ActiveFormChange(Sender: TObject);
begin
  if Screen = nil then
    Exit;

  AddFormToMainMenu(Screen.ActiveForm);
end;

procedure TMainForm.CreateMainMenu;
var
  mi: TMenuItem;
begin
  dmRefBooks.qSprRef.Close;
  dmRefBooks.qSprRef.Open;

  while not dmRefBooks.qSprRef.Eof do
  begin
    mi := TMenuItem.Create(Nil);
    mi.Caption := dmRefBooks.qSprRef.FieldByName('ReferenceRUSName').AsString;
    mi.Tag := dmRefBooks.qSprRef.RecNo;
    mi.OnClick := miRefBookClick;
    miRefBooks.Add(mi);
    dmRefBooks.qSprRef.Next;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  dmMain.MainConnection.Connect;
  CreateMainMenu;
  Screen.OnActiveFormChange := ActiveFormChange;
end;

procedure TMainForm.miRefBookClick(Sender: TObject);
var
  mi: TMenuItem;
begin
  dmRefBooks.qSprRef.RecNo := (Sender as TMenuItem).Tag;
  Application.CreateForm(TfmShowRefBook, fmShowRefBook);
//  mi := FindFormInMainMenu(fmShowRefBook);
{  if mi <> nil then
  begin
    fmShowRefBook.Free;
    TCustomForm((Sender as TMenuItem).Tag).BringToFront;
  end
  else  }
    fmShowRefBook.Show;
end;

procedure TMainForm.miWindowClick(Sender: TObject);
begin
  TCustomForm((Sender as TMenuItem).Tag).BringToFront;
end;

procedure TMainForm.WMCloseForm(var msg: TMessage);
begin
  if msg.WParam <> 0 then
    TCustomForm(msg.WParam).Free;
end;

end.
