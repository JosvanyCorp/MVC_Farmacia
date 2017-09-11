-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ALL_CAT]
AS
BEGIN
	SELECT CAT_INT_ID,CAT_NOMBRE,CAT_SYS_NAME 
	FROM CAT_CATEGORIA
END
