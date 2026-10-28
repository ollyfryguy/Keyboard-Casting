extends Node

@export var dictionary : JSON

var words : Array = []
var currentWords : PackedStringArray = []
var formattedWordList : String = ""

signal wordSendRequest(wordList : String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var textFile : FileAccess = FileAccess.open(dictionary.get_path(), FileAccess.READ)
	var json : JSON = JSON.new()
	var parseResult : int = json.parse(textFile.get_as_text())

	if parseResult == OK:
		var jsonData : Dictionary = json.data
		if typeof(jsonData) == TYPE_DICTIONARY:
			words = jsonData.keys()
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", JSON.stringify(dictionary), " at line ", json.get_error_line())

	# Test Case
	currentWords.append_array(getRandomWord(10))
	formattedWordList = formatWordArray(currentWords)
	wordSendRequest.emit(formattedWordList)
	GlobalActiveList.KnownText = formattedWordList

	#GlobalActiveList.ActiveListArray = currentWords
	#GlobalActiveList.ActiveList = formatWordArray(currentWords)
	#print(GlobalActiveList.ActiveListArray)
	#print(GlobalActiveList.ActiveList)

	pass # Replace with function body.

func getRandomWord(count: int) -> PackedStringArray:
	var wordArray : Array = []
	
	for i in count:
		wordArray.append(words.pick_random())
	return wordArray

func formatWordArray(array: PackedStringArray) -> String:
	var string : String = " ".join(array)
	# String cannot have multiple spaces (see @abstract_modifier)
	if string.contains("  "):
		string = string.replace("  ", " ")
	return string

# Meant to be accessed via signal from System Manager.
func sendWord(wordList : String) -> void:
	wordSendRequest.emit(wordList)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#TEMP
	wordSendRequest.emit(formattedWordList)
	pass
