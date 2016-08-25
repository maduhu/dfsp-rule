var path = require('path')
module.exports = {
  id: 'httpserver',
  createPort: require('ut-port-httpserver'),
  logLevel: 'trace',
  api: ['rule'],
  port: 8016,
  bundle: 'rule',
  dist: path.resolve(__dirname, '../dist'),
  routes: {
    rpc: {
      method: '*',
      path: '/rpc/{method?}',
      config: {
        auth: false
      }
    }
  },
  start: function () {
    var port = this

    function rest (request, reply, method) {
      request.payload = Object.assign({}, request.payload, request.params, request.query)
      request.params.method = method
      return port.handler(request, reply)
    }

    var routes = [
      { rpc: 'rule.fee.add', path: '/rule/fees', method: 'post' },
      { rpc: 'rule.fee.fetch', path: '/rule/fees', method: 'get' },
      { rpc: 'rule.fee.get', path: '/rule/fees/{feeId}', method: 'get' },
      { rpc: 'rule.fee.edit', path: '/rule/fees/{feeId}', method: 'put' },
      { rpc: 'rule.fee.remove', path: '/rule/fees/{feeId}', method: 'delete' },
      { rpc: 'rule.limit.add', path: '/rule/limits', method: 'post' },
      { rpc: 'rule.limit.fetch', path: '/rule/limits', method: 'get' },
      { rpc: 'rule.limit.get', path: '/rule/limits/{limitId}', method: 'get' },
      { rpc: 'rule.limit.edit', path: '/rule/limits/{limitId}', method: 'put' },
      { rpc: 'rule.limit.remove', path: '/rule/limits/{limitId}', method: 'delete' },
      { rpc: 'rule.decision.fetch', path: '/rule/decisions', method: 'get' },
      { rpc: 'rule.transfer.execute', path: '/rule/transfers/{transferId}', method: 'put' },
      { rpc: 'rule.transfer.reverse', path: '/rule/transfers/{transferId}/reverse', method: 'post' },
      { rpc: 'rule.transferType.fetch', path: '/rule/transferTypes', method: 'get' }
    ].map((route) => {
      return {
        method: route.method,
        path: route.path,
        handler: (request, reply) => rest(request, reply, route.rpc),
        config: { auth: false }
      }
    })

    this.registerRequestHandler(routes)
  }
}
