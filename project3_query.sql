--columns with victims shooting information:
SELECT
	shooting.INCIDENT_KEY,
    shooting.BORO,
    shooting.STATISTICAL_MURDER_FLAG,
    shooting.VIC_AGE_GROUP,
    shooting.VIC_SEX,
    shooting.VIC_RACE,
    dates.OCCUR_DATE,
    dates.OCCUR_TIME,
    geolocation.Latitude,
    geolocation.Longitude
FROM
    shooting
JOIN
    dates ON shooting.INCIDENT_KEY = dates.INCIDENT_KEY
JOIN
    geolocation ON shooting.INCIDENT_KEY = geolocation.INCIDENT_KEY;

SELECT
    shooting.INCIDENT_KEY,
    shooting.BORO AS borough,
    shooting.STATISTICAL_MURDER_FLAG AS victim_death,
    shooting.VIC_AGE_GROUP,
    shooting.VIC_SEX,
    shooting.VIC_RACE,
    dates.OCCUR_DATE AS incident_date,
    dates.OCCUR_TIME AS incident_time,
    geolocation.Latitude,
    geolocation.Longitude
FROM
    shooting
JOIN
    dates ON shooting.INCIDENT_KEY = dates.INCIDENT_KEY
JOIN
    geolocation ON shooting.INCIDENT_KEY = geolocation.INCIDENT_KEY;

--number of shooting incidents in each borough:
SELECT
    shooting.BORO AS borough,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
GROUP BY
    shooting.BORO
ORDER BY
    shooting_num DESC;
	
--number of shooting incidents for victim age group, sex, and race:	
SELECT
    shooting.VIC_AGE_GROUP,
    shooting.VIC_SEX,
    shooting.VIC_RACE,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
GROUP BY
    shooting.VIC_AGE_GROUP,
    shooting.VIC_SEX,
    shooting.VIC_RACE
ORDER BY
    shooting_num DESC;

	
--number of shootings categorized into victim_death or not:
SELECT
    shooting.STATISTICAL_MURDER_FLAG AS victim_death,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
GROUP BY
    victim_death;
	
--the number of shootings according to the occurrence date
SELECT
    dates.OCCUR_DATE AS incident_date,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
JOIN
    dates ON shooting.INCIDENT_KEY = dates.INCIDENT_KEY
GROUP BY
    incident_date
ORDER BY
    incident_date ASC;

--the number of shootings according to the occurrence time
SELECT
    dates.OCCUR_TIME AS incident_time,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
JOIN
    dates ON shooting.INCIDENT_KEY = dates.INCIDENT_KEY
GROUP BY
    incident_time
ORDER BY
    incident_time ASC;
	
-- total number of shooting each year
SELECT
    EXTRACT(YEAR FROM dates.OCCUR_DATE) AS year,
    COUNT(shooting.INCIDENT_KEY) AS total_shootings
FROM
    shooting
JOIN
    dates ON shooting.INCIDENT_KEY = dates.INCIDENT_KEY
JOIN
    geolocation ON shooting.INCIDENT_KEY = geolocation.INCIDENT_KEY
GROUP BY
    year
ORDER BY
    total_shootings DESC;
	
--selecting columns with offender information	
SELECT
    shooting.INCIDENT_KEY,
    shooting.BORO AS borough,
    shooting.STATISTICAL_MURDER_FLAG AS victim_death,
    shooting.PERP_AGE_GROUP,
    shooting.PERP_SEX,
    shooting.PERP_RACE,
    dates.OCCUR_DATE,
    dates.OCCUR_TIME,
    geolocation.Latitude,
    geolocation.Longitude
FROM
    shooting
JOIN
    dates ON shooting.INCIDENT_KEY = dates.INCIDENT_KEY
JOIN
    geolocation ON shooting.INCIDENT_KEY = geolocation.INCIDENT_KEY;


--the number of shootings for perpetrator age group, sex, race, and borough
SELECT
    shooting.BORO AS borough,
    shooting.PERP_AGE_GROUP,
    shooting.PERP_SEX,
    shooting.PERP_RACE,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
GROUP BY
    borough,
    shooting.PERP_AGE_GROUP,
    shooting.PERP_SEX,
    shooting.PERP_RACE
ORDER BY
    shooting_num DESC,
    borough DESC;

--the number of shootings for perpetrator age group and borough
SELECT
    shooting.BORO AS borough,
    shooting.PERP_AGE_GROUP,
    COUNT(shooting.INCIDENT_KEY) AS shooting_num
FROM
    shooting
GROUP BY
    borough,
    shooting.PERP_AGE_GROUP
ORDER BY
     shooting_num DESC;
  


