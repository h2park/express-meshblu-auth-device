MeshbluAuthExpress = require 'express-meshblu-auth'

module.exports = (meshbluOptions) ->
  meshbluAuthExpress = new MeshbluAuthExpress meshbluOptions

  middleware = (request, response, next) ->
    meshbluAuthExpress.getFromAnywhere request
    {uuid, token} = request.meshbluAuth ? {}
    return response.status(401).end() unless uuid? && token?
    return response.status(401).end() if uuid != meshbluOptions.uuid
    {uuid} = meshbluOptions
    meshbluAuthExpress.authDeviceWithMeshblu uuid, token, (error) ->
      if error?
        console.error error
        return response.status(401).end()
      next()

  middleware
