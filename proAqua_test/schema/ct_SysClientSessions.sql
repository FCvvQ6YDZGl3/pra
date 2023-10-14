drop table if exists axp.SysClientSessions;
create table axp.SysClientSessions
(
	SessionId int not null,
	UserId varchar(50) not null
)
go