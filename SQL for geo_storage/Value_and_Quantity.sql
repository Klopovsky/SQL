use DZZ;
select  SUM(Pict.Size) as '����� �����', COUNT(Pict.Size) as '���������� ������ ' 
From Pict WHere Pict.ID_Marsh IN (select Marsh.ID from Marsh where Marsh.ID_KA = 7);