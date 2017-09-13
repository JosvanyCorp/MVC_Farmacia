-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IM_CATEGORIA] (
    @CatIntdId   UNIQUEIDENTIFIER = NULL,
    @CatNombre   VARCHAR(50),
    @CatSysName  VARCHAR(50),
    @CatStatus  BIT
	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@CatIntdId IS NULL)
	  BEGIN

			INSERT INTO [dbo].[CAT_CATEGORIA]
			   (
					[CAT_INT_ID]
				   ,[CAT_NOMBRE]
				   ,[CAT_SYS_NAME]
				   ,[CAT_STATUS]
			   )
			 VALUES
			   (
					NEWID(),
					@CatNombre,
					@CatSysName,
					@CatStatus
			   )

		END
        ELSE
		   BEGIN
				UPDATE CAT_CATEGORIA
				SET CAT_NOMBRE = @CatNombre,
					CAT_SYS_NAME = @CatSysName,
					CAT_STATUS = @CatStatus
			  WHERE CAT_INT_ID = @CatIntdId

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
