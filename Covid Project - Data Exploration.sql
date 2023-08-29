
--Here I use publicly available data to analyse aspects of Covid such as infection rates, mortality, and vaccination.

SELECT* 
FROM [PortfolioProjectCovid].[dbo].CovidDeaths 
WHERE continent IS NOT NULL

SELECT 
  location, 
  date, 
  total_cases, 
  new_cases, 
  total_deaths, 
  population 

FROM [PortfolioProjectCovid].[dbo].CovidDeaths 
WHERE continent IS NOT NULL 
ORDER BY 1,2

--Looking at total cases vs total deaths. 
--Shows the likelihood of dying if you contract covid in your country. 
SELECT 
  location, 
  date, 
  total_cases, 
  total_deaths, 
  death_percentage = (total_deaths/total_cases)*100 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE location = 'Spain' AND continent IS NOT NULL 
ORDER BY 1,2

--Creating view to store data for later visualization. 
CREATE VIEW Covid_Mortality AS 
SELECT 
  location, 
  date, 
  total_cases, 
  total_deaths, 
  death_percentage = (total_deaths/total_cases)*100 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
--WHERE location = 'Spain' AND continent IS NOT NULL 
--ORDER BY 1,2

SELECT * FROM Covid_Mortality

--Looking at Total Cases vs Population 
--Shows what percentage of the population got covid. 
SELECT 
  location, 
  date, 
  population, 
  total_cases, 
  covid_infection_percentage = (total_cases/population)*100 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE location = 'Spain' AND continent IS NOT NULL 
ORDER BY 1,2

--Creating view to store data for later visualization. 
CREATE VIEW Population_With_Covid AS
SELECT 
  location, 
  date, 
  population, 
  total_cases, 
  covid_infection_percentage = (total_cases/population)*100 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
--WHERE location = 'Spain' AND continent IS NOT NULL 
--ORDER BY 1,2

SELECT * FROM Population_With_Covid

--Looking at countries with highest Infection Rate compred to Population. 
SELECT 
  location, 
  population, 
  MAX(total_cases) AS Highest_Infection_Count, 
  covid_infection_percentage = MAX((total_cases/population))*100 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
GROUP BY location, population 
ORDER BY covid_infection_percentage DESC

--Creating view to store data for later visualization. 
CREATE VIEW Highest_Infection_Compared_to_Population AS 
SELECT 
  location, 
  population, 
  MAX(total_cases) AS Highest_Infection_Count, 
  covid_infection_percentage = MAX((total_cases/population))*100 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
GROUP BY location, population 
--ORDER BY covid_infection_percentage DESC

SELECT * FROM Highest_Infection_Compared_to_Population

--Showing countries with hightest covid mortaility per population. 
SELECT 
  location, 
  MAX(CAST(total_deaths AS INT)) AS Total_Death_Count 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
GROUP BY location 
ORDER BY Total_Death_Count DESC

--Creating view to store data for later visualization. 
CREATE VIEW Highest_Covid_Mortality_Per_Population AS 
SELECT 
  location, 
  MAX(CAST(total_deaths AS INT)) AS Total_Death_Count 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
GROUP BY location 
--ORDER BY Total_Death_Count DESC

SELECT * FROM Highest_Covid_Mortality_Per_Population

--Breakdown by Continent 
--Showing Continents with the highest Total Death Count. 
SELECT 
  location, 
  MAX(CAST(total_deaths AS INT)) AS Total_Death_Count 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NULL 
GROUP BY location 
ORDER BY Total_Death_Count DESC

--Creating view to store data for later visualization. 
CREATE VIEW Continents_With_Highest_Total_Death_Count AS 
SELECT 
  location, 
  MAX(CAST(total_deaths AS INT)) AS Total_Death_Count 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NULL 
GROUP BY location 
--ORDER BY Total_Death_Count DESC

SELECT * FROM Continents_With_Highest_Total_Death_Count

--GLOBAL NUMBERS BY DAY 
SELECT 
  date, 
  SUM(new_cases) AS Global_New_Cases, 
  SUM(CAST(new_deaths AS int)) AS Global_New_Deaths, 
  (SUM(CAST(new_deaths AS int))/SUM(new_cases))*100 AS Global_Death_Percentage 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
GROUP BY date 
ORDER BY 1,2

--Creating view to store data for later visualization. 
CREATE VIEW Global_Numbers_By_Day AS 
SELECT 
  date, 
  SUM(new_cases) AS Global_New_Cases, 
  SUM(CAST(new_deaths AS int)) AS Global_New_Deaths, 
  (SUM(CAST(new_deaths AS int))/SUM(new_cases))*100 AS Global_Death_Percentage 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
GROUP BY date 
--ORDER BY 1,2

SELECT * FROM Global_Numbers_By_Day

