unit fm_AddEditRefBookClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxPC, cxDropDownEdit, cxCalc, cxGroupBox, cxCheckBox, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel,
  Vcl.ExtCtrls, AdvPanel, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Uni, MemDS, DBAccess, System.Actions, Vcl.ActnList, RzPanel, RzButton, Vcl.ImgList, AdvMenus, dxmdaset,
  cxSpinEdit, cxDBNavigator, dxPSGlbl, dxPSUtl, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSEngn, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPScxCommon, dxPgsDlg, AdvSmoothTabPager, HTMLabel,
  fm_ShowRefBookClients, dm_main;

type
  TfmAddEditRefBookClients = class(TForm)
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    dsClientType: TUniDataSource;
    qClientType: TUniQuery;
    ilRefBookActionImages: TcxImageList;
    cxPageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    ClientShortName: TcxTextEdit;
    ClientTypeID: TcxLookupComboBox;
    ClientINN: TcxTextEdit;
    Comment: TcxTextEdit;
    ClientFullName: TcxTextEdit;
    ClientLegalAddress: TcxTextEdit;
    ClientPostAddress: TcxTextEdit;
    ClientKPP: TcxTextEdit;
    ClientCity: TcxTextEdit;
    ClientMainPhone: TcxTextEdit;
    ClientEmail: TcxTextEdit;
    ClientSecondPhone: TcxTextEdit;
    ClientSite: TcxTextEdit;
    pmContacts: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    mdBankAccounts: TdxMemData;
    mdContacts: TdxMemData;
    GridContacts: TcxGrid;
    tvContacts: TcxGridDBTableView;
    GridContactsLevel1: TcxGridLevel;
    tbContacts: TRzToolbar;
    RzToolButton3: TRzToolButton;
    RzSpacer3: TRzSpacer;
    RzToolButton5: TRzToolButton;
    RzSpacer4: TRzSpacer;
    RzToolButton6: TRzToolButton;
    GridBankAccounts: TcxGrid;
    tvBankAccounts: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    tbBankAccounts: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton2: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzToolButton4: TRzToolButton;
    pmBankAccounts: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    spContacts: TUniStoredProc;
    spBankAccounts: TUniStoredProc;
    dsContacts: TUniDataSource;
    dsBankAccounts: TUniDataSource;
    alRefBook: TActionList;
    actAddContact: TAction;
    actEditContact: TAction;
    actDeleteContact: TAction;
    actCopyCellContacts: TAction;
    actAddBankAccount: TAction;
    actEditBankAccount: TAction;
    actDeleteBankAccount: TAction;
    actCopyCellBankAccounts: TAction;
    spRefBookFieldsBrowse: TUniStoredProc;
    lblLabel1: THTMLabel;
    lblLabel2: THTMLabel;
    lblLabel7: THTMLabel;
    lblLabel5: THTMLabel;
    lblLabel3: THTMLabel;
    lblLabel4: THTMLabel;
    lblLabel6: THTMLabel;
    lblLabel8: THTMLabel;
    lblLabel9: THTMLabel;
    lblLabel10: THTMLabel;
    lblLabel11: THTMLabel;
    lblLabel12: THTMLabel;
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    procedure FormShow(Sender: TObject);
    procedure actAddContactExecute(Sender: TObject);
    procedure actEditContactExecute(Sender: TObject);
    procedure actDeleteContactExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure actAddBankAccountExecute(Sender: TObject);
    procedure actEditBankAccountExecute(Sender: TObject);
    procedure actDeleteBankAccountExecute(Sender: TObject);
    procedure mdBankAccountsAfterPost(DataSet: TDataSet);
    procedure actCopyCellContactsExecute(Sender: TObject);
    procedure actCopyCellBankAccountsExecute(Sender: TObject);
    procedure alRefBookUpdate(Action: TBasicAction; var Handled: Boolean);

  private
    IsModified: Boolean;
    procedure SetParamsAndExecStoredProc;
    function CheckReqControls: TWinControl;
    { Private declarations }
  public
    { Public declarations }
    FormMode: TRefBookFormMode;
    CurrentID: Integer;
    ParentID: Integer;
    RefBookName: string;
    ParentRefBookForm: TfmShowRefBookClients;
  end;

var
  fmAddEditRefBookClients: TfmAddEditRefBookClients;

implementation

{$R *.dfm}

uses fm_AddEditLinkedRefBook, Vcl.Clipbrd;


