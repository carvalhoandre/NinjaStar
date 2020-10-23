extends Area2D

var mov = Vector2(0,0)
var velocidade = 2
var direcao = 1

func _ready():
	pass

func _process(delta):
	$AnimationPlayer.play("giro")
	mov.x = velocidade*direcao
	translate(mov)

func _on_Disparo_body_entered(body):
	if (body.name=="Inimigo"):
		body.velocidade = 0
		body.get_node("AnimatedSprite").play("morrendo")
		body.get_node("CollisionShape2D").queue_free()
		queue_free()
		ScriptGlobal.zombi = false
