USE [COMP3851B]
GO
/****** Object:  Table [dbo].[tutorialGuide]    Script Date: 1/12/2022 6:31:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutorialGuide](
	[gdeID] [int] IDENTITY(1,1) NOT NULL,
	[gdeCatID] [int] NOT NULL,
	[gdeTitle] [nvarchar](255) NULL,
	[gdeDesc] [nvarchar](max) NULL,
	[gdeThumbnail] [nvarchar](max) NULL,
 CONSTRAINT [PK__courseGu__8DAA4F7AFBD74078] PRIMARY KEY CLUSTERED 
(
	[gdeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutorialGuideCategory]    Script Date: 1/12/2022 6:31:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutorialGuideCategory](
	[gdeCatID] [int] IDENTITY(1,1) NOT NULL,
	[gdeCatName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[gdeCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tutorialGuide] ON 

INSERT [dbo].[tutorialGuide] ([gdeID], [gdeCatID], [gdeTitle], [gdeDesc], [gdeThumbnail]) VALUES (25, 35, N'How to Find My Zoom Meetings and Recordings on Canvas?', N'            <div class="callout" style="border-radius:5px; border:1px solid #006ce0; padding: 20px; border-left-width:7px; color:#002a57;">
                <h4 class="">List of Contents</h4>
                <ul>
                    <li><a href="#ZoomMeetings" class="h5" style="color: #002a57">Zoom Meetings</a></li>
                    <li><a href="#ZoomRecordings" class="h5" style="color: #002a57">Zoom Recordings</a></li>
                </ul>
            </div>
            <hr>
            <div class="content">
                <br>
                <h3 class="fw-bold" id="ZoomMeetings" style="text-align:left">Zoom Meetings</h3>
                <p style="font-size:20px; color:black;">To find your zoom meetings on Canvas, first head to your course page. </p>
                <p style="font-size:20px; color:black;">Under the course''s sidebar, click on ''Zoom''.</p>
                <img src="../../../uploads/zoom1.png" style="width:100%;">

                <br><br>

                <p style="font-size:20px; color:black;">After you''ve clicked on ''Zoom'', you will be directed to the following page. </p>
                <p style="font-size:20px; color:black;">Your upcoming meetings will be displayed first. To join a zoom meeting, click ''join'' on the right. </p>
                <img src="../../../uploads/zoom go to1.png" style="width:100%;">

                <hr>

                <h3 class="fw-bold" id="ZoomRecordings" style="text-align:left">Zoom Recordings</h3>
                <p style="font-size:20px; color:black;">To find your zoom recordings, click on ''Panopto'' as highlighted in red.</p>
                <p style="font-size:20px; color:black;">If your lecturer has saved past recordings, you will be able to view the following page.</p>
                <img src="../../../uploads/panopto.png" style="width:100%;">
                <hr>
            </div>', N'~/uploads/zoom.jpg')
INSERT [dbo].[tutorialGuide] ([gdeID], [gdeCatID], [gdeTitle], [gdeDesc], [gdeThumbnail]) VALUES (26, 35, N'Navigating My Canvas', N'            <div class="callout" style="border-radius:5px; border:1px solid #006ce0; padding: 20px; border-left-width:7px; color:#002a57;">
                <h4 class="">List of Contents</h4>
                <ul >
                    <li><a href="#HomePage" class="h5" style="color: #002a57">Homepage</a></li>
                    <li><a href="#Account" class="h5" style="color: #002a57">Account</a></li>
                    <li><a href="#Courses" class="h5" style="color: #002a57">Courses</a></li>
                    <li><a href="#Groups" class="h5" style="color: #002a57">Groups</a></li>
                    <li><a href="#Calendar" class="h5" style="color: #002a57">Calendar</a></li>
                    <li><a href="#Inbox" class="h5" style="color: #002a57">Inbox</a></li>
                    <li><a href="#History" class="h5" style="color: #002a57">History</a></li>
                    <li><a href="#Help" class="h5" style="color: #002a57">Help</a></li>
                </ul>
            </div>
            <hr />

            <div class="content">
                <br />
                <h3 class="fw-bold" id="HomePage" style="text-align:left">Home Page</h3>
                <p style="font-size:20px; color:black;">Once you have logged in, you will be directed to Canvas'' homepage.</p>
                <p style="font-size:20px; color:black;">Here, you will see a dashboard of your current courses as well as a small To-Do List on the right side.</p>
                <p style="font-size:20px; color:black;">You will also be able to see Canvas'' sidebar on the left side of the page.</p>
                <img src="../../../uploads/homepage.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Account" style="text-align:left">Account</h3>
                <p style="font-size:20px; color:black;">The ''Account'' tab is where you can access administrative settings such as your Profile, Settings and Notifications.</p>
                <img src="../../../uploads/account.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Courses" style="text-align:left">Courses</h3>
                <p style="font-size:20px; color:black;">The ''Courses'' tab will display all your current courses taken this term.</p>                
                <img src="../../../uploads/course.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Groups" style="text-align:left">Groups</h3>
                <p style="font-size:20px; color:black;">The ''Groups'' tab shows all the groups or project teams you have previously joined in different modules.</p>
                <img src="../../../uploads/groups.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Calendar" style="text-align:left">Calendar</h3>
                <p style="font-size:20px; color:black;">The ''Calendar'' tab allows you to view your assignment deadlines in a neatly organised calendar.</p>
                <img src="../../../uploads/calendar.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Inbox" style="text-align:left">Inbox</h3>
                <p style="font-size:20px; color:black;">The ''Inbox'' tab allows you to send, receive and view messages sent to you on Canvas about your courses.</p>
                <img src="../../../uploads/inbox.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="History" style="text-align:left">History</h3>
                <p style="font-size:20px; color:black;">The ''History'' tab allows you to quickly access Canvas tabs you were previously looking at.</p>
                <img src="../../../uploads/history.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Help" style="text-align:left">Help</h3>
                <p style="font-size:20px; color:black;">The ''Help'' tab provides official Canvas links and resources if you have an issue with Canvas.</p>
                <img src="../../../uploads/help.png" style="width:100%;">
                <hr />

            </div>', N'~/uploads/homepage.png')
INSERT [dbo].[tutorialGuide] ([gdeID], [gdeCatID], [gdeTitle], [gdeDesc], [gdeThumbnail]) VALUES (27, 35, N'Logging into Canvas', N'            <div class="content">
                <br>
                <h3 class="fw-bold" id="HomePage" style="text-align:left"></h3>
                <p style="font-size:20px; color:black;">Head over to the University of Newcastle''s <a href="https://canvas.newcastle.edu.au/">Canvas</a>.</p>
                <p style="font-size:20px; color:black;">Enter your student ID into the text field as highlighted below.</p>
                <p style="font-size:20px; color:black;">Your student ID can be found under your student details in UON''s myHub. asd</p>
                <img src="../../../uploads/login.png" style="width:100%;">
                <hr>

            </div>', N'~/uploads/loginthumbnail.png')
INSERT [dbo].[tutorialGuide] ([gdeID], [gdeCatID], [gdeTitle], [gdeDesc], [gdeThumbnail]) VALUES (28, 35, N'Navigating My Courses on Canvas', N'            <div class="callout" style="border-radius:5px; border:1px solid #006ce0; padding: 20px; border-left-width:7px; color:#002a57;">
                <h4 class="">List of Contents</h4>
                <ul >
                    <li><a href="#HomePage" class="h5" style="color: #002a57">Homepage</a></li>
                    <li><a href="#Announcement" class="h5" style="color: #002a57">Announcement</a></li>
                    <li><a href="#Modules" class="h5" style="color: #002a57">Modules</a></li>
                    <li><a href="#Assignment" class="h5" style="color: #002a57">Assignment</a></li>
                    <li><a href="#Discussion" class="h5" style="color: #002a57">Discussion</a></li>
                    <li><a href="#Grades" class="h5" style="color: #002a57">Grades</a></li>
                    <li><a href="#CourseReadings" class="h5" style="color: #002a57">Course Readings</a></li>
                    <li><a href="#Panopto" class="h5" style="color: #002a57">Panopto</a></li>
                    <li><a href="#Zoom" class="h5" style="color: #002a57">Zoom</a></li>
                    <li><a href="#NeedHelp" class="h5" style="color: #002a57">Need Help</a></li>
                </ul>
            </div>
            <hr />

            <div class="content">
                <br />
                <h3 class="fw-bold" id="HomePage" style="text-align:left">Homepage</h3>
                <p style="font-size:20px; color:black;">On the homepage of your course, there are quick links to course items.</p>
<p style="font-size:20px; color:black;">You will also be introduced to your course coordinator and a brief overview of what to expect from the course.</p>                
                <img src="../../../uploads/1 homepage.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Announcement" style="text-align:left">Announcement</h3>
                <p style="font-size:20px; color:black;">In the ''Announcement'' tab, you will be able to receive important message broadcasts from your tutors, lecturers and course coordinators.</p>
                <img src="../../../uploads/2 announcement.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Modules" style="text-align:left">Modules</h3>
                <p style="font-size:20px; color:black;">In the ''Modules'' tab, you will be able to see documents pertaining to your Course Overview, Course Materials and Assessments.</p>
                <img src="../../../uploads/3 modules.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Assignment" style="text-align:left">Assignment</h3>
                <p style="font-size:20px; color:black;">In the ''Assignment'' tab, you can view your past, current and upcoming assignments.</p>
                <img src="../../../uploads/4 assignment.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Discussion" style="text-align:left">Discussion</h3>
                <p style="font-size:20px; color:black;">In the ''Discussion'' tab, you can create threads with your classmates, tutors and lecturers to discuss on topics taught in the course.</p>
                <img src="../../../uploads/5 discussion.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Grades" style="text-align:left">Grades</h3>
                <p style="font-size:20px; color:black;">All your available assignment grades can be viewed here.</p>
                <p style="font-size:20px; color:black;">If you are unable to see your marks, contact your tutor in-charge about the release of your grade.</p>
                <img src="../../../uploads/6 grades.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="CourseReadings" style="text-align:left">Course Readings</h3>
                <p style="font-size:20px; color:black;">In the ''Course Readings'' tab, </p>
                <img src="../../../uploads/7 course reading.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Panopto" style="text-align:left">Panopto</h3>
                <p style="font-size:20px; color:black;">In the ''Panopto'' tab, you can view past recordings of your zoom classes.</p>
                <img src="../../../uploads/8 panopto.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="Zoom" style="text-align:left">Zoom</h3>
                <p style="font-size:20px; color:black;">In the ''Zoom'' tab, your past, current and upcoming meetings rooms can be accessed.</p>
                <img src="../../../uploads/9 zoom.png" style="width:100%;">
                <hr />

                <h3 class="fw-bold" id="NeedHelp" style="text-align:left">Need Help</h3>
                <p style="font-size:20px; color:black;">In the ''Need Help'' tab, you can access a list of academic resources should you require further help.</p>
                <p style="font-size:20px; color:black;">The resources provided are:</p>
                <ul style="font-size:20px; color:black;">
                    <li>Personal Support</li>
                    <li>Academic Support</li>
                    <li>Studiosity -24/7 Online Study Help</li>
                    <li>General Enquiries</li>
                    <li>Canvas Help</li>
                    <li>IT Support</li>
                </ul>
                <img src="../../../uploads/10 need help.png" style="width:100%;">
                <hr />

            </div>', N'~/uploads/1 homepage.png')
SET IDENTITY_INSERT [dbo].[tutorialGuide] OFF
GO
SET IDENTITY_INSERT [dbo].[tutorialGuideCategory] ON 

INSERT [dbo].[tutorialGuideCategory] ([gdeCatID], [gdeCatName]) VALUES (35, N'Canvas')
SET IDENTITY_INSERT [dbo].[tutorialGuideCategory] OFF
GO
ALTER TABLE [dbo].[tutorialGuide]  WITH CHECK ADD  CONSTRAINT [FK__courseGui__cseCa__47DBAE45] FOREIGN KEY([gdeCatID])
REFERENCES [dbo].[tutorialGuideCategory] ([gdeCatID])
GO
ALTER TABLE [dbo].[tutorialGuide] CHECK CONSTRAINT [FK__courseGui__cseCa__47DBAE45]
GO
