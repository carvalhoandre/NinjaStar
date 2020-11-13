extends Area2D

var mov = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Moeda.visible = false
	$Vida.visible = false
	$Jutsu.visible = false
	$Especial.visible = false
	$Fim.visible = false

	if(ScriptGlobal.tipo_premio=="moeda"):
		$Moeda.visible = true
	elif(ScriptGlobal.tipo_premio=="vida"):
		$Vida.visible = true
	elif(ScriptGlobal.tipo_premio=="especial"):
		$Especial.visible = true
	elif(ScriptGlobal.tipo_premio=="jutsu"):
		$Jutsu.visible = true
	elif(ScriptGlobal.tipo_premio=="fim"):
		$Fim.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	mov.y += 80

func _on_Premio_body_entered(body):
	if (body.name=="Personagem"):
		if(ScriptGlobal.tipo_premio=="moeda"):
			ScriptGlobal.qtd_pontos += ScriptGlobal.valor_ponto
		elif(ScriptGlobal.tipo_premio=="vida"):
			ScriptGlobal.qtd_vidas += 1
		elif(ScriptGlobal.tipo_premio=="especial"):
			ScriptGlobal.especial += 1
		elif(ScriptGlobal.tipo_premio=="jutsu"):
			ScriptGlobal.jutsu += 1
		elif(ScriptGlobal.tipo_premio=="fim"):
			get_tree().change_scene("res://cena_win.tscn")
		ScriptGlobal.troc_premio()
		queue_free()
		
