﻿CREATE TABLE [dbo].[TBL_DET_FACTURA] (
    [FAC_DET_INT_ID]   UNIQUEIDENTIFIER CONSTRAINT [DF_TBL_PEDIDO_PED_DET_INT_ID] DEFAULT (newid()) NOT NULL,
    [FAC_INT_ID]       UNIQUEIDENTIFIER NOT NULL,
    [PROD_INT_ID]      UNIQUEIDENTIFIER NOT NULL,
    [FAC_DET_CANTIDAD] INT              NOT NULL,
    [FAC_DET_PRECIO]   DECIMAL (18, 2)  NOT NULL,
    [FAC_DET_FECHA]    DATETIME         NOT NULL,
    CONSTRAINT [PK_TBL_PEDIDO] PRIMARY KEY CLUSTERED ([FAC_DET_INT_ID] ASC),
    CONSTRAINT [FK_TBL_DET_FACTURA_TBL_FACTURA] FOREIGN KEY ([FAC_INT_ID]) REFERENCES [dbo].[TBL_FACTURA] ([FAC_INT_ID]),
    CONSTRAINT [FK_TBL_PEDIDO_TBL_PRODUCTO] FOREIGN KEY ([PROD_INT_ID]) REFERENCES [dbo].[TBL_PRODUCTO] ([PROD_INT_ID])
);


GO
CREATE NONCLUSTERED INDEX [IX_TBL_DET_FACTURA]
    ON [dbo].[TBL_DET_FACTURA]([FAC_INT_ID] ASC);


GO
CREATE TRIGGER [dbo].[TR_PRODUCTO]
ON dbo.TBL_DET_FACTURA
AFTER  INSERT 
AS 
BEGIN
SET NOCOUNT ON;
UPDATE P
SET P.PROD_CANT = P.PROD_CANT - I.FAC_DET_CANTIDAD 
FROM TBL_PRODUCTO P
INNER JOIN INSERTED I ON P.PROD_INT_ID = I.PROD_INT_ID
END