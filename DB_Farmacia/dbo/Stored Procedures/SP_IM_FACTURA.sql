-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_IM_FACTURA (
    @FAC_INT_ID     UNIQUEIDENTIFIER = NULL,
	@FAC_NUMBER     NVARCHAR(50),
	@PAG_INT_ID     UNIQUEIDENTIFIER,
	@FAC_FECHA      DATETIME,
	@USE_INF_INT_ID UNIQUEIDENTIFIER,
	@USE_INT_ID     UNIQUEIDENTIFIER,
	@FAC_SUB_TOTAL  DECIMAL(16,2),
	@FAC_DESCUENTO  DECIMAL(16,2),
	@FAC_IVA        DECIMAL(18,18)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@FAC_INT_ID IS NULL)
	  BEGIN

		INSERT INTO [dbo].[TBL_FACTURA]
           (
			    [FAC_INT_ID]
			   ,[FAC_NUMBER]
			   ,[PAG_INT_ID]
			   ,[FAC_FECHA]
			   ,[USE_INF_INT_ID]
			   ,[USE_INT_ID]
			   ,[FAC_SUB_TOTAL]
			   ,[FAC_DESCUENTO]
			   ,[FAC_IVA]
		   )
			 VALUES
			   (
					NEWID(),
					@FAC_NUMBER,
					@PAG_INT_ID,
					@FAC_FECHA,
					@USE_INF_INT_ID,
					@USE_INT_ID,
					@FAC_SUB_TOTAL,
					@FAC_DESCUENTO,
					@FAC_IVA
			   )

		END
        ELSE
		   BEGIN
				UPDATE TBL_FACTURA
				SET PAG_INT_ID = @PAG_INT_ID,
					FAC_FECHA = @FAC_FECHA,
					USE_INF_INT_ID = @USE_INF_INT_ID,
					USE_INT_ID = @USE_INT_ID,
					FAC_SUB_TOTAL = @FAC_SUB_TOTAL,
					FAC_DESCUENTO = @FAC_DESCUENTO,
					FAC_IVA = @FAC_IVA
			  WHERE FAC_INT_ID = @FAC_INT_ID

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
