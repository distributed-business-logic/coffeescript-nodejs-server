{lstatSync, readdir}  = require 'fs'
{format}              = require 'util'
{resolve}             = require 'path'
{Router}              = require 'express'

{forFile, forFolder}  = require './../lib/lines_of_code'


router = Router()


router.get '/', (req, res) ->
    res.status(501).json
        error: 'NotImplemented'
        error_message: 'No implementation found'

router.get '/:file_or_foldername', (req, res) ->
    #f = if req.params.file_or_foldername.lastIndexOf('.') > 0 then forFile else forFolder
    file_or_foldername = resolve req.params.file_or_foldername
    stat = lstatSync file_or_foldername
    if stat.isDirectory()
        f = forFolder
    else if stat.isFile()
        f = forFile
    else
        return res.status(404).json
                   error: 'NotFound'
                   error_message: format "'%j' isn't a file or folder: ", file_or_foldername

    f file_or_foldername, (err, result) ->
        if err?
            err.file_or_foldername = file_or_foldername
            return res.status(400).json err if err?
        res.status(200).json result.filter (e) -> e?


module.exports = router
