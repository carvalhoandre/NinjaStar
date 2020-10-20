extends Node2D

var mov = Vector2(0,0)
var velocidade = 6

func _ready():
	$Disparo/Fire.visible = false
	$Disparo/Kunai.visible = false
	
	if (ScriptGlobal.tipo_disparo == "kunai"):
		$Disparo/Kunai.visible = true
	elif (ScriptGlobal.tipo_disparo == "fire"):
		$Disparo/Fire.visible = true
		$Disparo/Fire.play("lancamento")
	
	if(ScriptGlobal.status_efeitos_sonoros):
		$Efeito.play()
	
func _process(delta):	
	mov.x = velocidade
	translate(mov)

func _on_Disparo_body_entered(body):
	if (body.name=="Inimigo"):
		if(ScriptGlobal.status_efeitos_sonoros == true):
			$Disparo/Fire.play("impacto")
		body.velocidade = 0
		body.get_node("AnimatedSprite").play("morrendo")
		body.get_node("CollisionShape2D").queue_free()
		body.get_node("Ataque").queue_free()
		queue_free()
