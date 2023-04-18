/****** NOW DATA PREVIEW ******/
SELECT * FROM [netflix_t]

/****** DATA CLEANING : check dups in show_id******/


SELECT show_id, COUNT(show_id)
FROM [dbo].[netflix_t]
GROUP BY show_id
HAVING COUNT(show_id) > 1


-- no dups found so unique values


/****** DATA CLEANING : check dups in title******/

SELECT title,COUNT(title)
FROM [dbo].[netflix_t]
GROUP BY title
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC 

/****** DATA CLEANING : check dups in title : further dups in other columns ******/
SELECT  [type],
      [title]
      ,[director]
      ,[cast]
      ,[country]
      ,[date_added]
      ,[release_year]
      ,[rating]
      ,[duration]
      ,[listed_in]
      ,[description]
	  ,COUNT(title)
FROM [netflix].[dbo].[netflix_t]
GROUP BY 
		[type],
      [title]
      ,[director]
      ,[cast]
      ,[country]
      ,[date_added]
      ,[release_year]
      ,[rating]
      ,[duration]
      ,[listed_in]
      ,[description]
HAVING COUNT(title) > 1
ORDER BY COUNT(title) ASC 

--only one movie found, but since unique value for show_id available it cant be removed

-- to check  number of blank of nulls in a column (important columns )
  SELECT COUNT(*)
  FROM netflix_t
  Where show_id is NULL

  SELECT COUNT(*)
  FROM netflix_t
  Where type is NULL

    SELECT COUNT(*)
  FROM netflix_t
  Where title is NULL