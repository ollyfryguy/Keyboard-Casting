extends Node

#All High Level Systems
@export var DictionaryParserScene : PackedScene
@export var ModifierHandlerScene : PackedScene
@export var InputParserScene : PackedScene

#Testing Only
@export var ShiftModifierScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var DictionaryParser : Node = DictionaryParserScene.instantiate()
	add_child(DictionaryParser)
	var ModifierHandler : Node = ModifierHandlerScene.instantiate()
	add_child(ModifierHandler)
	var InputParser : Node = InputParserScene.instantiate()
	add_child(InputParser)


	#Testing Only
	var ShiftModifier : Node = ShiftModifierScene.instantiate()
	ModifierHandler.add_child(ShiftModifier)
	pass # Replace with function body.

	for child : Node in $ModifierHandler.get_children():
		
		$DictionarySystem.wordSendRequest.connect(child.updateKnownText)


func recieveTextUpdate() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
