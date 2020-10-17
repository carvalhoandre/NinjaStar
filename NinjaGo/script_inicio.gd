extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if (Input.is_action_just_pressed("enter") or Input.is_action_just_pressed("kunai")):
		get_tree().change_scene("res://cena_selecao.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://cena_selecao.tscn")
