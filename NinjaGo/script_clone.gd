extends KinematicBody2D

var magia = false
var direcao = 1 # 1 é para direita e -1 é para esquerda
var mov = Vector2(0,0)
var velocidade = 20
var forca_pulo = 20

func _ready():
	$Personagem1.visible = false
	$Personagem2.visible = false
	$Personagem3.visible = false

	if(ScriptGlobal.cod_personagem==1):
		$Personagem1.visible = true
	elif(ScriptGlobal.cod_personagem==2):
		$Personagem2.visible = true
	elif(ScriptGlobal.cod_personagem==3):
		$Personagem3.visible = true

func _process(delta):

	mov.y += 20
	
	if(Input.is_action_pressed("ui_left") and not magia):
		if(direcao == 1):
			scale.x = -1
			direcao = -1

		mov.x = - velocidade

		if(is_on_floor()):
			andando()

	elif(Input.is_action_pressed("ui_right") and not magia):
		if(direcao == -1):
			scale.x = -1
			direcao = 1

		mov.x = velocidade
		if(is_on_floor()):
			andando()

	else:
		mov.x = 0
		if(is_on_floor() and not ScriptGlobal.atacando and not ScriptGlobal.morrendo and not magia):
			parado()

	if(Input.is_action_just_pressed("ui_up") and is_on_floor()):
		mov.y = forca_pulo
		pulando()
	
	if(Input.is_action_pressed("ui_down") and is_on_floor()):
		abaixando()
		
	if(Input.is_action_pressed("golpe") and is_on_floor()):
		ScriptGlobal.atacando = true
		ataque()
	
	if(ScriptGlobal.morte == 0 and ScriptGlobal.qtd_vidas == 2):
		morrendo()
	
	if(ScriptGlobal.morte == 1 and ScriptGlobal.qtd_vidas == 1):
		morrendo()
	
	mov = move_and_slide(mov, Vector2(0,-1))
	
func _on_Kunai_body_entered(body):
	ScriptGlobal.zombi = true
	if (body.name=="Inimigo" and ScriptGlobal.atacando == true):
			body.get_node("AnimatedSprite").play("morrendo")
			body.velocidade = 0
			body.get_node("CollisionShape2D").queue_free()
			body.get_node("Ataque").queue_free()

func _on_pisadinha_body_entered(body):
	if (body.name=="Inimigo"):
		body.get_node("AnimatedSprite").play("morrendo")
		body.velocidade = 0
		body.get_node("CollisionShape2D").queue_free()
		body.get_node("Ataque").queue_free()
		mov.y = forca_pulo / 2

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

func aparecendo():
	if(ScriptGlobal.cod_personagem == 1):
		return $Personagem1.play("aparece")
	elif(ScriptGlobal.cod_personagem == 2):
		return $Personagem2.play("aparece")
	elif(ScriptGlobal.cod_personagem == 3):
		return $Personagem3.play("aparece")

func _on_Personagem1_animation_finished():
	ScriptGlobal.atacando = false
	ScriptGlobal.morrendo = false
	magia = false

func _on_Personagem2_animation_finished():
	ScriptGlobal.atacando = false
	ScriptGlobal.morrendo = false
	magia = false

func _on_Personagem3_animation_finished():
	ScriptGlobal.atacando = false
	ScriptGlobal.morrendo = false
	magia = false
