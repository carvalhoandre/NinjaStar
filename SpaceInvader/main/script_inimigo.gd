extends Area2D

var tipo_premio = "ponto"

func _ready():
	pass # Replace with function body.

var mov = Vector2(0,5)

func _process(delta):
	translate(mov)

func _on_Area2D_area_entered(area):
	if(area.name=="Disparo"):
		area.queue_free()
		mov.y = 0
		$AnimationPlayer.play("explodindo")
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name=="explodindo"):
		
		var cena_premio = preload("res://cena_premio.tscn")
		var objeto_premio = cena_premio.instance()
		
		objeto_premio.get_node("Premio").tipo_premio = tipo_premio
		
		objeto_premio.global_position = global_position
		get_tree().root.add_child(objeto_premio)
		queue_free()
