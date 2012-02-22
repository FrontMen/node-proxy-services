Node-Proxy-Services is a script that runs both HTTP and HTTP Proxy servers as local instances on a developer's machine.

## Getting Started

Developers frequently need a local web server for development purposes. While [nginx](nginx.org) and [Apache](http://httpd.apache.org/) are industrial-level servers, Node.js and Coffeescript can be used to quickly start a development server for any project. 

Unfortunately, developers often need BOTH a local web server and easy-access to remote data services.
HTTP Proxy servers allow developers to easily develop HTML5, Javascript,and other applications that consume remote dataservices and `bypass` all security issues of cross-domain restrictions/workarounds.

This project provides CoffeeScript files to easily configure and launch both servers with one (1) single command. 

### Requirements

* [nodeJS](http://github.com/ry/node) ( versions: 0.6.x or later )
* [npm](http://github.com/isaacs/npm)
* [coffee-script](https://github.com/jashkenas/coffee-script) ( installed via NPM; version: 1.2 or later )  
* A WebKit based browser: Chrome, Safari, etc.

### Install

Copy the `run.coffee` and `./node_modules` to a `scripts` directory within you project folders.
Open a Terminal window and cd to your apps folder
Run the script:

    coffee ../scripts/run.coffee
    
Coffeescript will run the specified script on top of Node.js… it could not get any easier!


![Screenshot](https://github.com/ThomasBurleson/node-proxy-services/raw/master/docs/illustration.png)<br/>


### Configuration

The run.coffee script contains defaults for local and remote URIs:

        # 
        # Include the HTTP and HTTP Proxy classes
		# @see http://nodejs.org/docs/v0.4.2/api/modules.html
		#
		ext = require('httpServers')

		# Main application
		#
		main = (options) ->

			options ||= { 
					'proxy_regexp' : /^\/api\/json/
					'local_host'   : '127.0.0.1' 		
					'local_proxy'  : 8080
					'local_port'   : 8000
					
					'remote_host'  : 'services.mydomain.com'    
					'remote_port'  : 80
				}

			new ext.HttpProxyServer() .start( options )
			new ext.HttpServer()      .start( options )

			return	

		# Auto-start the two (2) web servers
		#
		main()    

Developers should change the `options` to conform to their desired configurations.

### Usage

The `run.coffee` script will launch two (2) servers:

  * HTTP server listening on `http://localhost:8000`
  * HTTP Proxy server listening on `http://localhost:8080`
  
All applications requests for resources should be directed to the `localhost:8080`. If any requests are actually remote data service requests, those requests are proxied to the remote server. All other requests use the localhost:8000 as a local fallback (and are not proxied).

For the above configuration, the option ` proxy_regexp` is used to specify a regular expression that will be used to match part of the URI. 

    http://localhost:8080/index.html           --> forwarded to -->  http://localhost:8000/index.html
    http://localhost:8080/api/json/catalog.xml --> proxied to   -->  http://services.mydomain.com:80/catalog.xml
    
According to our configuration above, if any AJAX or other HTTP GET uses `/api/json` then it will be routed to the remote server at `http://services.mydomain.com:80/`.  

![Screenshot](https://github.com/ThomasBurleson/node-proxy-services/raw/master/docs/using_proxy_services.png)<br/>  

### Disclaimers

These scripts are NOT meant for production use. These simple facilitate local web servers with cross-domain support.

This project does NOT duplicate the GitHub efforts for Node or any extensions. Rather this project leverages various GitHub libraries to quickly and painlessly configure both an HTTP server and a HTTP Proxy Server.


## Thanks

This project respectfully uses code from and thanks the authors of:

* [CoffeeScript](https://github.com/jashkenas/coffee-script)
* [NodeJS](http://github.com/ry/node)
* [NPM](http://github.com/isaacs/npm)
* [node-http-proxy](https://github.com/nodejitsu/node-http-proxy)
* [AngularJS Seed Project](https://github.com/angular/angular-seed)
* [CafeTownsend - AngularJS](https://github.com/ThomasBurleson/angularJS-CafeTownsend)