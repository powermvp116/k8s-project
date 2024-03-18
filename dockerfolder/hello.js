const http = require('http');
const os = require('os');

console.log("Container Application TEST");

var ifaces = os.networkInterfaces();

var res_handler = function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("Container Hostname: " + os.hostname() + "\n");
  Object.keys(ifaces).forEach(function (ifname) {
    var alias = 0;

    ifaces[ifname].forEach(function (iface) {
      if ('IPv4' !== iface.family || iface.internal !== false) {
        return;
      }

      if (alias >= 1) {
        res.end("Container IPAddress: " + iface.address + "\n");
      } else {
        res.end("Container IPAddress: " + iface.address + "\n");
      }
      ++alias;
    });
  });
};

var www = http.createServer(res_handler);
www.listen(8080);
