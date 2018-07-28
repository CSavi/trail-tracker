Step 1. The client makes a request via browser to some route. Sinatra will grab that route and send it to the controller: TrailsController.

Step 2. The controller action will ask the model for an object or a list of objects: @trails = Trails.all

Step 3. The model will talk to the database using SQL

Step 4. The database will return the data and the model will convert that data into objects

Step 5. The model will take the objects and send them back to the controller

Step 6. The controller action will send those objects to the view for rendering.

Step 7. The view will take the objects from the controller and render HTML for the web browser and send that HTML back to the controller.

Step 8. The controller sends the HTML to the client (browser) to be viewed by the user.

FUTURE FEATURES:

1. Connect to Bootstraps for better styling (nav bars for each page)
2. Add feature for user to like other posts and save those likes to their account for future reference.
3. Enable maps and photos to be added to a trail 
