unit corecarilistesi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, DBGrids, ComCtrls, Buttons, StdCtrls, ExtCtrls, ZConnection,
  ZDataset,functionconfig;

type

  { Tcarilistesi }

  Tcarilistesi = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  carilistesi: Tcarilistesi;

implementation

{ Tcarilistesi }

procedure Tcarilistesi.Edit1Click(Sender: TObject);
begin
    Edit1.Text:='';
end;

procedure Tcarilistesi.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Tcarilistesi.Edit1KeyPress(Sender: TObject; var Key: char);
begin

  if Key=#13 then
  begin

    //Filtre yok
    if RadioGroup1.ItemIndex=0 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='select * from corecustomers LIMIT 0,100;';
      ZQuery1.Open;
      end;

    //Adına göre
    if RadioGroup1.ItemIndex=1 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='select * from corecustomers where adi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery1.Open;
      end;

    //Soyadına göre
    if RadioGroup1.ItemIndex=2 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='select * from corecustomers where soyadi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery1.Open;
      end;

    //Ünvana göre
    if RadioGroup1.ItemIndex=3 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='select * from corecustomers where unvani like "%'+Edit1.Text+'%" LIMIT 0,100';
      ZQuery1.Open;
      end;

    //T.C. Kimlik
    if RadioGroup1.ItemIndex=4 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='select * from corecustomers where tcno like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery1.Open;
      end;

    //Vergi no
    if RadioGroup1.ItemIndex=5 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='select * from corecustomers where verginumarasi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZQuery1.Open;
      end;

  end;

end;

procedure Tcarilistesi.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZQuery1.Active:=True;
end;





initialization
  {$I corecarilistesi.lrs}

end.

