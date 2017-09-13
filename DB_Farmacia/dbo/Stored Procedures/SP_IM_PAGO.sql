-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IM_PAGO] (
    @PagIntId   UNIQUEIDENTIFIER = NULL,
    @PagNombre VARCHAR(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@PagIntId IS NULL)
	  BEGIN

			INSERT INTO [dbo].[CAT_PAGO]
			   (
					[PAG_INT_ID]
				   ,[PAG_NOMBRE]
				  
			   )
			 VALUES
			   (
					NEWID(),
					@PagNombre
			   )

		END
        ELSE
		   BEGIN
				UPDATE CAT_PAGO
				SET PAG_NOMBRE = @PagNombre
			    WHERE PAG_INT_ID = @PagIntId

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
