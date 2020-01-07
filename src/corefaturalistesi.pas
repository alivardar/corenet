unit corefaturalistesi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, Buttons, StdCtrls, ExtCtrls, LR_Class, LR_DBSet,
  ZConnection, ZDataset, rxmemds, functionconfig;

type

  { Tfaturalistesi }

  Tfaturalistesi = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    RadioGroup1: TRadioGroup;
    RxMemoryData2: TRxMemoryData;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZQuery2: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
  faturalistesi: Tfaturalistesi;

implementation

{ Tfaturalistesi }

procedure Tfaturalistesi.Edit1Click(Sender: TObject);
begin
     Edit1.Text:='';
end;

procedure Tfaturalistesi.BitBtn4Click(Sender: TObject);
var
buttonSelected : Integer;
begin

buttonSelected := MessageDlg('Seçili olan faturayı silmek istiyormusunuz',mtWarning, [mbYes,mbNo], 0);

  // Show the button type selected
  if buttonSelected = mrYes then
      begin

      //carihareket tablsoundan hareket silinecek
      try
      ZQuery2.SQL.Text:='delete from corecarihareket where faturano='+IntToStr(ZQuery1.FieldByName('faturano').AsInteger);
      ZQuery2.Close;
      ZQuery2.ExecSQL;
      except
            begin
            ShowMessage('Carihareket tablsundan silinemedi.');
            Exit;
            end;
      end;

      //öncelikle seçili olan faturano ile ilgil olan kayıtlar silinecek
      try
      ZQuery2.SQL.Text:='delete from corefaturalar where faturano='+IntToStr(ZQuery1.FieldByName('faturano').AsInteger);
      ZQuery2.Close;
      ZQuery2.ExecSQL;
      except
            begin
            ShowMessage('Faturalar tablsoundan silinemedi');
            Exit;
            end;
      end;


      //tablo eski haline geri getiriliyor
      try
      ZQuery1.Close;
      ZQuery1.SQL.Text:='SELECT corefaturalar.id, corefaturalar.tarih, corefaturalar.carihesapid, corefaturalar.faturano, '+
      ' corefaturalar.tutar, corefaturalar.turu, corecustomers.adi, corecustomers.soyadi, corecustomers.unvani FROM '+
      ' corefaturalar, corecustomers  where  corefaturalar.turu="fatura" and '+
      ' corecustomers.id=corefaturalar.carihesapid limit 0,100';
      ZQuery1.Open;
      except
            begin
            ShowMessage('Tablo eski haline getirilemedi.');
            Exit;
            end;
      end;


      end;


end;



procedure Tfaturalistesi.BitBtn2Click(Sender: TObject);
var
kdvtoplam, oivtoplam, toplam, geneltoplam : Currency;

begin

//kdv okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT tutar FROM corefaturalar where turu="kdv" and faturano='+ IntToStr(ZQuery1.FieldByName('faturano').AsInteger);
ZReadOnlyQuery1.Active:=True;

kdvtoplam:=ZReadOnlyQuery1.FieldByName('tutar').AsCurrency;

//oiv okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT tutar FROM corefaturalar where turu="oiv" and faturano='+ IntToStr(ZQuery1.FieldByName('faturano').AsInteger);
ZReadOnlyQuery1.Active:=True;

oivtoplam:=ZReadOnlyQuery1.FieldByName('tutar').AsCurrency;

//toplam bulunacak okunacak
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT sum(tutar* adet)as "toplam" FROM corefaturalar where (turu="hizmet" or turu="emtia") and faturano='+IntToStr(ZQuery1.FieldByName('faturano').AsInteger);
ZReadOnlyQuery1.Active:=True;

toplam:=ZReadOnlyQuery1.FieldByName('toplam').AsCurrency;

//genel toplam bulunacak
geneltoplam:=toplam+kdvtoplam+oivtoplam;

