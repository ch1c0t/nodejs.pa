{ Pa } = require '@ch1c0t/pa'

describe Pa, ->
  it 'provides Pa.home', ->
    os = require 'os'
    expect(Pa.home.toString()).toBe os.homedir()
    expect("#{Pa.home}").toBe os.homedir()
