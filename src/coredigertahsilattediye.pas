unit coredigertahsilattediye;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, EditBtn, ZConnection, ZDataset,functionconfig;

type

  { Tdigertahsilattediye }

  Tdigertahsilattediye = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DateEdit1: TDateEdit;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZTable1BeforePost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  digertahsilattediye: Tdigertahsilattediye;

implementation

{ Tdigertahsilattediye }

procedure Tdigertahsilattediye.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;


procedure Tdigertahsilattediye.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZTable1.Insert;
end;


procedure Tdigertahsilattediye.ZTable1BeforePost(DataSet: TDataSet);
begin

ZTable1.FieldByName('tarih').AsDateTime:=DateEdit1.Date;

  if ZTable1.FieldByName('hareketturu').AsString='Tahsilat' then
   ZTable1.FieldByName('borcalacak').AsString:='alacak' else
   ZTable1.FieldByName('borcalacak').AsString:='borc';

end;

initialization
  {$I coredigertahsilattediye.lrs}

end.

