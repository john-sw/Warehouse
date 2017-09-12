unit fm_AddEditPriceList;

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
  cxSpinEdit, cxDBNavigator, AdvGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxButtonEdit, HTMLabel,
  cxCurrencyEdit, dm_main;

type
  TfmAddEditPriceList = class(TForm)
    pnlClient: TAdvPanel;
    pnlBottom: TAdvPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    spRefBookFieldsAddEditView: TUniStoredProc;
    ilRefBookActionImages: TcxImageList;
    alRefBook: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    dsPriceList: TUniDataSource;
    spPriceList: TUniStoredProc;
    pmPriceList: TAdvPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    mdPriceList: TdxMemData;
    AdvGroupBox1: TAdvGroupBox;
    GridPriceList: TcxGrid;
    tvPriceList: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    tbInvoiceList: TRzToolbar;
    RzToolButton4: TRzToolButton;
    RzSpacer5: TRzSpacer;
    RzToolButton5: TRzToolButton;
    RzSpacer6: TRzSpacer;
    RzToolButton6: TRzToolButton;
    PriceDate: TcxDateEdit;
    Supplier: TcxButtonEdit;
    qSprRef: TUniQuery;
    spRefBookFieldsBrowse: TUniStoredProc;
    lblLabel1: THTMLabel;
    lblLabel2: THTMLabel;
    tvPriceListPriceID: TcxGridDBColumn;
    tvPriceListPriceDate: TcxGridDBColumn;
    tvPriceListSupplier: TcxGridDBColumn;
    tvPriceListClientShortName: TcxGridDBColumn;
    tvPriceListClientFullName: TcxGridDBColumn;
    actFill: TAction;
    RzSpacer1: TRzSpacer;
    btnFill: TRzToolButton;
    spInsertUpdateDeleteRefBook: TUniStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mdDescrAfterPost(DataSet: TDataSet);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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
    spParentRefBook: TUniStoredProc;
  end;

var
  fmAddEditPriceList: TfmAddEditPriceList;

implementation

{$R *.dfm}

uses fm_AddEditLinkedRefBook, fm_ShowRefBookClients, fm_AddEditPriceListLine;

procedure TfmAddEditPriceList.actAddExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditPriceListLine, fmAddEditPriceListLine);
  try
    fmAddEditPriceListLine.RefBookName := 'позиция документа';
    fmAddEditPriceListLine.FormMode := fmAdd;
    fmAddEditPriceListLine.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 16; //invoice line
    fmAddEditPriceListLine.rsRefBookDataSet := mdPriceList;
    if fmAddEditPriceListLine.ShowModal = mrOk then
    begin
      GridPriceList.SetFocus;
      tvPriceListPriceID.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditPriceListLine);
  end;
end;

procedure TfmAddEditPriceList.actDeleteExecute(Sender: TObject);
begin
  if tvPriceList.Controller.FocusedRow = nil then
    Exit;
  if MessageBox(0,'Удалить запись?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION) <> id_yes then
    Exit;
  tvPriceList.DataController.DeleteFocused;
  IsModified := True;
end;

procedure TfmAddEditPriceList.actEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfmAddEditPriceListLine, fmAddEditPriceListLine);
  try
    fmAddEditPriceListLine.RefBookName := 'позиция документа';
    fmAddEditPriceListLine.FormMode := fmEdit;
    fmAddEditPriceListLine.spRefBookFieldsAddEditView.ParamByName('ReferenceID').AsInteger := 16; //invoice line
    fmAddEditPriceListLine.rsRefBookDataSet := mdPriceList;

    if fmAddEditPriceListLine.ShowModal = mrOk then
    begin
      GridPriceList.SetFocus;
      tvPriceListPriceID.FocusWithSelection;
    end;
  finally
    FreeAndNil(fmAddEditPriceListLine);
  end;
end;

procedure TfmAddEditPriceList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAddEditPriceList.SetParamsAndExecStoredProc;
var
  sp1: TUniStoredProc;
