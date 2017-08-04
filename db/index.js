module.exports = {
  id: 'db',
  createPort: require('ut-port-postgres'),
  createTT: false,
  retry: false,
  imports: [
    'db/rule',
    'ruleSeed'
  ],
  'rule.decision.fetch': function (msg, $meta) {
    return this.super['rule.decision.fetch'](msg)
      .then((response) => {
        if (!response.fee) {
          response.fee = {
            amount: 0,
            currency: msg.currency
          }
        } else {
          if (!response.fee.amount) {
            response.fee.amount = 0
          }
          if (!response.fee.currency) {
            response.fee.currency = 'TZS'
          }
        }
        if (!response.commission) {
          response.commission = {
            amount: 0,
            currency: msg.currency
          }
        } else {
          if (!response.commission.amount) {
            response.commission.amount = 0
          }
          if (!response.commission.currency) {
            response.commission.currency = 'TZS'
          }
        }
        return response
      })
  }
}