procedure TfmAddEditRefBookClients.actAddContactExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Контактное лицо';
    fmAddEditLinkedRefBook.FormMode := fmAdd;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 13; //persons
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdContacts;

    if fmAddEditLinkedRefBook.ShowModal = mrOk then
      GridContacts.SetFocus;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookClients.actCopyCellBankAccountsExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvBankAccounts.Controller.FocusedRecord.Values[tvBankAccounts.Controller.FocusedColumn.Index];
end;

procedure TfmAddEditRefBookClients.actCopyCellContactsExecute(Sender: TObject);
begin
  ClipBoard.AsText := tvContacts.Controller.FocusedRecord.Values[tvContacts.Controller.FocusedColumn.Index];
end;

procedure TfmAddEditRefBookClients.actAddBankAccountExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Банковский счет';
    fmAddEditLinkedRefBook.FormMode := fmAdd;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 14; //bankaccount
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdBankAccounts;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
      GridBankAccounts.SetFocus;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookClients.actDeleteContactExecute(Sender: TObject);
begin
  if tvContacts.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvContacts.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditRefBookClients.actDeleteBankAccountExecute(Sender: TObject);
begin
  if tvBankAccounts.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvBankAccounts.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditRefBookClients.actEditContactExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Контактное лицо';
    fmAddEditLinkedRefBook.FormMode := fmEdit;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 13; //persons
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdContacts;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
      GridContacts.SetFocus;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookClients.alRefBookUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  actEditContact.Enabled := (tvContacts.Controller.FocusedRow <> nil);
  actDeleteContact.Enabled := actEditContact.Enabled;
  actEditBankAccount.Enabled := (tvBankAccounts.Controller.FocusedRow <> nil);
  actDeleteBankAccount.Enabled := actEditBankAccount.Enabled;
end;

procedure TfmAddEditRefBookClients.actEditBankAccountExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditLinkedRefBook, fmAddEditLinkedRefBook);
  try
    fmAddEditLinkedRefBook.RefBookName := 'Банковский счет';
    fmAddEditLinkedRefBook.FormMode := fmEdit;
    fmAddEditLinkedRefBook.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 14; //bankaccount
    fmAddEditLinkedRefBook.rsRefBookDataSet := mdBankAccounts;
    if fmAddEditLinkedRefBook.ShowModal = mrOk then
      GridBankAccounts.SetFocus;
  finally
    FreeAndNil(fmAddEditLinkedRefBook);
  end;
end;

procedure TfmAddEditRefBookClients.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditRefBookClients.SetParamsAndExecStoredProc;
var
  sp1: TUniStoredProc;
  i: Integer;
