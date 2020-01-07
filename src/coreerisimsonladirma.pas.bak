unit coreerisimsonladirma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls, ExtCtrls, DBGrids, Buttons, ZConnection,
  ZDataset, functionconfig;

type

  { Terisimsonladirma }

  Terisimsonladirma = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZConnection2: TZConnection;
    ZQuery1: TZQuery;
    ZQuery2: TZQuery;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  erisimsonladirma: Terisimsonladirma;

implementation

{ Terisimsonladirma }

procedure Terisimsonladirma.Edit1Click(Sender: TObject);
begin
    Edit1.Text:='';
end;

procedure Terisimsonladirma.BitBtn1Click(Sender: TObject);
begin
  //Müşteri adına oluşturulmuş olan radius bilgileri coreradiusdan ve radius
  //sunucu üzerinden silinecek

  if MessageDlg('Kullanıcının erişimini silmek istediğinize emin misiniz?', mtConfirmation, mbOKCancel, 0)=mrOK then
     begin

     ZQuery2.Connection:=ZConnection1;

//--------------------------------------------------------------------------------------------------

      //radius sunucu bilgileri veritabanınndan alınacak
      try
      ZQuery2.Active:=False;
      ZQuery2.SQL.Clear;
      ZQuery2.SQL.Text:='select * from coreradiusservers where id='+ IntToStr(ZTable1.FieldByName('radiusserverid').AsInteger) ;
      ZQuery2.Active:=True;
      except
      on E : Exception do
         begin
         ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
         ShowMessage('Radius sunucu bilgileri alınamadı.');
         Exit;
         end;
      end;

//--------------------------------------------------------------------------------------------------

      //Alınan bilgiler ile zconnection2 yapılandırılacak
      try
      ZConnection2.Connected:=False;
      ZConnection2.HostName:=ZQuery2.FieldByName('mysqlserver').AsString;
      ZConnection2.User:=ZQuery2.FieldByName('mysqlusername').AsString;
      ZConnection2.Password:=ZQuery2.FieldByName('mysqlpassword').AsString;
      ZConnection2.Database:=ZQuery2.FieldByName('mysqldbname').AsString;
      ZConnection2.Connected:=True;
      except
      on E : Exception do
         begin
         ShowMessage(E.ClassName+' Radius Sunucu error raised, with message : '+E.Message);
         ShowMessage('Radius sunucu MySQL bağlantısı sağlanamadı.');
         Exit;
         end;
      end;

//--------------------------------------------------------------------------------------------------

      //radiusun bağlı olduğu mysql içinde o kullanıcı adı tamamen silinecek  radcheck tablosu
      try
      ZQuery2.Connection:=ZConnection2;
      ZQuery2.SQL.Clear;
      ZQuery2.SQL.Add('delete from radcheck where username="'+ ZTable1.FieldByName('username').AsString +'";');
      //InputBox('a','hata', ZQuery2.SQL.Text);
      ZQuery2.ExecSQL;
      except
      on E : Exception do
         begin
         ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
         ShowMessage('Radius sunucu MySQL bağlantısı sağlanamadı.');
         Exit;
         end;
      end;

 //--------------------------------------------------------------------------------------------------

      //radiusun bağlı olduğu mysql içinde o kullanıcı adı tamamen silinecek radreply tablosu
      try
      ZQuery2.Connection:=ZConnection2;
      ZQuery2.SQL.Clear;
      ZQuery2.SQL.Add('delete from radreply where username="'+ ZTable1.FieldByName('username').AsString +'";');
      //InputBox('a','hata', ZQuery2.SQL.Text);
      ZQuery2.ExecSQL;
      except
      on E : Exception do
         begin
         ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
         Exit;
         end;
      end;

//--------------------------------------------------------------------------------------------------

      //corenet database bağlan ve ordaki kullanıcıya ait veriyi sil
      ZTable1.Delete;
      ShowMessage('Kullanıcı bilgileri silinmiştir!');

     end; //if kosulunun sonu

end;

procedure Terisimsonladirma.BitBtn4Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Terisimsonladirma.Edit1KeyPress(Sender: TObject; var Key: char);
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

procedure Terisimsonladirma.FormShow(Sender: TObject);
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
  {$I coreerisimsonladirma.lrs}

end.

