# VinoLoca
VinoLoca is an application designed to help wine enthusiats organize their wine collections by country and category.  First, a country must be added (if there are currently no wines from that country) along with a wine.  Then an individual may view wines from that country - and add wines to the country being viewed through the specific country index page. Additionally, wines may be deleted from a country as well as updated (full CRUD). 

## Installation Instructions

First; fork and clone this repository.  Then run bundle install in the command line.  If an individual would like to sign in with google - the following must be created:
GOOGLE_CLIENT_ID=YOUR CLIENT ID 
GOOGLE_CLIENT_SECRET=YOUR SECRET 

In order to create the above follow the instructions per the following link: https://github.com/zquestz/omniauth-google-oauth2 and replace <YOUR CLIENT ID> with the ID provided by google.  Do the same for <YOUR SECRET>.  In order to start the application, run rails s in the command line and use localhost:3000 in the browser to navigate to the application.

### Sample Demo Video

A description of how to use this program can be found at the following link:
[![VinoLoca](https://img.youtube.com/vi/MW_Trxq1N8s/0.jpg)](https://www.youtube.com/watch?v=MW_Trxq1N8s)
