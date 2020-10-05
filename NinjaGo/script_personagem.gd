extends KinematicBody2D

func _ready():
	pass # Replace with function body.
	
#var velocidade = 300
#var forca_pulo = -690
#var mov = Vector2(0,0)

func _process(delta):
	ScriptGlobal.mov.y += 20
	#mov.y += 20
	
	if(Input.is_action_pressed("ui_left")):
		ScriptGlobal.mov.x = -ScriptGlobal.velocidade
		#mov.x = -velocidade
		$AnimatedSprite.flip_h = true
		if(is_on_floor()):
			$AnimatedSprite.play("andando")
	elif(Input.is_action_pressed("ui_right")):
		ScriptGlobal.mov.x = ScriptGlobal.velocidade
		#mov.x = velocidade
		$AnimatedSprite.flip_h = false
		if(is_on_floor()):
			$AnimatedSprite.play("andando")
	else:
		ScriptGlobal.mov.x = 0
		#mov.x = 0
		if(is_on_floor()):
			$AnimatedSprite.play("parado")
	
	if(Input.is_action_just_pressed("ui_up") and is_on_floor()):
		ScriptGlobal.mov.y = ScriptGlobal.forca_pulo
		#mov.y = forca_pulo
		$AnimatedSprite.play("pulando")
	
	if(Input.is_action_pressed("ui_down") and is_on_floor()):
		ScriptGlobal.mov.y = -ScriptGlobal.forca_pulo
		#mov.y = -forca_pulo
		$AnimatedSprite.play("abaixado")
	ScriptGlobal.mov = move_and_slide(ScriptGlobal.mov, Vector2(0,-1))
	#mov = move_and_slide(mov, Vector2(0,-1))
