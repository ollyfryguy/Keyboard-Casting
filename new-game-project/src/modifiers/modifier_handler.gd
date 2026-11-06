extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func handleModifyRequest(modifiedText : String) -> void:
	var indexToModify : int = GlobalActiveList.UsedList.length() + 1
	var textToModify : String = GlobalActiveList.KnownText.right(indexToModify)
	GlobalActiveList.KnownText = GlobalActiveList.KnownText.replace(textToModify, modifiedText)
	pass