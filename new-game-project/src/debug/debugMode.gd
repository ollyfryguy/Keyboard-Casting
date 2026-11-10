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



func _unhandled_key_input(event: InputEvent) -> void:
	if event.keycode == Key.KEY_CTRL and event.is_pressed() and !event.is_echo() and debugModeToggle == true:
		requestedModifierCreation.emit()


func toggleDebugMode(status : bool) -> void:
	debugModeToggle = status
	debugModeToggled.emit(debugModeToggle)

