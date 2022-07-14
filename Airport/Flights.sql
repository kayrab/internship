USE [Sofia Airport]
GO

/****** Object:  Table [dbo].[Flights]    Script Date: 14/07/2022 15:58:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Flights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartDest_ID] [int] NOT NULL,
	[EndDest_ID] [int] NOT NULL,
	[Plane_ID] [int] NOT NULL,
	[Departure_time] [datetime] NOT NULL,
	[Duration] [time](7) NOT NULL,
	[Delay] [time](7) NOT NULL,
	[Terminal] [varchar](10) NOT NULL,
	[Gate] [varchar](10) NOT NULL,
	[Passengers] [int] NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

