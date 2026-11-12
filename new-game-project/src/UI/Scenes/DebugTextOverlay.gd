extends Control

const VERSION_SETTING : String = "application/config/version"

@onready var FPSLabel : Label = $MarginContainer/VBoxContainer/FPSLabel
@onready var VersionInfo : Label = $MarginContainer/VBoxContainer/VersionInfo
@onready var DebugInfo : Label = $MarginContainer/VBoxContainer/DebugInfo

var debugModeToggle : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	addVersionToInfoLabel()
	DebugMode.debugModeToggled.connect(toggleDebugMode)

func toggleDebugMode(status : bool) -> void:
	debugModeToggle = status
	if debugModeToggle == true:
		DebugInfo.text = "Debug Mode Enabeled"
	else:
		DebugInfo.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	FPSLabel.text = "FPS: " + str(Engine.get_frames_per_second())


func addVersionToInfoLabel() -> void:
	var _versionStr : String = ProjectSettings.get_setting(VERSION_SETTING)
	VersionInfo.text += _versionStr