begin
  try
    dmMain.MainConnection.StartTransaction;

    spInsertUpdateDeleteRefBook.ParamByName('ClientFolderID').Value := ParentID;
    spInsertUpdateDeleteRefBook.ParamByName('ClientFullName').Value := ClientFullName.Text;
    spInsertUpdateDeleteRefBook.ParamByName('ClientShortName').Value := ClientShortName.Text;
    spInsertUpdateDeleteRefBook.ParamByName('ClientINN').Value := ClientINN.Text;
    spInsertUpdateDeleteRefBook.ParamByName('ClientKPP').Value := ClientKPP.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('ClientTypeID').Value := ClientTypeID.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('ClientCity').Value := ClientKPP.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('PostAddress').Value := ClientPostAddress.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('LegalAddress').Value := ClientLegalAddress.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('ClientMainPhone').Value := ClientMainPhone.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('ClientSecondPhone').Value := ClientSecondPhone.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('ClientMainEMail').Value := ClientEmail.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('ClientSite').Value := ClientSite.EditValue;
    spInsertUpdateDeleteRefBook.ParamByName('Comment').Value := Comment.Text;
    spInsertUpdateDeleteRefBook.ParamByName('IsActive').Value := 1;

    if (FormMode = fmAdd) then
    begin
      spInsertUpdateDeleteRefBook.Open;
      if not spInsertUpdateDeleteRefBook.Eof then
        CurrentID := spInsertUpdateDeleteRefBook.FieldByName('ID').AsInteger;
    end
    else
      spInsertUpdateDeleteRefBook.Execute;

    try
      sp1 := TUniStoredProc.Create(Nil);
      sp1.Connection := dmMain.MainConnection;

      if (FormMode = fmEdit) then
      begin
        sp1.CreateProcCall('delPersons');
        spContacts.First;
        while not spContacts.Eof do
        begin
          if not mdContacts.Locate('PersonID', spContacts.FieldByName('PersonID').AsInteger, []) then
          begin
            sp1.ParamByName('ID').AsInteger := spContacts.FieldByName('PersonID').AsInteger;
            sp1.Execute;
          end;
          spContacts.Next;
        end;
        sp1.CreateProcCall('delBankAccount');
        spBankAccounts.First;
        while not spBankAccounts.Eof do
        begin
          if not mdBankAccounts.Locate('BankAccountID', spBankAccounts.FieldByName('BankAccountID').AsInteger, []) then
          begin
            sp1.ParamByName('ID').AsInteger := spBankAccounts.FieldByName('BankAccountID').AsInteger;
            sp1.Execute;
          end;
          spBankAccounts.Next;
        end;
      end;
      mdContacts.First;
      while not mdContacts.Eof do
      begin
        if mdContacts.FieldByName('PersonID').IsNull then
          sp1.CreateProcCall('insPersons')
        else
        begin
          sp1.CreateProcCall('updPersons');
          sp1.ParamByName('ID').AsInteger := mdContacts.FieldByName('PersonID').AsInteger;
        end;
        // нулевое поле - внутренний RecID
        // назания полей из хранимой процедуры берутся ибо в mdContacts названия полей с префиксом
        for i := 1 to mdContacts.FieldCount - 1 do
          // могут быть поля, которые не нужно передавать в процедуру
          try
            sp1.ParamByName(spContacts.Fields[i - 1].FieldName).Value := mdContacts.Fields[i].Value;
          except
          end;

        sp1.ParamByName('ClientID').AsInteger := CurrentID;
        sp1.Execute;
        mdContacts.Next;
      end;

      mdBankAccounts.First;
      while not mdBankAccounts.Eof do
      begin
        if mdBankAccounts.FieldByName('BankAccountID').IsNull then
          sp1.CreateProcCall('insBankAccount')
        else
        begin
          sp1.CreateProcCall('updBankAccount');
          sp1.ParamByName('ID').AsInteger := mdBankAccounts.FieldByName('BankAccountID').AsInteger;
        end;
        // первое поле внутренний RecID
        // назания полей из хранимой процедуры берутся ибо в mdBankAccounts названия полей с префиксом
        for i := 1 to mdBankAccounts.FieldCount - 1 do
          // могут быть поля, которые не нужно передавать в процедуру
          try
            sp1.ParamByName(spBankAccounts.Fields[i - 1].FieldName).Value := mdBankAccounts.Fields[i].Value;
          except
          end;
        sp1.ParamByName('ClientID').AsInteger := CurrentID;
        sp1.Execute;
        mdBankAccounts.Next;
      end;
      dmMain.MainConnection.Commit;
    finally
      FreeAndNil(sp1);
    end;
  except
    if dmMain.MainConnection.InTransaction then
      dmMain.MainConnection.Rollback;
  end;

end;

function TfmAddEditRefBookClients.CheckReqControls: TWinControl;
begin
  Result := nil;

  dmMain.spGetReferenceFieldList.Close;
  dmMain.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 11; // clients
  dmMain.spGetReferenceFieldList.Open;

  if not dm_main.CheckControl(TcxCustomEdit(Comment), dmMain.spGetReferenceFieldList, 'Comment') then
    Result := Comment;

  if not dm_main.CheckControl(TcxCustomEdit(ClientSite), dmMain.spGetReferenceFieldList, 'ClientSite') then
    Result := ClientSite;

  if not dm_main.CheckControl(TcxCustomEdit(ClientEmail), dmMain.spGetReferenceFieldList, 'ClientEmail') then
    Result := ClientEmail;

  if not dm_main.CheckControl(TcxCustomEdit(ClientSecondPhone), dmMain.spGetReferenceFieldList, 'ClientSecondPhone') then
    Result := ClientSecondPhone;

  if not dm_main.CheckControl(TcxCustomEdit(ClientMainPhone), dmMain.spGetReferenceFieldList, 'ClientMainPhone') then
    Result := ClientMainPhone;

  if not dm_main.CheckControl(TcxCustomEdit(ClientLegalAddress), dmMain.spGetReferenceFieldList, 'ClientLegalAddress') then
    Result := ClientLegalAddress;

  if not dm_main.CheckControl(TcxCustomEdit(ClientPostAddress), dmMain.spGetReferenceFieldList, 'ClientPostAddress') then
    Result := ClientPostAddress;

  if not dm_main.CheckControl(TcxCustomEdit(ClientCity), dmMain.spGetReferenceFieldList, 'ClientCity') then
    Result := ClientCity;

  if not dm_main.CheckControl(TcxCustomEdit(ClientTypeID), dmMain.spGetReferenceFieldList, 'ClientTypeID') then
    Result := ClientTypeID;

  if not dm_main.CheckControl(TcxCustomEdit(ClientKPP), dmMain.spGetReferenceFieldList, 'ClientKPP') then
    Result := ClientKPP;

  if not dm_main.CheckControl(TcxCustomEdit(ClientINN), dmMain.spGetReferenceFieldList, 'ClientINN') then
    Result := ClientINN;

  if not dm_main.CheckControl(TcxCustomEdit(ClientShortName), dmMain.spGetReferenceFieldList, 'ClientShortName') then
    Result := ClientShortName;

  if not dm_main.CheckControl(TcxCustomEdit(ClientFullName), dmMain.spGetReferenceFieldList, 'ClientFullName') then
    Result := ClientFullName;

