extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
func _process(delta):
	if (Input.is_action_just_pressed("enter")):
		get_tree().change_scene("res://cena_selecao.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://cena_selecao.tscn")
