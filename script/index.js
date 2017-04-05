var dispatchToDB = /^(rule)\./
module.exports = {
  id: 'script',
  createPort: require('ut-port-script'),
  imports: ['rule'],
  logLevel: 'trace',
  exec: function (msg, $meta) {
    if (dispatchToDB.test($meta.method)) {
      return this.bus.importMethod('db/' + $meta.method)(msg, $meta)
    }
  }
}
