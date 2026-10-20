extends CanvasLayer

@export var BackgroundScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Background : Control = BackgroundScene.instantiate()
	add_child(Background)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
