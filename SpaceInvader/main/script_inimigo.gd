extends Area2D

func _ready():
	pass # Replace with function body.

var mov = Vector2(0,5)

func _process(delta):
	translate(mov)

func _on_Area2D_area_entered(area):
	if(area.name=="Disparo"):
		area.queue_free()
		mov.y = 0
		$AnimationPlayer.play("explodindo")
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name=="explodindo"):
		queue_free()
