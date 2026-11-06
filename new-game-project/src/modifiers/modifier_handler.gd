extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func handleModifyRequest(modifiedText : String) -> void:
	var indexToModify : int = GlobalActiveList.UsedList.length() + 1
	var modificationLength : int = modifiedText.length()
	var erasedString : String = GlobalActiveList.KnownText.erase(indexToModify - 1, modificationLength)
	var modifiedString : String = erasedString.insert(indexToModify, modifiedText)
	GlobalActiveList.KnownText = modifiedString
	pass
