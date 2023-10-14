drop table if exists axp.SysClientSessions;
create table axp.SysClientSessions
(
	SessionId bigint not null,
	userId varchar(50) not null,
	clientType tinyint not null,
	sessionType tinyint not null,
	[Status] tinyint not null,
	clientComputer varchar(50) not null
)
go