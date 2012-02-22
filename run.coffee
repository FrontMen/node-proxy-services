# ************************************************
# Build HTTP and HTTP_PROXY servers
#
#  Note: to debug Node.js scripts, 
#        see https://github.com/dannycoates/node-inspector
#
# Copyright 2012     Mindspace, LLC.
# ************************************************

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
					'remote_host'  : 'data.gridlinked.info'    			
					'remote_port'  : 80
				}

			new ext.HttpProxyServer() .start( options )
			new ext.HttpServer()      .start( options )

			return	

		# Auto-start
		#
		main()
