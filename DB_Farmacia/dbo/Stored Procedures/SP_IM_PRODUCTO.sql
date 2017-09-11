-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_IM_PRODUCTO (
    @PROD_INT_ID    UNIQUEIDENTIFIER = NULL,
    @PROD_NOMBRE     VARCHAR(50),
    @PROD_SYS_NAME   VARCHAR(50),
	@PROD_PRE_V      DECIMAL(16,2),
	@PROD_PRE_C      DECIMAL(16,2),
	@PROD_CANT       INT,
	@CAT_INT_ID      UNIQUEIDENTIFIER,
	@USE_INF_INT_ID  UNIQUEIDENTIFIER,
	@PROD_STATUS     BIT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@PROD_INT_ID IS NULL)
	  BEGIN

		  INSERT INTO [dbo].[TBL_PRODUCTO]
            (
				[PROD_INT_ID]
			   ,[PROD_NOMBRE]
			   ,[PROD_SYS_NAME]
			   ,[PROD_PRE_V]
			   ,[PROD_PRE_C]
			   ,[PROD_CANT]
			   ,[CAT_INT_ID]
			   ,[USE_INF_INT_ID]
			   ,[PROD_STATUS]
			   )
			 VALUES
			   (
					NEWID(),
					@PROD_NOMBRE,
					@PROD_SYS_NAME,
					@PROD_PRE_V,
					@PROD_PRE_C,
					@PROD_CANT,
					@CAT_INT_ID,
					@USE_INF_INT_ID,
					@PROD_STATUS
			   )

		END
        ELSE
		   BEGIN
				UPDATE TBL_PRODUCTO
				SET PROD_NOMBRE = @PROD_NOMBRE,
					PROD_SYS_NAME = @PROD_SYS_NAME,
					PROD_PRE_V = @PROD_PRE_V,
					PROD_PRE_C = @PROD_PRE_C,
					PROD_CANT = @PROD_CANT,
					CAT_INT_ID = @CAT_INT_ID,
					USE_INF_INT_ID = @USE_INF_INT_ID,
					PROD_STATUS = @PROD_STATUS
			  WHERE PROD_INT_ID = @PROD_INT_ID

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
