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
	var characterArray : PackedStringArray
	for index in knownText.length():
		var originalCharacter : String = knownText[index]
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

	# DEBUG ONLY
	print("Initial Text: ", knownText)
	print("Shifted Text: ", "".join(characterArray))
	GlobalActiveList.ActiveList = "".join(characterArray)
	pass