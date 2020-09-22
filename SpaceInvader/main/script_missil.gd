extends Area2D

var mov = Vector2(0,-3)
var tipo_disparo = "simples"

func _ready():
	$Especial.visible = false
	$Simples.visible = false
	
	if(tipo_disparo == "simples"):
		$Simples.visible = true
	elif(tipo_disparo == "especial"):
		$Especial.visible = true
	
	get_parent().get_node("AudioStreamPlayer2D").play()
	
func _process(delta):	
	translate(mov)
