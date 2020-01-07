unit coreyenihatakaydi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ComCtrls, DbCtrls, DBGrids, Buttons, ExtCtrls, StdCtrls, EditBtn,
  ZConnection, ZDataset, functionconfig, rxlookup;

type

  { Tyenihatakaydi }

  Tyenihatakaydi = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource3: TDatasource;
    Datasource4: TDatasource;
    DateEdit1: TDateEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    ZConnection1: TZConnection;
    ZQuery2: TZQuery;
    ZTable1: TZTable;
    ZTable2: TZTable;
    ZTable3: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ZTable1BeforePost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  yenihatakaydi: Tyenihatakaydi;

implementation

{ Tyenihatakaydi }

procedure Tyenihatakaydi.Edit1KeyPress(Sender: TObject; var Key: char);
begin

  if Key=#13 then
  begin

    //Filtre yok
    if RadioGroup1.ItemIndex=0 then
      begin
      ZQuery2.Close;
      ZQuery2.SQL.Text:='select * from corecustomers LIMIT 0,100;';
      ZQuery2.Open;
      end;

    //Adına göre
    if RadioGroup1.ItemIndex=1 then
      begin
      ZQuery2.Close;
      ZQuery2.SQL.Text:='select * from corecustomers where adi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery2.Open;
      end;

    //Soyadına göre
    if RadioGroup1.ItemIndex=2 then
      begin
      ZQuery2.Close;
      ZQuery2.SQL.Text:='select * from corecustomers where soyadi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery2.Open;
      end;

    //Ünvana göre
    if RadioGroup1.ItemIndex=3 then
      begin
      ZQuery2.Close;
      ZQuery2.SQL.Text:='select * from corecustomers where unvani like "%'+Edit1.Text+'%" LIMIT 0,100';
      ZQuery2.Open;
      end;

    //T.C. Kimlik
    if RadioGroup1.ItemIndex=4 then
      begin
      ZQuery2.Close;
      ZQuery2.SQL.Text:='select * from corecustomers where tcno like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery2.Open;
      end;

    //Vergi no
    if RadioGroup1.ItemIndex=5 then
      begin
      ZQuery2.Close;
      ZQuery2.SQL.Text:='select * from corecustomers where verginumarasi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery2.Open;
      end;

  end;


end;

procedure Tyenihatakaydi.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  ZConnection1.Connected:=False;
end;

procedure Tyenihatakaydi.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZQuery2.Active:=True;
  ZTable2.Active:=True;
  ZTable3.Active:=True;

  ZTable1.Insert;
end;

procedure Tyenihatakaydi.ZTable1BeforePost(DataSet: TDataSet);
begin
  ZTable1.FieldByName('tarih').AsDateTime:=DateEdit1.Date;
  ZTable1.FieldByName('carihesapid').AsInteger:=ZQuery2.FieldByName('id').AsInteger;
  ZTable1.FieldByName('durum').AsString:='Aktif';   //aktif pasif
end;

procedure Tyenihatakaydi.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure Tyenihatakaydi.BitBtn1Click(Sender: TObject);
begin
   Self.Free;
end;

initialization
  {$I coreyenihatakaydi.lrs}

end.

