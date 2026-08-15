os = require 'os'

home = os.homedir()

Pa =
  home: home
  local: "#{home}/.local"

Pa.share = "#{Pa.local}/share"

module.exports = {
  Pa
}
