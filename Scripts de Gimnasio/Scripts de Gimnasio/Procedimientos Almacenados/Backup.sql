

declare @fecha varchar(18)
declare @path varchar(400)
declare @name varchar(20)
set @fecha = (cast (datepart(day,getdate())as varchar(2))+ 
			'-' +cast (datepart(month,getdate())as varchar(2)) +
			'-' +cast (datepart(year,getdate())as varchar(4)) +
			'_' + cast(datepart(hour,getdate()) as varchar(2)) +
			'-' + cast(datepart (minute,getdate()) as varchar(2)))			
print @fecha
set @path = 'C:\BD\Repositorio para Base de Datos Sql Server\Gimnasio\Base-de-Datos-Gimnasio\Copia de Sguridad\Backup_Gimnasio_'+@fecha+'.bak'
set @name = 'Gimnasio'+@fecha
BACKUP DATABASE Gimnasio  --nombre de la base de datos
TO DISK = @path			 -- direccioin donde se guardara el backup
WITH NO_COMPRESSION, NAME=@name  --establece la no compresion del backup







/*
print cast (datepart(day,getdate())as varchar(2))+
						'/' +cast (datepart(month,getdate())as varchar(2)) +
						'/' +cast (datepart(year,getdate())as varchar(4)) +
						' -- ' + cast(datepart(hour,getdate()) as varchar(2)) + 
						':' + cast (datepart (minute,getdate()) as varchar(2))*/