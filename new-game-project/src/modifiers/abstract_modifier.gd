@abstract
class_name AbstractModifier extends Node

var knownText : String = ""
var initializedFlag : bool = false

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
