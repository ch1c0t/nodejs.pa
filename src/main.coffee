{ join, resolve } = require 'path'
{ bow } = require '@ch1c0t/bow'

Pa = bow
  init: (path) ->
    @path = if path.startsWith '~'
      join home, path.slice(1)
    else
      resolve path
  methods:
    toString: -> @path

os = require 'os'
home = os.homedir()

Pa.home = home
Pa.local = "#{home}/.local"
Pa.share = "#{Pa.local}/share"

module.exports = {
  Pa
}
