extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var login = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_CheckButton_button_up():
	login = false

func _on_Enviar_pressed():
	if login == true: 
		var url = "http://localhost/ninjastar/consultar.php?";
		var data = "email=" + $email.text + "&password=" + $senha.text;
		var headers = []
		var use_ssl = false
		$HTTPRequest.request(url + data, headers, use_ssl, HTTPClient.METHOD_GET)
	else:
		ScriptGlobal.jogador = "Convidado"
		get_tree().change_scene("res://cena_selecao.tscn")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var resultado = body.get_string_from_utf8()
	if (resultado!=""):
		ScriptGlobal.jogador = resultado
		get_tree().change_scene("res://cena_selecao.tscn")
	else:
		$ColorRect.visible = true
	

func _on_Ok_pressed():
	$ColorRect.visible = false


