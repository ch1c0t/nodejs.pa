(function() {
  var Pa, bow, home, join, os, resolve;

  ({join, resolve} = require('path'));

  ({bow} = require('@ch1c0t/bow'));

  Pa = bow({
    init: function(path) {
      return this.path = path.startsWith('~') ? join(home, path.slice(1)) : resolve(path);
    },
    methods: {
      toString: function() {
        return this.path;
      }
    }
  });

  os = require('os');

  home = os.homedir();

  Pa.home = home;

  Pa.local = `${home}/.local`;

  Pa.share = `${Pa.local}/share`;

  module.exports = {Pa};

}).call(this);
