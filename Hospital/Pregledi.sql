USE [medicine]
GO

/****** Object:  Table [dbo].[Pregledi]    Script Date: 13/07/2022 10:24:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pregledi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_doctor] [int] NOT NULL,
	[id_patient] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[comment] [varchar](max) NULL,
	[direction] [varchar](200) NULL,
 CONSTRAINT [PK_Pregledi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

