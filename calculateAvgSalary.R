# calculateAvgSalary.R
#
# Purpose: Calculate and return the average salary of an MLB player 
#          (hitter or pitcher) for 1 WAR for a given year.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2018-08-04
#
# ==============================================================================

calculateAvgSalary <- function(year){
    source("collectData.R")
    combinedData <- collectData(year)
    
    # Add up the salaries of all baseball players for a given year.
    total_salary <- sum(combinedData$actual_salary)
    
    # Add up the WAR of all baseball players for a given year.
    total_WAR <- sum(combinedData$WAR)
    
    # Return the average salary for 1 WAR by dividing the total WAR 
    # from the total salary.
    return(total_salary / total_WAR)
}