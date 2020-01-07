unit coreilaveturleri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, DBGrids, Buttons, ZDataset, ZConnection, rxdbgrid,functionconfig;

type

  { Tilaveturleri }

  Tilaveturleri = class(TForm)
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
    ZTable1ilaveadi: TStringField;
    ZTable1kacay: TSmallintField;
    ZTable1tarifeid: TLargeintField;
    ZTable1tutar: TFloatField;
    ZTable2: TZTable;
    ZTable2aciklama: TStringField;
    ZTable2downloadlimit: TStringField;
    ZTable2fiyat: TFloatField;
    ZTable2id: TLargeintField;
    ZTable2kotagigabyte: TSmallintField;
    ZTable2tarifeadi: TStringField;
    ZTable2tarifeno: TStringField;
    ZTable2uploadlimit: TStringField;
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  ilaveturleri: Tilaveturleri;

implementation

{ Tilaveturleri }

procedure Tilaveturleri.FormShow(Sender: TObject);
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
  {$I coreilaveturleri.lrs}

end.

