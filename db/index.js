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
          Object.assign(response.fee, {
            amount: 0,
            currency: msg.currency
          })
        }
        if (!response.commission) {
          response.commission = {
            amount: 0,
            currency: msg.currency
          }
        } else {
          Object.assign(response.commission, {
            amount: 0,
            currency: msg.currency
          })
        }
        return response
      })
  }
}
