{readFile, readFileSync, createWriteStream, unlink, exists, existsSync} = require 'fs'
{join, resolve}                                                         = require 'path'
http                                                                    = require 'http'

corpus_path = join resolve('.'), 'cache', 'big.txt'

corpus = readFileSync(corpus_path) if existsSync(corpus_path)


download_to_file = (url, dest, cb) ->
    file = createWriteStream(dest)

    request = http.get url, (response) ->
        response.pipe file
        file.on 'finish', ->
            file.close cb

    request.on 'error', (err) ->
        unlink dest # Delete the file async. (But we don't check the result)
        cb err.message  if cb

module.exports = fetch_corpus = (dest = null, cb) ->
    if corpus
        return cb null, corpus

    dest = if dest then resolve(dest) else corpus_path # Default args aren't that convenient, so need this

    exists dest, (err, res) ->
        return cb(err) if err
        if res
            readFile dest, (err, c) ->
                return cb(err) if err
                return cb null, c
    download_to_file 'http://norvig.com/big.txt', dest, (err) ->
        return cb(err) if err
        return fetch_corpus dest, cb

if require.main is module
    console.log "Fetching \"big.txt\" to/from \"#{corpus_path}\""

    fetch_corpus null, (err, res) ->
        if err?
            console.error 'error'
            console.error err
        if res?
            console.info 'info'
            console.info res
