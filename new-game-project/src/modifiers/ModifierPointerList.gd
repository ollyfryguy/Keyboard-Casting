extends Node

## List of all Modifiers (and other Activatable Abilities that an entity could hold reference to)
var modifierArray : Array[PackedScene] = [
	ShiftModifier
]

@export var ShiftModifier : PackedScene

func getRandomModifierRef() -> PackedScene:
	randomize()
	return modifierArray.pick_random()