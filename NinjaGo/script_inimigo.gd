extends KinematicBody2D

var velocidade = 250
var direcao = 1 # Direcao 1 para direita, -1 para esquerda
var mov = Vector2(velocidade,0)

func _ready():
	$Zumbi.visible = false
	$Zumbi2.visible = false
	$Abobora.visible = false
	
	if ScriptGlobal.cod_inimigo == 1:
		$Zumbi.visible = true
	if ScriptGlobal.cod_inimigo == 2:
		$Zumbi2.visible = true
	if ScriptGlobal.cod_inimigo == 3:
		$Abobora.visible = true
	
	andando()

func _process(delta):
	if(not $AudioStreamPlayer.playing and ScriptGlobal.status_musica==true and ScriptGlobal.zombi):
		$AudioStreamPlayer.play()
	elif($AudioStreamPlayer.playing and ScriptGlobal.status_musica==false):
		$AudioStreamPlayer.stop()
	if (not $AudioStreamPlayer.playing):
		$AudioStreamPlayer.play()
	mov.x = direcao * velocidade	
	mov = move_and_slide(mov)

func _on_pe_esquerdo_body_exited(body):
	direcao = 1
	flipF()
	
func _on_pe_direito_body_exited(body):
	direcao = -1
	flipT()
	
func _on_Timer_timeout():
	disparo()
	
func disparo():
		ScriptGlobal.tipo_disparo = "kunai"
		var cena_tiro = preload("res://disparo_inimigo.tscn")
		var objeto_tiro = cena_tiro.instance()
		objeto_tiro.direcao = direcao
		if(direcao == -1):
			objeto_tiro.scale.x = -1
		objeto_tiro.global_position = $Position2D.global_position
		get_tree().root.add_child(objeto_tiro)

func _on_Zumbi2_animation_finished():
	if ($Zumbi2.animation=="morrendo"):
		queue_free()
		premio()
		ScriptGlobal.zombi = false
	
func _on_Zumbi_animation_finished():
	if ($Zumbi.animation=="morrendo"):
		queue_free()
		premio()
		ScriptGlobal.zombi = false

func _on_Abobora_animation_finished():
	if ($Abobora.animation=="morrendo"):
		queue_free()
		premio()
		ScriptGlobal.zombi = false

func _on_Ataque_body_entered(body):
	if (body.name=="Personagem" and ScriptGlobal.atacando == false):
		ScriptGlobal.qtd_vidas -= 1
		ScriptGlobal.zombi = true
		direcao = direcao * (-1)
	if(direcao==1):
		flipF()
	else:
		flipT()
		
func premio():
	var cena_premio = preload("res://cena_premio.tscn")
	var objeto = cena_premio.instance()
	ScriptGlobal.troc_premio()
	objeto.global_position = global_position
	get_parent().get_parent().add_child(objeto)
	
func morrendo():
	if ScriptGlobal.cod_inimigo == 1:
		return $Zumbi.play("morrendo")
	if ScriptGlobal.cod_inimigo == 2:
		return $Zumbi2.play("morrendo")
	if ScriptGlobal.cod_inimigo == 3:
		return $Abobora.play("morrendo")

func andando():
	if ScriptGlobal.cod_inimigo == 1:
		return $Zumbi.play("andando")
	if ScriptGlobal.cod_inimigo == 2:
		return $Zumbi2.play("andando")
	if ScriptGlobal.cod_inimigo == 3:
		return $Abobora.play("andando")
		
func flipF():
	if ScriptGlobal.cod_inimigo == 1:
		$Zumbi.flip_h = false
	if ScriptGlobal.cod_inimigo == 2:
		$Zumbi2.flip_h = false
	if ScriptGlobal.cod_inimigo == 3:
		$Abobora.flip_h = false
		
func flipT():
	if ScriptGlobal.cod_inimigo == 1:
		$Zumbi.flip_h = true
	if ScriptGlobal.cod_inimigo == 2:
		$Zumbi2.flip_h = true
	if ScriptGlobal.cod_inimigo == 3:
		$Abobora.flip_h = true
