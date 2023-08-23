--Using data from the Nasvhille Housing market, I run SQL queries to clean the data.

SELECT*
FROM PortfolioProjectHousing.dbo.NashvilleHousing


--Change SaleDate format from DateTime to Date

/* HAVING DROPPED SALEDATE COLUMN AT THE END OF EXERCISE, REINSTALLING IT FROM ORIGINAL 'UNALTERED' TABLE)

UPDATE t2
SET t2.SaleDate = t1.SaleDate
FROM PortfolioProjectHousing.dbo.NashvilleHousing t2
     JOIN PortfolioProjectHousing.dbo.NashvilleUnaltered t1 ON t2.[UniqueID ] = t1.UniqueID; */


SELECT 
SaleDate, 
CONVERT(DATE,SaleDate)
FROM PortfolioProjectHousing.dbo.NashvilleHousing

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
ALTER COLUMN SaleDate DATE


--Populate Property Address
SELECT *
FROM PortfolioProjectHousing.dbo.NashvilleHousing
WHERE PropertyAddress IS NULL
ORDER BY ParcelID

SELECT
A.ParcelID,
A.PropertyAddress,
B.ParcelID,
B.PropertyAddress,
ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM PortfolioProjectHousing.dbo.NashvilleHousing A JOIN PortfolioProjectHousing.dbo.NashvilleHousing B
	ON A.ParcelID = B.ParcelID
	AND A.[UniqueID ] <> B.[UniqueID ]
WHERE A.PropertyAddress IS NULL --OR B.PropertyAddress IS NULL
--ORDER BY ParcelID

UPDATE A
SET PropertyAddress = ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM PortfolioProjectHousing.dbo.NashvilleHousing A JOIN PortfolioProjectHousing.dbo.NashvilleHousing B
	ON A.ParcelID = B.ParcelID
	AND A.[UniqueID ] <> B.[UniqueID ]
WHERE A.PropertyAddress IS NULL


--Breaking out Addresses into individual columns (Address, City, State)
--PROPERTY ADDRESS
SELECT PropertyAddress
FROM PortfolioProjectHousing.dbo.NashvilleHousing

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address,
--SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, 20) as City
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) as City
FROM PortfolioProjectHousing.dbo.NashvilleHousing

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
ADD PropertySplitAddress VARCHAR(255)

UPDATE PortfolioProjectHousing.dbo.NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
ADD PropertySplitCity VARCHAR(255)

UPDATE PortfolioProjectHousing.dbo.NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))


--OWNER ADDRESS
SELECT OwnerAddress
FROM PortfolioProjectHousing.dbo.NashvilleHousing

SELECT
PARSENAME(REPLACE(OwnerAddress,',','.'),3) AS OwnerAddress,
PARSENAME(REPLACE(OwnerAddress,',','.'),2) AS OwnerCity,
PARSENAME(REPLACE(OwnerAddress,',','.'),1) AS OwnerState
FROM PortfolioProjectHousing.dbo.NashvilleHousing

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
ADD OwnerSplitAddress VARCHAR(255)

UPDATE PortfolioProjectHousing.dbo.NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3) 

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
ADD OwnerSplitCity VARCHAR(255)

UPDATE PortfolioProjectHousing.dbo.NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2) 

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
ADD OwnerSplitState VARCHAR(225)

UPDATE PortfolioProjectHousing.dbo.NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1) 


--Change Y and N to Yes and No in SoldAsVacant.
SELECT DISTINCT SoldAsVacant, COUNT(SoldAsVacant)
FROM PortfolioProjectHousing.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant,
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	 WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
FROM PortfolioProjectHousing.dbo.NashvilleHousing

UPDATE PortfolioProjectHousing.dbo.NashvilleHousing
SET SoldAsVacant =
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	 WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END

--Remove Duplicates.

WITH RowNumCTE AS(
SELECT*,
ROW_NUMBER() OVER (
PARTITION BY ParcelID,
			 PropertyAddress,
			 SaleDate,
			 SalePrice,
			 LegalReference
			 ORDER BY UniqueID
			 ) row_num	
FROM PortfolioProjectHousing.dbo.NashvilleHousing
--ORDER BY ParcelID
)
SELECT*
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress

WITH RowNumCTE AS(
SELECT*,
ROW_NUMBER() OVER (
PARTITION BY ParcelID,
			 PropertyAddress,
			 SaleDate,
			 SalePrice,
			 LegalReference
			 ORDER BY UniqueID
			 ) row_num	
FROM PortfolioProjectHousing.dbo.NashvilleHousing
--ORDER BY ParcelID
)
DELETE
FROM RowNumCTE
WHERE row_num > 1

SELECT*
FROM PortfolioProjectHousing.dbo.NashvilleHousing


--Delete Unused Columns.
SELECT*
FROM PortfolioProjectHousing.dbo.NashvilleHousing

ALTER TABLE PortfolioProjectHousing.dbo.NashvilleHousing
DROP COLUMN PropertyAddress, OwnerAddress, TaxDistrict
