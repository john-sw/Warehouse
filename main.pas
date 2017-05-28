unit main;

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
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure FormShow(Sender: TObject);
  private
    procedure CreateMainMenu;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  dm_RefBooks, dm_main;

{$R *.dfm}


procedure TMainForm.CreateMainMenu;
var
  mi: TMenuItem;
begin
  try
    dmRefBooks.qSprRef.Open;

    while not dmRefBooks.qSprRef.Eof do
    begin
      mi := TMenuItem.Create(Nil);
      mi.Caption := dmRefBooks.qSprRef.FieldByName('ReferenceRUSName').AsString;
      miRefBooks.Add(mi);
      dmRefBooks.qSprRef.Next;
    end;
  finally
    dmRefBooks.qSprRef.Close;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  dmMain.MainConnection.Connect;
  CreateMainMenu;
end;

end.
