extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOver.visible = false
	$Venceu.visible = false
	
	if(ScriptGlobal.qtd_vidas_barreira==0 or ScriptGlobal.qtd_vidas_nave==0):
		$GameOver.visible = true
	else:
		$Venceu.visible = true
		
func _process(delta):
	if(Input.is_action_just_pressed("enter")):
		get_tree().change_scene("res://cena_inicio.tscn")
