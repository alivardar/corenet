unit corebankadanparacekme;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, EditBtn, ZConnection, ZDataset,
  functionconfig;

type

  { Tbankadanparacekme }

  Tbankadanparacekme = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DateEdit1: TDateEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    ZTable2: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZTable1BeforePost(DataSet: TDataSet);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  bankadanparacekme: Tbankadanparacekme;

implementation

{ Tbankadanparacekme }



procedure Tbankadanparacekme.BitBtn1Click(Sender: TObject);
begin
  self.Free;
end;

procedure Tbankadanparacekme.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZTable2.Active:=True;
  ZTable1.Insert;
end;

procedure Tbankadanparacekme.ZTable1BeforePost(DataSet: TDataSet);
begin
  ZTable1.FieldByName('tarih').AsDateTime:=DateEdit1.Date;
//bankadan para çekince kasaya borç bankaya alacak yazılacak
  ZTable1.FieldByName('borcalacak').AsString:='alacak';
  ZTable1.FieldByName('hareketturu').AsString:='BTediye';
end;

initialization
  {$I corebankadanparacekme.lrs}

end.

