extends Node2D
		
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

func _on_Timer_timeout():
	ScriptGlobal.troc_premio()
	var cena_premio = preload("res://cena_premio.tscn")
	var objeto = cena_premio.instance()
	objeto.global_position = Vector2(rand_range(1000,1000), rand_range(1000,1000))
	add_child(objeto)
	
func chefe():
		var cena_chefe = preload("res://cena_chefe.tscn")
		var objeto_chefe = cena_chefe.instance()
		objeto_chefe.global_position = $Pont.global_position
		get_tree().root.add_child(objeto_chefe)

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
	
	if(ScriptGlobal.morte == 0 and ScriptGlobal.qtd_vidas == 2):
		$AnimationPlayer.play("morrendo")
	
	if(ScriptGlobal.morte == 1 and ScriptGlobal.qtd_vidas == 1):
		$AnimationPlayer.play("morrendo")
		ScriptGlobal.zombi = true
