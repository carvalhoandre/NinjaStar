extends Node2D

var mov = Vector2(0,0)
var velocidade = 16
var direcao = 1
func _ready():
	$Disparo/Fire.visible = false
	$Disparo/Kunai.visible = false
	$Disparo/Sprite.visible = false
	
	if (ScriptGlobal.tipo_disparo == "kunai"):
		$Disparo/Kunai.visible = true
		if(ScriptGlobal.status_efeitos_sonoros):
			$Kunai.play()
	elif (ScriptGlobal.tipo_disparo == "fire"):
		$Disparo/Fire.visible = true
		velocidade = 11
		$Disparo/Fire.play("lancamento")
		if(ScriptGlobal.status_efeitos_sonoros):
			$Kunai.play()
	elif (ScriptGlobal.tipo_disparo == "especial"):
		velocidade = 20
		$Disparo/Sprite.visible = true
		$Disparo/Sprite/AnimationPlayer.play("giro")
		if(ScriptGlobal.status_efeitos_sonoros):
			$Efeito.play()
	
func _process(delta):	
	mov.x = velocidade*direcao
	translate(mov)

func _on_Disparo_body_entered(body):
	if (body.name=="Inimigo"):
		if(ScriptGlobal.tipo_disparo == "fire"):
			$Disparo/Fire.play("impacto")
		body.velocidade = 0
		if ScriptGlobal.cod_inimigo == 1:
			body.get_node("Zumbi").play("morrendo")
		if ScriptGlobal.cod_inimigo == 2:
			body.get_node("Zumbi2").play("morrendo")
		if ScriptGlobal.cod_inimigo == 3:
			body.get_node("Abobora").play("morrendo")
		body.get_node("CollisionShape2D").queue_free()
		body.get_node("Ataque").queue_free()
		queue_free()
		ScriptGlobal.zombi = false
	if (body.name=="Chefe"):
		if(ScriptGlobal.tipo_disparo == "fire"):
			$Disparo/Fire.play("impacto")
		ScriptGlobal.zombi = false
		if (ScriptGlobal.tipo_disparo == "kunai"):
			ScriptGlobal.qtd_vidas_chefe -= 100
		elif (ScriptGlobal.tipo_disparo == "fire"):
			ScriptGlobal.qtd_vidas_chefe -= 5
		elif (ScriptGlobal.tipo_disparo == "especial"):
			ScriptGlobal.qtd_vidas_chefe -= 10
	queue_free()
	
