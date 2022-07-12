USE [Sofia Airport]
GO

/****** Object:  Table [dbo].[Direction]    Script Date: 12/07/2022 15:22:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Direction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
 CONSTRAINT [PK_Direction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Direction]  WITH CHECK ADD  CONSTRAINT [FK_Direction_Flights] FOREIGN KEY([From])
REFERENCES [dbo].[Flights] ([ID])
GO

ALTER TABLE [dbo].[Direction] CHECK CONSTRAINT [FK_Direction_Flights]
GO

ALTER TABLE [dbo].[Direction]  WITH CHECK ADD  CONSTRAINT [FK_Direction_Flights1] FOREIGN KEY([To])
REFERENCES [dbo].[Flights] ([ID])
GO

ALTER TABLE [dbo].[Direction] CHECK CONSTRAINT [FK_Direction_Flights1]
GO