begin
  try
    dmMain.MainConnection.StartTransaction;

    spInsertUpdateDeleteRefBook.ParamByName('PriceDate').Value := PriceDate.Date;

    if Supplier.Properties.Buttons.Items[0].Tag = 0 then
      spInsertUpdateDeleteRefBook.ParamByName('Supplier').Clear
    else
      spInsertUpdateDeleteRefBook.ParamByName('Supplier').Value := Supplier.Properties.Buttons.Items[0].Tag;

    if (FormMode in [fmAdd, fmCopy]) then
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
        sp1.CreateProcCall('delPriceListLine');
        spPriceList.First;
        while not spPriceList.Eof do
        begin
          if not mdPriceList.Locate('PriceLineID', spPriceList.FieldByName('PriceLineID').AsInteger, []) then
          begin
            sp1.ParamByName('ID').AsInteger := spPriceList.FieldByName('PriceLineID').AsInteger;
            sp1.Execute;
          end;
          spPriceList.Next;
        end;
      end;
      mdPriceList.First;
      while not mdPriceList.Eof do
      begin
        if mdPriceList.FieldByName('PriceLineID').IsNull then
          sp1.CreateProcCall('insPriceListLine')
        else
        begin
          sp1.CreateProcCall('updPriceListLine');
          sp1.ParamByName('ID').AsInteger := mdPriceList.FieldByName('PriceLineID').AsInteger;
        end;

        sp1.ParamByName('PriceID').Value := CurrentID;
        sp1.ParamByName('ProdID').Value := mdPriceList.FieldByName('ProdID').Value;
        sp1.ParamByName('SuppArticle').Value := mdPriceList.FieldByName('SuppArticle').Value;
        sp1.ParamByName('SuppProdName').Value := mdPriceList.FieldByName('SuppProdName').Value;
        sp1.ParamByName('SuppProdComment').Value := mdPriceList.FieldByName('SuppProdComment').Value;
        sp1.ParamByName('SuppPrice').Value := mdPriceList.FieldByName('SuppPrice').Value;
        sp1.ParamByName('SuppVolume').Value := mdPriceList.FieldByName('SuppVolume').Value;
        sp1.ParamByName('SuppKvant').Value := mdPriceList.FieldByName('SuppKvant').Value;
        sp1.ParamByName('SuppCountry').Value := mdPriceList.FieldByName('SuppCountry').Value;
        sp1.ParamByName('Comment').Value := mdPriceList.FieldByName('Comment').Value;

        sp1.Execute;
        mdPriceList.Next;
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

function TfmAddEditPriceList.CheckReqControls: TWinControl;
begin
  Result := nil;

  dmMain.spGetReferenceFieldList.Close;
  dmMain.spGetReferenceFieldList.ParamByName('ReferenceID').AsInteger := 17; //Price List
  dmMain.spGetReferenceFieldList.Open;

  if not dm_main.CheckControl(TcxCustomEdit(Supplier), dmMain.spGetReferenceFieldList, 'Supplier') then
    Result := Supplier;

  if not dm_main.CheckControl(TcxCustomEdit(PriceDate), dmMain.spGetReferenceFieldList, 'PriceDate') then
    Result := PriceDate;

  dmMain.spGetReferenceFieldList.Close;
end;

procedure TfmAddEditPriceList.cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  frm: TfmShowRefBookClients;
begin
  if AButtonIndex = 0 then
    try
      Application.CreateForm(TfmShowRefBookClients, frm);
      frm.CurrentID := TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag;
      if frm.ShowModal = mrOk then
      begin
        TcxButtonEdit(Sender).Text := frm.tvRefBook.Controller.FocusedRow.Values[3];
        TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := frm.tvRefBook.Controller.FocusedRow.Values[0];

        IsModified := True;
      end;
    finally
      FreeAndNil(frm);
    end
  else
    begin
      TcxButtonEdit(Sender).Text := '';
      TcxButtonEdit(Sender).Properties.Buttons.Items[0].Tag := 0;
      IsModified := True;
    end;
end;

procedure TfmAddEditPriceList.btnSaveClick(Sender: TObject);
var
  InvalidControl: TWinControl;
begin
  if (FormMode in [fmAdd, fmCopy]) or IsModified or IsControlsModified(pnlClient) then
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

procedure TfmAddEditPriceList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // ModalResult может быть установлен в btnSaveClick
  if (FormMode = fmView) then
    ModalResult := mrOk;
  if ModalResult = mrOk then
  begin
    CanClose := True;
    Exit;
  end;
  if IsModified or IsControlsModified(pnlClient) then
    if MessageBox(0,'Вы действительно хотите выйти без сохранения изменений?',
                  'Подтверждение', MB_YESNO + MB_ICONQUESTION) = ID_YES then
      ModalResult := mrNo
    else
      ModalResult := mrCancel
  else
    ModalResult := mrNo;
  CanClose := (ModalResult <> mrCancel);
end;

procedure TfmAddEditPriceList.FormCreate(Sender: TObject);
begin
  FormMode := fmAdd;
  CurrentID := 0;
end;

