extends Node2D

func _process(delta):
	if(Input.is_action_just_pressed("enter")):
		get_tree().change_scene("res://cena_selecao.tscn")

	$Personagem1.visible = false
	$Personagem2.visible = false
	$Personagem3.visible = false
	if(ScriptGlobal.cod_personagem == 1):
		$Personagem1.visible = true
		$Personagem1.play("morrendo")
	elif(ScriptGlobal.cod_personagem == 2):
		$Personagem2.visible = true
		$Personagem2.play("morrendo")
	elif(ScriptGlobal.cod_personagem == 3):
		$Personagem3.visible = true
		$Personagem3.play("morrendo")
