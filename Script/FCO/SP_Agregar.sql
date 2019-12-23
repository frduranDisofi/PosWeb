USE [PosWeb]
GO

/****** Object:  StoredProcedure [dbo].[ListadoProductos]    Script Date: 23-12-2019 0:10:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListadoProductos]
AS
SELECT Id,Producto,IdFamilia,UnidadMedida,Estado FROM Productos WHERE Estado = 1
GO


--------------------

USE [PosWeb]
GO

/****** Object:  StoredProcedure [dbo].[ListadoFamilia]    Script Date: 23-12-2019 0:10:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListadoFamilia]
AS
SELECT Id,Familia,Estado FROM FamiliaProductos WHERE Estado = 1
GO


	