use solving_test;

insert into axp.UserInfo
select distinct [userId] , [userId] as [name]
  FROM [axp].[SysClientSessionsSource]