unit corebankahesaphareketleri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, Buttons, DBGrids, ZConnection, ZDataset,functionconfig;

type

  { Tbankahesaphareketleri }

  Tbankahesaphareketleri = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    ZTable2: TZTable;
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  bankahesaphareketleri: Tbankahesaphareketleri;

implementation

{ Tbankahesaphareketleri }

procedure Tbankahesaphareketleri.FormShow(Sender: TObject);
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
  {$I corebankahesaphareketleri.lrs}

end.

