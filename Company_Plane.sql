USE [Sofia Airport]
GO

/****** Object:  Table [dbo].[Company_Plane]    Script Date: 14/07/2022 15:57:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company_Plane](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Plane_ID] [int] NOT NULL,
 CONSTRAINT [PK_Company_Plane] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Company_Plane]  WITH CHECK ADD  CONSTRAINT [FK_Company_Plane_Company] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[Company] ([ID])
GO

ALTER TABLE [dbo].[Company_Plane] CHECK CONSTRAINT [FK_Company_Plane_Company]
GO

ALTER TABLE [dbo].[Company_Plane]  WITH CHECK ADD  CONSTRAINT [FK_Company_Plane_Planes] FOREIGN KEY([Plane_ID])
REFERENCES [dbo].[Planes] ([ID])
GO

ALTER TABLE [dbo].[Company_Plane] CHECK CONSTRAINT [FK_Company_Plane_Planes]
GO

