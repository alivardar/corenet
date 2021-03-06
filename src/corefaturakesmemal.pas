unit corefaturakesmemal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, DBGrids, ExtCtrls, DbCtrls, EditBtn, LR_DBSet,
  LR_Class, rxcurredit, rxdbgrid, rxmemds, ZConnection, ZDataset, functionconfig;

type

  { Tfaturakesmemal }

  Tfaturakesmemal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckGroup1: TCheckGroup;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource4: TDatasource;
    DateEdit1: TDateEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioGroup1: TRadioGroup;
    RxDBGrid1: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1adet: TLongintField;
    RxMemoryData1fiyat: TCurrencyField;
    RxMemoryData1stokadi: TStringField;
    RxMemoryData1stokid: TLongintField;
    RxMemoryData1toplam: TCurrencyField;
    RxMemoryData2: TRxMemoryData;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ZReadOnlyQuery2: TZReadOnlyQuery;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure RxMemoryData1AfterPost(DataSet: TDataSet);
    procedure RxMemoryData1BeforePost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  faturakesmemal: Tfaturakesmemal;

implementation

{ Tfaturakesmemal }

procedure Tfaturakesmemal.Edit1Click(Sender: TObject);
begin
   Edit1.Text:='';
end;

procedure Tfaturakesmemal.BitBtn1Click(Sender: TObject);
var
kdvtoplam, oivtoplam, toplam, geneltoplam : Currency;
aciklama : String;

begin

if Edit2.Text='' then begin Showmessage('Fatura no alanı boş olmaz!'); exit; end;

//kdv okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT tutar FROM corefaturalar where turu="kdv" and faturano='+Edit2.Text;
ZReadOnlyQuery1.Active:=True;

kdvtoplam:=ZReadOnlyQuery1.FieldByName('tutar').AsCurrency;

//oiv okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT tutar FROM corefaturalar where turu="oiv" and faturano='+Edit2.Text;
ZReadOnlyQuery1.Active:=True;

oivtoplam:=ZReadOnlyQuery1.FieldByName('tutar').AsCurrency;

//toplam bulunacak okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT sum(tutar* adet)as "toplam" FROM corefaturalar where turu="emtia" and faturano='+Edit2.Text;
ZReadOnlyQuery1.Active:=True;

toplam:=ZReadOnlyQuery1.FieldByName('toplam').AsCurrency;

//genel toplam bulunacak
geneltoplam:=toplam+kdvtoplam+oivtoplam;

//aciklama bilgiisi okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT aciklama FROM corefaturalar where turu="fatura" and faturano='+Edit2.Text;
ZReadOnlyQuery1.Active:=True;

aciklama:=ZReadOnlyQuery1.FieldByName('aciklama').AsString;

//okunan veriler memory tblosuna yazılacak
RxMemoryData2.Active:=True;
RxMemoryData2.Insert;
RxMemoryData2.FieldByName('kdvtoplam').AsCurrency:=kdvtoplam;
RxMemoryData2.FieldByName('oivtoplam').AsCurrency:=oivtoplam;
RxMemoryData2.FieldByName('toplam').AsCurrency:=toplam;
RxMemoryData2.FieldByName('geneltoplam').AsCurrency:=geneltoplam;
RxMemoryData2.FieldByName('yaziyla').AsString:=parayiyaziya(geneltoplam);
RxMemoryData2.FieldByName('aciklama').AsString:=aciklama;
RxMemoryData2.Post;

//ana fatura dökümü çekilecek
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT corecustomers.adi, corecustomers.soyadi, corecustomers.unvani, corecustomers.adres, '+
' corecustomers.vergidairesi, corecustomers.verginumarasi, corefaturalar.tarih, corefaturalar.hizmetid, corefaturalar.adet, '+
' corefaturalar.tutar, corefaturalar.aciklama, corefaturalar.faturano, corestokkart.urunadi FROM corefaturalar, '+
' corecustomers, corestokkart where corecustomers.id=corefaturalar.carihesapid  and corefaturalar.turu="emtia" and '+
' corestokkart.id=corefaturalar.stokid and  corefaturalar.faturano='+Edit2.Text;
ZReadOnlyQuery1.Active:=True;

