extends MarginContainer

@export var textLabel : RichTextLabel

var textFinished : bool = false

var tempFlag : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _resX : float = get_viewport().get_visible_rect().size.x
	var _padding : float = get_theme_constant("margin_left") + get_theme_constant("margin_right")
	textLabel.custom_maximum_size = Vector2((_resX - _padding), -1.0)
	
	GlobalActiveList.finishedLastWordQueried.connect(LastWordFinished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if textFinished == false and GlobalActiveList.UsedList + GlobalActiveList.ActiveList == GlobalActiveList.KnownText:
		textLabel.text = grayOutText(GlobalActiveList.UsedList) + GlobalActiveList.ActiveList
		tempFlag = false
	elif textFinished == true:
		textLabel.text = redOutText(GlobalActiveList.KnownText)
	elif GlobalActiveList.UsedList + GlobalActiveList.ActiveList != GlobalActiveList.KnownText:
		if tempFlag != true:
			#push_error("UsedList + ActiveList != KnownText. Last character of UsedList equals '", GlobalActiveList.UsedList.right(1), "' and the first character of ActiveList equals '", GlobalActiveList.ActiveList.left(1), "'")
			tempFlag = true

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

## Valid colors are currently: Gray, Red
func colorText(text : String, color : String) -> String:
	color = color.to_lower()
	if color == "gray" or color == "grey":
		text = grayOutText(text)
	elif color == "red":
		text = redOutText(text)
	return text


func colorBackgroundText(text : String, color : String) -> String:
	color = color.to_lower()
	text = escapeBBCode(text)
	if color == "black":
		return "[background=black]%s[/background]"
	push_warning("Color Background Text used without valid color chosen; returning unmodified text")
	return text

func LastWordFinished(status : bool) -> void:
	textFinished = status
