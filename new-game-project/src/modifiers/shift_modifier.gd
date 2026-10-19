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

	
	var knownTextArray : PackedStringArray = textToWordArray(knownText)
	randomize()
	var randomWordIndex : int = randomIndex(knownTextArray)
	@warning_ignore("shadowed_variable_base_class")
	var randomWord : String = knownTextArray[randomWordIndex]
	knownTextArray.remove_at(randomWordIndex)


	var characterArray : PackedStringArray
	for index in randomWord.length():
		var originalCharacter : String = randomWord[index]
		var character : String = originalCharacter.to_lower()
		if character == " ":
			characterArray.append(originalCharacter)
		elif alphabet.find(character) != -1:
			var shiftedCharacter : String
			if alphabet.find(character) != alphabet.size() - 1:
				shiftedCharacter = alphabet.get(alphabet.find(character) + shiftAmount)
			else: # Loop Back Around for Z
				shiftedCharacter = alphabet.get(0)
			if originalCharacter != character:
				shiftedCharacter = shiftedCharacter.to_upper()
			characterArray.append(shiftedCharacter)
		else:
			push_error("Couldn't find character; not in standard alphabet.")

	knownTextArray.insert(randomWordIndex, "".join(characterArray))
	var shiftedText : String = " ".join(knownTextArray)

	# DEBUG ONLY
	print("Initial Text: ", knownText)
	print("Shifted Text: ", shiftedText)
	GlobalActiveList.ActiveList = shiftedText
	pass
