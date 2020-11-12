extends Node2D
func _process(delta):
	atualizar_hud()
	
func _ready():
	$Personagem.global_position = get_node(ScriptGlobal.checkpoint).global_position
	$HUD/NomeJogador.text = ScriptGlobal.jogador
		
func atualizar_hud():
	$HUD/Face1.visible = false
	$HUD/Face2.visible = false
	$HUD/Face3.visible = false
	$HUD/Vida1.visible = false
	$HUD/Vida2.visible = false
	$HUD/Vida3.visible = false
	$HUD/Vida4.visible = false
	#Face:
	if(ScriptGlobal.cod_personagem==1):
		$HUD/Face1.visible = true
	elif(ScriptGlobal.cod_personagem==2):
		$HUD/Face2.visible = true
	elif(ScriptGlobal.cod_personagem==3):
		$HUD/Face3.visible = true
	#Vidas:
	if (ScriptGlobal.qtd_vidas>=4):
		$HUD/Vida1.visible = true
		$HUD/Vida2.visible = true
		$HUD/Vida3.visible = true
		$HUD/Vida4.visible = true
		
	if (ScriptGlobal.qtd_vidas==3):
		$HUD/Vida1.visible = true
		$HUD/Vida2.visible = true
		$HUD/Vida3.visible = true
	elif (ScriptGlobal.qtd_vidas==2):
		$HUD/Vida1.visible = true
		$HUD/Vida2.visible = true
	elif (ScriptGlobal.qtd_vidas==1):
		$HUD/Vida1.visible = true
	elif(ScriptGlobal.qtd_vidas == 0):
		ScriptGlobal.chefao = false
		ScriptGlobal.qtd_vidas_chefe = 0
		get_tree().change_scene("res://cena_gameover.tscn")
	else:
		pass
	#Musica
	if(not $AudioStreamPlayer.playing and ScriptGlobal.status_musica==true):
		$AudioStreamPlayer.play()
	elif($AudioStreamPlayer.playing and ScriptGlobal.status_musica==false):
		$AudioStreamPlayer.stop()
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()

	#HUD:
	$HUD/QPonto.text = str(ScriptGlobal.qtd_pontos)
	$HUD/QEspecial.text = str(ScriptGlobal.especial)
	$HUD/QJutsu.text = str(ScriptGlobal.jutsu)
	$HUD/Chacra.value = ScriptGlobal.chacra
	
