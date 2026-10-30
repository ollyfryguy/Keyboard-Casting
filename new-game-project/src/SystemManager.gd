extends Node

signal propogateInputUpdate(oldText : String, newText : String)

# All High Level Systems
@export var DictionaryParserScene : PackedScene
@export var ModifierHandlerScene : PackedScene
@export var InputParserScene : PackedScene

# Testing Only
@export var ShiftModifierScene : PackedScene

@onready var DictionaryParser : Node = DictionaryParserScene.instantiate()
@onready var ModifierHandler : Node = ModifierHandlerScene.instantiate()
@onready var InputParser : Node = InputParserScene.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	add_child(DictionaryParser)
	add_child(ModifierHandler)
	add_child(InputParser)

	#Testing Only
	var ShiftModifier : Node = ShiftModifierScene.instantiate()
	ModifierHandler.add_child(ShiftModifier)
	pass # Replace with function body.

	for child : Node in $ModifierHandler.get_children():
		
		$DictionarySystem.wordSendRequest.connect(child.updateKnownText)
	
	var GameHUDRoot : Node = get_node("../GameHUDLayer/GameHUDRoot")
	propogateInputUpdate.connect(GameHUDRoot.propogateInputUpdate)


func recieveInputUpdate(oldText : String, newText : String) -> void:
	propogateInputUpdate.emit(oldText, newText)
	pass
