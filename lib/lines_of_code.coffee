{readFile, readdir} = require 'fs'

async               = require 'async'
sloc                = require 'sloc'

exports.forFile = forFile = (filename, cb) ->
    readFile filename, 'utf8', (err, code) ->
        if err or err?
            return if err.errno == 28 then cb(null) else err
        stats = sloc code, 'coffee'
        # [[sloc.keys[i], stats[sloc.keys[i]]] for i of sloc.keys]
        stats.filename = filename

        return cb null, stats

exports.forFolder = forFolder = (absolute_path, cb) ->
    readdir absolute_path, (err, files) ->
        return cb err if err
        async.map files, forFile, cb
