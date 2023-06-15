# Weather app
## Description
Downloads and displays weather data. 
Allows filtering, refresh, view details and sorting. 
Built with example unit test with mock data.

Used SwiftUI, MVVM and Combine

## Approach
The app is downloading an entire json file with 300+ items and there is no api server that allows for getting by page.
The approach taken for this demo is to pre-sort the items into 3 versions once data is downloaded. Then a tab view is used to render all list versions into each page giving the effect of instant load without having the app to sort the long list all the time.

For the filter functionality the app simply applies a filter existing list and displays result.
Meanwhile, the refresh functionality redownloads the data and shows a loading screen to prevent user events until data is displayed.

## Video
https://github.com/jeff-tabios/news-perform-weather/assets/52874288/411b5653-f5e2-4af0-b6fb-5267b83abfc7

