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
var lastCompletedWord : String = ""

#var regexPattern : String = "(?<=\\s)(\\w+)(?=\\s)"
var regexPattern : String = "(\\w+)(?=\\s)"
@onready var regex : RegEx = RegEx.create_from_string(regexPattern)

signal LastWordUpdated()
signal FinishedLastWord()

func TextFinishedCheck() -> void:
	pass

func LastCompletedWord() -> String:
	"""
	if lastCompletedWord != UsedList.get_slice(" ", UsedList.get_slice_count(" ") - 1):
		lastCompletedWord = UsedList.get_slice(" ", UsedList.get_slice_count(" ") - 1)
		return lastCompletedWord
	return ""
	"""
	var allCompletedWords : Array = regex.search_all(UsedList)
	if allCompletedWords.size() != 0:
		return allCompletedWords[allCompletedWords.size() - 1].get_string(1)
	else:
		return ""

func PlayerTextUpdate(_oldInput : String, _newInput : String) -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	
	#Inefficient, but unable to be abstracted directly out to PlayerTextUpdate
	if lastCompletedWord != LastCompletedWord():
		lastCompletedWord = LastCompletedWord()
		print("Last Completed Word Updated")
		LastWordUpdated.emit()

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
		ActiveList = KnownText.substr(PlayerText.length())
