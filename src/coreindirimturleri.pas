unit coreindirimturleri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, Buttons, DBGrids, DbCtrls, ZConnection, ZDataset,
  rxdbgrid,functionconfig;

type

  { Tindirimturleri }

  Tindirimturleri = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    RxDBGrid1: TRxDBGrid;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    ZTable1aciklama: TStringField;
    ZTable1id: TLargeintField;
    ZTable1indirimadi: TStringField;
    ZTable1kacay: TSmallintField;
    ZTable1tarifeid: TLargeintField;
    ZTable1tutar: TFloatField;
    ZTable2: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  indirimturleri: Tindirimturleri;

implementation

{ Tindirimturleri }

procedure Tindirimturleri.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Tindirimturleri.FormShow(Sender: TObject);
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



initialization
  {$I coreindirimturleri.lrs}

end.

