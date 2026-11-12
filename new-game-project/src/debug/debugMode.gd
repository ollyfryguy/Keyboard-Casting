extends Node

signal debugModeToggled(status : bool)
signal requestedModifierCreation()

var debugModeToggle : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _isInputValid(event : InputEvent) -> bool:
	if event.is_pressed() and !event.is_echo():
		return true
	else:
		return false


func _unhandled_key_input(event: InputEvent) -> void:
	if debugModeToggle == true:
		if event.keycode == Key.KEY_CTRL and _isInputValid(event):
			requestedModifierCreation.emit()
		
		if event.keycode == Key.KEY_HOME and _isInputValid(event):
			GlobalActiveList.PlayerText = GlobalActiveList.KnownText



func toggleDebugMode(status : bool) -> void:
	debugModeToggle = status
	debugModeToggled.emit(debugModeToggle)

