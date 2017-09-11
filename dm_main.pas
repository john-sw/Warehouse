unit dm_main;

interface

uses
  System.SysUtils, System.Classes, DBAccess, UniDacVcl, Data.DB, Uni,
  UniProvider, SQLServerUniProvider, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxClasses, cxLookAndFeels, AdvPanel, MemDS, AdvMenuStylers, AdvMenus,
  Vcl.Forms, cxLocalization, cxStyles, System.IniFiles;

type
  TdmMain = class(TDataModule)
    MainConnection: TUniConnection;
    MainConnectDialog: TUniConnectDialog;
    MainProvider: TSQLServerUniProvider;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvMenuFantasyStyler1: TAdvMenuFantasyStyler;
    cxLocalizer: TcxLocalizer;
    GridStyleRepository: TcxStyleRepository;
    GridStyleSelectedRow: TcxStyle;
    GridStyleEvenRow: TcxStyle;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.DataModuleCreate(Sender: TObject);
var
  Ini : TIniFile;
begin

  if MainConnection.Connected then MainConnection.Close;
  if FileExists(ExtractFilePath(Application.ExeName)+'config.ini') then begin
    try
      Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');

      MainConnection.Server := Ini.ReadString('DB', 'server', '');
      MainConnection.Database := Ini.ReadString('DB', 'database', '');
      MainConnection.Username := Ini.ReadString('DB', 'username', '');
      MainConnection.Password := Ini.ReadString('DB', 'password', '');
    finally
      FreeAndNil(Ini);
    end;
  end;

  MainConnection.Connect;

  try
    cxLocalizer.FileName := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + 'RussianLng.ini';
    cxLocalizer.Active := True;
    cxLocalizer.Locale := 1049;
  except
  end;
end;

end.
