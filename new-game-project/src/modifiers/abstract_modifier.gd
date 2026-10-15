@abstract
class_name AbstractModifier extends Node

var knownText : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func updateKnownText(text : String) -> void:
	knownText = text
