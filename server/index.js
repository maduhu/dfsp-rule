module.exports = {
  ports: [
    require('../db'),
    require('../httpserver'),
    require('../script')
  ],
  modules: {
    rule: require('ut-rule').postgres,
    identity: require('../service/identity')
  },
  validations: {
    rule: require('ut-rule/validations')
  }
}
