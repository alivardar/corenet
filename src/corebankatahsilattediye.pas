unit corebankatahsilattediye;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, DbCtrls, DBGrids, ExtCtrls, EditBtn, ZConnection,
  ZDataset, functionconfig;

type

  { Tbankatahsilattediye }

  Tbankatahsilattediye = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource3: TDatasource;
    Datasource4: TDatasource;
    DateEdit1: TDateEdit;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox2: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZQuery2: TZQuery;
    ZTable1: TZTable;
    ZTable3: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure ZTable1BeforePost(DataSet: TDataSet);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  bankatahsilattediye: Tbankatahsilattediye;

implementation

{ Tbankatahsilattediye }



procedure Tbankatahsilattediye.BitBtn1Click(Sender: TObject);
begin
   self.Free;
end;

procedure Tbankatahsilattediye.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure Tbankatahsilattediye.Edit1KeyPress(Sender: TObject; var Key: char);
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

procedure Tbankatahsilattediye.FormShow(Sender: TObject);
begin

  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZQuery2.Active:=True;
  ZQuery2.Active:=True;

  ZTable1.Insert;
end;

procedure Tbankatahsilattediye.ZTable1BeforePost(DataSet: TDataSet);
begin

  ZTable1.FieldByName('tarih').AsDateTime:=DateEdit1.Date;
  ZTable1.FieldByName('carihesapid').AsInteger:=ZQuery2.FieldByName('id').AsInteger;

  if ZTable1.FieldByName('hareketturu').AsString='BTahsilat' then
   ZTable1.FieldByName('borcalacak').AsString:='alacak' else
   ZTable1.FieldByName('borcalacak').AsString:='borc';

end;

initialization
  {$I corebankatahsilattediye.lrs}

end.

