# filterData.R
#
# Purpose: Filter for a specific team's data to get values and rows/columns
#          of interest. Return the filtered data frame.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2018-08-04
#
# ==============================================================================

filterData <- function(combinedData, team){
    selection <- (combinedData$team_ID == team)
    combinedData <- combinedData[ selection , ]
    
    # Organize columns.
    combinedData <- combinedData[c("last_name", "WAR", "actual_salary")]
    
    return(combinedData)
}

# [END]

