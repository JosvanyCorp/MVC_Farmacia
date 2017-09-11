-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_IM_USER (
    @USE_INT_ID     UNIQUEIDENTIFIER = NULL,
	@USE_INF_INT_ID UNIQUEIDENTIFIER,
    @USE_NAME       VARCHAR(100),
	@USE_LOGIN      VARCHAR(100),
    @USE_PASS       VARCHAR(100),
	@ROL_INT_ID     UNIQUEIDENTIFIER,
	@USE_STATUS     BIT
    
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@USE_INT_ID IS NULL)
	  BEGIN

		INSERT INTO [dbo].[TBL_USER]
             (
			    [USE_INT_ID]
			   ,[USE_INF_INT_ID]
			   ,[USE_NAME]
			   ,[USE_LOGIN]
			   ,[USE_PASS]
			   ,[ROL_INT_ID]
			   ,[USE_STATUS]
		       )
			 VALUES
			   (
					NEWID(),
					@USE_INF_INT_ID,
					@USE_NAME,
					@USE_LOGIN,
					@USE_PASS,
					@ROL_INT_ID,
					@USE_STATUS
			   )

		END
        ELSE
		   BEGIN
				UPDATE TBL_USER
				SET USE_NAME = @USE_NAME,
					USE_PASS = @USE_PASS,
					ROL_INT_ID = @ROL_INT_ID,
					USE_STATUS = @USE_STATUS
			  WHERE USE_INT_ID = @USE_INT_ID

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
