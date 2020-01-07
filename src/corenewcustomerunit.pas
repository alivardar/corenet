unit corenewcustomerunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, ExtCtrls, ZConnection, ZDataset,functionconfig;

type

  { Tyenimusteri }

  Tyenimusteri = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DBComboBox1: TDBComboBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  yenimusteri: Tyenimusteri;

implementation

{ Tyenimusteri }

uses mainform;



procedure Tyenimusteri.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure Tyenimusteri.FormCreate(Sender: TObject);
begin
  ZTable1.Active:=True;
  ZTable1.Insert;
end;




initialization
  {$I corenewcustomerunit.lrs}

end.

