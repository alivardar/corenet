unit corestokhareketunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, DbCtrls, Buttons, ExtCtrls, ZConnection, ZDataset,functionconfig;

type

  { Tstokhareketleri }

  Tstokhareketleri = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource3: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    ZTable2: TZTable;
    ZTable3: TZTable;

     procedure BitBtn1Click(Sender: TObject);
     procedure FormShow(Sender: TObject);



  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  stokhareketleri: Tstokhareketleri;

implementation

{ Tstokhareketleri }







procedure Tstokhareketleri.BitBtn1Click(Sender: TObject);
begin
  self.Free;
end;

procedure Tstokhareketleri.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZTable2.Active:=True;
  ZTable3.Active:=True;
end;



initialization
  {$I corestokhareketunit.lrs}

end.

