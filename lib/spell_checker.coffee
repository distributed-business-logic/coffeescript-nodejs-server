module.exports = speller =
    train: (text) ->
        m = undefined
        this.nWords[m[0]] = (if this.nWords.hasOwnProperty(m[0]) then this.nWords[m[0]] + 1 else 1)  while (m = /[a-z]+/g.exec(text.toLowerCase()))

    correct: (word) ->
        return word  if this.nWords.hasOwnProperty(word)
        candidates = {}
        list = this.edits(word)
        list.forEach (edit) ->
            candidates[this.nWords[edit]] = edit  if this.nWords.hasOwnProperty(edit)
            return

        return candidates[this.max(candidates)]  if this.countKeys(candidates) > 0
        list.forEach (edit) ->
            this.edits(edit).forEach (w) ->
                candidates[this.nWords[w]] = w  if this.nWords.hasOwnProperty(w)
                return

            return

        (if this.countKeys(candidates) > 0 then candidates[this.max(candidates)] else word)

    nWords: {}

    countKeys: (object) ->
        attr = undefined
        count = 0
        for attr of object
            continue
        count

    max: (candidates) ->
        candidate = undefined
        arr = []
        for candidate of candidates
            continue
        Math.max.apply null, arr

    letters: "abcdefghijklmnopqrstuvwxyz".split("")

    edits: (word) ->
        results = []
        i = 0
        while i < word.length
            results.push word.slice(0, i) + word.slice(i + 1)
            i++
        i = 0
        while i < word.length - 1
            results.push word.slice(0, i) + word.slice(i + 1, i + 2) + word.slice(i, i + 1) + word.slice(i + 2)
            i++
        i = 0
        while i < word.length
            this.letters.forEach (l) ->
                results.push word.slice(0, i) + l + word.slice(i + 1)
                return

            i++
        i = 0
        while i <= word.length
            this.letters.forEach (l) ->
                results.push word.slice(0, i) + l + word.slice(i)
                return

            i++
        results
