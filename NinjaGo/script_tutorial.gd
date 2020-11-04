extends Node2D


# Declare member variables here. Examples:
var a = 0
var inimigo = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/Label. visible = false
	$HUD/Label1. visible = false
	$HUD/Label2. visible = false
	$HUD/Label3. visible = false
	$HUD/Label4. visible = false
	
func _process(delta):
	if a == 1:
		$HUD/Label. visible = true
	if a == 2:
		$HUD/Label. visible = false
		$HUD/Label1. visible = true
	if a == 3:
		$HUD/Label1. visible = false
		$HUD/Label2. visible = true
	if a == 4:
		$HUD/Label2. visible = false
		$HUD/Label3. visible = true
	if a == 5:
		$HUD/Label3. visible = false
		$HUD/Label4. visible = true
	if a == 6 and inimigo == 0:
		$HUD/Label4. visible = false
		var cena_inimigo = preload("res://cena_inimigo.tscn")
		var objeto_inimigo = cena_inimigo.instance()
		objeto_inimigo.global_position = $CheckPoint1.position
		get_tree().root.add_child(objeto_inimigo)
		inimigo  += 1
		if a == 8:
			queue_free()
	if a == 10:
		get_tree().change_scene("res://cena_fase.tscn")
	
	if (Input.is_action_just_pressed("exit")):
		get_tree().change_scene("res://cena_fase.tscn")
		
func _on_Timer_timeout():
	a += 1
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


