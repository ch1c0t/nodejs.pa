{ Pa } = require '@ch1c0t/pa'

describe Pa, ->
  it 'provides Pa.home', ->
    os = require 'os'
    expect(Pa.home.toString()).toBe os.homedir()
    expect("#{Pa.home}").toBe os.homedir()

  it 'provides Pa.local', ->
    expect("#{Pa.local}").toBe "#{Pa.home}/.local"

  it 'provides Pa.share', ->
    expect("#{Pa.share}").toBe "#{Pa.local}/share"
