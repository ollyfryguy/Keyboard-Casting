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

func PlayerTextUpdate() -> void:
	#print(ActiveList)
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	
	#TO-DO; Can be abstracted out of process to run in PlayerTextUpdate()
	
	# If no change has been made to either text, return.
	if PlayerText == _lastPlayerText and KnownText == _lastKnownText:
		return

	_lastPlayerText = PlayerText
	_lastKnownText = KnownText

	var commonLength := 0
	while commonLength < KnownText.length() and commonLength < PlayerText.length() and KnownText.substr(commonLength, 1) == PlayerText.substr(commonLength, 1):
		commonLength += 1
	UsedList = KnownText.substr(0, commonLength).strip_edges(false, true)

	if KnownText.begins_with(PlayerText):
		print(UsedList)
		ActiveList = KnownText.substr(PlayerText.length())
