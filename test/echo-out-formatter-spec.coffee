ReturnValue = require 'nanocyte-component-return-value'
EchoOutFormatter = require '../src/echo-out-formatter'

describe 'EchoOutFormatter', ->
  beforeEach ->
    @sut = new EchoOutFormatter

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with a url and a responseText', ->
      beforeEach ->
        config =
          url: 'something.octoblu.com'
          responseText: 'hello'

        @result = @sut.onEnvelope({config})

      it 'should return the message', ->
        expect(@result).to.deep.equal
          headers:
            'User-Agent': 'Octoblu'
          uri: 'something.octoblu.com'
          method: 'POST'
          followAllRedirects: true
          qs: {}
          json:
            responseText: 'hello'

    describe 'when called with a url and a response object', ->
      beforeEach ->
        config =
          url: 'something.octoblu.com'
          response:
            outputSpeech:
              type: 'SSML'
              ssml: '<speak>hello</speak>'

        @result = @sut.onEnvelope({config})

      it 'should return the message', ->
        expect(@result).to.deep.equal
          headers:
            'User-Agent': 'Octoblu'
          uri: 'something.octoblu.com'
          method: 'POST'
          followAllRedirects: true
          qs: {}
          json:
            response:
              outputSpeech:
                type: 'SSML'
                ssml: '<speak>hello</speak>'

    describe 'when called with a url and without a responseText', ->
      beforeEach ->
        config =
          url: 'something.octoblu.com'

        @result = @sut.onEnvelope({config})

      it 'should return the message', ->
        expect(@result).to.deep.equal
          headers:
            'User-Agent': 'Octoblu'
          uri: 'something.octoblu.com'
          method: 'POST'
          followAllRedirects: true
          qs: {}
          json: true
