extends AbstractModifier

var shiftAmount : int

# _ready handled by abstract modifier
func _ready() -> void:
	randomize()
	shiftAmount = randi_range(1,25)
	connectInitialization()
	super._ready()


func connectInitialization() -> void:
	initialized.connect(shiftText)
	pass


func shiftText() -> void:

	var _knownTextArray : PackedStringArray = _textToWordArray(knownText)
	var wordDictionary : Dictionary = randomWordMap(_knownTextArray)
	var _randomWord : String = wordDictionary.keys().get(0)
	var _randomWordIndex : int = wordDictionary.values().get(0)
	_knownTextArray.remove_at(_randomWordIndex)

	var _characterArray : PackedStringArray
	for index in _randomWord.length():
		var _originalCharacter : String = _randomWord[index]
		var _character : String = _originalCharacter.to_lower()
		if _character == " ":
			_characterArray.append(_originalCharacter)
		elif alphabet.find(_character) != -1:
			var _shiftedCharacter : String
			_shiftedCharacter = alphabet.get((alphabet.find(_character) + shiftAmount) % alphabet.size())
			if _originalCharacter != _character:
				_shiftedCharacter = _shiftedCharacter.to_upper()
			_characterArray.append(_shiftedCharacter)
		else:
			push_error("Couldn't find _character; not in standard alphabet.")

	_knownTextArray.insert(_randomWordIndex, "".join(_characterArray))
	var shiftedText : String = " ".join(_knownTextArray)

	# DEBUG ONLY
	print("Initial Text: ", knownText)
	print("Shifted Text: ", shiftedText)
	_sendRequestModification(shiftedText)
	destroySelf()
	