end;

procedure TfmAddEditRefBookClients.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode = fmAdd) or IsModified or IsControlsModified(cxPageControl) then
  begin
    InvalidControl := CheckReqControls;
    if InvalidControl = nil then
    begin
      SetParamsAndExecStoredProc;
      ModalResult := mrOk;
    end
    else
    begin
      MessageBox(Self.Handle,'Необходимо заполнить обязательные поля', 'Ошибка', MB_OK + MB_ICONERROR);
      InvalidControl.SetFocus;
    end;
  end
  else
    ModalResult := mrCancel;
end;

procedure TfmAddEditRefBookClients.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // ModalResult может быть установлен в btnSaveClick
  if (FormMode = fmView) then
    ModalResult := mrOk;
  if ModalResult = mrOk then
  begin
    CanClose := True;
    Exit;
  end;
  if IsModified or IsControlsModified(cxPageControl) then
    if MessageBox(0,'Вы действительно хотите выйти без сохранения изменений?',
                  'Подтверждение', MB_YESNO + MB_ICONQUESTION) = ID_YES then
      ModalResult := mrNo
    else
      ModalResult := mrCancel
  else
    ModalResult := mrNo;
  CanClose := (ModalResult <> mrCancel);
end;

procedure TfmAddEditRefBookClients.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditRefBookClients.FormShow(Sender: TObject);
var
  i: Integer;
