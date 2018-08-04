# collectData.R
#
# Purpose: Read .csv files into data frames, and generically filter them by 
#          year. Return a merged data frame with batters and pitchers both.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2018-08-04
#
# ==============================================================================

collectData <- function(year){
    # Read batter_values.csv file and filter for hitters only.
    batterData <- read.csv("data/batter_values.csv", stringsAsFactors = FALSE)
    # Remove any batters that switched teams mid season as their WAR and
    # salary are divided between the teams, and this is not reflected in
    # the csv files given.
    selection <- duplicated(batterData[ , c("player_ID", "year_ID")])
    batterData <- batterData [ !selection , ]
    
    selection <- ((batterData$year_ID == year) & (batterData$WAR != "NULL") 
                  & (batterData$salary != "NULL"))
    batterData <- batterData[ selection , ]
    
    # Read pitcher_values.csv file and filter for pitchers only.
    pitcherData <- read.csv("data/pitcher_values.csv", stringsAsFactors = FALSE)
    # Remove any pitchers that switched teams mid season as their WAR and
    # salary are divided between the teams, and this is not reflected in
    # the csv files given.
    selection <- duplicated(pitcherData[ , c("player_ID", "year_ID")])
    pitcherData <- pitcherData [ !selection , ]
    
    selection <- ((pitcherData$year_ID == year) & (pitcherData$WAR != "NULL") 
                  & (pitcherData$salary != "NULL"))
    pitcherData <- pitcherData[ selection , ]
    
    
    # Merge data frames.
    combinedData <- rbind(batterData, pitcherData)
    
    # Extract last names only for plotting on horizontal axis.
    combinedData$last_name <- regmatches(combinedData$name_common, 
                                         regexpr(" ", 
                                                 combinedData$name_common), 
                                         invert = TRUE)
    combinedData$last_name <- sapply(combinedData$last_name, tail, 1)
    
    # Sort by last name.
    combinedData <- combinedData[ order(combinedData$last_name) , ]
    
    
    # VERY IMPORTANT: Check for duplicate player_ID to account for pitchers
    # hitting in NL ballparks, a batter pitching (common during a blowout 
    # game), or 2 way players (Ex: Shohei Ohtani).
    combinedData$WAR <- as.numeric(combinedData$WAR)
    selection <- duplicated(combinedData$player_ID)
    duplicates <- cbind((combinedData[ selection , ])["player_ID"], 
                        (combinedData[ selection , ])["WAR"])
    
    # Remove duplicates.
    combinedData <- combinedData[ !selection , ]
    
    # Get indices corresponding to 1st instance of player_ID in combinedData.
    selection <- match(duplicates$player_ID, combinedData$player_ID)
    
    # Add WAR from duplicates data frame onto the WAR on combinedData.
    combinedData[ selection , ][ , "WAR"] <- 
      (combinedData[ selection , ][ , "WAR"] + duplicates$WAR)
    
    # Change "salary" to "actual_salary" to distinguish from "deserved_salary".
    colnames(combinedData)[names(combinedData) == "salary"] <- "actual_salary"
    # Change actual_salary values to numeric.
    combinedData$actual_salary <- as.numeric(combinedData$actual_salary)
    
    return(combinedData)
}

# [END]

