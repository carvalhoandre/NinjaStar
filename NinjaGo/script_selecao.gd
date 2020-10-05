extends Node2D

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	
	if (Input.is_action_just_pressed("ui_left")):
		Script
		if (ScriptGlobal.cod_personagem==1):
			ScriptGlobal.cod_personagem = 3
		else:
			ScriptGlobal.cod_personagem -= 1

	elif (Input.is_action_just_pressed("ui_right")):
		if (ScriptGlobal.cod_personagem==3):
			ScriptGlobal.cod_personagem = 1
		else:
			ScriptGlobal.cod_personagem += 1

	if (ScriptGlobal.cod_personagem==1):
		$AnimationPlayer.play("personagem1")
	elif (ScriptGlobal.cod_personagem==2):
		$AnimationPlayer.play("personagem2")
	elif (ScriptGlobal.cod_personagem==3):
		$AnimationPlayer.play("personagem3")

	if (Input.is_action_just_pressed("enter")):
		get_tree().change_scene("res://cena_fase.tscn")
