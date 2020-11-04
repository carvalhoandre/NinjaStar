extends Area2D

var tipo_premio = "ponto"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Missil.visible = false
	$Ponto.visible = false
	
	if (tipo_premio=="ponto"):
		$Ponto.visible = true
	elif (tipo_premio=="missil"):
		$Missil.visible = true
	
func _on_TempoPremio_timeout():
	queue_free()

func _on_Premio_body_entered(body):
	if (tipo_premio=="ponto"):
		ScriptGlobal.qtd_pontos += ScriptGlobal.valor_ponto
	elif (tipo_premio=="missil"):
		ScriptGlobal.qtd_missel += 1
	queue_free()
