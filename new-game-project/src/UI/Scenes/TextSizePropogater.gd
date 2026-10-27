extends MarginContainer

@export var textLabel : RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var resX : float = get_viewport().get_visible_rect().size.x
	var padding : float = get_theme_constant("margin_left") + get_theme_constant("margin_right")
	textLabel.custom_maximum_size = Vector2((resX - padding), -1.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	textLabel.text = str(grayOutText(GlobalActiveList.UsedList), GlobalActiveList.ActiveList)
	pass


func escapeBBCode(text: String) -> String:
	text = text.replace("[", "[lb]")
	text = text.replace("]", "[rb]")
	return text

func grayOutText(text : String) -> String:
	text = escapeBBCode(text)
	return "[color=gray]%s[/color]" % text
