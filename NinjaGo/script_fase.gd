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
	if(not $AudioStreamPlayer.playing and ScriptGlobal.status_musica==true):
		$AudioStreamPlayer.play()
	elif($AudioStreamPlayer.playing and ScriptGlobal.status_musica==false):
		$AudioStreamPlayer.stop()
	$HUD/QPonto.text = str(ScriptGlobal.qtd_pontos)

func _process(delta):
	atualizar_hud()
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()
	
	if(ScriptGlobal.morte == 0 and ScriptGlobal.qtd_vidas == 2):
		$AnimationPlayer.play("morrendo")
	
	if(ScriptGlobal.morte == 1 and ScriptGlobal.qtd_vidas == 1):
		$AnimationPlayer.play("morrendo")
	
func _ready():
	$Personagem.global_position = get_node(ScriptGlobal.checkpoint).global_position

func _on_CheckPoint2_body_entered(body):
	ScriptGlobal.checkpoint = "CheckPoint2"
	$CheckPoint2/AnimationPlayer.play("checkpoint_inativo")

func _on_Pont_area_shape_entered(area_id, area, area_shape, self_shape):
	get_tree().change_scene("res://cena_win.tscn")

