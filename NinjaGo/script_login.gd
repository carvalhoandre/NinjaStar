extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Entrar_pressed():
	var url = "localhost/NinjaGO/login.php"+ $Email.text + "&senha" + $Senha.text
	var headers = []
	var ssl = false
	var method = HTTPClient.METHOD_GET
	$HTTPRequest.request(url,headers,ssl,method)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var usuario = body.get_string_from_utf8()
	if (usuario !=""):
		get_tree().change_scene("res://cena_selecao.tscn")
	else:
		$ColorRect.visible = true
	

func _on_Ok_pressed():
	$ColorRect.visible = false
