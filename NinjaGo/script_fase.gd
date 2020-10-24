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
	$HUD/QEspecial.text = str(ScriptGlobal.especial)
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()
	
	if(ScriptGlobal.morte == 0 and ScriptGlobal.qtd_vidas == 2):
		$AnimationPlayer.play("morrendo")
	
	if(ScriptGlobal.morte == 1 and ScriptGlobal.qtd_vidas == 1):
		$AnimationPlayer.play("morrendo")
		ScriptGlobal.zombi = true
	
	#if (ScriptGlobal.jutso == true):
		#var clone = preload("res://cena_personagem.tscn")
		#var objeto_clone = clone.instance()
		#get_tree().root.add_child(objeto_clone)
		#objeto_clone.global_position = $Position2D.global_position
		#ScriptGlobal.jutsu = false
	
	

		
func _process(delta):
	atualizar_hud()
	
func _ready():
	$Personagem.global_position = get_node(ScriptGlobal.checkpoint).global_position

func _on_CheckPoint2_body_entered(body):
	ScriptGlobal.checkpoint = "CheckPoint2"
	$CheckPoint2/AnimationPlayer.play("checkpoint_inativo")

func _on_Pont_body_entered(body):
	if (body.name=="Personagem"):
		get_tree().change_scene("res://cena_win.tscn")
	
func criar_inimigo():
	var cena_inimigo = preload("res://cena_inimigo.tscn")
	var objeto_inimigo = cena_inimigo.instance()
	#objeto_inimigo.global_position =

func _on_Timer_timeout():
	criar_inimigo()
