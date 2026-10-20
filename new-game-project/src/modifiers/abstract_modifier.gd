@abstract
class_name AbstractModifier extends Node

var knownText : String = ""
var initializedFlag : bool = false

var alphabet : PackedStringArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

# The order in which modifiers activate. Handeled by SystemManager in cases of ties. 0 is first.
@export var activateOrder : int

signal initialized()

@abstract
func connectInitialization() -> void



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)
	pass

func _process(_delta: float) -> void:
	if (initializedFlag == false):
		if knownText != "":
			initializedFlag = true
			initialized.emit()
	pass

func updateKnownText(text : String) -> void:
	knownText = text

func textToWordArray(text : String) -> PackedStringArray:
	return text.split(" ")
	
## Should most likely have randomize() called beforehand.
func randomIndex(array : Array) -> int:
	return randi() % array.size()
	
## if isDestructive is true, chosen word will also be removed from the array.
func randomWord(wordArray : PackedStringArray, isDestructive : bool) -> String:
	var randomWordIndex : int = randomIndex(wordArray)
	var word : String = wordArray[randomWordIndex]
	if isDestructive:
		wordArray.remove_at(randomWordIndex)
	return word
