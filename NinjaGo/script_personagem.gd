extends KinematicBody2D

func _ready():
	$Personagem1.visible = false
	$Personagem2.visible = false
	$Personagem3.visible = false
	
	if(ScriptGlobal.cod_personagem==1):
		$Personagem1.visible = true
		var personagem = $Personagem1
	elif(ScriptGlobal.cod_personagem==2):
		$Personagem2.visible = true
		var personagem = $Personagem2
	elif(ScriptGlobal.cod_personagem==3):
		$Personagem3.visible = true
		var personagem = $Personagem3

func _process(delta):
	ScriptGlobal.mov.y += 20
	#mov.y += 20
	
	if(Input.is_action_pressed("ui_left")):
		ScriptGlobal.mov.x = -ScriptGlobal.velocidade
		#mov.x = -velocidade
		if(ScriptGlobal.cod_personagem==1):
			$Personagem1.flip_h = true
		elif(ScriptGlobal.cod_personagem==2):
			$Personagem2.flip_h = true
		elif(ScriptGlobal.cod_personagem==3):
			$Personagem3.flip_h = true
		#$AnimatedSprite.flip_h = true
		if(is_on_floor()):
			andado()
	elif(Input.is_action_pressed("ui_right")):
		ScriptGlobal.mov.x = ScriptGlobal.velocidade
		#mov.x = velocidade
		if(ScriptGlobal.cod_personagem==1):
			$Personagem1.flip_h = false
		elif(ScriptGlobal.cod_personagem==2):
			$Personagem2.flip_h = false
		elif(ScriptGlobal.cod_personagem==3):
			$Personagem3.flip_h = false
		#$AnimatedSprite.flip_h = false
		if(is_on_floor()):
			andado()
	else:
		ScriptGlobal.mov.x = 0
		#mov.x = 0
		if(is_on_floor()):
			parado()
	
	if(Input.is_action_just_pressed("ui_up") and is_on_floor()):
		ScriptGlobal.mov.y = ScriptGlobal.forca_pulo
		#mov.y = forca_pulo
		pulando()
	
	if(Input.is_action_pressed("ui_down") and is_on_floor()):
		ScriptGlobal.mov.y = -ScriptGlobal.forca_pulo
		#mov.y = -forca_pulo
		abaixando()
	ScriptGlobal.mov = move_and_slide(ScriptGlobal.mov, Vector2(0,-1))
	#mov = move_and_slide(mov, Vector2(0,-1))

func andado():
	if(ScriptGlobal.cod_personagem==1):
		return $Personagem1.play("andando")
	elif(ScriptGlobal.cod_personagem==2):
		return $Personagem2.play("andando")
	elif(ScriptGlobal.cod_personagem==3):
		return $Personagem3.play("andando")
		
func parado():
	if(ScriptGlobal.cod_personagem==1):
		return $Personagem1.play("parado")
	elif(ScriptGlobal.cod_personagem==2):
		return $Personagem2.play("parado")
	elif(ScriptGlobal.cod_personagem==3):
		return $Personagem3.play("parado")
		
func pulando():
	if(ScriptGlobal.cod_personagem==1):
		return $Personagem1.play("pulando")
	elif(ScriptGlobal.cod_personagem==2):
		return $Personagem2.play("pulando")
	elif(ScriptGlobal.cod_personagem==3):
		return $Personagem3.play("pulando")

func abaixando():
	if(ScriptGlobal.cod_personagem==1):
		return $Personagem1.play("abaixado")
	elif(ScriptGlobal.cod_personagem==2):
		return $Personagem2.play("abaixado")
	elif(ScriptGlobal.cod_personagem==3):
		return $Personagem3.play("abaixado")
