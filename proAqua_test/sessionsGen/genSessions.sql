--select distinct clientComputer from axp.SysClientSessionsSource m
set nocount on;
declare
	@count int = 240000
while @count > 0
begin
	insert into axp.SysClientSessions(SessionId, userId, clientType, sessionType, [Status], clientComputer)
	exec axp.newSession
	set @count = @count - 1;
end;
--select count(*) from axp.SysClientSessions