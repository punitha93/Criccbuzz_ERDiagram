/*Usser Details*/
CREATE TABLE [CricbuzzERP].[dbo].[userdetails] (
	id uniqueidentifier not null primary key default newid(),
	authid uniqueidentifier not null foreign key references auth(id),
	lastname varchar(255) not null,
	firstname varchar(255) not null,
	emailaddress varchar(255) not null,		
);

/*PasswordDetails_Secured*/
CREATE TABLE [CricbuzzERP].[dbo].auth (
	id uniqueidentifier not null primary key default newid(),	
	password varchar(25) not null,
);

/*Match Details*/
CREATE TABLE [CricbuzzERP].[dbo].[players] (
	id uniqueidentifier not null primary key default newid(),
	playerfirstname varchar(255) not null,
	playerlastname varchar(255) not null,
	playercountry varchar(255) not null,
	age int,
	runs int,
	wickets int,
	numberofmatches int,
	bestat varchar(50), /*Bowlers/Bastsman, All rounder*/
	playerphoto image,
);

CREATE TABLE [CricbuzzERP].[dbo].[teamdetails] (
	id uniqueidentifier not null primary key default newid(),	
	teamname varchar(255) not null,
	teamcountry varchar(255) not null,
	teamlogo image,
);

/*ALTER TABLE [CricbuzzERP].[dbo].[teamdetails] ALTER COLUMN teamlogo image;*/

CREATE TABLE [CricbuzzERP].[dbo].[matchschedule] (
	id uniqueidentifier not null primary key default newid(),	
	matchtype varchar(255) not null, /*Test, ODI, T20*/
	groundname varchar(255) not null,
	groundlocation varchar(255) not null,
	matchstartdate date,
	matchstarttime time,
	matchenddate date,
	matchendtime time,
	Results varchar(255)
);

CREATE TABLE [CricbuzzERP].[dbo].[team_matchdetails] (
	id uniqueidentifier not null primary key default newid(),
	playerid uniqueidentifier not null foreign key references players(id),
	teamid uniqueidentifier not null foreign key references teamdetails(id),
	matchscheduleid uniqueidentifier not null foreign key references matchschedule(id),
	playing11s varchar(50) not null,
);

/* ALTER TABLE [CricbuzzERP].[dbo].[teamdetails] ALTER COLUMN teamlogo image;*/



CREATE TABLE [CricbuzzERP].[dbo].[matchscore_teamlive] (
	id uniqueidentifier not null primary key default newid(),	
	teamid uniqueidentifier not null foreign key references teamdetails(id),
	matchscheduleid uniqueidentifier not null foreign key references matchschedule(id),
	score int,
	wickets int,
	balls int,
	overs int,
	totalballsavailable int,
);

/*DROP TABLE [CricbuzzERP].[dbo].[matchscore_teamlive]*/

CREATE TABLE [CricbuzzERP].[dbo].[matchccore_playerlive] (
	id uniqueidentifier not null primary key default newid(),	
	playerid uniqueidentifier not null foreign key references players(id),
	matchid uniqueidentifier not null foreign key references team_matchdetails(id),
	runs int,
	number_wicketstaken int,
	ballsusedatbatting int,
	number_six int,
	number_four int,
);


SELECT * FROM [CricbuzzERP].[dbo].[players] 
SELECT * FROM [CricbuzzERP].[dbo].[teamdetails] 
SELECT * FROM [CricbuzzERP].[dbo].[matchschedule] 
SELECT * FROM [CricbuzzERP].[dbo].[team_matchdetails] 
SELECT * FROM [CricbuzzERP].[dbo].[matchscore_teamlive] 
SELECT * FROM [CricbuzzERP].[dbo].[matchccore_playerlive] 

INSERT INTO [CricbuzzERP].[dbo].[players] (playerfirstname, playercountry, age, runs, wickets, numberofmatches, bestat, playerlastname) VALUES ('Punitha', 'UK', 30, 0, 0, 0, 'nothing', 'V');
INSERT INTO [CricbuzzERP].[dbo].[players] (playerfirstname, playercountry, age, runs, wickets, numberofmatches, bestat, playerlastname) VALUES ('Selvakumar', 'India', 29, 0, 0, 0, 'nothing', 'V');
INSERT INTO [CricbuzzERP].[dbo].[players] (playerfirstname, playercountry, age, runs, wickets, numberofmatches, bestat, playerlastname) VALUES ('Ramkumar', 'India', 25, 0, 0, 0, 'nothing', 'C');
INSERT INTO [CricbuzzERP].[dbo].[players] (playerfirstname, playercountry, age, runs, wickets, numberofmatches, bestat, playerlastname) VALUES ('Yazhini', 'UK', 35, 0, 0, 0, 'nothing', 'A');

INSERT INTO [CricbuzzERP].[dbo].[teamdetails] (teamname, teamcountry) VALUES ('Superkings', 'India');
INSERT INTO [CricbuzzERP].[dbo].[teamdetails] (teamname, teamcountry) VALUES ('SuperQueen', 'UK');

