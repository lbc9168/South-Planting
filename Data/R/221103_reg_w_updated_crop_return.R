########################################
## Combine the updated county-leverl ag return data
## with the regression data
##
## Date: 2022-11-03
## Creator: Bingcai Liu
########################################


#### Import Data

## original regression
library(haven)
south_reg_220404 <- read_dta("GitHub/South-Planting/Data/Stata/south_reg_220404.dta")

## ag return data
library(readxl)
Crop_return_SE <- read_excel("GitHub/South-Planting/Data/Crop_return_SE.xlsx")


#### merge data

## subset data, keep key columns
library(dplyr)
Crop_return <- subset(Crop_return_SE, select = c(year, STATECD, COUNTYCD,
                                                 corn_GrossReturn, Soybean_GrossReturn))

south_reg_221103 <- merge(south_reg_220404, Crop_return, by = c("year", "STATECD", "COUNTYCD"))


#### export data
library(foreign)
write.dta(south_reg_221103, "south_reg_221103.dta")
