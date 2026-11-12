extends Node

signal propogatedInputUpdate(oldText : String, newText : String)

# All High Level Systems
@export var DictionaryParserScene : PackedScene
@export var ModifierHandlerScene : PackedScene
@export var InputParserScene : PackedScene


@onready var DictionaryParser : Node = DictionaryParserScene.instantiate()
@onready var ModifierHandler : Node = ModifierHandlerScene.instantiate()
@onready var InputParser : Node = InputParserScene.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	add_child(DictionaryParser)
	add_child(ModifierHandler)
	add_child(InputParser)

	for child : Node in $ModifierHandler.get_children():
		
		$DictionarySystem.sentWordRequest.connect(child._updateKnownText)
	
	var GameHUDRoot : Node = get_node("../GameHUDLayer/GameHUDRoot")
	propogatedInputUpdate.connect(GameHUDRoot.propogateInputUpdate)
	var CharacterDisplay : Node = get_node("../GameHUDLayer/GameHUDRoot/CharacterDisplay")
	InputParser.resetRequestSent.connect(CharacterDisplay.resetText)
	InputParser.resetRequestSent.connect(DictionaryParser.ResetText)


func recieveInputUpdate(oldText : String, newText : String) -> void:
	propogatedInputUpdate.emit(oldText, newText)
	pass
