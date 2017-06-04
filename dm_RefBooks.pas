unit dm_RefBooks;

interface

uses
  System.SysUtils, System.Classes, dm_main, Uni, Data.DB, MemDS, DBAccess;

type
  TdmRefBooks = class(TDataModule)
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    qSprRefForMainMenu: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRefBooks: TdmRefBooks;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
