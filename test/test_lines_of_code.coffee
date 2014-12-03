path          = require 'path'

expect        = require 'expect.js'

lines_of_code = require './../lib/lines_of_code'

it 'should develop well formed statistics across a folder', (done) ->
    lines_of_code.forFolder path.resolve('.'), (err, res) ->
        return done(err) if err
        res.forEach (statistics_obj) ->
            if statistics_obj?
                expect(statistics_obj).to.only.have.keys [
                    'total', 'source', 'comment', 'single', 'block', 'mixed', 'empty', 'filename'
                ]
        done()

it 'should be correct count on bower.json', (done) ->
    lines_of_code.forFile path.join(path.resolve('.'), 'bower.json'), (err, res) ->
        return done(err) if err
        delete res.filename  # Gives an absolute path, dependent on where you extract this, could use getcwd() instead
        expect(res).to.be.eql
            total: 9
            source: 9
            comment: 0
            single: 0
            block: 0
            mixed: 0
            empty: 0
        done()
