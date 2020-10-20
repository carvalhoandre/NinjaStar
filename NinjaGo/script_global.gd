extends Node

var velocidade = 400
var forca_pulo = -720
var mov = Vector2(0,0)

var cod_personagem = 1
var valor_ponto = 10
var status_musica = true
var status_efeitos_sonoros = true

var qtd_vidas = 3
var qtd_pontos = 0
var checkpoint = "CheckPoint1"
var atacando = false
var morrendo = false
var morte = 0
var zombi = false

var tipo_disparo = "kunai"

func alpha():
	var qtd_vidas = 3
	var qtd_pontos = 0
	var checkpoint = "CheckPoint1"
	var morte = 0
	
