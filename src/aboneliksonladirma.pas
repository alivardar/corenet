unit aboneliksonladirma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBGrids, ExtCtrls, Buttons, ZDataset,
  ZConnection,functionconfig;

type

  { Taboneliksonlandirmaform }

  Taboneliksonlandirmaform = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZReadOnlyQuery2: TZReadOnlyQuery;
    ZReadOnlyQuery3: TZReadOnlyQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  aboneliksonlandirmaform: Taboneliksonlandirmaform;

implementation

{ Taboneliksonlandirmaform }

procedure Taboneliksonlandirmaform.DBGrid1CellClick(Column: TColumn);
begin
 ZReadOnlyQuery3.Active:=False;
 ZReadOnlyQuery3.Sql.Text:='SELECT coreaboneler.id, coreaboneler.carihesapid, coreaboneler.tarifeid, '+
 ' coreaboneler.baslangictarihi, coreaboneler.sonhesapbitis, coreaboneler.baslatankullanici, '+
 ' coretarife.tarifeadi, coretarife.aciklama, coretarife.fiyat  FROM coreaboneler, coretarife '+
 ' where coreaboneler.tarifeid=coretarife.id and  coreaboneler.carihesapid='+ IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger);
 ZReadOnlyQuery3.Active:=True;
end;

procedure Taboneliksonlandirmaform.BitBtn2Click(Sender: TObject);
var
buttonSelected : Integer;
begin
buttonSelected := MessageDlg('Müşterinin bu hizmete olan üyeliğini silmek istediğinizden emin misiniz?',mtWarning, mbYesNo, 0);

  if buttonSelected = mrYes then
     begin
     try
        ZQuery1.Active:=False;
        ZQuery1.SQL.Text:='delete from coreaboneler where id='+ IntToStr(ZReadOnlyQuery3.FieldByName('id').AsInteger);
        ZQuery1.ExecSQL;
        ZQuery1.Active:=False;
     except
           ShowMessage('Silme işleminde hata oluştu!!!');
     end;

     end;

end;

procedure Taboneliksonlandirmaform.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure Taboneliksonlandirmaform.Edit1KeyPress(Sender: TObject; var Key: char
  );
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

procedure Taboneliksonlandirmaform.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZReadOnlyQuery3.Active:=True;
  ZReadOnlyQuery2.Active:=True;
end;

initialization
  {$I aboneliksonladirma.lrs}

end.

