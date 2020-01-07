unit coretekfaturakesunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, Buttons, StdCtrls, DBGrids, ExtCtrls, EditBtn, ZConnection, ZDataset,
  LR_Class, LR_DBSet, LR_PGrid, LR_Desgn, PrintersDlgs, functionconfig;

type

  { Tfaturatektarifeyegore }

  Tfaturatektarifeyegore = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ZReadOnlyQuery2: TZReadOnlyQuery;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  faturatektarifeyegore: Tfaturatektarifeyegore;

implementation

{ Tfaturatektarifeyegore }

procedure Tfaturatektarifeyegore.BitBtn1Click(Sender: TObject);
begin

//ShowMessage(calismadizini);

frReport1.LoadFromFile(calismadizini+'/reports/fatura.lrf');
frReport1.PrepareReport;
frReport1.ShowReport;


end;

procedure Tfaturatektarifeyegore.BitBtn2Click(Sender: TObject);
begin
   self.Free;
end;

procedure Tfaturatektarifeyegore.Edit1Click(Sender: TObject);
begin
    Edit1.Text:='';
end;

procedure Tfaturatektarifeyegore.Edit1KeyPress(Sender: TObject; var Key: char);
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


procedure Tfaturatektarifeyegore.frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
begin

end;


initialization
  {$I coretekfaturakesunit.lrs}

end.

