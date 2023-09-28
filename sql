

--- Covid 19 Data Exploration 

---first look ar the data 
Select *
From Deaths
Where continent is not null 
order by location , date


-- Select Data i going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From Deaths
Where continent is not null 
order by location , date, population desc





-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
Select Location, date, total_cases,total_deaths, CAST(total_deaths AS FLOAT) / CAST(total_cases AS FLOAT) * 100 as DeathPercentage
From Deaths
Where location like 'israel'
and continent is not null 
order by date desc 


---Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid

Select Location, date, total_cases,total_deaths, CAST(total_deaths AS FLOAT) / CAST(total_cases AS FLOAT) * 100 as DeathPercentage
From Deaths
Where continent is not null 
order by location , date 





--Countries with Highest  deaths Rate compared to Population
Select Location, Population, MAX(total_deaths) as Highes_deaths,   MAX(CAST(total_deaths AS FLOAT) / CAST(population AS FLOAT)) * 100 as PercentPopulation_deaths
From Deaths

Group by Location, Population
order by PercentPopulation_deaths desc

----- Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,   MAX(CAST(total_cases AS FLOAT) / CAST(population AS FLOAT)) * 100 as  PopulationInfected
From Deaths
Group by Location, Population
order by PopulationInfected desc



-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Deaths

Where continent is not null 
Group by Location
order by TotalDeathCount desc


---Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Deaths

Where continent is  not null 
Group by continent
order by TotalDeathCount desc


------ GLOBAL NUMBERS % of Death


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(New_Cases as float))*100 as DeathPercentage
From Deaths
where continent is not null 

order by 1,2







