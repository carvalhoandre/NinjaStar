extends KinematicBody2D

var tipo_premio = "fim"
var velocidade = 500
var mov = Vector2(velocidade,0)

func _ready():
	$Vida.value = ScriptGlobal.qtd_vidas_chefe
	
	if ScriptGlobal.qtd_vidas_chefe == 0:
		$AnimatedSprite.play("morrendo")
		
	$AnimatedSprite.play("andando")

func _process(delta):
	mov.x = ScriptGlobal.direcao_chefe * velocidade	
	mov = move_and_slide(mov)

func _on_pe_esquerdo_body_exited(body):
	ScriptGlobal.direcao_chefe = 1
	$AnimatedSprite.flip_h = false
	
func _on_pe_direito_body_exited(body):
	ScriptGlobal.direcao_chefe = -1
	$AnimatedSprite.flip_h = true

func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation=="morrendo"):
		premio()
		ScriptGlobal.chefao == false

func _on_Ataque_body_entered(body):
	if (body.name=="Personagem" and ScriptGlobal.atacando == false):
		ScriptGlobal.qtd_vidas -= 1
		ScriptGlobal.zombi = true
		ScriptGlobal.direcao_chefe = ScriptGlobal.direcao_chefe * (-1)
	if(ScriptGlobal.direcao_chefe==1):
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
		
func premio():
	var cena_premio = preload("res://cena_premio.tscn")
	var objeto = cena_premio.instance()
	ScriptGlobal.tipo_premio = tipo_premio
	objeto.global_position = global_position
	get_parent().get_parent().add_child(objeto)
	
	
func inimigos():
		var cena_inimigo = preload("res://cena_inimigo.tscn")
		var objeto_inimigo = cena_inimigo.instance()
		objeto_inimigo.global_position = $Position2D.global_position
		get_tree().root.add_child(objeto_inimigo)
		

func _on_Timer_timeout():
	inimigos()
