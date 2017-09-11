-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_IM_USER_INFO (
    @USE_INF_INT_ID UNIQUEIDENTIFIER = NULL,
	@CAT_TYP_USER   UNIQUEIDENTIFIER,
    @USE_INF_PRIMER_N   VARCHAR(100),
	@USE_INF_SEGUNDO_N  VARCHAR(100),
	@USE_INF_PRIMER_A   VARCHAR(50),
	@USE_INF_SEGUNDO_A  VARCHAR(50),
	@USE_INF_FECHA_NAC  DATETIME,
	@USE_INF_CED        VARCHAR(50),
	@USE_INF_TEL        VARCHAR(50),
	@USE_INF_EMAIL      VARCHAR(100)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRANSACTION

    BEGIN TRY

	  IF (@USE_INF_INT_ID IS NULL)
	  BEGIN

			INSERT INTO [dbo].[TBL_USER_INFO]
             (
				    [USE_INF_INT_ID]
				   ,[CAT_TYP_USER]
				   ,[USE_INF_PRIMER_N]
				   ,[USE_INF_SEGUNDO_N]
				   ,[USE_INF_PRIMER_A]
				   ,[USE_INF_SEGUNDO_A]
				   ,[USE_INF_FECHA_NAC]
				   ,[USE_INF_CED]
				   ,[USE_INF_TEL]
				   ,[USE_INF_EMAIL]
		       )
			 VALUES
			   (
					NEWID(),
					@CAT_TYP_USER,
					@USE_INF_PRIMER_N,
					@USE_INF_SEGUNDO_N,
					@USE_INF_PRIMER_A,
					@USE_INF_SEGUNDO_A,
					@USE_INF_FECHA_NAC,
					@USE_INF_CED,
					@USE_INF_TEL,
					@USE_INF_EMAIL
			   )

		END
        ELSE
		   BEGIN
				UPDATE TBL_USER_INFO
				SET CAT_TYP_USER = @CAT_TYP_USER,
					USE_INF_PRIMER_N = @USE_INF_PRIMER_N,
					USE_INF_SEGUNDO_N = @USE_INF_SEGUNDO_N,
					USE_INF_PRIMER_A = @USE_INF_PRIMER_A,
					USE_INF_SEGUNDO_A = @USE_INF_SEGUNDO_A,
					USE_INF_FECHA_NAC = @USE_INF_FECHA_NAC,
					USE_INF_CED = @USE_INF_CED,
					USE_INF_TEL = @USE_INF_TEL,
					USE_INF_EMAIL = @USE_INF_EMAIL
			  WHERE USE_INF_INT_ID = @USE_INF_INT_ID

		  END

   COMMIT TRANSACTION

   END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION 

    END CATCH
END
