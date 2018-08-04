# plotData.R
#
# Purpose: Plot a bar chart where the x-axis lists the names of all players
#          on the team, and the y-axis lists salaries in millions of dollars.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2018-08-04
#
# ==============================================================================

plotData <- function(combinedData, year, team){
    barplot(combinedData$actual_salary / 1000000,
            las = 2,
            ylab = "Salary in millions of dollars",
            names.arg = combinedData$last_name,
            main = paste("Moneyball Value of", year, team, "players", 
                         sep = " "),
            # Scale is structured according to the highest salary.
            ylim = range(pretty
                         (c(0, 
                            max(combinedData$actual_salary / 1000000, 
                                combinedData$deserved_salary / 1000000)))),
            col = "#FF000055")
    
    barplot(combinedData$deserved_salary / 1000000,
            las = 2,
            add = TRUE,
            col = "#32CD3255")

    # Allows for legend to be outside of plotting region.
    par(xpd = TRUE)
    
    legend("topright",
           c("Actual", "Deserved"),
           fill = c("#FF000055", "#32CD3255"),
           cex = 0.8,
           inset = c(-0.09,-0.18),
           bty = 'n')
}

# [END]
