unit corecarihesaphareketleri;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, DBGrids, Buttons, ZDataset, ZConnection, functionconfig;

type

  { Tcarihesaphareketleri }

  Tcarihesaphareketleri = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZTable1: TZTable;
    ZTable1aciklama: TStringField;
    ZTable1borcalacak: TStringField;
    ZTable1carihesapid: TLargeintField;
    ZTable1evrakno: TStringField;
    ZTable1faturano: TStringField;
    ZTable1hareketturu: TStringField;
    ZTable1tarih: TDateField;
    ZTable1tutar: TFloatField;
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  carihesaphareketleri: Tcarihesaphareketleri;

implementation

uses mainform;

{ Tcarihesaphareketleri }

procedure Tcarihesaphareketleri.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZQuery1.Active:=True;
  ZTable1.Active:=True;
end;

initialization
  {$I corecarihesaphareketleri.lrs}

end.

