unit corehizmetturleri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, DbCtrls, Buttons, ZConnection, ZDataset,functionconfig;

type

  { Thizmetturleri }

  Thizmetturleri = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
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
  hizmetturleri: Thizmetturleri;

implementation

{ Thizmetturleri }

procedure Thizmetturleri.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Thizmetturleri.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
end;

initialization
  {$I corehizmetturleri.lrs}

end.

