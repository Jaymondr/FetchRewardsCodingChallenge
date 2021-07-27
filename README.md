# FetchRewardsCodingChallenge
This coding challenge consumes the Seat Geek open API, and displays results on a table view, a detail screen to view event details, favorite an event, get directions in maps, and visit the Seat-Geek site.

I created this project as a coding exercise given to me by a Fetch Rewards representative to showcase some of my skills.

**Requirements**
• Write your application for Native iOS Platform preferably with Swift (or Objective-C)
• Favorited events are persisted between app launches
• Events are searchable through SeatGeek API
• Unit tests are preferable.
• Third party libraries are allowed.
• Cocoapods, Carthage, Swift Package Manager are all allowed as long as there is a
clear instructions on how to build and run the application.
• Make sure that the application supports iOS 12 and above.
• The application must compile with Xcode 12.x.x
• Please add a README or equivalent documentation about your project.
• The screenshots are just blueprints. UI doesn’t have to follow them.

Directions
1. Run the app you will see a search bar and blank table view. Begin searching by typing the event name, the search results will update as user types. 
2.  The the keyboard is dismissed when a cell is selected and will remain dismissed until searchbar is accessed again.
3. To view event details select event cell and user will be taken to a detail view. On the detail view, I've included the event title, image, location, local time of the event, a favorite button, open in Maps button(Opens with Apple maps), Get tickets button, and a Powered By Seat Geek referenceat the bottom.

BUTTONS
1. Get Tickets button: Takes the event URL and opens the link online giving user the ability to purchase tickets for the event they were viewing.

2. Open in Maps button: Takes the event latitude and longitude and displays the location on apple maps.

3. Powered by Seat Geek button: Takes the user to Seat Geeks website.

I also added alert controllers to notify the user that they are going to be directed to another page on the maps and tickets buttons.

Favorites
When the heart shaped favorites button is tapped, a heart will also appear on the cell in the table view. 
Favorites are saved to file manager, using JSON persistence so the app will still show favorites when it is closed and re-opened.





