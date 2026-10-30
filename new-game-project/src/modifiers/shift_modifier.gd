extends AbstractModifier

@export var shiftAmount : int

# _ready handled by abstract modifier
func _ready() -> void:
	connectInitialization()
	super._ready()


func connectInitialization() -> void:
	initialized.connect(shiftText)
	pass


func shiftText() -> void:

	
	var _knownTextArray : PackedStringArray = textToWordArray(knownText)
	randomize()
	var _randomWordIndex : int = randomIndex(_knownTextArray)
	@warning_ignore("shadowed_variable_base_class")
	var _randomWord : String = _knownTextArray[_randomWordIndex]
	_knownTextArray.remove_at(_randomWordIndex)


	var _characterArray : PackedStringArray
	for index in _randomWord.length():
		var _originalCharacter : String = _randomWord[index]
		var _character : String = _originalCharacter.to_lower()
		if _character == " ":
			_characterArray.append(_originalCharacter)
		elif alphabet.find(_character) != -1:
			var _shiftedCharacter : String
			if alphabet.find(_character) != alphabet.size() - 1:
				_shiftedCharacter = alphabet.get(alphabet.find(_character) + shiftAmount)
			else: # Loop Back Around for Z
				_shiftedCharacter = alphabet.get(0)
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
	GlobalActiveList.KnownText = shiftedText
