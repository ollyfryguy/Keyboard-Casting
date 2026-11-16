class_name ScreenShatter extends AbstractAbility

var shaderMaterial : ShaderMaterial = self.material
var warpIntensity : float
var timeScale : float

var initialTimeScale : float
var initialWarpIntensity : float

@export var tweenDuration : float

@onready var timer : Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialTimeScale = shaderMaterial.get_shader_parameter("time_scale")
	initialWarpIntensity = shaderMaterial.get_shader_parameter("warp_intensity")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _onTimerTimeout() -> void:
	'''
	timer.wait_time = randf_range(0.7, 2)
	warpIntensity = initialWarpIntensity + randf_range(-0.02, 0.02)
	warpIntensity = snapped(warpIntensity, 0.001)
	timeScale = initialTimeScale + randf_range(-1.0, 1.0)
	timeScale = snapped(timeScale, 0.001)
	var _tween := self.create_tween().set_parallel()
	_tween.tween_property(shaderMaterial, "shader_parameter/warp_intensity", 0, tweenDuration).set_trans(Tween.TRANS_LINEAR).from_current()
	_tween.tween_property(shaderMaterial, "shader_parameter/time_scale", 0, tweenDuration).set_trans(Tween.TRANS_LINEAR).from_current()
	'''
