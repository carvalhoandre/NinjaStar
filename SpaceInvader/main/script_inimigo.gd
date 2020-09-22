extends Area2D

var tipo_premio = "ponto"

func _ready():
	pass # Replace with function body.

var mov = Vector2(0,-10)
func _process(delta):
	translate(mov)

func _on_Area2D_area_entered(area):	
	if (area.name=="Disparo" and $AnimationPlayer.current_animation=="voando"):
		area.queue_free()
		mov.y = 0
		$AnimationPlayer.play("explodindo")
		soltar_premio()
	elif (area.name=="Barreira"):
		ScriptGlobal.qtd_vidas_barreira -= 1
		mov.y = 0
		$AnimationPlayer.play("explodindo")

func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name=="explodindo"):
		queue_free()

func soltar_premio():
	var cena_premio = preload("res://cena_premio.tscn")	
	var objeto_premio = cena_premio.instance()
	objeto_premio.get_node("Premio").tipo_premio = tipo_premio		
	objeto_premio.global_position = global_position
	get_tree().root.add_child(objeto_premio)	

func _on_Area2D_body_entered(body):
	if (body.name=="Nave" and $AnimationPlayer.current_animation=="voando"):
		ScriptGlobal.qtd_vidas_nave -= 1
		mov.y = 0
		$AnimationPlayer.play("explodindo")
