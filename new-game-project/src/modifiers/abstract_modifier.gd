@abstract
class_name AbstractModifier extends Node

## Represents all text available from the modifier to chose from. Almost always equals [member GlobalActiveList.ActiveList]
var knownText : String = ""
var initializedFlag : bool = false

var alphabet : PackedStringArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

# The order in which modifiers activate. Handeled by ModifierHandler in cases of ties. 0 is first.
@export var activateOrder : int

signal initialized()
signal requestedModification(modifiedText : String)

@abstract
func connectInitialization() -> void



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _parentNode : Node = get_parent()
	set_process(true)
	if (_parentNode != null):
		print("Connected Request Modification")
		requestedModification.connect(_parentNode.handleModifyRequest)


func _process(_delta: float) -> void:

	_updateKnownText(GlobalActiveList.ActiveList)

	if (initializedFlag == false):
		if knownText != "":
			initializedFlag = true
			initialized.emit()
	pass


func _sendRequestModification(modifiedText : String) -> void:
	requestedModification.emit(modifiedText)

func _updateKnownText(text : String) -> void:
	knownText = text

func _textToWordArray(text : String) -> PackedStringArray:
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
