## **WeatherApp: A Simple and Modern Weather App**

WeatherApp is a SwiftUI application designed to provide a clear and concise view of current weather conditions and location. It utilises the latest SwiftUI features, including glassmorphism, for a sleek contemporary design. For the GitHub repository [click here](https://github.com/ComanderPotato/WeatherAppV2).

## Application Structure:
### Main Structure:
|--MainView <br />
&emsp;   |--MainSearchBarView <br /> 
&emsp;&emsp;        |--MainSearchBarFieldVIew <br />
&emsp;&emsp;        |--MainSearchBarItemView <br />
&emsp;&emsp;&emsp;            |--ForecastView <br />
&emsp;    |--MainListView <br />
&emsp;&emsp;        |--MainListItemView <br />
&emsp;&emsp;&emsp;            |--ForecastView <br />
&emsp;&emsp;&emsp;            |--ForecastListView <br />
&emsp;&emsp;&emsp;&emsp;                |--ForecastListLocationView <br />
&emsp;&emsp;&emsp;&emsp;                |--ForecastListTemperaturesView  <br />
### Forecast Structure
|--ForecastView <br />
&emsp;    |--ForecastHeaderView <br />
&emsp;    |--ForecastHourView <br />
&emsp;&emsp;        |--ForecastHourItemView <br />
&emsp;&emsp;        |--SunIconView <br />
&emsp;    |--ForecastDayView <br />
&emsp;&emsp;        |--ForecastDayItemView <br />
&emsp;&emsp;&emsp;            |--WeatherIconView <br />
&emsp;&emsp;&emsp;            |--ForecastTemperatureBarView <br />

## Description on Each View:
### MainView:
This view main entry point into the application. On appearance, it requests the users location which show at the top of their view depending on their selection. The MainView is also paired with a MainViewModel, which handles necessary functionionaility such as, requesting location, saving, removing and deleting from local storage. This MainViewModel is also an environment object that gets passed down to the necessary views that requires these functions. The view holds other views as well, such as the MainSearchBarView, and the MainListView which is passed as Content to the view previously mentioned.

### MainSearchBarView:
This view is the main content that users will see. It allows the user to view weather from their saved locations, as well as search up new locations using the MainSearchBarFieldView. This view is also paired with a MainSearchBarViewModel, which handles functionality for fetching data that the user inputs in the search bar. Depending on if the searchbar is focused and/or if information has been fetched, it will either show the list of saved locations, or a list of queried results.

### MainSearchBarItemView:
This view holds queried results via the fetchQueriedResults function in MainSearchBarViewModel. It is a NavigationLink, which has a destination set to the ForecastView, and information regarding the queried locations name, region and country. A condition is set within the toolbar of the ForecastView which allows a user to add it to their local storage if it doesn't already contain that location.

### MainListView:
This is an intermediate view that holds the MainViewModel environment object that iterates through the users local storage and displays their saved locations. On appearance, it checks whether a user selected to share their location, if so, the first location it will show will be their location with a different display. 
    
### MainListItemView:
This view is very similar to the MainSearchBarItemView, with the fact that it displays NavigationalLinks with a destination set to the ForecastView, which is passed the current viewModel as an environment object. Each MainListItemView also has a MainListView, which stores individual forecast data which is fetched using information passed to it. Within each NavigationLink, a ForecastListView is displayed showing relevant information to a user, it is also passed an environment object with the current view model.

### ForecastListView:
This is an intermediate view that gets passed the MainListItemViewModel environment object for a specific forecast. It then passes this information to the ForecastListLocationView, and the ForecastListTemperatureView to display important information about the location.

### ForecastListLocationView:
This view shows information (depending if it's the users current location) on the current locations name, time, and condition. It also receives the MainListItemViewModel environment variable which prepares the hourly forecasts for the appropriate views.

### ForecastListTemperatureView:
This view shows information on the current locations temperature, minimum and maximum temperature for the day.

### ForecastView:
This view is also an intermediate view that branches off into independent views such as, the ForecastHeaderView, ForecastHourView and ForecastDayView.

### ForecastHeaderView:
This view shows information on the current locations temperature, minimum and maximum temperature for the day.

### ForecastHourView:
This view is also an intermediate view which loops through the MainListItemViewModel environment objects hourly forecasts array, and displays them. On appearance, it also gets information pertaining to the sunrise and sunset via its personal ForecastHourViewModel, which will be used within the loop to display when the sun will rise and set via the SunIconView.

### ForecastHourItemView:
This view displays information regarding each specific hour in the previously mentioned hourly forecasts arrays. It displays information regarding the time of day or "Now" if it is the current hour, a WeatherIconView which displays an image and the chance of rain if there is any, and the temperature at that hour.

### ForecastDayView
Similarly to the ForecastHourView, this is an intermediate view that gets passed the MainListItemViewModel environment object as well, which it loops through to retreive each daily forecast. On appearance, it also retreives information regarding the lowest and highest temperature out of this data, which will be used shortly.

### ForecastDayItemView:
This view will display information regarding the forecast of the day, such as the specific day, an image of the days condition via the WeatherIconView, the minimum and maximum temperature of the day, and the ForecastTemperatureBarView.

### ForecastTemperatureBarView:
This view is a temperature bar, which is displays a gradient showing the minimum and maximum temperature for each day, in comparison to the gray outer bar which is the minimum and maximum of the entire 10 day forecast. For todays forecast, a circle is displayed in the bar which shows the current temperature at that time of the day, compared to the temperature range for the entire day.


## Key Features:

+ Optimised Data Fetching: Asynchronous data fetching ensures quick updates on current weather conditions.
+ Simple and Easy to Read: WeatherApp prioritises ease of use with a user-friendly interface that allows you to see the weather information at a glance.
+ Modern Design: The app leverages glassmorphism to create a visually appealing and informative user experience.
+ Accessibility Focus: The app prioritises accessibility with high-contrast text and clear UI elements.



Screenshots... will add when finished (or latest v)




## Tech/Framework:

* SwiftUI
* WeatherApi: https://www.weatherapi.com/docs/
* CoreLocation: https://developer.apple.com/documentation/corelocation



## Getting Started

1) Download and Launch: Download the WeatherApp and open it on your device.

2) Location Permission (Optional): The app may request access to your current location. Granting permission allows you to see the weather for your current area automatically.

