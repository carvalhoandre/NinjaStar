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
	if (global_position.y > $Camera2D.limit_bottom):
		var checkpoint = ScriptGlobal.checkpoint 
		global_position = get_parent().get_node(checkpoint).global_position
		ScriptGlobal.qtd_vidas -= 1

	ScriptGlobal.mov.y += 20
	if(Input.is_action_pressed("ui_left")):
		ScriptGlobal.mov.x = -ScriptGlobal.velocidade
		if(ScriptGlobal.cod_personagem==1):
			$Personagem1.flip_h = true
		elif(ScriptGlobal.cod_personagem==2):
			$Personagem2.flip_h = true
		elif(ScriptGlobal.cod_personagem==3):
			$Personagem3.flip_h = true
		if(is_on_floor()):
			andando()
	elif(Input.is_action_pressed("ui_right")):
		ScriptGlobal.mov.x = ScriptGlobal.velocidade
		if(ScriptGlobal.cod_personagem==1):
			$Personagem1.flip_h = false
		elif(ScriptGlobal.cod_personagem==2):
			$Personagem2.flip_h = false
		elif(ScriptGlobal.cod_personagem==3):
			$Personagem3.flip_h = false
		if(is_on_floor()):
			andando()
	else:
		ScriptGlobal.mov.x = 0
		if(is_on_floor() and not ScriptGlobal.atacando and not ScriptGlobal.morrendo):
			parado()

	if(Input.is_action_just_pressed("ui_up") and is_on_floor()):
		ScriptGlobal.mov.y = ScriptGlobal.forca_pulo
		pulando()
	
	if(Input.is_action_pressed("ui_down") and is_on_floor()):
		abaixando()
	ScriptGlobal.mov = move_and_slide(ScriptGlobal.mov, Vector2(0,-1))
	
	if(Input.is_action_pressed("golpe") and is_on_floor()):
		ScriptGlobal.atacando = true
		ataque()
	
	if(Input.is_action_just_pressed("kunai")):
		var cena_disparo = preload("res://cena_disparo.tscn")
		var objeto_disparo1 = cena_disparo.instance()
		objeto_disparo1.global_position = $Position2D.global_position
		objeto_disparo1.z_index = 0
		kunai()
		get_parent().get_parent().add_child(objeto_disparo1)
	
	if(ScriptGlobal.morte == 0 and ScriptGlobal.qtd_vidas == 2):
		ScriptGlobal.morrendo = true
		morrendo()
		ScriptGlobal.morte += 1
	
	if(ScriptGlobal.morte == 1 and ScriptGlobal.qtd_vidas == 1):
		ScriptGlobal.morrendo = true
		morrendo()
		ScriptGlobal.morte += 1

func _on_pisadinha_body_entered(body):
	if (body.name=="Inimigo"):
		body.get_node("AnimatedSprite").play("morrendo")
		body.velocidade = 0
		body.get_node("CollisionShape2D").queue_free()
		ScriptGlobal.mov.y = ScriptGlobal.forca_pulo / 2

func andando():
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

func ataque():
	if(ScriptGlobal.cod_personagem==1):
		return $Personagem1.play("ataque")
	elif(ScriptGlobal.cod_personagem==2):
		return $Personagem2.play("ataque")
	elif(ScriptGlobal.cod_personagem==3):
		return $Personagem3.play("ataque")

func kunai():
	if(ScriptGlobal.cod_personagem==1):
		return $Personagem1.play("kunai")
	elif(ScriptGlobal.cod_personagem==2):
		return $Personagem2.play("kunai")
	elif(ScriptGlobal.cod_personagem==3):
		return $Personagem3.play("kunai")
		
func morrendo():
	if(ScriptGlobal.cod_personagem == 1):
		return $Personagem1.play("morrendo")
	elif(ScriptGlobal.cod_personagem == 2):
		return $Personagem2.play("morrendo")
	elif(ScriptGlobal.cod_personagem == 3):
		return $Personagem3.play("morrendo")

func _on_Personagem1_animation_finished():
	ScriptGlobal.atacando = false
	ScriptGlobal.morrendo = false

func _on_Personagem2_animation_finished():
	ScriptGlobal.atacando = false
	ScriptGlobal.morrendo = false

func _on_Personagem3_animation_finished():
	ScriptGlobal.atacando = false
	ScriptGlobal.morrendo = false
	
