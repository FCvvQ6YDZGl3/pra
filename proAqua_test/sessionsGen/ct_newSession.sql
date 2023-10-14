create or alter procedure axp.newSession
as
begin
	declare
		@mx_number bigint,
		@num bigint,
		@userId varchar(50),
		@ssId bigint,
		@clientType tinyint,
		@sessionType tinyint,
		@status tinyint,
		@clientComputer varchar(50);

	drop table if exists #tt_usif_numb;
	create table #tt_usif_numb
	(
		id varchar(50),
		user_num int
	);


set @mx_number = dbo.getRandIntUp(9)
drop table if exists #tt_clcp_numb
select *
into #tt_clcp_numb
from
	(values
('SRV-TRM-TST', 1),
('SRV-WIN2012', 2),
('SRV-WIN2012R2', 3),
('SRV-WIN2019-01', 4),
('SRV-WIN2019-02', 5),
('SRV-WIN2019-03', 6),
('CL-ANDR-001', 7),
('CL-ANDR-002', 8),
('CL-ANDR-003', 9)) as clcp (clientComputer, num)
set @clientComputer = (select clientComputer from #tt_clcp_numb c where c.num = @mx_number)
	

	exec User4SessGen;

	set @mx_number = (select max(user_num) from #tt_usif_numb);

	set @num = dbo.getRandIntUp(@mx_number);

	set @ssId = next value for axp.SessionId;
	set @userId = (select id
	from #tt_usif_numb u
	where
	u.user_num = 
	@num);
	set @clientType = dbo.getRandIntUp(4) - 1;
	set @sessionType = dbo.getRandIntUp(4) - 1;
	set @status = dbo.getRandIntUp(12);

	select
	@ssId SessionId,
	@userId userId,
	@clientType clientType,
	@sessionType sessionType,
	@status [Status],
	@clientComputer clientComputer
end;
go