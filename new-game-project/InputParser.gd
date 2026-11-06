extends Node

## Takes the old input before the update and the new input after the update as args.
signal updatedText(oldInput : String, newInput : String)

var currentInput : String = ""

## Time in MS when another character will be added to the current input while holding the given button.
@export var repeatCharTimeMS : float
## Time in MS when the repeat character timer starts.
@export var beginRepeatingTimeMS : float

@onready var repeatTimer : Timer = $RepeatTimer
@onready var startTimer : Timer = $StartTimer



func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and !event.is_echo():
		if event.keycode == Key.KEY_BACKSPACE and currentInput.length() > 0:
			startTimer.start()
			backspaceText()
	if event is InputEventKey and !event.pressed and event.keycode == Key.KEY_BACKSPACE:
			startTimer.stop()
			repeatTimer.stop()
	
	var _charCode: int = event.unicode
	
	#32 is space. Unicode characters below 32 are system commands.
	if _charCode >= 32:
		currentInput += char(_charCode)
		onTextUpdated()
		pass
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	repeatTimer.wait_time = repeatCharTimeMS/1000
	startTimer.wait_time = beginRepeatingTimeMS/1000
	updatedText.connect(GlobalActiveList.PlayerTextUpdate)
	updatedText.connect(get_parent().recieveInputUpdate)


func backspaceText() -> void:
	currentInput = currentInput.left(currentInput.length() - 1)
	onTextUpdated()


func onTextUpdated() -> void:
	#print("Full String: ", currentInput)
	var _oldInput : String = GlobalActiveList.PlayerText
	GlobalActiveList.PlayerText = currentInput
	updatedText.emit(_oldInput, currentInput)


# Handles repeated backspacing start delay
func onStartTimerTimeout() -> void:
	backspaceText()
	repeatTimer.start()


# Handles repeated backspacing rate
func onRepeatTimerTimeout() -> void:
	if currentInput.length() > 0: backspaceText()
