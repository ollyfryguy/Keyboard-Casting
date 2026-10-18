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
	for character : String in knownText.to_lower():
		if character == "" or character == " ":
			characterArray.append(character)
		elif alphabet.find(character) != -1 && alphabet.find(character) != alphabet.size()-1:
			characterArray.append(alphabet.get(alphabet.find(character) + shiftAmount))
		elif alphabet.find(character) == alphabet.size() - 1: #Loop Back Around for Z
			characterArray.append(alphabet.get(0))
		elif alphabet.find(character) == -1 && character != "" && character != " ":
			push_error("Couldn't find character; not in standard alphabet.")
	
	# If capitalized in initial text, make capitalized in shifted text
	for index in range(characterArray.size()):
		if knownText.left(index) == knownText.left(index).capitalize():
			characterArray[index] = characterArray[index].capitalize()

	# DEBUG ONLY
	print("Initial Text:", knownText)
	print("Shifted Text:", "".join(characterArray))
	GlobalActiveList.ActiveList = "".join(characterArray)
	pass

#func printKnownText() -> void:
	#print(knownText)
	#print("this did something")