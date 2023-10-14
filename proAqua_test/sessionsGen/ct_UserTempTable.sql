create or alter procedure User4SessGen
as
begin
	select
		ui.id
	into #tt_usif_other_user
	from
	axp.UserInfo ui
	union
	select id
	from
	(values
	(cast('popov_pv' as varchar(50))),
	(cast('dukareva_ni' as varchar(50))),
	(cast('wfsys' as varchar(50)))
	) as otherUser (id);

	insert into
	#tt_usif_numb (id, user_num)
	select
		ou.id,
		row_number() over(order by ou.id) user_num
	from
	#tt_usif_other_user ou;

	drop table #tt_usif_other_user
end;