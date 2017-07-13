var dispatchToDB = /^(rule)\./
module.exports = {
  id: 'script',
  createPort: require('ut-port-script'),
  imports: ['rule'],
  logLevel: 'trace',
  log: {
    transform: {
      payee: 'hide',
      name: 'hide',
      firstName: 'hide',
      lastName: 'hide',
      nationalId: 'hide',
      dob: 'hide'
    }
  },
  exec: function (msg, $meta) {
    if (dispatchToDB.test($meta.method)) {
      return this.bus.importMethod('db/' + $meta.method)(msg, $meta)
    }
  }
}
