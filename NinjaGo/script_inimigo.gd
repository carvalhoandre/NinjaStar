extends KinematicBody2D

var tipo_premio = "moeda"

func _ready():
	$AnimatedSprite.play("andando")
	if(not ScriptGlobal.zombi and not ScriptGlobal.status_efeitos_sonoros):
		$Zombi.play()

var velocidade = 100
var direcao = 1 # Direcao 1 para direita, -1 para esquerda
var mov = Vector2(velocidade,0)

func _process(delta):
	mov.x = direcao * velocidade	
	mov = move_and_slide(mov)

func _on_pe_esquerdo_body_exited(body):
	direcao = 1
	$AnimatedSprite.flip_h = false
	
func _on_pe_direito_body_exited(body):
	direcao = -1
	$AnimatedSprite.flip_h = true

func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation=="morrendo"):
		queue_free()
		premio()
	ScriptGlobal.zombi = false

func _on_Ataque_body_entered(body):
	if (body.name=="Personagem" and ScriptGlobal.atacando == false):
		ScriptGlobal.qtd_vidas -= 1
		ScriptGlobal.zombi = true
		direcao = direcao * (-1)
	if(direcao==1):
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
		
func premio():
	var cena_premio = preload("res://cena_premio.tscn")
	var objeto = cena_premio.instance()
	objeto.get_node("Premio").tipo_premio = tipo_premio
	objeto.global_position = global_position
	get_parent().get_parent().add_child(objeto)
	
	
	
	
	
