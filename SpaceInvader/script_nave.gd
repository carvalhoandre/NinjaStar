extends KinematicBody2D

func _ready():
	
	$Nave1.visible = false
	$Nave2.visible = false
	$Nave3.visible = false
	
	if (ScriptGlobal.cod_nave==1):
		$Nave1.visible = true
	elif (ScriptGlobal.cod_nave==2):
		$Nave2.visible = true
	elif (ScriptGlobal.cod_nave==3):
		$Nave3.visible = true

var mov = Vector2(0,0)
var velocidade = 400
func _process(delta):
	
	var posx = global_position.x
	var posy = global_position.y
	
	var limitex = get_viewport_rect().size.x
	var limitey = get_viewport_rect().size.y
	
	global_position.x = clamp(posx,0,limitex)	
	global_position.y = clamp(posy,0,limitey)
	
	#print("Posicao y nave = " + str(global_position.y))
	#print("Tamanho da tela = " + str(get_viewport().size.x))
	z_index = 1
	
	if (Input.is_action_just_pressed("disparo_simples")):		
		var cena_disparo = preload("res://cena_disparo.tscn")				
		var objeto_disparo1 = cena_disparo.instance()
		objeto_disparo1.global_position = $Position2D.global_position		
		objeto_disparo1.z_index = 0
#		get_tree().root.add_child(objeto_disparo1)
		get_parent().get_parent().add_child(objeto_disparo1)
	
	elif (Input.is_action_just_pressed("disparo_especial") and ScriptGlobal.qtd_missel>0):
		var cena_disparo = preload("res://cena_disparo.tscn")	
		
		var largura_tela = get_viewport_rect().size.x
		var altura_tela = get_viewport_rect().size.y
		var espaco_entre_missil = 60
		var qtd_missil = round(largura_tela / espaco_entre_missil) + 1
		var posicaoX = 0
		while(qtd_missil>0):	
			var objeto_disparo1 = cena_disparo.instance()
			
			objeto_disparo1.get_node("Disparo").tipo_disparo = "especial"
			
			objeto_disparo1.global_position.y = altura_tela
			objeto_disparo1.global_position.x = posicaoX
			objeto_disparo1.z_index = 0
#			get_tree().root.add_child(objeto_disparo1)
			get_parent().get_parent().add_child(objeto_disparo1)
			posicaoX += espaco_entre_missil
			qtd_missil-=1
		ScriptGlobal.qtd_missel -= 1
		
		
	mov.x = 0
	mov.y = 0	
	if (Input.is_action_pressed("ui_up")):
		mov.y = -velocidade 
	if (Input.is_action_pressed("ui_down")):
		mov.y = velocidade
	if (Input.is_action_pressed("ui_left")):
		mov.x = -velocidade
	if (Input.is_action_pressed("ui_right")):
		mov.x = velocidade	
		
	move_and_slide(mov)
