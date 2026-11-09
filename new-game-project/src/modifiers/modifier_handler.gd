extends Node

@export var ShiftModifierScene : PackedScene

@onready var ShiftModifier : Node = ShiftModifierScene.instantiate()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


## Should be called by entities only.
func createModifier() -> void:
	# Testing Only
	add_child(ShiftModifier)
	pass

func handleModifyRequest(modifiedText : String) -> void:
	var indexToModify : int = GlobalActiveList.UsedList.length() + 1
	var modificationLength : int = modifiedText.length()
	var erasedString : String = GlobalActiveList.KnownText.erase(indexToModify - 1, modificationLength)
	var modifiedString : String = erasedString.insert(indexToModify, modifiedText)
	GlobalActiveList.KnownText = modifiedString
	pass
