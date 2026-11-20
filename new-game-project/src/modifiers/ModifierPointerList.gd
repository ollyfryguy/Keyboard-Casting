extends Node

@export var ShiftModifier : PackedScene
@export var GlitchEffect : PackedScene
@export var WaveEffect : PackedScene

## List of all Modifiers (and other Activatable Abilities that an entity could hold reference to)
var modifierArray : Array[PackedScene] = [
	ShiftModifier,
	GlitchEffect,
	WaveEffect,
]

func getRandomModifierRef() -> PackedScene:
	print(modifierArray)
	randomize()
	return modifierArray.pick_random()