INSERT INTO [CricbuzzERP].[dbo].[matchschedule] (matchtype, groundname, groundlocation, matchstartdate, matchenddate) VALUES ('Test','LO','India','2023-03-10','2023/03/12');

INSERT INTO [CricbuzzERP].[dbo].[team_matchdetails] (playerid, teamid, matchscheduleid, playing11s) VALUES ('C7D561C6-8156-4E82-98AD-51AAAF41378A','62ED70B1-A1B6-40BF-BF4C-8D7E5042A1D9','94246A07-7CCF-4421-952C-CC6F82268FF8','yes');
INSERT INTO [CricbuzzERP].[dbo].[team_matchdetails] (playerid, teamid, matchscheduleid, playing11s) VALUES ('A2141147-36EA-40EA-B3FA-A1CB78E72D49','62ED70B1-A1B6-40BF-BF4C-8D7E5042A1D9','94246A07-7CCF-4421-952C-CC6F82268FF8','yes');
INSERT INTO [CricbuzzERP].[dbo].[team_matchdetails] (playerid, teamid, matchscheduleid, playing11s) VALUES ('36860B05-5E7E-4475-B9FF-8CA9BDF5F3E7','D032BA58-E5E3-4C9D-BFAE-4B6018D00CBC','94246A07-7CCF-4421-952C-CC6F82268FF8','yes');
INSERT INTO [CricbuzzERP].[dbo].[team_matchdetails] (playerid, teamid, matchscheduleid, playing11s) VALUES ('195A0376-8EC9-4913-A8C3-19726D724018','D032BA58-E5E3-4C9D-BFAE-4B6018D00CBC','94246A07-7CCF-4421-952C-CC6F82268FF8','yes');

INSERT INTO [CricbuzzERP].[dbo].[matchscore_teamlive] (teamid, matchscheduleid, score, wickets, balls, overs, totalballsavailable) VALUES ('D032BA58-E5E3-4C9D-BFAE-4B6018D00CBC','94246A07-7CCF-4421-952C-CC6F82268FF8',20,2,20,2,50);
INSERT INTO [CricbuzzERP].[dbo].[matchscore_teamlive] (teamid, matchscheduleid, score, wickets, balls, overs, totalballsavailable) VALUES ('62ED70B1-A1B6-40BF-BF4C-8D7E5042A1D9','94246A07-7CCF-4421-952C-CC6F82268FF8',20,2,20,2,50);

INSERT INTO [CricbuzzERP].[dbo].[matchccore_playerlive] (playerid, matchid, runs) VALUES ('C7D561C6-8156-4E82-98AD-51AAAF41378A','8D737020-CEB1-4417-94EF-622B68AD3A1D',4);
INSERT INTO [CricbuzzERP].[dbo].[matchccore_playerlive] (playerid, matchid, runs) VALUES ('A2141147-36EA-40EA-B3FA-A1CB78E72D49','06452664-AA0F-421D-9AD9-F87EC4CD7799',2);
INSERT INTO [CricbuzzERP].[dbo].[matchccore_playerlive] (playerid, matchid, runs) VALUES ('36860B05-5E7E-4475-B9FF-8CA9BDF5F3E7','B56EF959-1F4B-4989-9451-255933983871',4);
INSERT INTO [CricbuzzERP].[dbo].[matchccore_playerlive] (playerid, matchid, runs) VALUES ('195A0376-8EC9-4913-A8C3-19726D724018','6B9987EE-0F4D-4351-BBC3-AD792CDE6B23',10);



SELECT [CricbuzzERP].[dbo].[players].playerfirstname, [CricbuzzERP].[dbo].[players].runs, [CricbuzzERP].[dbo].[matchschedule].matchstartdate 
FROM [CricbuzzERP].[dbo].[players] INNER JOIN [CricbuzzERP].[dbo].[matchschedule] ON [CricbuzzERP].[dbo].[players].id=[CricbuzzERP].[dbo].[matchschedule].id




SELECT * FROM [CricbuzzERP].[dbo].[players] INNER JOIN [CricbuzzERP].[dbo].[matchschedule] ON [CricbuzzERP].[dbo].[players].id=[CricbuzzERP].[dbo].[matchschedule].id

SELECT * FROM [CricbuzzERP].[dbo].[players]
SELECT * FROM [CricbuzzERP].[dbo].[matchschedule]











DELETE FROM [CricbuzzERP].[dbo].[players] 
DELETE FROM [CricbuzzERP].[dbo].[teamdetails] 
DELETE FROM [CricbuzzERP].[dbo].[playerlist] 
DELETE FROM [CricbuzzERP].[dbo].[matchdetails] 
DELETE FROM [CricbuzzERP].[dbo].[matchscore_teamlive] 
DELETE FROM [CricbuzzERP].[dbo].[matchccore_playerlive] 