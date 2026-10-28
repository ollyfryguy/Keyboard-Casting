extends Control

@onready var label : Label = $MarginContainer/CenterContainer/Label
var shownText : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalActiveList.LastWordUpdated.connect(resetText)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = shownText
	pass

func recieveInputUpdate(_oldText : String, _newText : String) -> void:
	
	# On Backspace
	if (_oldText.length() > _newText.length()):
		shownText = shownText.left(shownText.length() - 1)
	else:
		var charToAdd : String = _newText.substr(_oldText.length())
		shownText += charToAdd

func resetText() -> void:
	shownText = ""
