unit functionconfig;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const

  versionnumber = ' 1.2beta';

  BIRLER: array[0..9] of string=('', 'Bir', 'iki', 'Üç', 'Dört', 'Beş', 'Altı',
          'Yedi', 'Sekiz', 'Dokuz');
  ONLAR : array[0..9] of string=('', 'On', 'Yirmi', 'Otuz', 'Kırk', 'Elli', 'Altmış',
          'Yetmiş', 'Seksen', 'Doksan');
  DIGER : array[0..5] of string=('', 'Bin', 'Milyon', 'Milyar', 'Trilyon', 'Katrilyon');


  var
  passwordgecerli : boolean;
  corekullaniciadi : string;
  kdvyuzdesi : integer;
  oivyuzdesi : integer;

  //mysql server settings
  mysqlserver: String;
  mysqlusername: String;
  mysqlpassword: String;
  mysqldbname: String;

  function calismadizini:String;
  function parayiyaziya(para: currency):String;
  function SayiyiYaziyaCevir(Sayi: double; Seviye:Integer): String;
  function SQLTarih(tarih:TDateTime):string;

implementation

function SQLTarih(tarih:TDateTime):string;
begin
   result := FormatDateTime('yyyy-mm-dd',tarih);
end;

function calismadizini:String;
var
directory : string;
begin
getdir(2,result);
end;


Function parayiyaziya(para: currency):String;
var
sayi, ondalik :integer;
begin
sayi:=trunc(para);
ondalik:=round(100*Frac(para));
result:=SayiyiYaziyaCevir(sayi,0)+' TürkLirası '+SayiyiYaziyaCevir(ondalik,0)+' Kuruş';
end;


Function SayiyiYaziyaCevir(Sayi: double; Seviye:Integer): String;
var
  SayiStr, Ek, Donen : String;
Const
  UstArr : Array [1..7] of String[20] = ('', 'Bin', 'Milyon', 'Milyar', 'Trilyon', 'Katrilyon', 'Katrilyar');
  YuzArr : Array [1..10] of String[20] = ('', 'Yüz', 'İkiYüz', 'ÜçYüz', 'DörtYüz', 'BeşYüz', 'AltıYüz', 'YediYüz', 'SekizYüz', 'DokuzYüz');
  OnArr  : Array [1..10] of String[20] = ('', 'On', 'Yirmi', 'Otuz', 'Kırk', 'Elli', 'Altmış', 'Yetmiş', 'Sekzen', 'Doksan');
  BirArr : Array [1..10] of String[20] = ('', 'Bir', 'İki', 'Üç', 'Dört', 'Beş', 'Altı', 'Yedi', 'Sekiz', 'Dokuz');
begin
  SayiStr := FloatToStrF(Sayi,ffFixed,18,0);
  SayiStr := StringOfChar('0',3-Length(SayiStr) Mod 3)+SayiStr;
  Donen := YuzArr[StrtoInt(Copy(SayiStr, Length(SayiStr) - (Seviye * 3) - 2, 1)) + 1];
  Donen := Donen + OnArr[StrtoInt(Copy(SayiStr, Length(SayiStr) - (Seviye * 3) - 1, 1)) + 1];
  Donen := Donen + BirArr[StrtoInt(Copy(SayiStr, Length(SayiStr) - (Seviye * 3), 1)) + 1];

  If Donen <> '' Then Ek := UstArr[Seviye+1];
  If (Donen = 'Bir') And (Seviye=1) Then Donen:= ''; //BirBin çevrimini iptal etmek için

  If Seviye * 3 + 3 < Length(SayiStr) Then
    Donen := SayiyiYaziyaCevir(Sayi, Seviye + 1) + Donen; //'Sayinin cevrimi bitmemişse tekrar çağır

  SayiyiYaziyaCevir := Donen + Ek;
End;





end.

