-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_IM_TYPE_USER (
    @Cat_typ_Name   VARCHAR(50),
	@CatTypUser   UNIQUEIDENTIFIER = NULL
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@CatTypUser IS NULL)
	  BEGIN

			INSERT INTO [dbo].[CAT_TYPE_USER]
			   (
				    [CAT_TYP_USER]
				   ,[CAT_TYP_NAME]
			   )
			 VALUES
			   (
					NEWID(),
					@Cat_typ_Name
			   )

	    END
        ELSE
		   BEGIN
				UPDATE CAT_TYPE_USER
				SET CAT_TYP_NAME = @Cat_typ_Name
			  WHERE CAT_TYP_USER = @CatTypUser

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
