extends Node2D

var mov = Vector2(-19, 0)

var tipo_disparo = "kunai"

func _ready():
	$Disparo/Fire.visible = false
	$Disparo/Kunai.visible = false
	
	if (tipo_disparo == "kunai"):
		$Disparo/Kunai.visible = true
	elif (tipo_disparo == "fire"):
		$Disparo/Fire.visible = true
	
	if(ScriptGlobal.status_efeitos_sonoros):
		get_parent().get_node("AudioStreamPlayer2D").play()
	
func _process(delta):	
	translate(mov)
