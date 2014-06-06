# Github Issues to Trello


## Install

* Deploy Heroku Server with a clone of this repo
* In Heroku app dashboard, set 3 variables
 * `PUBLIC_KEY` - Trello public key
 * `TOKEN` - Trello token
 * `LIST_ID` - ID of the list to put the cards
* Go to your Github repo -> settings -> webhooks
 * URL of the hook : `http://YOUR-APP.herokuapp.com/posthook`
 * Set the hook to trigger when an issue open or close

 Enjoy!
 
