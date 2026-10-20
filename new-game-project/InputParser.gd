extends Node

var currentInput : String = ""
## Time in MS when another character will be added to the current input while holding the given button.
@export var repeatCharTimeMS : float
## Time in MS when the repeat character timer starts.
@export var beginRepeatingTimeMS : float

@onready var repeatTimer : Timer = $RepeatTimer
@onready var startTimer : Timer = $StartTimer

func backspaceText() -> void:
	currentInput = currentInput.left(currentInput.length() - 1)
	onTextUpdated()

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and !event.is_echo():
		if event.keycode == Key.KEY_BACKSPACE and currentInput.length() > 0:
			startTimer.start()
			backspaceText()
	if event is InputEventKey and !event.pressed and event.keycode == Key.KEY_BACKSPACE:
			startTimer.stop()
			repeatTimer.stop()
	
	var charCode: int = event.unicode
	
	#32 is space. Unicode characters below 32 are system commands.
	if charCode >= 32:
		currentInput += char(charCode)
		onTextUpdated()
		pass
	pass
	
	
func onTextUpdated() -> void:
	print("Full String: ", currentInput)
	GlobalActiveList.PlayerText = currentInput
	# Here you would check current_player_input against your target word!


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	repeatTimer.wait_time = repeatCharTimeMS/1000
	startTimer.wait_time = beginRepeatingTimeMS/1000

# Handles repeated backspacing start delay
func onStartTimerTimeout() -> void:
	backspaceText()
	repeatTimer.start()
	pass # Replace with function body.

# Handles repeated backspacing rate
func onRepeatTimerTimeout() -> void:
	if currentInput.length() > 0:
		backspaceText()
	pass # Replace with function body.
