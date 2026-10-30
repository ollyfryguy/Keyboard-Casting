extends Control

const VERSION_SETTING : String = "application/config/version"

@onready var FPSLabel : Label = $MarginContainer/VBoxContainer/FPSLabel
@onready var VersionInfo : Label = $MarginContainer/VBoxContainer/VersionInfo


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	addVersionToInfoLabel()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	FPSLabel.text = "FPS: " + str(Engine.get_frames_per_second())


func addVersionToInfoLabel() -> void:
	var _versionStr : String = ProjectSettings.get_setting(VERSION_SETTING)
	VersionInfo.text += _versionStr
