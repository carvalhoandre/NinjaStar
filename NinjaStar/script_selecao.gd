extends Node2D

func _ready():
	$Nomejogador.text = ScriptGlobal.jogador
	
func _process(delta):
	
	if (Input.is_action_just_pressed("ui_left")):
		$Efeito.play()
		Script
		if (ScriptGlobal.cod_personagem==1):
			ScriptGlobal.cod_personagem = 3
			
		else:
			ScriptGlobal.cod_personagem -= 1
	elif (Input.is_action_just_pressed("ui_right")):
		$Efeito.play()
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
		ScriptGlobal.alpha()
		if(ScriptGlobal.tutorial == true):
			ScriptGlobal.troc_inimigo()
			get_tree().change_scene("res://cena_tutorial.tscn")
		else:
			ScriptGlobal.troc_inimigo()
			get_tree().change_scene("res://cena_fase.tscn")

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