//inputbox('','',ZReadOnlyQuery1.SQL.Text);

//rapor çalıştırılacak
frReport1.LoadFromFile(calismadizini+'/reports/faturaemtia.lrf');
frReport1.PrepareReport;
frReport1.ShowReport;

end;

procedure Tfaturakesmemal.BitBtn3Click(Sender: TObject);
begin

//Kayıt öncesi kontrol
if Edit2.Text='' then begin Showmessage('Fatura no alanı boş olmaz!'); exit; end;
if DateEdit1.Text='' then begin Showmessage('Tarih alanı boş olmaz!'); exit; end;

  //Fatura kayıt edilecek
    RxMemoryData1.First;
    while not RxMemoryData1.EOF do
    begin
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Text:='insert into corefaturalar '+
    ' (tarih, carihesapid, faturano, stokid, adet, tutar, turu) '+
    ' values ("'+ SQLTarih(DateEdit1.Date) +'", '+
    IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger)+', '+
    Edit2.Text+',  '+ IntToStr(RxMemoryData1.FieldByName('stokid').AsInteger)+', '+
    IntToStr(RxMemoryData1.FieldByName('adet').AsInteger)+', '+
    CurrToStr(RxMemoryData1.FieldByName('fiyat').AsCurrency)+', "emtia");';
        try
        ZQuery1.ExecSQL;
        except
        on E : Exception do
           begin
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
           ShowMessage('Fatura Bilgleri yazılamadı!!!');
           Exit;
           end;
        end;
    //Showmessage(ZQuery1.SQL.Text);
    RxMemoryData1.Next;
    end;

    //kdv tıklı mı?
    if CheckGroup1.Checked[0] then
    begin
    //faturanın kdv si yazılacak
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Text:='insert into corefaturalar '+
    ' (tarih, carihesapid, faturano, tutar, turu) '+
    ' values ("'+ SQLTarih(DateEdit1.Date)  +'", '+
    IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger)+', '+
    Edit2.Text +', '+ CurrToStr(CurrencyEdit3.Value)+', "kdv");';
        try
        ZQuery1.ExecSQL;
        except
        on E : Exception do
           begin
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
           ShowMessage('Fatura KDV degeri yazılamadı!!!');
           Exit;
           end;
        end;
    //inputbox('','',ZQuery1.SQL.Text);
    end;


    //oiv tıklı mı?
    if CheckGroup1.Checked[1] then
    begin
    //faturanın oiv si yazılacak
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Text:='insert into corefaturalar '+
    ' (tarih, carihesapid, faturano, tutar, turu) '+
    ' values ( "'+ SQLTarih(DateEdit1.Date) +'", '+
    IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger)+', '+
    Edit2.Text +', '+ CurrToStr(CurrencyEdit1.Value)+', "oiv");';
        try
        ZQuery1.ExecSQL;
        except
        on E : Exception do
           begin
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
           ShowMessage('Fatura KDV degeri yazılamadı!!!');
           Exit;
           end;
        end;
    //Showmessage(ZQuery1.SQL.Text);
    end;


//Toplam fatura değeri /fatura/ adıyla kayıt edilecek ve açıklama alanı yazılacak
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Text:='insert into corefaturalar '+
    ' (tarih, carihesapid, faturano, tutar, aciklama, turu) '+
    ' values ( "'+ SQLTarih(DateEdit1.Date) +'", '+
    IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger)+', '+
    Edit2.Text +', '+ CurrToStr(CurrencyEdit4.Value)+ ', "'+ Edit3.Text +'", "fatura");';
        try
        ZQuery1.ExecSQL;
        except
        on E : Exception do
           begin
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
           ShowMessage('Fatura KDV degeri yazılamadı!!!');
           Exit;
           end;
        end;

