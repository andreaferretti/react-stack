React stack
===========

This is the skeleton of a basic single page application based on

* CoffeeScript
* Require.js to manage modules
* Facebook React for the views
* SASS and Compass for the stylesheets

I have also added a few modules that are not mandatory, but are useful common dependencies of most apps:

* Crossroads.js and Hasher to handle routing
* Prelude.ls, which is a general purpose collections and utility library
* Pajamas to fire HTTP requests and return Q promises

Usage
-----

The skeleton uses Bower to handle client-side dependencies and Grunt to build the actual application. First, install the necessary Grunt plugins with

    npm install

and add the client side dependencies with

    bower install

Then you have the commands

    grunt server

to interactively develop the application, with auto-refresh, and

    grunt

to build a self-contained distribution of the app in the `dist` directory.
