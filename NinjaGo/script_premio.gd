extends Area2D

var tipo_premio = "moeda"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Moeda.visible = false
	$Vida.visible = false

	if(tipo_premio=="moeda"):
		$Moeda.visible = true
	elif(tipo_premio=="vida"):
		$Vida.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Premio_body_entered(body):
	if(tipo_premio=="moeda"):
		ScriptGlobal.qtd_pontos += ScriptGlobal.valor_ponto
	elif(tipo_premio=="vida"):
		ScriptGlobal.qtd_vidas += ScriptGlobal.qtd_vidas
	queue_free()

func _on_TempoPremio_timeout():
	queue_free()
