unit corevergioranlariunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, DbCtrls, Buttons, ZConnection, ZDataset, functionconfig;

type

  { Tvergioranlari }

  Tvergioranlari = class(TForm)
    BitBtn1: TBitBtn;
    Datasource2: TDatasource;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  vergioranlari: Tvergioranlari;

implementation

{ Tvergioranlari }

procedure Tvergioranlari.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
end;


procedure Tvergioranlari.BitBtn1Click(Sender: TObject);
begin
   self.Free;
end;

initialization
  {$I corevergioranlariunit.lrs}

end.

