unit abonelikbaslatma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, ExtCtrls, StdCtrls, DbCtrls, Buttons, EditBtn, ZDataset,
  ZConnection,  functionconfig;

type

  { Tabonelikbaslatmaform }

  Tabonelikbaslatmaform = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource3: TDatasource;
    DateEdit1: TDateEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZReadOnlyQuery2: TZReadOnlyQuery;
    ZReadOnlyQuery3: TZReadOnlyQuery;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ZTable1BeforePost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  abonelikbaslatmaform: Tabonelikbaslatmaform;

implementation

{ Tabonelikbaslatmaform }

procedure Tabonelikbaslatmaform.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure Tabonelikbaslatmaform.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Tabonelikbaslatmaform.BitBtn2Click(Sender: TObject);
begin
  ZTable1.FieldByName('baslangictarihi').AsDateTime:=DateEdit1.Date;
  ZTable1.Post;
  ShowMessage('Abonelik kayıt edilmiştir.');
  ZTable1.Insert;
end;

procedure Tabonelikbaslatmaform.Edit1KeyPress(Sender: TObject; var Key: char);
begin

  if Key=#13 then
  begin

    //Filtre yok
    if RadioGroup1.ItemIndex=0 then
      begin
      ZReadOnlyQuery2.Close;
      ZReadOnlyQuery2.SQL.Text:='select * from corecustomers LIMIT 0,100;';
      ZReadOnlyQuery2.Open;
      end;

    //Adına göre
    if RadioGroup1.ItemIndex=1 then
      begin
      ZReadOnlyQuery2.Close;
      ZReadOnlyQuery2.SQL.Text:='select * from corecustomers where adi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZReadOnlyQuery2.Open;
      end;

    //Soyadına göre
    if RadioGroup1.ItemIndex=2 then
      begin
      ZReadOnlyQuery2.Close;
      ZReadOnlyQuery2.SQL.Text:='select * from corecustomers where soyadi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZReadOnlyQuery2.Open;
      end;

    //Ünvana göre
    if RadioGroup1.ItemIndex=3 then
      begin
      ZReadOnlyQuery2.Close;
      ZReadOnlyQuery2.SQL.Text:='select * from corecustomers where unvani like "%'+Edit1.Text+'%" LIMIT 0,100';
      ZReadOnlyQuery2.Open;
      end;

    //T.C. Kimlik
    if RadioGroup1.ItemIndex=4 then
      begin
      ZReadOnlyQuery2.Close;
      ZReadOnlyQuery2.SQL.Text:='select * from corecustomers where tcno like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZReadOnlyQuery2.Open;
      end;

    //Vergi no
    if RadioGroup1.ItemIndex=5 then
      begin
      ZReadOnlyQuery2.Close;
      ZReadOnlyQuery2.SQL.Text:='select * from corecustomers where verginumarasi like "%'+Edit1.Text+'%" LIMIT 0,100 ';
      ZReadOnlyQuery2.Open;
      end;

  end;

end;

procedure Tabonelikbaslatmaform.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  ZTable1.Cancel;
end;

procedure Tabonelikbaslatmaform.FormShow(Sender: TObject);
begin

  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
  ZReadOnlyQuery2.Active:=True;
  ZReadOnlyQuery3.Active:=True;

  ZTable1.Insert;
end;

procedure Tabonelikbaslatmaform.ZTable1BeforePost(DataSet: TDataSet);
begin
  ZTable1.FieldByName('baslatankullanici').AsString:=corekullaniciadi;
  ZTable1.FieldByName('tarifeid').AsInteger:=ZReadOnlyQuery3.FieldByName('id').AsInteger;
  ZTable1.FieldByName('carihesapid').AsInteger:=ZReadOnlyQuery2.FieldByName('id').AsInteger;
end;

initialization
  {$I abonelikbaslatma.lrs}

end.

