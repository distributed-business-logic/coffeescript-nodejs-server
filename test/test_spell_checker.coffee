expect = require 'expect.js'

spell_checker = require './../lib/spell_checker'

it 'can split string into words just fine', ->
    expect(spell_checker.words('a test')).to.be.eql ['a', 'test']
    expect(spell_checker.words('one two three one')).to.be.eql ['one', 'two', 'three', 'one']

it 'can train a dictionary based on words', ->
    expect(spell_checker.train(spell_checker.words('one two three one'))).to.be.eql {
        one: 3, two: 2, three: 2
    }

it 'should correct for a 3 letter word', ->
    expect(spell_checker.edits1('law')).to.be.eql [
        'aw', 'lw', 'la', 'alw', 'lwa', 'aaw', 'baw', 'caw', 'daw',
        'eaw', 'faw', 'gaw', 'haw', 'iaw', 'jaw', 'kaw', 'law', 'maw', 'naw', 'oaw',
        'paw', 'qaw', 'raw', 'saw', 'taw', 'uaw', 'vaw', 'waw', 'xaw', 'yaw', 'zaw',
        'law', 'lbw', 'lcw', 'ldw', 'lew', 'lfw', 'lgw', 'lhw', 'liw', 'ljw', 'lkw',
        'llw', 'lmw', 'lnw', 'low', 'lpw', 'lqw', 'lrw', 'lsw', 'ltw', 'luw', 'lvw',
        'lww', 'lxw', 'lyw', 'lzw', 'laa', 'lab', 'lac', 'lad', 'lae', 'laf', 'lag',
        'lah', 'lai', 'laj', 'lak', 'lal', 'lam', 'lan', 'lao', 'lap', 'laq', 'lar',
        'las', 'lat', 'lau', 'lav', 'law', 'lax', 'lay', 'laz', 'alaw', 'blaw', 'claw',
        'dlaw', 'elaw', 'flaw', 'glaw', 'hlaw', 'ilaw', 'jlaw', 'klaw', 'llaw', 'mlaw',
        'nlaw', 'olaw', 'plaw', 'qlaw', 'rlaw', 'slaw', 'tlaw', 'ulaw', 'vlaw', 'wlaw',
        'xlaw', 'ylaw', 'zlaw', 'laaw', 'lbaw', 'lcaw', 'ldaw', 'leaw', 'lfaw', 'lgaw',
        'lhaw', 'liaw', 'ljaw', 'lkaw', 'llaw', 'lmaw', 'lnaw', 'loaw', 'lpaw', 'lqaw',
        'lraw', 'lsaw', 'ltaw', 'luaw', 'lvaw', 'lwaw', 'lxaw', 'lyaw', 'lzaw', 'laaw',
        'labw', 'lacw', 'ladw', 'laew', 'lafw', 'lagw', 'lahw', 'laiw', 'lajw', 'lakw',
        'lalw', 'lamw', 'lanw', 'laow', 'lapw', 'laqw', 'larw', 'lasw', 'latw', 'lauw',
        'lavw', 'laww', 'laxw', 'layw', 'lazw', 'lawa', 'lawb', 'lawc', 'lawd', 'lawe',
        'lawf', 'lawg', 'lawh', 'lawi', 'lawj', 'lawk', 'lawl', 'lawm', 'lawn', 'lawo',
        'lawp', 'lawq', 'lawr', 'laws', 'lawt', 'lawu', 'lawv', 'laww', 'lawx', 'lawy',
        'lawz'
    ]

it 'should correct a word off trained data', ->
    expect(spell_checker.correct('lw'), spell_checker.train(['law'])).to.be 'law'