begin
  qClientType.Open;
  if FormMode in [fmEdit, fmView] then
    with ParentRefBookForm.spGetClientsForGroup do
    begin
      ClientFullName.Text := FieldByName('ClientFullName').AsString;
      ClientShortName.Text := FieldByName('ClientShortName').AsString;
      ClientINN.Text := FieldByName('ClientINN').AsString;
      ClientKPP.EditValue := FieldByName('ClientKPP').AsString;
      ClientTypeID.EditValue := FieldByName('ClientTypeID').AsInteger;
      ClientKPP.EditValue := FieldByName('ClientCity').AsString;
      ClientPostAddress.EditValue := FieldByName('PostAddress').AsString;
      ClientLegalAddress.EditValue := FieldByName('LegalAddress').AsString;
      ClientMainPhone.EditValue := FieldByName('ClientMainPhone').AsString;
      ClientSecondPhone.EditValue := FieldByName('ClientSecondPhone').AsString;
      ClientEmail.EditValue := FieldByName('ClientMainEMail').AsString;
      ClientSite.EditValue := FieldByName('ClientSite').AsString;
      Comment.Text := FieldByName('Comment').AsString;
      spContacts.ParamByName('ClientID').Value := FieldByName('ClientID').AsInteger;
      spContacts.Open;
      spBankAccounts.ParamByName('ClientID').Value := FieldByName('ClientID').AsInteger;
      spBankAccounts.Open;
    end
  else
  begin
    spContacts.ParamByName('ClientID').Value := 0;
    spContacts.Open;
    spBankAccounts.ParamByName('ClientID').Value := 0;
    spBankAccounts.Open;
  end;

  mdContacts.CopyFromDataSet(spContacts);
  mdContacts.First;

  tvContacts.DataController.CreateAllItems;
  spRefBookFieldsBrowse.Close;
  spRefBookFieldsBrowse.ParamByName('ReferenceID').AsInteger := 13; // код справочника
  spRefBookFieldsBrowse.Open;
  for i:= 0 to tvContacts.ColumnCount - 1 do
    if (spRefBookFieldsBrowse.Locate('BrowserFieldName', tvContacts.Columns[i].Caption, [loCaseInsensitive])) then
    begin
      if (spRefBookFieldsBrowse.FieldByName('IsVisible').AsInteger = 0) then
        tvContacts.Columns[i].Visible := False;

      tvContacts.Columns[i].Caption := spRefBookFieldsBrowse.FieldByName('BrowserFieldRUSName').AsString;
      if spRefBookFieldsBrowse.FieldByName('IsKeyField').AsInteger = 1 then
        tvContacts.DataController.KeyFieldNames := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
      if spRefBookFieldsBrowse.FieldByName('ColumnTypeID').AsInteger = 5 then
      begin
        tvContacts.Columns[i].PropertiesClass := TcxCheckBoxProperties;
        with tvContacts.Columns[i].Properties as TcxCheckBoxProperties do
        begin
          AllowGrayed := False;
          ValueChecked := 1;
          ValueUnchecked := 0;
        end;
      end;
      if spRefBookFieldsBrowse.FieldByName('HaveFilter').AsInteger = 0 then
        tvContacts.Columns[i].Options.Filtering := False;
      if spRefBookFieldsBrowse.FieldByName('HaveSummary').AsInteger = 1 then
      begin
        tvContacts.Columns[i].Summary.FooterKind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
        tvContacts.Columns[i].Summary.FooterFormat := spRefBookFieldsBrowse.FieldByName('FooterFormat').AsString;
        with TcxGridDBTableSummaryItem(tvContacts.DataController.Summary.FooterSummaryItems.Add) do
        begin
          Kind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
          Column := tvContacts.Columns[i];
          FieldName := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
        end;
      end;

      tvContacts.Columns[i].Width := spRefBookFieldsBrowse.FieldByName('Width').AsInteger;
    end
    else
      tvContacts.Columns[i].Visible := False;

  mdBankAccounts.CopyFromDataSet(spBankAccounts);
  mdBankAccounts.First;

  tvBankAccounts.DataController.CreateAllItems;
  spRefBookFieldsBrowse.Close;
  spRefBookFieldsBrowse.ParamByName('ReferenceID').AsInteger := 14; // код справочника
  spRefBookFieldsBrowse.Open;
  for i:= 0 to tvBankAccounts.ColumnCount - 1 do
    if (spRefBookFieldsBrowse.Locate('BrowserFieldName', tvBankAccounts.Columns[i].Caption, [loCaseInsensitive])) then
    begin
      if (spRefBookFieldsBrowse.FieldByName('IsVisible').AsInteger = 0) then
        tvBankAccounts.Columns[i].Visible := False;

      tvBankAccounts.Columns[i].Caption := spRefBookFieldsBrowse.FieldByName('BrowserFieldRUSName').AsString;
      if spRefBookFieldsBrowse.FieldByName('IsKeyField').AsInteger = 1 then
        tvBankAccounts.DataController.KeyFieldNames := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
      if spRefBookFieldsBrowse.FieldByName('ColumnTypeID').AsInteger = 5 then
      begin
        tvBankAccounts.Columns[i].PropertiesClass := TcxCheckBoxProperties;
        with tvBankAccounts.Columns[i].Properties as TcxCheckBoxProperties do
        begin
          AllowGrayed := False;
          ValueChecked := 1;
          ValueUnchecked := 0;
        end;
      end;
      if spRefBookFieldsBrowse.FieldByName('HaveFilter').AsInteger = 0 then
        tvBankAccounts.Columns[i].Options.Filtering := False;
      if spRefBookFieldsBrowse.FieldByName('HaveSummary').AsInteger = 1 then
      begin
        tvBankAccounts.Columns[i].Summary.FooterKind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
        tvBankAccounts.Columns[i].Summary.FooterFormat := spRefBookFieldsBrowse.FieldByName('FooterFormat').AsString;
        with TcxGridDBTableSummaryItem(tvBankAccounts.DataController.Summary.FooterSummaryItems.Add) do
        begin
          Kind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
          Column := tvBankAccounts.Columns[i];
          FieldName := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
        end;
      end;

      tvBankAccounts.Columns[i].Width := spRefBookFieldsBrowse.FieldByName('Width').AsInteger;
    end
    else
      tvBankAccounts.Columns[i].Visible := False;

  case FormMode of
    fmAdd: Caption := 'Добавление контрагента';
    fmEdit: Caption := 'Изменение контрагента';
    fmView:
      begin
        Caption := 'Просмотр контрагента';
        SetControlsReadOnly(Self, True);
        tbBankAccounts.Visible := False;
        tbContacts.Visible := False;
        GridContacts.PopupMenu := nil;
        GridBankAccounts.PopupMenu := nil;
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;

  DrawRequiredAsterisks(Self, 11); // clients

  IsModified := False;
end;

procedure TfmAddEditRefBookClients.mdBankAccountsAfterPost(DataSet: TDataSet);
begin
  IsModified := True;
end;

end.
