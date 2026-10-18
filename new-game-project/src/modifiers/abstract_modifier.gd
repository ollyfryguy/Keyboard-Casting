@abstract
class_name AbstractModifier extends Node

var knownText : String = ""
var initializedFlag : bool = false

var alphabet : PackedStringArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

# The order in which modifiers activate. Handeled by SystemManager in cases of ties. 0 is first.
@export var activateOrder : int

signal initialized()

@abstract
func connectInitialization() -> void



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)
	pass

func _process(_delta: float) -> void:
	if (initializedFlag == false):
		if knownText != "":
			initializedFlag = true
			initialized.emit()
	pass

func updateKnownText(text : String) -> void:
	knownText = text
