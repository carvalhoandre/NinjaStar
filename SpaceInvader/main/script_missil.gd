extends Area2D

var mov = Vector2(0,-3)

func _ready():
	get_parent().get_node("AudioStreamPlayer2D").play()
	
func _process(delta):	
	translate(mov)
