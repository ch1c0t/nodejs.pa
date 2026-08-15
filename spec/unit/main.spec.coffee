{ Pa } = require '@ch1c0t/pa'

describe 'Pa', ->
  it 'provides Pa.home', ->
    os = require 'os'

    expect(Pa.home.toString()).toBe os.homedir()
    expect("#{Pa.home}").toBe os.homedir()

  it 'provides Pa.config', ->
    expect("#{Pa.config}").toBe "#{Pa.home}/.config"

  it 'provides Pa.local', ->
    expect("#{Pa.local}").toBe "#{Pa.home}/.local"

  it 'provides Pa.share', ->
    expect("#{Pa.share}").toBe "#{Pa.local}/share"

  it 'provides Pa.state', ->
    expect("#{Pa.state}").toBe "#{Pa.local}/state"

  describe 'bow', ->
    it 'resolves ~', ->
      pa = Pa("~/.local/share")
      expect("#{pa}").toBe Pa.share

    it 'resolves .', ->
      string = Pa('spec').toString()
      expect(string).toBe "#{process.cwd()}/spec"
