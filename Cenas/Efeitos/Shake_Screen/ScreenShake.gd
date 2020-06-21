extends Node2D

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

var amplitude = 0
var priority = 0

onready var camera = get_parent()

func start(duration = 0.3, frequency = 15, amplitude = 16, priority = 0):
	if priority >= self.priority:
		self.priority = priority
		self.amplitude = amplitude
		
		$Duration.wait_time = duration
		$Frequence.wait_time = 1 / float(frequency)
		$Duration.start()
		$Frequence.start()
		
		_new_shake()

func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	
	$ShakeT.interpolate_property(camera, "offset", camera.offset, rand, $Frequence.wait_time, TRANS, EASE)
	$ShakeT.start()

func _reset():
	$ShakeT.interpolate_property(camera, "offset", camera.offset, Vector2(), $Frequence.wait_time, TRANS, EASE)
	$ShakeT.start()
	
	priority = 0

func _on_Frequence_timeout():
	_new_shake()


func _on_Duration_timeout():
	_reset()
	$Frequence.stop()
