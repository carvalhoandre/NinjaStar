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
		body.get_node("AnimatedSprite").play("morrendo")
		body.get_node("CollisionShape2D").queue_free()
		body.get_node("Ataque").queue_free()
		queue_free()
		ScriptGlobal.zombi = false
