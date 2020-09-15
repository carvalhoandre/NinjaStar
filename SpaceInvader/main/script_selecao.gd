extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if (Input.is_action_just_pressed("ui_left")):
		if(ScriptGlobal.cod_nave==1):
			ScriptGlobal.cod_nave = 3
		else:
			ScriptGlobal.cod_nave -= 1
	elif(Input.is_action_just_pressed("ui_right")):
		if(ScriptGlobal.cod_nave==3):
			ScriptGlobal.cod_nave = 1
		else:
			ScriptGlobal.cod_nave +=1

	if(ScriptGlobal.cod_nave==1):
		$AnimPersonagem.play("nave1")
	elif(ScriptGlobal.cod_nave==2):
		$AnimPersonagem.play("nave2")
	elif(ScriptGlobal.cod_nave==3):
		$AnimPersonagem.play("nave3")
		
	
	if(Input.is_action_just_pressed("enter")):
		get_tree().change_scene("res://cena_fase1.tscn")
