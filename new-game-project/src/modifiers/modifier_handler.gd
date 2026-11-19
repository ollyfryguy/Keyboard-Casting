extends Node

@export var ShiftModifierScene : PackedScene
@export var BlackoutModifierScene : PackedScene


var ShiftModifier : Node
var BlackoutModifier : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DebugMode.requestedModifierCreation.connect(createModifier)
	#var TextDisplay : Node = get_node("%TextDisplay" + "/MarginContainer"); NOT WORKING; SEE ISSUE #6.


## Should be called by entities only.
func createModifier(modifierName : String) -> void:
	if modifierName == "ShiftModifier":
		ShiftModifier = ShiftModifierScene.instantiate()
		add_child(ShiftModifier)
	
	if modifierName == "BlackoutModifier":
		BlackoutModifier = BlackoutModifierScene.instantiate()
		add_child(BlackoutModifier)
	pass

func handleModifyRequest(modifiedText : String) -> void:
	var indexToModify : int = GlobalActiveList.UsedList.length() + 1
	var modificationLength : int = modifiedText.length()
	var erasedString : String = GlobalActiveList.KnownText.erase(indexToModify - 1, modificationLength)
	var modifiedString : String = erasedString.insert(indexToModify, modifiedText)
	GlobalActiveList.KnownText = modifiedString
	pass


func handleBlackoutRequest(characterIndices : PackedInt32Array) -> void:

	pass