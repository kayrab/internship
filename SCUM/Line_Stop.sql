USE [SUMC]
GO

/****** Object:  Table [dbo].[Line_Stop]    Script Date: 07/07/2022 15:57:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Line_Stop](
	[line_id] [int] NOT NULL,
	[stop_id] [int] NOT NULL,
	[stops_order] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Line_Stop]  WITH CHECK ADD  CONSTRAINT [FK_Line_Stop_Lines] FOREIGN KEY([line_id])
REFERENCES [dbo].[Lines] ([id])
GO

ALTER TABLE [dbo].[Line_Stop] CHECK CONSTRAINT [FK_Line_Stop_Lines]
GO

ALTER TABLE [dbo].[Line_Stop]  WITH CHECK ADD  CONSTRAINT [FK_Line_Stop_Stops] FOREIGN KEY([stop_id])
REFERENCES [dbo].[Stops] ([id])
GO

ALTER TABLE [dbo].[Line_Stop] CHECK CONSTRAINT [FK_Line_Stop_Stops]
GO

