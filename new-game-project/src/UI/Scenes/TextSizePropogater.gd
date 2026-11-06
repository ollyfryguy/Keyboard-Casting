extends MarginContainer

@export var textLabel : RichTextLabel

var textFinished : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _resX : float = get_viewport().get_visible_rect().size.x
	var _padding : float = get_theme_constant("margin_left") + get_theme_constant("margin_right")
	textLabel.custom_maximum_size = Vector2((_resX - _padding), -1.0)
	
	GlobalActiveList.finishedLastWordQueried.connect(LastWordFinished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if textFinished == false:
		textLabel.text = str(grayOutText(GlobalActiveList.UsedList), GlobalActiveList.ActiveList)
	else:
		textLabel.text = redOutText(GlobalActiveList.KnownText)

func escapeBBCode(text: String) -> String:
	text = text.replace("[", "[lb]")
	text = text.replace("]", "[rb]")
	return text


func grayOutText(text : String) -> String:
	text = escapeBBCode(text)
	return "[color=gray]%s[/color]" % text
	

func redOutText(text : String) -> String:
	text = escapeBBCode(text)
	return "[color=red]%s[/color]" % text
	
func LastWordFinished(status : bool) -> void:
	textFinished = status
