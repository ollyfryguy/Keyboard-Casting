extends Node

@export var ShiftModifierScene : PackedScene
@export var BlackoutModifierScene : PackedScene
@export var GlitchEffectScene : PackedScene
@export var WaveEffectScene : PackedScene


var ShiftModifier : Node
var BlackoutModifier : Node
var WaveEffect : Node
var GlitchEffect : Node

var modifierPointerArray : Array[PackedScene] = [
	ShiftModifierScene,
	WaveEffectScene,
	GlitchEffectScene,
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DebugMode.requestedModifierCreation.connect(createModifier)
	#var TextDisplay : Node = get_node("%TextDisplay" + "/MarginContainer"); NOT WORKING; SEE ISSUE #6.


## Should be called by entities only.
func createModifier(modifierName : String) -> void:
	if modifierName == "ShiftModifier":
		ShiftModifier = ShiftModifierScene.instantiate()
		add_child(ShiftModifier)
	
	if modifierName == "BlackoutModifier":
		BlackoutModifier = BlackoutModifierScene.instantiate()
		add_child(BlackoutModifier)
	
	if modifierName == "Random":
		var randomValue : int = randi_range(1,3)
		var modifierScene : PackedScene
		if randomValue == 1:
			modifierScene = ShiftModifierScene
		elif randomValue == 2:
			modifierScene = GlitchEffectScene
		elif randomValue == 3:
			modifierScene = WaveEffectScene
		
		var modifier : Node = modifierScene.instantiate()
		if modifierScene == GlitchEffectScene or modifierScene == WaveEffectScene:
			var disruptLayer : Node = get_parent().get_node("DisruptLayer")
			for child in disruptLayer.get_children():
				disruptLayer.remove_child(child)
			disruptLayer.add_child(modifier)
			print(modifier.name)
		else:
			add_child(modifier)
	
	pass

func handleModifyRequest(modifiedText : String) -> void:
	var indexToModify : int = GlobalActiveList.UsedList.length() + 1
	var modificationLength : int = modifiedText.length()
	var erasedString : String = GlobalActiveList.KnownText.erase(indexToModify - 1, modificationLength)
	var modifiedString : String = erasedString.insert(indexToModify, modifiedText)
	GlobalActiveList.KnownText = modifiedString
	pass


func handleBlackoutRequest(characterIndices : PackedInt32Array) -> void:

	pass


func _onTempTimerTimeout() -> void:
	createModifier("Random")
	pass # Replace with function body.
