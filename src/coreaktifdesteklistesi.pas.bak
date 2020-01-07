unit coreaktifdesteklistesi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, Buttons, DBGrids, DbCtrls, ZConnection, ZDataset,functionconfig;

type

  { Taktifdesteklistesi }

  Taktifdesteklistesi = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZTable1: TZTable;
    ZTable1adi: TStringField;
    ZTable1adres: TStringField;
    ZTable1eposta: TStringField;
    ZTable1id: TLargeintField;
    ZTable1soyadi: TStringField;
    ZTable1telefon: TStringField;
    ZTable1unvani: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  aktifdesteklistesi: Taktifdesteklistesi;

implementation

{ Taktifdesteklistesi }

procedure Taktifdesteklistesi.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Taktifdesteklistesi.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZQuery1.Active:=True;
end;

initialization
  {$I coreaktifdesteklistesi.lrs}

end.

