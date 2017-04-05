var utRuleValidations = require('ut-rule/validations')
var joi = require('joi')
module.exports = {
  ports: [
    require('../db'),
    require('../httpserver'),
    require('../script')
  ],
  modules: {
    rule: require('ut-rule/api/script'),
    'db/rule': require('ut-rule/api/postgre'),
    ruleSeed: require('../db/schema')
  },
  validations: {
    rule: Object.keys(utRuleValidations).reduce(function (all, key) {
      all[key] = utRuleValidations[key]
      all[key].auth = false
      return all
    }, {
      'fee.fetch': {
        description: '',
        notes: '',
        params: joi.any(),
        result: joi.any(),
        auth: false
      }
    })
  }
}
