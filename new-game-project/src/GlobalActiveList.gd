extends Node

## The Active List is the String containing the difference between the known text and the player text.
## When PlayerText is empty, this is equal to [member KnownText]
var ActiveList : String = ""
var ActiveListArray : PackedStringArray = []

## CURRENTLY UNUSED. The text prior to modification, usually right from the DictionaryParser
var OriginalText : String = ""

## All text as inputted from the player.
var PlayerText : String = ""

## All text, post modifier.
var KnownText : String = ""

func _ready() -> void:
	pass

#TO-DO
func _process(_delta: float) -> void:
	if KnownText.begins_with(PlayerText):
		pass
