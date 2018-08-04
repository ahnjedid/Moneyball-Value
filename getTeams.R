# getTeams.R
#
# Purpose: Get and return all baseball team IDs in MLB for a given year.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2018-08-04
#
# ==============================================================================

getTeams <- function(year){
    teams <- read.csv("data/teams.csv", stringsAsFactors = FALSE)
    selection <- (teams$yearID == year)
    teams <- teams [ selection , ]
    return(teams$teamIDBR)
}

# [END]
