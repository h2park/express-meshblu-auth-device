MeshbluAuthExpress = require 'express-meshblu-auth/src/meshblu-auth-express'

module.exports = (meshbluOptions) ->
  meshbluAuthExpress = new MeshbluAuthExpress meshbluOptions

  middleware = (request, response, next) ->
    credentials = meshbluAuthExpress.getFromAnywhere request
    return response.status(401).end() unless credentials?

    {uuid, token} = credentials

    return response.status(401).end() unless uuid? && token?
    meshbluAuthExpress.authDeviceWithMeshblu uuid, token, (error) ->
      if error?
        console.error error
        return response.status(403).end()
      return response.status(403).end() if uuid != meshbluOptions.uuid
      next()

  middleware
