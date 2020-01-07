unit corebankayatirmacekme;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, EditBtn, ZConnection, ZDataset,
  functionconfig;

type

  { Tbankayaparayatirma }

  Tbankayaparayatirma = class(TForm)
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
  bankayaparayatirma: Tbankayaparayatirma;

implementation

{ Tbankayaparayatirma }

procedure Tbankayaparayatirma.BitBtn1Click(Sender: TObject);
begin
  self.Free;
end;

procedure Tbankayaparayatirma.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZTable2.Active:=True;
end;

procedure Tbankayaparayatirma.ZTable1BeforePost(DataSet: TDataSet);
begin
  ZTable1.FieldByName('tarih').AsDateTime:=DateEdit1.Date;

  //bankaya para yatırılınca kasa alacak verecek banka borc verecek
  ZTable1.FieldByName('borcalacak').AsString:='borc';
  ZTable1.FieldByName('hareketturu').AsString:='BTahsilat';
end;



initialization
  {$I corebankayatirmacekme.lrs}

end.