//okunan veriler memory tblosuna yazılacak
RxMemoryData2.Active:=True;
RxMemoryData2.Insert;
RxMemoryData2.FieldByName('kdvtoplam').AsCurrency:=kdvtoplam;
RxMemoryData2.FieldByName('oivtoplam').AsCurrency:=oivtoplam;
RxMemoryData2.FieldByName('toplam').AsCurrency:=toplam;
RxMemoryData2.FieldByName('geneltoplam').AsCurrency:=geneltoplam;
RxMemoryData2.FieldByName('yaziyla').AsString:=parayiyaziya(geneltoplam);
RxMemoryData2.Post;

//ana fatura dökümü çekilecek
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Text:='SELECT corecustomers.adi, corecustomers.soyadi, corecustomers.unvani, corecustomers.adres, '+
' corecustomers.vergidairesi, corecustomers.verginumarasi, corefaturalar.tarih, corefaturalar.hizmetid, corefaturalar.adet, '+
' corefaturalar.tutar, corefaturalar.aciklama, corefaturalar.faturano, corehizmetturleri.hizmetadi FROM corefaturalar, '+
' corecustomers, corehizmetturleri where corecustomers.id=corefaturalar.carihesapid  and (corefaturalar.turu="hizmet" or corefaturalar.turu="hizmet") and '+
' corehizmetturleri.id=corefaturalar.hizmetid and  corefaturalar.faturano='+IntToStr(ZQuery1.FieldByName('faturano').AsInteger);
ZReadOnlyQuery1.Active:=True;

//InputBox('','',ZReadOnlyQuery1.SQL.Text);

//rapor çalıştırılacak
frReport1.LoadFromFile(calismadizini+'/reports/faturageneldokum.lrf');
frReport1.PrepareReport;
frReport1.ShowReport;

end;

procedure Tfaturalistesi.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;


procedure Tfaturalistesi.Edit1KeyPress(Sender: TObject; var Key: char);
begin

  if Key=#13 then
  begin

    //Filtre yok
    if RadioGroup1.ItemIndex=0 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='SELECT corefaturalar.id, corefaturalar.tarih, corefaturalar.carihesapid, corefaturalar.faturano, '+
      ' corefaturalar.tutar, corefaturalar.turu, corecustomers.adi, corecustomers.soyadi, corecustomers.unvani FROM '+
      ' corefaturalar, corecustomers  where  corefaturalar.turu="fatura" and '+
      ' corecustomers.id=corefaturalar.carihesapid limit 0,100';
      ZQuery1.Open;
      end;

    //Fatura noya göre
    if RadioGroup1.ItemIndex=1 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='SELECT corefaturalar.id, corefaturalar.tarih, corefaturalar.carihesapid, corefaturalar.faturano, '+
      ' corefaturalar.tutar, corefaturalar.turu, corecustomers.adi, corecustomers.soyadi, corecustomers.unvani FROM '+
      ' corefaturalar, corecustomers  where  corefaturalar.turu="fatura" and '+
      ' corecustomers.id=corefaturalar.carihesapid and corefaturalar.faturano='+Edit1.Text+' limit 0,100';
      ZQuery1.Open;
      end;

    //Tarihe göre
    if RadioGroup1.ItemIndex=2 then
      begin
      ZQuery1.Close;
      ZQuery1.SQL.Text:='SELECT corefaturalar.id, corefaturalar.tarih, corefaturalar.carihesapid, corefaturalar.faturano, '+
      ' corefaturalar.tutar, corefaturalar.turu, corecustomers.adi, corecustomers.soyadi, corecustomers.unvani FROM '+
      ' corefaturalar, corecustomers  where  corefaturalar.turu="fatura" and '+
      ' corecustomers.id=corefaturalar.carihesapid and corefaturalar.tarih="'+Edit1.Text+'" limit 0,100';
      ZQuery1.Open;
      end;



  end;

end;

procedure Tfaturalistesi.FormShow(Sender: TObject);
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
  {$I corefaturalistesi.lrs}

end.

