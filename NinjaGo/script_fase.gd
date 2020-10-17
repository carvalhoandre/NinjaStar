extends Node2D

func atualizar_hud():
	$HUD/Vida1.visible = false
	$HUD/Vida2.visible = false
	$HUD/Vida3.visible = false
	
	if (ScriptGlobal.qtd_vidas==3):
		$HUD/Vida1.visible = true
		$HUD/Vida2.visible = true
		$HUD/Vida3.visible = true
	elif (ScriptGlobal.qtd_vidas==2):
		$HUD/Vida1.visible = true
		$HUD/Vida2.visible = true
	elif (ScriptGlobal.qtd_vidas==1):
		$HUD/Vida1.visible = true
	else:
		get_tree().change_scene("res://cena_gameover.tscn")

func _process(delta):
	atualizar_hud()
	
	if(ScriptGlobal.morte == 0 and ScriptGlobal.qtd_vidas == 2):
		$AnimationPlayer.play("morrendo")
		ScriptGlobal.zombi = true
	
	if(ScriptGlobal.morte == 1 and ScriptGlobal.qtd_vidas == 1):
		$AnimationPlayer.play("morrendo")
		ScriptGlobal.zombi = true
		
	if ScriptGlobal.zombi == true:
		$Zombi.play()

func _ready():
	$Personagem.global_position = get_node(ScriptGlobal.checkpoint).global_position

func _on_CheckPoint2_body_entered(body):
	ScriptGlobal.checkpoint = "CheckPoint2"
	$CheckPoint2/AnimationPlayer.play("checkpoint_inativo")


#func _on_CheckPoint3_body_entered(body):
	#get_tree().change_scene("res://cena_win.tscn")
