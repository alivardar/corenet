unit coreabout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, eventlog, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, Buttons, functionconfig;

type

  { Tabout }

  Tabout = class(TForm)
    BitBtn1: TBitBtn;
    EventLog1: TEventLog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Panel1: TPanel;


    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  about: Tabout;

implementation

{ Tabout }





procedure Tabout.BitBtn1Click(Sender: TObject);
begin
   Self.Close;
end;

procedure Tabout.FormShow(Sender: TObject);
Begin
    //Label3.Caption:='Build number : '+RxVersionInfo1.ProductVersion+' '+RxVersionInfo1.SpecialBuild;
end;

procedure Tabout.Image1Click(Sender: TObject);
begin

end;






initialization
  {$I coreabout.lrs}

end.

