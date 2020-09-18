extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$TempoJogo.wait_time = ScriptGlobal.qtd_tempo
	$TempoJogo.start()

func atualizarHUD():
	if(ScriptGlobal.qtd_vidas_nave == 2):
		$Vida3.visible = false
	if(ScriptGlobal.qtd_vidas_nave == 1):
		$Vida2.visible = false
	if(ScriptGlobal.qtd_vidas_nave == 0):
		$Vida1.visible = false
	
	$QtdMissil.text = str(ScriptGlobal.qtd_missil) + "X"
	$QtdTempo.text = str(round($TempoJogo.time_left))
	$QtdPonto.text = "Pontos: " + str(ScriptGlobal.qtd_pontos)
	$VidaBarreira.value = ScriptGlobal.qtd_vidas_barreira

func _process(delta):
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()

var qtd_inimigo = 0

func _on_Timer_timeout():
	var cena_inimigo = preload("res://cena_inimigo.tscn")
	var obj_inimigo = cena_inimigo.instance()
	
	if (qtd_inimigo ==3):
		obj_inimigo.get_note("Area2D").tipo_premio = "missil"
		qtd_inimigo = 0
	else:
		obj_inimigo.get_note("Area2D").tipo_premio = "ponto"
		qtd_inimigo +=1
			
	get_tree().root.add_child(obj_inimigo)

	obj_inimigo.global_position.y = 0
	var largura = get_viewport_rect().size.x
	obj_inimigo.global_position.x = rand_range(0,1024)
	
	get_tree().root.add_child(obj_inimigo)
