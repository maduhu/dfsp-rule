var test = require('ut-run/test')
var joi = require('joi')
var config = require('./../lib/appConfig')
const request = require('supertest')('http://localhost:8016')

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
        assert.equals(joi.validate(result, joi.object().keys({
          commission: joi.object().keys({
            amount: joi.number().required(),
            currency: joi.string().required()
          }).required(),
          fee: joi.object().keys({
            amount: joi.number().required(),
            currency: joi.string().required()
          }).required(),
          limit: joi.object().keys({
            maxAmount: joi.number().required(),
            maxAmountDaily: joi.number().required(),
            maxAmountMonthly: joi.number().required(),
            maxAmountWeekly: joi.number().required(),
            maxCountDaily: joi.number().required(),
            maxCountMonthly: joi.number().required(),
            maxCountWeekly: joi.number().required(),
            minAmount: joi.number().required()
          }).required()
        })).error, null, 'Return decision')
      }
    },
    {
      name: 'Pass incorrect password to the inspector',
      params: (context) => {
        return request
          .get('/rule/decisions')
          .set('Content-Type', 'text/plain')
          .send('{amount: "1000",channelCountryId: "1",currency: "TZS"}')
      },
      result: (result, assert) => {
        assert.equal(result.status, 200, 'Check that request succeed')
      }
    }
  ])
  }
}, module.parent)
