extends Control

signal propogatedInputUpdate(oldText : String, newText : String)

@export var BackgroundScene : PackedScene
@export var TextDisplayScene : PackedScene
@export var CharacterDisplayScene : PackedScene

@onready var Background : Control = BackgroundScene.instantiate()
@onready var TextDisplay : Control = TextDisplayScene.instantiate()
@onready var CharacterDisplay : Control = CharacterDisplayScene.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	add_child(Background)
	add_child(TextDisplay)
	add_child(CharacterDisplay)

	propogatedInputUpdate.connect(CharacterDisplay.recieveInputUpdate)


func propogateInputUpdate(oldText : String, newText : String) -> void:
	propogatedInputUpdate.emit(oldText, newText)

