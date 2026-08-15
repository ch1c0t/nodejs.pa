(function() {
  var os;

  os = require('os');

  exports.Pa = {
    home: os.homedir()
  };

}).call(this);
