extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()


func _on_Timer_timeout():
	var cena_inimigo = preload("res://cena_inimigo.tscn")
	var obj_inimigo = cena_inimigo.instance()
	
	get_tree().root.add_child(obj_inimigo)

	obj_inimigo.global_position.y = 0
	var largura = get_viewport_rect().size.x
	obj_inimigo.global_position.x = rand_range(0,1024)
	
	get_tree().root.add_child(obj_inimigo)
