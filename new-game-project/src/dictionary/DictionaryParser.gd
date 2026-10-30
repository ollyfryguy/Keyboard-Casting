extends Node

signal wordSendRequest(wordList : String)

@export var dictionary : JSON

var words : Array = []
var currentWords : PackedStringArray = []
var formattedWordList : String = ""



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _textFile : FileAccess = FileAccess.open(dictionary.get_path(), FileAccess.READ)
	var _json : JSON = JSON.new()
	var _parseResult : int = _json.parse(_textFile.get_as_text())

	if _parseResult == OK:
		var jsonData : Dictionary = _json.data
		if typeof(jsonData) == TYPE_DICTIONARY:
			words = jsonData.keys()
	else:
		print("JSON Parse Error: ", _json.get_error_message(), " in ", JSON.stringify(dictionary), " at line ", _json.get_error_line())

	# Test Case
	currentWords.append_array(getRandomWord(10))
	formattedWordList = formatWordArray(currentWords)
	wordSendRequest.emit(formattedWordList)
	
	#GlobalActiveList.KnownText = formattedWordList

	#GlobalActiveList.ActiveListArray = currentWords
	#GlobalActiveList.ActiveList = formatWordArray(currentWords)
	#print(GlobalActiveList.ActiveListArray)
	#print(GlobalActiveList.ActiveList)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#TEMP
	wordSendRequest.emit(formattedWordList)
	pass


func getRandomWord(count: int) -> PackedStringArray:
	var _wordArray : Array = []
	
	for i in count:
		_wordArray.append(words.pick_random())
	return _wordArray

func formatWordArray(array: PackedStringArray) -> String:
	var _string : String = " ".join(array)
	# String cannot have multiple spaces (see @abstract_modifier)
	if _string.contains("  "):
		_string = _string.replace("  ", " ")
	return _string

# Meant to be accessed via signal from System Manager.
func sendWord(wordList : String) -> void:
	wordSendRequest.emit(wordList)

