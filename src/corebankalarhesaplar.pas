unit corebankalarhesaplar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, DBGrids, Buttons, ZConnection, ZDataset,functionconfig;

type

  { Tbankalarhesaplar }

  Tbankalarhesaplar = class(TForm)
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
  bankalarhesaplar: Tbankalarhesaplar;

implementation

{ Tbankalarhesaplar }

procedure Tbankalarhesaplar.BitBtn1Click(Sender: TObject);
begin
   self.Free;
end;

procedure Tbankalarhesaplar.FormShow(Sender: TObject);
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
  {$I corebankalarhesaplar.lrs}

end.

