program corenet;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainform, rxnew, zcomponent,
  tachartlazaruspkg;

{$IFDEF WINDOWS}{$R corenet.rc}{$ENDIF}


//{$R *.res}

begin

  Application.Title:='CoreNet ISP Automatization Software';

  Application.Initialize;
  Application.CreateForm(Tmainscreen, mainscreen);

  Application.Run;

end.

