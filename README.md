# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Run `bundle` to install Ruby gems for the API
* Run `npm install` to install Javascript files for the app

* Database creation
  * `rake db:scrape_stations` pulls all station data
  * `rake db:scrape_hourlies` pulls all hourly data
  * `rake db:scrape_dailies` pulls all daily data
  * `rake db:scrape_monthlies` pulls all monthly data

# WeatherWokeAPI

This API is a collection of all hourly/daily/monthly data from every NWS-certified station in the USA. Main information has been pulled into this API, for additional information not included please visit the [NCEI](https://www.ncdc.noaa.gov/orders/qclcd/) site and view the `QCLCDdate.zip` links.

# WeatherWokeApp

[index](http://imgur.com/kUh6Bdl.png "index")

This application allows a user to view all data of weather conditions that occurred for any date and location in the US over the past 10 years, including clear weather graphs to help visualize the weather breakdowns.

For any date and location, a user can view the main info for that day, the hourly breakdowns, daily data, monthly summaries, and top social media #weather tweets and images that occurred. They can also choose to see weather leading up to that date/location, see a year to year comparison of weather conditions for the chosen date and location to see the trends, and also see a projection of the future weather for that day either by a general climate or a trend prediction.

The primary focus of this application is to help with forensic meteorological analysis to reconstruct weather conditions that occurred in the past, while also letting users see what the most likely climate and weather will be like in the future.

## Components
- NavBar - lets users log in (and out) to add (and remove) their favorite locations
- SearchBar - select a location and a date to load data
- Data - contains a table of weather condition data for a certain day
- Graph - show a visual graph representation of that data
- Symbols - handles weather image symbols shown from data
### stretch goals
- Forecasts - show comparisons to MOS forecasts for that day
- Nearby - show a map with nearby locations to load in data for
- Tweets - queries for #weather tweets based on date/location
- Images - queries for #weather images based on date/location
