extends Area2D
var tipo_premio = "especial"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Moeda.visible = false
	$Vida.visible = false
	$Jutsu.visible = false
	$Especial.visible = false

	if(tipo_premio=="moeda"):
		$Moeda.visible = true
	elif(tipo_premio=="vida"):
		$Vida.visible = true
	elif(tipo_premio=="especial"):
		$Especial.visible = true
	elif(tipo_premio=="jutsu"):
		$Jutsu.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Premio_body_entered(body):
	if (body.name=="Personagem"):
		if(tipo_premio=="moeda"):
			ScriptGlobal.qtd_pontos += ScriptGlobal.valor_ponto
		elif(tipo_premio=="vida"):
			ScriptGlobal.qtd_vidas += 1
		elif(tipo_premio=="especial"):
			ScriptGlobal.especial += 1
		elif(tipo_premio=="jutsu"):
			ScriptGlobal.jutsu = true
		queue_free()
		
