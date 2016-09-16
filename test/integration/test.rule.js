var test = require('ut-run/test')
// var joi = require('joi')

test({
  type: 'integration',
  name: 'Rule service',
  client: require('../client'),
  clientConfig: require('../client/test'),
  steps: function (test, bus, run) {
    run(test, bus, [{
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
    }, {
      method: 'rule.decision.fetch',
      params: {},
      name: 'Get decision without amount',
      result: (result, assert) => { // todo handle error
        assert.ok(result, 'return error')
      }
    }])
  }
})
