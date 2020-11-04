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
		$Disparo/Fire.play("lancamento")
		if(ScriptGlobal.status_efeitos_sonoros):
			$Efeito.play()
	elif (ScriptGlobal.tipo_disparo == "especial"):
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
			body.get_node("Zumbi1").play("morrendo")
		if ScriptGlobal.cod_inimigo == 3:
			body.get_node("Abobora").play("morrendo")
		body.get_node("CollisionShape2D").queue_free()
		body.get_node("Ataque").queue_free()
		queue_free()
		ScriptGlobal.zombi = false
	if (body.name=="Personagem"):
		if(ScriptGlobal.tipo_disparo == "fire"):
			$Disparo/Fire.play("impacto")
		if ScriptGlobal.cod_personagem == 1:
			body.get_node("Personagem1").play("morrendo")
		if ScriptGlobal.cod_personagem == 2:
			body.get_node("Personagem2").play("morrendo")
		if ScriptGlobal.cod_personagem == 3:
			body.get_node("Personagem3").play("morrendo")
		ScriptGlobal.qtd_vidas -= 1

	
