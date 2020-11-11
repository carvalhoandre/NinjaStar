extends Node2D


# Declare member variables here. Examples:
var a = 0
var inimigo = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/Label1. visible = false
	$HUD/Label2. visible = false
	$HUD/Label3. visible = false
	$HUD/Label4. visible = false
	$HUD/Label5. visible = false
	$HUD/Label6. visible = false
	
	
func _process(delta):
	$HUD/Chacra.value = ScriptGlobal.chacra
	
	if a == 1:
		$HUD/Label1. visible = true
	if a == 2:
		$HUD/Label1. visible = false
		$HUD/Label2. visible = true
	if a == 3:
		$HUD/Label2. visible = false
		$HUD/Label3. visible = true
	if a == 4:
		$HUD/Label3. visible = false
		$HUD/Label4. visible = true
	if a == 5:
		$HUD/Label4. visible = false
		$HUD/Label5. visible = true
	if a == 6:
		$HUD/Label5. visible = false
		$HUD/Label6. visible = true
	if a == 7 and inimigo == 0:
		$HUD/Label4. visible = false
		var cena_inimigo = preload("res://cena_inimigo.tscn")
		var objeto_inimigo = cena_inimigo.instance()
		objeto_inimigo.global_position = $CheckPoint1.position
		get_tree().root.add_child(objeto_inimigo)
		inimigo  += 1
		if a == 9:
			queue_free()
	if a == 9:
		ScriptGlobal.alpha()
		ScriptGlobal.troc_inimigo()
		ScriptGlobal.tutorial = false
		get_tree().change_scene("res://cena_fase.tscn")
	
	if (Input.is_action_just_pressed("exit")):
		ScriptGlobal.alpha()
		ScriptGlobal.troc_inimigo()
		ScriptGlobal.tutorial = false
		get_tree().change_scene("res://cena_fase.tscn")
		
	if(not $AudioStreamPlayer.playing and ScriptGlobal.status_musica==true):
		$AudioStreamPlayer.play()
	elif($AudioStreamPlayer.playing and ScriptGlobal.status_musica==false):
		$AudioStreamPlayer.stop()
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()

func _on_Timer_timeout():
	a += 1
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


