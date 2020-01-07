unit coreerisimradiusayarlari;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, Buttons, StdCtrls, DBGrids, ExtCtrls, Spin, ZConnection,
  ZDataset, functionconfig, rxmemds;

type

  { Terisimradiusayarlari }

  Terisimradiusayarlari = class(TForm)
    Bevel1: TBevel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource4: TDatasource;
    Datasource5: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBLookupComboBox2: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    dummytable: TRxMemoryData;
    SpinEdit1: TSpinEdit;
    ZConnection1: TZConnection;
    ZConnection2: TZConnection;
    ZQuery1: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ZReadOnlyQuery2: TZReadOnlyQuery;
    ZTable4: TZTable;

    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);



  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  erisimradiusayarlari: Terisimradiusayarlari;

implementation

{ Terisimradiusayarlari }



procedure Terisimradiusayarlari.BitBtn4Click(Sender: TObject);
begin
  Self.Free;
end;



procedure Terisimradiusayarlari.BitBtn5Click(Sender: TObject);
var
uploadlimit, downloadlimit : String;
begin

//------------------------------------------------------
//Kullanıcının tarife bilgileri öğrenilecek
ZQuery1.Active:=False;
//ilk olarak ana veritabanı ayarlı olacak
ZQuery1.Connection:=ZConnection1;
//mysql üstüne açılanların bir bilgisi yazılacak
ZQuery1.SQL.Clear;
ZQuery1.SQL.Text:='select uploadlimit, downloadlimit from coretarife where id='+
                                                     inttostr(ZReadOnlyQuery1.FieldByName('tarifeid').AsInteger);

try
 ZQuery1.Active:=True;
 uploadlimit:=ZQuery1.FieldByName('uploadlimit').AsString;
 downloadlimit:=ZQuery1.FieldByName('downloadlimit').AsString;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Kullanıcıya ait tarife verileri alınamadı!!!');
      Exit;
      end;
end;

//------------------------------------------------------

//Kullanıcnın bilgileri radiususers tablosu içine eklencek

ZQuery1.Active:=False;
//ilk olarak ana veritabanı ayarlı olacak
ZQuery1.Connection:=ZConnection1;
//mysql üstüne açılanların bir bilgisi yazılacak
ZQuery1.SQL.Clear;
ZQuery1.SQL.Text:='insert into coreradiususers '+
'(musteriid, username, password, tarifeid, radiusserverid, tarih, islemkullaniciadi, islemkullaniciid) '+
' values ( "'+inttostr(ZReadOnlyQuery2.FieldByName('id').AsInteger)+'","'+ Edit2.Text+'", "'+ Edit3.Text+ '", '+
inttostr(ZReadOnlyQuery1.FieldByName('tarifeid').AsInteger)+ ', '+
IntToStr(dummytable.FieldByName('id').AsInteger)+', now(), "'+corekullaniciadi+'", 1  )';

try
 ZQuery1.ExecSQL;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Aynı kullanıcı adı mevcut veya yazma hatası oluştu!!!');
      Exit;
      end;
end;

//------------------------------------------------------

//radius sunucu bilgileri veritabanınndan alınacak
try
ZQuery1.Active:=False;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Text:='select * from coreradiusservers where id='+ IntToStr(dummytable.FieldByName('id').AsInteger) ;
ZQuery1.Active:=True;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Radius MySQL verisi okunamadı. Oluşturulan kullanıcıyı siliniz!!!');
      Exit;
      end;
end;

//--------------------------------------------------------------------------------

//Alınan bilgiler ile zconnection2 yapılandırılacak
try
ZConnection2.HostName:= ZQuery1.FieldByName('mysqlserver').AsString;
ZConnection2.User:= ZQuery1.FieldByName('mysqlusername').AsString;
ZConnection2.Password:= ZQuery1.FieldByName('mysqlpassword').AsString;
ZConnection2.Database:= ZQuery1.FieldByName('mysqldbname').AsString;
ZConnection2.Connected:=True;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Radius MySQL hatası oluştu. Oluşturulan kullanıcıyı siliniz!!!');
      Exit;
      end;
end;

//--------------------------------------------------------------------------------

//Connection2 ayarları radiusserverid okunarak değiştirilecek ona göre yeni bağlantı yapılacak
//radiusun bağlı olduğu mysql içine yazılacak
try
ZQuery1.Connection:=ZConnection2;
ZQuery1.SQL.Clear;
//Kullanıcı erişim bilgileri ekleniyor
ZQuery1.SQL.Add('insert into radcheck (username, attribute, op, value) values ("'+Edit2.Text+
'","User-Password",":=","'+Edit3.Text+'");');

//tarife bilgilerine göre ekleme yapılacak
//ZQuery1.SQL.Add('insert into radcheck (username, attribute, op, value) values ("username","attr","op","value");');
// ShowMessage(ZQuery1.SQL.Text);
 ZQuery1.ExecSQL;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Radius MySQL hatası oluştu. Oluşturulan kullanıcıyı siliniz!!!');
      inputbox('','',ZQuery1.SQL.Text);
      Exit;
      end;
end;

//--------------------------------------------------------------------------------

//Kullanıcı simultaneous-use eklenecek

try
ZQuery1.Connection:=ZConnection2;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('insert into radcheck (username, attribute, op, value) values ("'+Edit2.Text+
'","Simultaneous-Use",":=","'+IntToStr(SpinEdit1.Value)+'");');
 ZQuery1.ExecSQL;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Simultane miktarı girilemedi!!!');
      inputbox('','',ZQuery1.SQL.Text);
      Exit;
      end;
end;

//--------------------------------------------------------------------------------

//Kullanıcı upload limit radreply icine eklenecek mikrotik için

try
ZQuery1.Connection:=ZConnection2;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('insert into radreply (username, attribute, op, value) values ("'+Edit2.Text+
'","Mikrotik-Rate-Limit",":=","'+ uploadlimit +'/'+ downloadlimit +'");');
 ZQuery1.ExecSQL;
except
on E : Exception do
      begin
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      ShowMessage('Upload limit miktarı girilemedi!!!');
      inputbox('','',ZQuery1.SQL.Text);
      Exit;
      end;
end;
//-----------------------------------------------------------------------------


ZQuery1.Active:=False;
ZQuery1.SQL.Clear;

ShowMessage('Kullanıcı başarıyla oluşturulmuştur!');

end;



procedure Terisimradiusayarlari.DBGrid1CellClick(Column: TColumn);
begin
  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='select coreaboneler.id, coreaboneler.carihesapid, coreaboneler.tarifeid, '+
  ' coretarife.tarifeadi, coretarife.aciklama from '+
  ' coreaboneler, coretarife where coreaboneler.tarifeid=coretarife.id  and coreaboneler.carihesapid='+
  IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger);
  ZReadOnlyQuery1.Active:=True;
end;

procedure Terisimradiusayarlari.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure Terisimradiusayarlari.Edit1KeyPress(Sender: TObject; var Key: char);
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

procedure Terisimradiusayarlari.FormCreate(Sender: TObject);
begin

end;

procedure Terisimradiusayarlari.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZReadOnlyQuery2.Active:=True;
  ZReadOnlyQuery1.Active:=True;
  ZTable4.Active:=True;

end;






initialization
  {$I coreerisimradiusayarlari.lrs}

end.

