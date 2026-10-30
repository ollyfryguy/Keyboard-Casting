## File containing all naming conventions for the rest of the project. Not meant to be instantiated in-game.
## Also contains the preferred order of the file.

@abstract
class_name scriptFormat
extends Node

@warning_ignore("untyped_declaration") @warning_ignore("unused_signal")
signal sent_thing(args)

enum ExampleEnum {
	ELEMENT_ONE,
	ELEMENT_TWO,
	ELEMENT_THREE,
	ELEMENT_FOUR,
}

const MAX_SPEED : int = 200

static var exampleArray : Array = [ # Static variables listed first
	1,
	2,
	3, #Trailing Comma in multiline arrays
]

@export var exampleVarient : Variant # Exported variables come after static variables

var exampleArray2 : Array = [1, 2, 3] # Normal variables after that

@onready var orphanNodeIDs : Array[int] = get_orphan_node_ids() # And Finally Onready Variables

# Three line breaks before functions begin being listed

func _init() -> void:
	pass


func _enter_tree() -> void:
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _physics_process(_delta: float) -> void:
	pass


## Virtual Functions are functions designed to be overriden, such as _process, _ready, etc. They're prepended with an underscore
## Virtual Functions come before normal functions, and built-in virtual functions come before user virtual functions
## Abstract functions would probably go under this category.
func _virtualFunction() -> void:
	pass

## See the two line breaks between functions.
## Functions that are private are also prepended with an underscore
func _privateFunction() -> void:
	## Private variables are, likewise, prepended with an underscore.
	var _counter : int = 0
	pass

func normalFunction() -> void:
	pass

'''
Extra Information:
File names: snake_case
Class names: PascalCase
Node names: PascalCase
Built-In Functions: snake_case
Functions: camelCase
Variables: camelCase
Constants: CONSTANT_CASE
Enum names: PascalCase
Enum Members: CONSTANT_CASE

'''