create or alter procedure updClientTypeBySessCount
as
drop table if exists #tt_sessFiltred;
select [SessionId]
      ,[userId]
      ,[clientType]
      ,[sessionType]
      ,[Status]
      ,[clientComputer]
into #tt_sessFiltred
		from axp.SysClientSessions s
	join axp.UserInfo u on u.id = s.userId
	where
	s.[Status] IN (1, 2, 3)
	and s.userId <> 'wfsys'
	and s.clientType = 0

declare @sessCount bigint = (select COUNT(*) from #tt_sessFiltred);

update m
set clientType = 3
from
	axp.SysClientSessions m
	join #tt_sessFiltred sf on sf.SessionId = m.SessionId
where  @sessCount >= 70
	and m.[Status] = 1
	and m.clientComputer NOT LIKE 'SRV-TRM%'
go