var test = require('ut-run/test')
// var joi = require('joi')
var config = require('./../lib/appConfig')
test({
  type: 'integration',
  name: 'Rule service',
  server: config.server,
  serverConfig: config.serverConfig,
  client: config.client,
  clientConfig: config.clientConfig,
  steps: function (test, bus, run) {
    return run(test, bus, [{
      method: 'rule.decision.fetch',
      params: {
        amount: '1000',
        channelCountryId: '1',
        currency: 'TZS'
      },
      name: 'Get decision',
      result: (result, assert) => {
        assert.ok(result, 'return decision')
      }
    }])
  }
}, module.parent)
