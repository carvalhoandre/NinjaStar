extends KinematicBody2D


func _ready():
	$Nave1.visible = false
	$Nave2.visible = false
	$Nave3.visible = false
	
	if(ScriptGlobal.cod_nave==1):
		$Nave1.visible = true
	elif(ScriptGlobal.cod_nave==2):
		$Nave2.visible = true
	elif(ScriptGlobal.cod_nave==3):
		$Nave3.visible = true

var mov = Vector2(0,0)
var velocidade = 400
func _process(delta):
	
	#print("Posicao y nave = " + str(global_position.y))
	#print("Tamanho da tela = " + str(get_viewport().size.x))
	
	if (Input.is_action_just_pressed("ui_accept")):		
		var cena_disparo = preload("res://cena_disparo.tscn")		
		z_index = 1		
		var objeto_disparo1 = cena_disparo.instance()
		objeto_disparo1.global_position = $Position2D.global_position		
		objeto_disparo1.z_index = 0
		get_tree().root.add_child(objeto_disparo1)
		var objeto_disparo2 = cena_disparo.instance()
		objeto_disparo2.global_position = $Position2D2.global_position
		objeto_disparo2.z_index = 0
		get_tree().root.add_child(objeto_disparo2)
		
	mov.x = 0
	mov.y = 0	
	
	if (Input.is_action_pressed("ui_up")and global_position.y>=95):
		mov.y = -velocidade 
	if (Input.is_action_pressed("ui_down")and global_position.y<=492):
		mov.y = velocidade
	if (Input.is_action_pressed("ui_left") and global_position.x>=142):
		mov.x = -velocidade
	if (Input.is_action_pressed("ui_right") and global_position.x<=886):
		mov.x = velocidade	
		
	move_and_slide(mov)