//cari hesabın borcuna toplam deger işlenecek
//cari hesabın borcuna toplam deger işlenecek
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Text:='insert into corecarihareket '+
    ' (carihesapid, faturano, tarih, hareketturu, borcalacak, tutar) '+
    ' values ( '+IntToStr(ZReadOnlyQuery2.FieldByName('id').AsInteger)+ ', '+Edit2.Text +
    ', "'+ SQLTarih(DateEdit1.Date) +'", "Fatura" , "borc", '+
     CurrToStr(CurrencyEdit4.Value)+' );';
        try
        ZQuery1.ExecSQL;
        except
        on E : Exception do
           begin
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
           ShowMessage('Fatura Cari Hesaba Geçirilemedi!');
           //inputbox('','',ZQuery1.SQL.Text);
           Exit;
           end;
        end;



ShowMessage('Fatura kayıt edilmiştir');

end;

procedure Tfaturakesmemal.Edit1KeyPress(Sender: TObject; var Key: char);
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

procedure Tfaturakesmemal.FormShow(Sender: TObject);
begin

//SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZReadOnlyQuery2.Active:=True;
  ZTable1.Active:=True;

  //kdv alanı aktif edildi
  CheckGroup1.Checked[0]:=True;
  //öiv alanı aktif edildi
  CheckGroup1.Checked[1]:=True;

  RxMemoryData1.insert;
end;




procedure Tfaturakesmemal.RxMemoryData1AfterPost(DataSet: TDataSet);
var
kdv, oiv, geneltoplam :Currency;
begin

//Veri girişi yapıldıktan sonra

//KDV varmı  varsa hesapla ve ilgili alana yaz
kdv:=0;
if CheckGroup1.Checked[0] then
begin
  RxMemoryData1.First;
  while not RxMemoryData1.EOF do
    begin
    //vergi oranı vergiler tablosundan alınacak
    kdv:=kdv + (RxMemoryData1.FieldByName('toplam').AsCurrency*kdvyuzdesi/100);
    RxMemoryData1.Next;
    end;
end;
CurrencyEdit3.Value:=kdv;

//öiv varmı varsa hesapla ilgili alana yaz
oiv:=0;
if CheckGroup1.Checked[1] then
begin
  RxMemoryData1.First;
  while not RxMemoryData1.EOF do
    begin
    //vergi oranı vergiler tablosundan alınacak
    oiv:=oiv + (RxMemoryData1.FieldByName('toplam').AsCurrency*oivyuzdesi/100);
    RxMemoryData1.Next;
    end;
end;
CurrencyEdit1.Value:= oiv;

//genel toplamı
  RxMemoryData1.First;
  geneltoplam:=0;
  while not RxMemoryData1.EOF do
    begin
    //vergi oranı vergiler tablosundan alınacak
    geneltoplam:=geneltoplam + RxMemoryData1.FieldByName('toplam').AsCurrency;
    RxMemoryData1.Next;
    end;
  CurrencyEdit2.Value:= geneltoplam;


//fatura toplamı
//Geneltoplam+kdv+oiv
CurrencyEdit4.Value:=CurrencyEdit1.Value+CurrencyEdit2.Value+CurrencyEdit3.Value;

end;

procedure Tfaturakesmemal.RxMemoryData1BeforePost(DataSet: TDataSet);
begin
  RxMemoryData1.FieldByName('stokid').AsInteger := ZTable1.FieldByName('id').AsInteger;
  RxMemoryData1.FieldByName('toplam').AsCurrency :=  RxMemoryData1.FieldByName('adet').AsInteger *  RxMemoryData1.FieldByName('fiyat').AsCurrency;
end;

initialization
  {$I corefaturakesmemal.lrs}

end.

