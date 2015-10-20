program AProject;

uses
  ExceptionLog,
  Forms,
  Sender in 'Sender.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.Title := 'AProject';
  Application.Run;
  SendAlt24B6;
end.

