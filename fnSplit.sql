USE [INVENTARIO]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 13/11/2017 10:18:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSplit] (
	@sep varchar(32) = ''
	, @s varchar(MAX)
)
RETURNS TABLE
AS
    RETURN
    (
        SELECT r.value('.','VARCHAR(MAX)') AS [item]
        FROM (SELECT CONVERT(XML, N'<root><r>' + REPLACE(REPLACE(REPLACE(@s,'& ','&amp; '),'<','&lt;'), @sep, '</r><r>') + '</r></root>') as valxml) x
        CROSS APPLY x.valxml.nodes('//root/r') AS RECORDS(r)
    )