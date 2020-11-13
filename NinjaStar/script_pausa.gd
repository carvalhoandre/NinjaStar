extends Node2D

func _ready():
	$Musica.pressed = ScriptGlobal.status_musica
	$EfeitosSonoros.pressed = ScriptGlobal.status_efeitos_sonoros
	
func _process(delta):
	if(Input.is_action_just_pressed("pausar")):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused
	
func _on_Musica_pressed():
	if($Musica.pressed):
		ScriptGlobal.status_musica = true
	else:
		ScriptGlobal.status_musica = false


func _on_EfeitosSonoros_pressed():
	if($EfeitosSonoros.pressed):
		ScriptGlobal.status_efeitos_sonoros = true
	else:
		ScriptGlobal.status_efeitos_sonoros = false

func _on_Button_pressed():
	get_tree().change_scene("res://cena_selecao.tscn")
