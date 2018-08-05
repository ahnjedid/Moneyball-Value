# getYearAndTeam.R
#
# Purpose: Ask user to input an year and a team of interest, and plot a bar 
#          chart to determine how much their players deserved to get paid 
#          depending on their WAR compared to their actual salary.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2018-08-04
#
# ==============================================================================

# 1871 is the earliest year that baseball statistics were recorded and 2018 is
# the latest year.
years <- as.character(c(1871:2018))
year <- readline(prompt = "Please enter any year of interest from 1871-2018: ")
while(!(any(year %in% years))){
    year <- readline(
      prompt = "Please enter any year of interest from 1871-2018: ")
}
# Convert year from character to integer after validation is complete.
year <- as.integer(year)


# Get all baseball team IDs in MLB for that year.
source("getTeams.R")
teams <- getTeams(year)
# Ask user for a team ID out of the ones listed.
print(teams)
team <- toupper(readline(
  prompt = "Please type a team ID of interest from the list above: "))
while(!(any(team %in% teams))){
    print(teams)
    team <- toupper(readline(
      prompt = "Please type a team ID of interest from the list above: "))
}
print("Please wait while it processes...")


# Collect and filter data depending on the given year and team of interest.
source("collectData.R")
source("filterData.R")
combinedData <- collectData(year)
combinedData <- filterData(combinedData, team)

# Get the ratio of 1 WAR to deserved salary for a given year.
source("calculateAvgSalary.R")
ratio <- calculateAvgSalary(year)
# Calculate the rounded salary that each individual player on the team
# deserved to get paid depending on their WAR.
combinedData$deserved_salary <- round(combinedData$WAR * ratio)

# Any player who has a negative WAR deserves none of their salary as a
# negative salary does not exist.
selection <- (combinedData$deserved_salary < 0)
combinedData [ selection , ][ , "deserved_salary"] <- 0

# Plot the data.
source("plotData.R")
plotData(combinedData, year, team)

print("Done! Please click the zoom button above the bar graph.")

# Clean up data.
rm(selection)
rm(team)
rm(teams)
rm(year)
rm(years)

# [END]
