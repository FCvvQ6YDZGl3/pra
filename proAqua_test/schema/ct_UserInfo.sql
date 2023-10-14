drop table if exists axp.UserInfo
create table axp.UserInfo
(
	id varchar(50) not null,
	[name] varchar(100) not null
	constraint pr_usif_id primary key (id)
	constraint ch_usif_id check (LEN(REPLACE([name],' ','') )> 0),
	constraint ch_usif_name check (LEN([name])> 0)
)