3) Main Dashboard: Upon launch, you'll be directed to the main weather dashboard. If you granted location permission, the weather for your current location will be displayed prominently at the top of the list, titled 'My Location'.



## Searching for Locations

The weather dashboard features a search bar at the top to easily find weather information for other locations:

1) Enter Location: Type the desired location into the search bar.

2) Select Location: Choose the specific location you want to view from the search suggestions.

3) Detailed Forecast: You'll be directed to a detailed weather forecast for the selected location.



## Accessing Detailed Forecasts

There are two ways to access detailed weather forecasts within WeatherApp:

1) Main Dashboard: Simply click on any location displayed on the main dashboard. This will take you to a dedicated view with detailed forecast information for that specific location.

2) Search Functionality: Utilise the search bar on the dashboard to find a specific location (see "Searching for Locations"). Selecting a location from the search results will also display its detailed forecast.


## Saving Favorite Locations

WeatherApp allows you to save frequently viewed locations for quick and easy access:

1) Add Location: While viewing the detailed forecast for a desired location, tap the "Add" button located in the top left corner.

2) Main Dashboard: Navigate back to the main dashboard (usually by tapping a back button in the top left corner).

3) View Saved Location: The saved location will now be listed on the main dashboard. Simply tap the location to access its detailed forecast again.

Note: WeatherApp has a limit of 10 saved locations (including your current location) displayed on the main dashboard.



Things to further project: optional. . .

// list of things for R2 etc...
