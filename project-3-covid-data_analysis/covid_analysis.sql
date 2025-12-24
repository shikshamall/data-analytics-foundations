use portfolioproject;
select * from CovidVaccination order by 3,4;

--selecting data that we will use
select location,date,total_cases,new_cases,total_deaths,population from CovidDeaths order by 3,4;


--death percentage
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage from CovidDeaths order by 1,2;

--infected percentage
select location,date,total_cases,population,(total_cases/population)*100 as Infected_Percentage from CovidDeaths order by 1,2;

--To get the max of the cases
select location,population,max(total_cases) as Highest_Number_infected,(max(total_cases)/population)*100 as Max_infected_percentage from CovidDeaths 
group by location,population order by 1,2;

--Show max death rates
select location,max(cast(total_deaths as int)) as Death from CovidDeaths where continent is not null group by location order by Death desc

--to show max death in continents
select continent,max(cast(total_deaths as int)) as Death from CovidDeaths where continent is not null group by continent order by Death desc

--Global numbers
select date,sum(new_cases) as Total_cases,sum(cast(new_deaths as int)) as Total_deaths, 
sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_Percentage from CovidDeaths where continent is not null group by date order by 1,2

--Joining 2 tables
select * from CovidDeaths cd 
join CovidVaccination cv on
cd.location=cv.location and
cd.date=cv.date

--getting certain columns
select cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations
from CovidDeaths cd 
join CovidVaccination cv on
cd.location=cv.location and
cd.date=cv.date
where cd.continent is not null
order by 2,3

--looking at total population and vaccination 
select cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
sum(convert(int,new_vaccinations)) over (partition by cd.location order by cd.location,cd.date)
from CovidDeaths cd 
join CovidVaccination cv
on cd.location=cv.location and cd.date=cv.date
where cd.continent is not null
order by 2,3

--creating a function
with popvsvac(continent,location,date,population,new_vaccinations,sum_peo_vaccinated)
as
(
select cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
sum(convert(int,new_vaccinations)) over (partition by cd.location order by cd.location,cd.date) as sum_peo_vaccinated
from CovidDeaths cd 
join CovidVaccination cv
on cd.location=cv.location and cd.date=cv.date
where cd.continent is not null
)

select *,(sum_peo_vaccinated/population)*100 as Vaccinated_percent from popvsvac


--Creating a new table and adding in values
drop table if exists people_vaccinated
create table people_vaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
date datetime,
Population numeric,
New_Vaccination numeric,
Sum_vaccinated numeric
)

insert into people_vaccinated
select cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
sum(convert(int,new_vaccinations)) over (partition by cd.location order by cd.location,cd.date) as sum_peo_vaccinated
from CovidDeaths cd 
join CovidVaccination cv
on cd.location=cv.location and cd.date=cv.date
--where cd.continent is not null

select *,(sum_vaccinated/population)*100 as Vaccinated_percent from people_vaccinated