--GLOBAL NUMBERS SUMMARY 
SELECT 
  SUM(new_cases) AS Global_Cases, 
  SUM(CAST(new_deaths AS int)) AS Global_Deaths, 
  (SUM(CAST(new_deaths AS int))/SUM(new_cases))*100 AS Global_Death_Percentage 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
ORDER BY 1,2

--Creating view to store data for later visualization. 
CREATE VIEW Global_Numbers_Summary AS 
SELECT 
  SUM(new_cases) AS Global_Cases, 
  SUM(CAST(new_deaths AS int)) AS Global_Deaths, 
  (SUM(CAST(new_deaths AS int))/SUM(new_cases))*100 AS Global_Death_Percentage 

FROM [PortfolioProjectCovid].[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL 
--ORDER BY 1,2

SELECT * FROM Global_Numbers_Summary

--COVID VACCINATIONS 
SELECT* FROM [PortfolioProjectCovid].dbo.CovidVaccinations

--Creating view to store data for later visualization. 
CREATE VIEW Covid_Vaccinations AS 
SELECT* FROM [PortfolioProjectCovid].dbo.CovidVaccinations

SELECT * FROM Covid_Vaccinations

--COMBINING COVID DEATHS TABLE WITH COVID VACCINATIONS TABLE 
SELECT* FROM [PortfolioProjectCovid].dbo.CovidVaccinations vac 
  JOIN [PortfolioProjectCovid].dbo.CovidDeaths dea 
  ON dea.location = vac.location AND dea.date = vac.date

--Looking at Total Population vs Vaccination 
SELECT 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(CONVERT(int, vac.new_vaccinations)) OVER (
  PARTITION BY dea.location ORDER BY dea.location, dea.date) 
  AS Aggregate_Vaccinations 
  
/*Aggregate_Vaccinations/population)*100 AS Percent_Vaccinated 
  FROM [PortfolioProjectCovid].dbo.CovidVaccinations vac 
  JOIN [PortfolioProjectCovid].dbo.CovidDeaths dea 
    ON dea.location = vac.location 
    AND dea.date = vac.date 
  
  WHERE dea.continent IS NOT NULL 
  ORDER BY 2,3*/

/*USE CTE WITH Population_VS_Vaccination 
  (continent, location, date, population, new_vaccinations, Aggregate_Vaccinations) 
  AS ( SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(int, vac.new_vaccinations)) 
  OVER (PARTITION BY dea.location 
        ORDER BY dea.location, dea.date) 
  AS Aggregate_Vaccinations*/
  
/*(Aggregate_Vaccinations/population)100 AS Percent_Vaccinated 
FROM [PortfolioProjectCovid].dbo.CovidVaccinations vac 
  JOIN [PortfolioProjectCovid].dbo.CovidDeaths dea 
    ON dea.location = vac.location AND dea.date = vac.date 
  WHERE dea.continent IS NOT NULL 
  --ORDER BY 2,3*/ 
  
 /*SELECT (Aggregate_Vaccinations/population)*100 AS Percent_Vaccinated 
  FROM Population_VS_Vaccination*/

TEMP TABLE DROP TABLE IF EXISTS 
  #Percent_Population_Vaccinated 

CREATE TABLE #Percent_Population_Vaccinated ( 
  Continent nvarchar(255), 
  Location nvarchar(255), 
  Date datetime, 
  Population int, 
  New_Vaccinations int, 
  Aggregate_Vaccinations numeric )

INSERT INTO #Percent_Population_Vaccinated 
SELECT 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(CONVERT(int, vac.new_vaccinations)) OVER (
    PARTITION BY dea.location 
    ORDER BY dea.location, dea.date) 
  AS Aggregate_Vaccinations 
  
  /*Aggregate_Vaccinations/population)*100 AS 
    Percent_Vaccinated 
  
  FROM [PortfolioProjectCovid].dbo.CovidVaccinations vac 
    JOIN [PortfolioProjectCovid].dbo.CovidDeaths dea 
      ON dea.location = vac.location AND dea.date = vac.date 
  
  WHERE dea.continent IS NOT NULL 
  --ORDER BY 2,3*/

SELECT , (Aggregate_Vaccinations/population)100 AS Percent_Vaccinated FROM #Percent_Population_Vaccinated

--Creating view to store data for later visualization. 
  CREATE VIEW Percent_Population_Vaccinated AS 
  SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations, 
    SUM(CONVERT(int, vac.new_vaccinations)) OVER (
      PARTITION BY dea.location 
      ORDER BY dea.location, dea.date) AS Aggregate_Vaccinations 
  
  /*Aggregate_Vaccinations/population)*100 
    AS Percent_Vaccinated FROM [PortfolioProjectCovid].dbo.CovidVaccinations vac 
      JOIN [PortfolioProjectCovid].dbo.CovidDeaths dea 
        ON dea.location = vac.location AND dea.date = vac.date 
      
      WHERE dea.continent IS NOT NULL 
      --ORDER BY 2,3*/

SELECT * FROM Percent_Population_Vaccinated
