extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$TempoJogo.wait_time = ScriptGlobal.qtd_tempo
	$TempoJogo.start()

func atualizarHUD():
	if (ScriptGlobal.qtd_vidas_nave==2):
		$Vida3.visible = false
	if (ScriptGlobal.qtd_vidas_nave==1):
		$Vida2.visible = false
	if (ScriptGlobal.qtd_vidas_nave==0):
		$Vida1.visible = false
	
	$QtdMissel.text = str(ScriptGlobal.qtd_missel) + "X"
	$QtdTempo.text = str(round($TempoJogo.time_left))
	$QtdPonto.text = "Pontos: " + str(ScriptGlobal.qtd_pontos)
	$VidaBarreira.value = ScriptGlobal.qtd_vidas_barreira
	if(not $AudioStreamPlayer.playing and ScriptGlobal.status_musica==true):
		$AudioStreamPlayer.play()
	elif($AudioStreamPlayer.playing and ScriptGlobal.status_musica==false):
		$AudioStreamPlayer.stop()
	

func _process(delta):
	atualizarHUD()
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()

var qtd_inimigo = 0
func _on_Timer_timeout():
	var cena_inimigo = preload("res://cena_inimigo.tscn")
	var objeto_inimigo = cena_inimigo.instance()
	
	if (qtd_inimigo==3):
		objeto_inimigo.get_node("Area2D").tipo_premio = "missil"
		qtd_inimigo = 0
	else:
		objeto_inimigo.get_node("Area2D").tipo_premio = "ponto"
		qtd_inimigo += 1
	
	
	objeto_inimigo.global_position.y = 0
	var largura = get_viewport_rect().size.x
	objeto_inimigo.global_position.x = rand_range(0,largura)
	
	get_tree().root.add_child(objeto_inimigo)
	
func _on_TempoJogo_timeout():
	get_tree().change_scene("res://cena_fim_de_jogo.tscn")
