extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/Label. visible = false
	$HUD/Label2. visible = false
	$HUD/Label3. visible = false
	$HUD/Label4. visible = false
	$HUD/Label5. visible = false
	$HUD/Label6. visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$HUD/Label.visible = false
	$HUD/Label2.visible = true
	$Timer2.start()
	$Timer.stop()

func _on_Timer2_timeout():
	$HUD/Label2.visible = false
	$HUD/Label3.visible = true
	$Timer3.start()
	$Timer2.stop()

func _on_Timer3_timeout():
	$HUD/Label3.visible = false
	$HUD/Label4.visible = true
	$Timer4.start()
	$Timer3.stop()

func _on_Timer4_timeout():
	$HUD/Label4.visible = false
	$HUD/Label5.visible = true
	$Timer5.start()
	$Timer4.stop()



func _on_Timer5_timeout():
	ScriptGlobal.alpha()
	get_tree().change_scene("res://cena_fase.tscn")
