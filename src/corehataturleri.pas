unit corehataturleri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, DBGrids,  Buttons, ZConnection, ZDataset,functionconfig;

type

  { Thataturleri }

  Thataturleri = class(TForm)
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
  hataturleri: Thataturleri;

implementation

{ Thataturleri }

procedure Thataturleri.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Thataturleri.FormShow(Sender: TObject);
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
  {$I corehataturleri.lrs}

end.

