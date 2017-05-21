## Blocmetrics: an application service that tracks events on websites.

Made with my mentor at [Bloc](http://bloc.io).

# Configuration

Start by cloning the repository:

$ git clone https://github.com/Bloc/bloc-backend-project-starter.git <your-backend-project-name>

The project uses [Atom](https://atom.io/) in development. In your local environment, please [download](https://atom.io/) Atom and install it. Once installed, open and run Atom. Hit ```CMD+SHFT+P``` if you're on a Mac or ```CTRL+SHFT+P``` if you're using a Windows machine. Start typing "Install Package", select "Setting View: Install Packages and Themes" and hit enter. This opens the "Install" section of "Setting". In the search box, enter "atom-live-server", click enter and scroll down to the "atom-live-server" package and install it. ```atom-live-server``` launch a simple development HTTP server with live reload capability.

## Run the Application

Run the application using the rails server task:

```
$ rails s
```

Atom runs a simple server on port 3000. To view it in a any browser, go to [http://localhost:3000](http://localhost:3000).

## JavaScript Code Snippet

To track events on your website, add this code snippet to your application:

```
blocmetrics.report = function(eventName) {
   // #1
   var event = {event: { name: eventName }};

   // #2
   var request = new XMLHttpRequest();
   // #3
   request.open("POST", "http://localhost:3000/api/events", true);
   // #4
   request.setRequestHeader('Content-Type', 'application/json');
   // #5
   request.send(JSON.stringify(event));
}
```
