extends Node

@export var dictionary : JSON

var words : Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var textFile : FileAccess = FileAccess.open(dictionary.get_path(), FileAccess.READ)
	var json : JSON = JSON.new()
	var parseResult : int = json.parse(textFile.get_as_text())

	if parseResult == OK:
		var jsonData : Dictionary = json.data
		if typeof(jsonData) == TYPE_DICTIONARY:
			words = jsonData.keys()


	print(getRandomWord(5))

	pass # Replace with function body.

func getRandomWord(count: int) -> Array[String]:
	var wordArray : Array = []
	
	for i in count:
		wordArray.append(words.pick_random())
	return wordArray

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
