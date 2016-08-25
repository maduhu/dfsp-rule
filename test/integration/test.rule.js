var test = require('ut-run/test')
// var joi = require('joi')

test({
  type: 'integration',
  name: 'Rule service',
  client: require('../client'),
  clientConfig: require('../client/test'),
  steps: function (test, bus, run) {
    run(test, bus, [{
      method: 'rule.decision.get',
      params: {
        sourceAmount: 100
      },
      name: 'Get decision',
      result: (result, assert) => {
        assert.ok(result, 'return decision')
      }
    }, {
      method: 'rule.decision.get',
      params: {},
      name: 'Get decision without amount',
      error: (result, assert) => {
        assert.ok(result, 'return error')
      }
    }])
  }
})
