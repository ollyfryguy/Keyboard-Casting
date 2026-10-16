extends AbstractModifier


# _ready handled by abstract modifier
func _ready() -> void:
	connectInitialization()
	super._ready()


func connectInitialization() -> void:
	initialized.connect(printKnownText)
	pass


func printKnownText() -> void:
	print(knownText)
	print("this did something")