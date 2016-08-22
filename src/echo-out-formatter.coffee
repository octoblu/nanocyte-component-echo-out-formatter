ReturnValue = require 'nanocyte-component-return-value'

class EchoOutFormatter extends ReturnValue
  onEnvelope: ({config}) =>
    {url,responseText,response} = config
    params =
      headers:
        'User-Agent': 'Octoblu'
      uri: url
      method: 'POST'
      followAllRedirects: true
      qs: {}
      json: true
    params.json = {responseText} if responseText?
    params.json = {response} if response?
    return params

module.exports = EchoOutFormatter
