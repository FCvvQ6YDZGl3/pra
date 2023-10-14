use solving_test;

insert into axp.UserInfo
SELECT distinct [userId] , [userId] as [name]
  FROM [axp].[SysClientSessionsSource]