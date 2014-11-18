var vertx = require('vertx');

var eb = vertx.eventBus;

var myHandler = function(message) {
  console.log('I received a message ' + message);
}

eb.registerHandler('listen.test', myHandler);

vertx.createHttpServer().requestHandler(function(req) {
  req.response.end("Hello World!");
  eb.publish('listen.test', 'hello world');
}).listen(8080);
