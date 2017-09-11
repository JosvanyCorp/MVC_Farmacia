-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_IM_DET_FACTURA (
    @FAC_DET_INT_ID     UNIQUEIDENTIFIER = NULL,
    @FAC_INT_ID         UNIQUEIDENTIFIER,
	@PROD_INT_ID        UNIQUEIDENTIFIER,
	@FAC_DET_CANTIDAD   INT,
	@FAC_DET_PRECIO     DECIMAL(16,2),
	@FAC_DET_FECHA      DATETIME
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@FAC_DET_INT_ID IS NULL)
	  BEGIN

     INSERT INTO [dbo].[TBL_DET_FACTURA]
              (
				[FAC_DET_INT_ID]
			   ,[FAC_INT_ID]
			   ,[PROD_INT_ID]
			   ,[FAC_DET_CANTIDAD]
			   ,[FAC_DET_PRECIO]
			   ,[FAC_DET_FECHA]
		      )
		VALUES
			   (
					NEWID(),
					@FAC_INT_ID,
					@PROD_INT_ID,
					@FAC_DET_CANTIDAD,
					@FAC_DET_PRECIO,
					@FAC_DET_FECHA	
			   )

		END
        ELSE
		   BEGIN
				UPDATE TBL_DET_FACTURA
				SET PROD_INT_ID = @PROD_INT_ID,
					FAC_DET_CANTIDAD = @FAC_DET_CANTIDAD,
					FAC_DET_PRECIO = @FAC_DET_PRECIO,
					FAC_DET_FECHA = FAC_DET_FECHA
			  WHERE FAC_DET_INT_ID = @FAC_DET_INT_ID

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
