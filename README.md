# Moneyball-Value
“A programmer combining their love of baseball and learning of R at the same time.”

<hr>

### Introduction
In today’s baseball world, “Wins Above Replacement” (WAR) has become a commonly used sabermetric statistic to assess a player’s overall value with 1 number only.   In short, this number is an approximation of how many wins a player has directly contributed to their team compared to if they were replaced by a replacement level player such as a minor leaguer.

If a player has a WAR of 0, this means that a minor leaguer could contribute relatively the same amount of production as that player could, however, a minor leaguer gets paid the league minimum in the range of $550,000.  On the other hand, the player mentioned could get paid tens of millions of dollars that they do not deserve, while simultaneously handcuffing his teams’ resources in a bid to get other players.

In MLB, teams are free to spend as much money as they wish as there is no salary cap.  However, some teams are more financially constrained than others and thus, they have to be creative to be competitive.  This is accomplished through a “Moneyball” approach first commonly used by Billy Beane of the Oakland Athletics (in which there is a movie about), where he found undervalued players who deserved more than their actual salary.

<hr>

### Program Details
This program has been designed to assess a baseball team’s money efficiency (Moneyball-Value) for a given year to assess if their players are getting the salary that they deserve depending on the money value of 1 WAR.  This value is calculated by dividing the total WAR from the total salary of all players for a given year to account for inflation.

The end result is a bar graph plotting salaries vs players’ last names. Deserved salary (in green) and actual salary (in red) are plotted on the same bar for direct comparison.

    • If a player’s bar contains green, it means that they are worth more than their actual salary and are underpaid. The more green their bar contains, the more underpaid they are.
    • If a player’s bar contains red, it means that they are not worth their actual salary and are overpaid.  The more red a bar contains, the more overpaid they are.
    • If a player’s bar contains neither green nor red, it means that they are roughly getting paid what they’re worth.

<img src="https://github.com/ahnjedid/Moneyball-Value/blob/master/barGraphScreenshot.png">

<hr>

### How to run the program
    1. Start by sourcing the file “getYearAndTeam.R”.  
    2. It will ask you to input a year between 1871 and 2018 (as 1871 is the earliest year that baseball statistics were recorded).
    3. It will then print a list of all teams in MLB for that year (in 3 letter team abbreviations) and ask you to type in 1 of them.  
    4. A bar graph will appear to the right of the console.  To enlarge the bar graph, click the zoom button above it.
    
<img src="https://github.com/ahnjedid/Moneyball-Value/blob/master/inputScreenshot.png">

Notes:

    • Input is foolproof to ensure that nothing else other than year and team abbreviation are accepted respectively.
    • Although the abbreviations are all printed as uppercase, lowercase is accepted as input.  
    • Please note that MLB teams that currently do not exist are included if you input a year in which the team did exist (Ex: 2004 Montreal Expos).
    
<hr>

### Program Limitations
Players who have switched teams mid-season will not appear in the bar graph of any teams that they were a part of for the given year.  Although the WAR that they gathered for each team was recorded, their salary for each respective team was not.   Thus, it was not possible to plot their actual salary.

In addition, some players may not appear in the bar graph for a given year, although they have played for their team for a full season.  This is because either their WAR or salary was written as “NULL” in the .csv files (which is out of my control), and thus, their name had to be filtered out.

<hr>

### Notes
For a full description of WAR including calculations, please visit the Fangraphs link here: https://www.fangraphs.com/library/misc/war/

Thank-you to Baseball Reference and Sean Lahman for providing baseball data in .txt and .csv format to the general public.  You can get these files for free here:

Baseball Reference: https://www.baseball-reference.com/about/  
Lahman’s Baseball Database: www.seanlahman.com/baseball-archive/statistics/ 
