banana
======


banana time!!!!



latest banana
-------
http://upplication.github.io/banana



installation from this repo
------------

Clone this repo and install the dependencies:


* [nodejs](http://nodejs.org/)
* [bower](http://bower.io/)
* [karma](http://karma-runner.github.io/)
* [grunt-cli](http://gruntjs.com/getting-started)
* [Compass Core](http://compass-style.org/install/)
* Install node dependencies -- `npm install`
* Install project dependencies -- `bower install`

scripts
-----------
`grunt server`:
Starts development environment:
* Watch changes in coffee, sass, jade -> compile
* live reload browser

`grunt`:
Builds the project
* Unifies js & css

`grunt banana`:
Builds the project and uploads it to gh-pages




config
---------

### Bananas config

`bananas/config.json`:

Configuration of available bananas

* version: {String} version of the file
* config: {Object}
	* bananas {Array}
		* day: {number} day of the banana
		* author: {String} name of the author of the banana
		* index: {String} name of the html, located at the folder 'bananas' and subfolder '{DAY}' where DAY is the previous parameter
		* tags: {Array of String} (optional) tags of the banana


Ex.:

    {
    	"version": "0.0.1",
    	"bananas": [
    		{
    			"day": 20131211,
    			"author": "borja",
    			"index": "banana.html",
    			"tags":[
    				"tag1"
    			]
    		},{
    			"day": 20131207,
    			"author": "raul",
    			"index": "banana.html",
    			"tags":[
    				"tag2 tag3"
    			]
    		}
    	]
    }