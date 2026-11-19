extends AbstractModifier

var errorHash : String = "arbitrary error code".sha256_text()
@onready var blackoutTimer : Timer = $BlackoutTimer
@onready var killTimer : Timer = $KillTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connectInitialization()
	super._ready()
	pass # Replace with function body.


func connectInitialization() -> void:
	initialized.connect(blackoutText)

func blackoutText() -> void:
	var validWord : String = _findValidWord()
	if validWord == errorHash:
		destroySelf()
	else:
		var startingIndex : int = GlobalActiveList.KnownText.find(validWord)
		var arrayofIndexes : PackedInt32Array
		for index in range(validWord.length()):
			arrayofIndexes.append(startingIndex + index)
		print(arrayofIndexes)
		
	pass

func _findValidWord() -> String:
	var attemptIndex : int = 0
	while attemptIndex >= 0 and attemptIndex < 10:
		randomize()
		var dictionary : Dictionary = randomWordMap(_textToWordArray(knownText))
		var word : String = dictionary.keys().get(0)
		if TextDictionary.words.find(word) != -1:
			return str(word)
		else:
			attemptIndex += 1
	push_warning("No valid word found for blackout modifier, aborting.")
	return errorHash