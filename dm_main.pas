unit dm_main;

interface

uses
  System.SysUtils, System.Classes, DBAccess, UniDacVcl, Data.DB, Uni,
  UniProvider, SQLServerUniProvider;

type
  TdmMain = class(TDataModule)
    MainConnection: TUniConnection;
    MainConnectDialog: TUniConnectDialog;
    MainProvider: TSQLServerUniProvider;
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

end.
