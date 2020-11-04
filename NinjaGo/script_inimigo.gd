extends KinematicBody2D

var velocidade = 200
var direcao = 1 # Direcao 1 para direita, -1 para esquerda
var mov = Vector2(velocidade,0)

func _ready():
	$Zumbi.visible = false
	$Zumbi2.visible = false
	$Abobora.visible = false
	
	if ScriptGlobal.cod_inimigo == 1:
		$Zumbi.visible = true
	if ScriptGlobal.cod_inimigo == 2:
		$Zumbi1.visible = true
	if ScriptGlobal.cod_inimigo == 3:
		$Abobora.visible = true

func _process(delta):
	mov.x = direcao * velocidade	
	mov = move_and_slide(mov)
	andando()
	if(not ScriptGlobal.zombi and ScriptGlobal.status_efeitos_sonoros):
		$Zombi.play()

func _on_pe_esquerdo_body_exited(body):
	flipF()
	
func _on_pe_direito_body_exited(body):
	flipT()

func _on_Ataque_body_entered(body):
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

func _on_Timer_timeout():
	disparo()
	
func disparo():
		ScriptGlobal.tipo_disparo = "kunai"
		var cena_tiro = preload("res://cena_disparo.tscn")
		var objeto_tiro = cena_tiro.instance()
		objeto_tiro.direcao = direcao
		if(direcao == -1):
			objeto_tiro.scale.x = -1
		objeto_tiro.global_position = $Position2D.global_position
		get_tree().root.add_child(objeto_tiro)
	
func morrendo():
	if ScriptGlobal.cod_inimigo == 1:
		return $Zumbi.play("morrendo")
	if ScriptGlobal.cod_inimigo == 2:
		return $Zumbi2.play("morrendo")
	if ScriptGlobal.cod_inimigo == 3:
		return $Abobora.play("morrendo")

func andando():
	if ScriptGlobal.cod_inimigo == 1:
		return $Zumbi.play("morrendo")
	if ScriptGlobal.cod_inimigo == 2:
		return $Zumbi2.play("morrendo")
	if ScriptGlobal.cod_inimigo == 3:
		return $Abobora.play("morrendo")

func _on_Zumbi2_animation_finished():
	animation()
	premio()
	ScriptGlobal.zombi = false
	
func _on_Zumbi_animation_finished():
	animation()
	premio()
	ScriptGlobal.zombi = false

func _on_Abobora_animation_finished():
	animation()
	premio()
	ScriptGlobal.zombi = false

func animation():
	if ScriptGlobal.cod_inimigo == 1 and $Zumbi.animation=="morrendo":
		return queue_free()
	if ScriptGlobal.cod_inimigo == 2 and $Zumbi2.animation=="morrendo":
		return queue_free() 
	if ScriptGlobal.cod_inimigo == 3 and $Abobora.animation=="morrendo":
		return queue_free()

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