procedure TfmAddEditPriceList.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if FormMode in [fmEdit, fmView, fmCopy] then
    with spParentRefBook do
    begin
      PriceDate.Date := FieldByName('PriceDate').AsDatetime;

      Supplier.Properties.Buttons.Items[0].Tag := FieldByName('Supplier').AsInteger;
      Supplier.Text := FieldByName('ClientFullName').AsString;

      spPriceList.ParamByName('PriceID').Value := FieldByName('PriceID').AsInteger;
      spPriceList.Open;
    end
  else
  begin
    spPriceList.ParamByName('PriceID').Value := -1;
    spPriceList.Open;
  end;

  mdPriceList.CopyFromDataSet(spPriceList);
  mdPriceList.First;
  if FormMode = fmCopy then
  begin
    PriceDate.Date := Trunc(Now);
    while not mdPriceList.Eof do
    begin
      mdPriceList.Edit;
      mdPriceList.FieldByName('PriceID').Clear;
      mdPriceList.FieldByName('PriceLineID').Clear;
      mdPriceList.FieldByName('SuppPrice').Clear;
      mdPriceList.Post;
      mdPriceList.Next;
    end;
    mdPriceList.First;
  end;

  case FormMode of
    fmAdd, fmCopy: Caption := 'Добавление прайс листа';
    fmEdit: Caption := 'Изменение прайс листа';
    fmView:
      begin
        Caption := 'Просмотр прайс листа';
        SetControlsReadOnly(Self, True);
        tbInvoiceList.Visible := False;
        GridPriceList.PopupMenu := nil;
        btnSave.Visible := False;
        btnCancel.Caption := 'Закрыть';
      end;
  end;

  qSprRef.ParamByName('ID').AsInteger := 18; // код справочника!
  qSprRef.Open;
  tvPriceList.ClearItems;
  tvPriceList.DataController.CreateAllItems;
  spRefBookFieldsBrowse.Close;
  spRefBookFieldsBrowse.ParamByName('ReferenceID').AsInteger := qSprRef.FieldByName('ReferenceID').AsInteger;
  spRefBookFieldsBrowse.Open;
  for i := 0 to tvPriceList.ColumnCount - 1 do
    if (spRefBookFieldsBrowse.Locate('BrowserFieldName', tvPriceList.Columns[i].Caption, [loCaseInsensitive])) then
    begin
      if (spRefBookFieldsBrowse.FieldByName('IsVisible').AsInteger = 0) then
        tvPriceList.Columns[i].Visible := False;

      tvPriceList.Columns[i].Caption := spRefBookFieldsBrowse.FieldByName('BrowserFieldRUSName').AsString;
      if spRefBookFieldsBrowse.FieldByName('IsKeyField').AsInteger = 1 then
        tvPriceList.DataController.KeyFieldNames := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
      if spRefBookFieldsBrowse.FieldByName('ColumnTypeID').AsInteger = 5 then
      begin
        tvPriceList.Columns[i].PropertiesClass := TcxCheckBoxProperties;
        with tvPriceList.Columns[i].Properties as TcxCheckBoxProperties do
        begin
          AllowGrayed := False;
          ValueChecked := 1;
          ValueUnchecked := 0;
        end;
      end;
      if spRefBookFieldsBrowse.FieldByName('HaveFilter').AsInteger = 0 then
        tvPriceList.Columns[i].Options.Filtering := False;
      if spRefBookFieldsBrowse.FieldByName('HaveSummary').AsInteger = 1 then
      begin
        tvPriceList.Columns[i].Summary.FooterKind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
        tvPriceList.Columns[i].Summary.FooterFormat := spRefBookFieldsBrowse.FieldByName('FooterFormat').AsString;
        with TcxGridDBTableSummaryItem(tvPriceList.DataController.Summary.FooterSummaryItems.Add) do
        begin
          Kind := TcxSummaryKind(spRefBookFieldsBrowse.FieldByName('FooterType').AsInteger);
          Column := tvPriceList.Columns[i];
          FieldName := spRefBookFieldsBrowse.FieldByName('BrowserFieldName').AsString;
        end;
      end;

      tvPriceList.Columns[i].Width := spRefBookFieldsBrowse.FieldByName('Width').AsInteger;
      if not spRefBookFieldsBrowse.FieldByName('DisplayFormat').IsNull then
      begin
        tvPriceList.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
        (tvPriceList.Columns[i].Properties as TcxCurrencyEditProperties).DisplayFormat := spRefBookFieldsBrowse.FieldByName('DisplayFormat').AsString;
      end;
    end
    else
      tvPriceList.Columns[i].Visible := False;
  actEdit.Enabled := (tvPriceList.DataController.KeyFieldNames <> '');

  DrawRequiredAsterisks(Self, 17); // PriceList

  IsModified := False;
end;

procedure TfmAddEditPriceList.mdDescrAfterPost(DataSet: TDataSet);
begin
  IsModified := True;
end;

end.
