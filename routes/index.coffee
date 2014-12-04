express        = require 'express'
async          = require 'async'

package_json   = require './../package'

router = express.Router()

router.get '/', (req, res) ->
    res.status(200).json
        service: package_json.name
        version: package_json.version
        environ: req.app.get('env')


router.get '/status', (req, res) ->
    res.status(501).json
        error: 'NotImplemented'
        error_message: 'No implementation found'


module.exports = router
