{\rtf1\ansi\ansicpg949\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset129 AppleSDGothicNeo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs28 \cf0 1. 	SELECT ReleaseYear, Title, RunningTime, Plot FROM movie\
   	WHERE KoreanTitle = \'a1\'ae \'c6\'db\'bd\'ba\'c6\'ae \'b8\'c7 \'a1\'af ;\
\
2. 	SELECT KoreanTitle, Title FROM Movie \
	WHERE ReleaseYear = 2003;\
\
3. 	\cf2 \CocoaLigature0 SELECT Name  FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID WHERE R.RoleName='Composer' AND 	M.KoreanTitle ='\'b1\'db\'b7\'a1\'b5\'f0\'bf\'a1\'c0\'cc\'c5\'cd' ;\cf0 \CocoaLigature1 \
\
4. 	\cf2 \CocoaLigature0 SELECT COUNT(Name)  FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID JOIN MajorRole AS MR ON MR.RoleID = R.RoleID 	JOIN Person AS P ON P.PersonID = MR.PersonID WHERE R.RoleName=\'a1\'aeDirector\'a1\'af AND 	M.KoreanTitle =\'a1\'ae\'b8\'c5\'c6\'ae\'b8\'af\'bd\'ba ;\cf0 \CocoaLigature1 \
\
5.	\cf2 \CocoaLigature0 SELECT M.Title  FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf2 	JOIN Role AS R ON R.RoleID = A.RoleID JOIN MajorRole AS MR ON MR.RoleID = R.RoleID 	JOIN Person AS P ON P.PersonID = MR.PersonID \cf0 \CocoaLigature1  \
	GROUP BY A.PersonID HAVING COUNT(*) >=2\
	\cf2 \CocoaLigature0 WHERE R.RoleName=\'a1\'aeDirector\'a1\'af; 	\cf0 \CocoaLigature1 	\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
6. 	\cf2 \CocoaLigature0 SELECT A.MovieID FROM Appear AS A JOIN Person P On A.PersonID = P.PersonID \
	Join AwardInvolve AS W ON W.AppearID = A.AppearID WHERE P.KoreanName = '\'c7\'d1\'bd\'ba\'c1\'fc\'b8\'d3';\
\
7. 	SELECT Title  FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
    	WHERE P.KoreanName ='\'c1\'a6\'c0\'d3\'bd\'ba \'c4\'ab\'b8\'de\'b7\'d0' AND P.KoreanName = '\'be\'c6\'b3\'ee\'b5\'e5 \'bd\'b4\'bf\'d0\'c3\'f7\'b3\'d7\'b0\'c5' ;\
\
8. 	SELECT DISTINCT Title  FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID 	   	 WHERE P.KoreanName ='\'b7\'b9\'bf\'c0\'b3\'aa\'b8\'a3\'b5\'b5 \'b5\'f0\'c4\'ab\'c7\'c1\'b8\'ae\'bf\'c0' AND M.RunningTime >= 100;\
\
9.	SELECT DISTINCT Title  FROM Movie AS M \
	JOIN Grade AS G ON M.GradeID = G.GradeID\
        WHERE M.BoxOfficeWWGross = (SELECT MAX(M.BoxOfficeWWGross) from Movie) AND 	G.GradeName='NC-17';\
\
10. 	SELECT DISTINCT AVG(BoxOfficeWWGross)  FROM Movie \
    	WHERE Movie.ReleaseYear <1999;\
\
11. 	SELECT DISTINCT Title  FROM Movie \
    	WHERE Movie.Budget = (SELECT MAX(M.Budget) from Movie M)\
\
12.   SELECT P.Name FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
    	WHERE M.BudGet = (SELECT MAX(SUM(M.Budget)) from Movie M)\
        AND R.RoleName = 'Director';\
\
13. SELECT P.Name FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
    	WHERE M.BoxOfficeWWGross = (SELECT MAX(M.BoxOfficeWWGross) from Movie M)\
        AND RoleName = 'Director';\
\
14. SELECT distinct BoxOfficeWWGross FROM Movie AS M JOIN Appear AS A ON M.MovieID = 	A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
    	WHERE M.BudGet = (SELECT MIN(M.BudGet) from Movie M) \
\
15. SELECT distinct AVG(BoxOfficeWWGross) FROM Movie \
    	WHERE M.BudGet < 5000\
\
16. SELECT distinct AVG(BoxOfficeWWGross) \
	FROM Movie AS M JOIN MovieGenre AS MG ON M.MovieID = MG.MovieID \
	JOIN Genre AS G ON G.GenreID = MG.GenreID \
    	WHERE G.GenreName = 'Action'\
\
17. SELECT  distinct Title \
	FROM Movie AS M JOIN MovieGenre AS MG ON M.MovieID = MG.MovieID \
	JOIN Genre AS G ON G.GenreID = MG.GenreID \
    	WHERE G.GenreName = 'Drama' OR G.GenreName = 'War';\
\
18. 	SELECT DISTINCT Title  FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN PERSON AS P ON  A.PersonID = P.PersonID 	\
    	WHERE P.KoreanName ='\'c5\'e8 \'c7\'e0\'c5\'a9\'bd\'ba' AND RunningTime = (SELECT MAX(M.RunningTime)from 	Movie );\
\
19. SELECT DISTINCT MAX(P.Name)  FROM Appear AS A JOIN AwardInvolve AS AI ON A.AppearID = AI.AppearID \
	JOIN Sector AS S ON  S.SectorID = AI.SectorID\
    JOIN Person AS P ON P.PersonID = A.PersonID\
    WHERE S.SectorName =\'a1\'aeBest Performance by an Actor in a Leading Role';\
        \
20. SELECT DISTINCT MAX(P.Name)  FROM Appear AS A JOIN AwardInvolve AS AI ON A.AppearID = AI.AppearID \
	JOIN Sector AS S ON  S.SectorID = AI.SectorID\
    JOIN Person AS P ON P.PersonID = A.PersonID\
    WHERE S.SectorName ='Best Achievement in Directing';\
\
21. SELECT DISTINCT MAX(P.Name)  FROM Appear AS A JOIN AwardInvolve AS AI ON A.AppearID = AI.AppearID \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf2 	JOIN Sector AS S ON  S.SectorID = AI.SectorID\
    JOIN Person AS P ON P.PersonID = A.PersonID\
    WHERE S.SectorName ='Best Performance by an Actor in a Leading Role';\
\
23. SELECT DISTINCT MAX(P.Name)  FROM Appear AS A JOIN AwardInvolve AS AI ON A.AppearID = AI.AppearID \
	JOIN Sector AS S ON  S.SectorID = AI.SectorID\
    JOIN Person AS P ON P.PersonID = A.PersonID\
    WHERE S.SectorName ='Best Achievement in Directing';\
\
24. SELECT DISTINCT MAX(M.Title)  FROM Appear AS A JOIN AwardInvolve AS AI ON A.AppearID = AI.AppearID \
	JOIN Sector AS S ON  S.SectorID = AI.SectorID\
    JOIN Winning AS W ON W.WinningID = AI.WinningID\
    JOIN Person AS P ON P.PersonID = A.PersonID\
    JOIN Movie AS M ON M.MovieID = A.MovieID\
    WHERE S.SectorName ='Best Achievement in Directing' AND W.WinOrNot ='Nominated';\
\
25. SELECT MAX(P.Name) FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID \
	JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
    	WHERE RoleName = 'Actress';\
\
26.  SELECT  Title FROM Movie\
    	order by BoxOfficeWWGross\
        desc LIMIT 10; \
\
27.  SELECT  Title FROM Movie\
    	WHERE BoxOfficeWWGross >= 1000000000 AND Budget < 100000000;\
\
28. SELECT  distinct P.Name \
	FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID\
       JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
	JOIN MovieGenre AS MG ON M.MovieID = MG.MovieID \
	JOIN Genre AS G ON G.GenreID = MG.GenreID \
\
    	WHERE G.GenreName = 'WAR' AND R.RoleName = 'Director' \
29. SELECT  distinct Count(P.Name) \
	FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID\
    JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
	JOIN MovieGenre AS MG ON M.MovieID = MG.MovieID \
	JOIN Genre AS G ON G.GenreID = MG.GenreID \
	WHERE G.GenreName = 'Drama'\
     \
 30.  SELECT  distinct P.Name \
	FROM Movie AS M JOIN Appear AS A ON M.MovieID = A.MovieID\
    JOIN Role AS R ON R.RoleID = A.RoleID \
	JOIN MajorRole AS MR ON MR.RoleID = R.RoleID \
	JOIN Person AS P ON P.PersonID = MR.PersonID \
	JOIN MovieGenre AS MG ON M.MovieID = MG.MovieID \
	JOIN Genre AS G ON G.GenreID = MG.GenreID \
	WHERE G.GenreName = 'Drama' AND G.GenreName != 'Horror';\
     \
 31. SELECT MAX(Location) FROM AWARDYEAR\
\
32. SELECT MAX(Location) FROM AWARDYEAR}