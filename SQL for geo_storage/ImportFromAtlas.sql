/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
SELECT TOP 1000000 
      [Plg].STAsText()
  FROM [DZZ].[dbo].[Marsh] where ID_KA = 7