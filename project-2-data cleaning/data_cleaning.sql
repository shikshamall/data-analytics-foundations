use portfolioproject

select * from house

--standazing date and modifying the table

select saledate, convert(date,saledate) from house

alter table house 
add dateconverted date

update house
set dateconverted= convert(date,saledate)

select dateconverted from house

--populate address data

select propertyaddress from house

select a.parcelid,a.propertyaddress,b.parcelid,b.propertyaddress,isnull(a.propertyaddress,b.propertyaddress)
from house a join house b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress= isnull(a.propertyaddress,b.propertyaddress)
from house a join house b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

select propertyaddress from house where PropertyAddress is null

--breaking address in various columns

select propertyaddress from house

select
SUBSTRING(propertyaddress, 1, CHARINDEX(',',propertyaddress)-1) as address1,
SUBSTRING(propertyaddress, CHARINDEX(',',propertyaddress) +1,len(propertyaddress)) as address2
from house

alter table house
add Address nvarchar(255)

update house
set Address =SUBSTRING(propertyaddress, 1, CHARINDEX(',',propertyaddress)-1) 

alter table house
add addresscity nvarchar(255)

update house
set addresscity=SUBSTRING(propertyaddress,charindex(',',propertyaddress)+1,len(PropertyAddress))


select PropertyAddress,address,addresscity from house

select 
PARSENAME(replace(owneraddress,',','.'),3),
PARSENAME(replace(owneraddress,',','.'),2),
PARSENAME(replace(owneraddress,',','.'),1)
from house

alter table house
add owneradd nvarchar(255)

update house
set owneradd=PARSENAME(replace(owneraddress,',','.'),3)

alter table house
add ownercity nvarchar(255)

update house
set ownercity=PARSENAME(replace(owneraddress,',','.'),2)

alter table house
add ownerstate nvarchar(255)

update house
set ownerstate=PARSENAME(replace(owneraddress,',','.'),1)

select owneradd,ownercity,ownerstate from house

--changing y and n to yes and no in soldasvacant field

select distinct soldasvacant,count(soldasvacant)
from house group by SoldAsVacant order by 2

select soldasvacant,
case when soldasvacant='Y' then 'Yes'
	 when soldasvacant='N' then 'No'
	 else soldasvacant
	 end
from house

update house
set SoldAsVacant =case when soldasvacant='Y' then 'Yes'
	 when soldasvacant='N' then 'No'
	 else soldasvacant
	 end

select distinct soldasvacant from house

--deleting duplicates
WITH RowNumCTE AS(
select *,
	ROW_NUMBER() over (
	partition by parcelid,
				 propertyaddress,
				 saleprice,
				 saledate,
				 legalreference
				 order by
				     uniqueid) row_num
from house
--order by ParcelID
)
select * from RowNumCTE where row_num>1

--delete unused columns
select * from house

alter table house
drop column owneraddress, taxdistrict, propertyaddress

alter table house
drop column saledate

select * from house
