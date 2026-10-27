extends Control

@export var BackgroundScene : PackedScene
@export var TextDisplayScene : PackedScene
@export var CharacterDisplayScene : PackedScene

signal propogatedInputUpdate(oldText : String, newText : String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Background : Control = BackgroundScene.instantiate()
	add_child(Background)
	
	var TextDisplay : Control = TextDisplayScene.instantiate()
	add_child(TextDisplay)
	
	var CharacterDisplay : Control = CharacterDisplayScene.instantiate()
	add_child(CharacterDisplay)
	propogatedInputUpdate.connect(CharacterDisplay.recieveInputUpdate)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func propogateInputUpdate(oldText : String, newText : String) -> void:
	propogatedInputUpdate.emit(oldText, newText)
	pass
