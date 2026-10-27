extends Node

## The Active List is the String containing the difference between [member KnownText] and [member PlayerText].
## When [member KnownText] is "The Brown Fox" and [member PlayerText] is "The Brown" ActiveList is "Fox"
var ActiveList : String = ""

var ActiveListArray : PackedStringArray = []

## Opposite of [member KnownText]. Contains the similarities between [member KnownText] and [member PlayerText].
## When [member KnownText] is "The Brown Fox" and [member PlayerText] is "The Brown abc," UsedList is "The Brown"
var UsedList : String = ""

## CURRENTLY UNUSED. The text prior to modification, usually right from the DictionaryParser
var OriginalText : String = ""

## All text as inputted from the player.
var PlayerText : String = ""

## All text, post modifier.
var KnownText : String = ""

var _lastPlayerText : String = ""
var _lastKnownText : String = ""

func PlayerTextUpdate(_oldInput : String, _newInput : String) -> void:
	#print(ActiveList)
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	
	#TO-DO; Can be abstracted out of process to run in PlayerTextUpdate(). Probably.
	
	# If no change has been made to either text, return.
	if PlayerText == _lastPlayerText and KnownText == _lastKnownText:
		return

	_lastPlayerText = PlayerText
	_lastKnownText = KnownText

	var sharedLength := 0
	while sharedLength < KnownText.length() and sharedLength < PlayerText.length() and KnownText.substr(sharedLength, 1) == PlayerText.substr(sharedLength, 1):
		sharedLength += 1
	UsedList = KnownText.substr(0, sharedLength)

	if KnownText.begins_with(PlayerText):
		print(UsedList)
		ActiveList = KnownText.substr(PlayerText.length())
