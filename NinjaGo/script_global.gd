extends Node

var cod_personagem = 1
var cod_inimigo = 1
var valor_ponto = 10
var status_musica = true
var status_efeitos_sonoros = true
var tipo_premio = "jutsu"
var tutorial = true

var qtd_vidas = 3
var qtd_pontos = 0
var checkpoint = "CheckPoint1"
var atacando = false
var morrendo = false
var morte = 0
var zombi = false
var especial = 0
var jutsu = 0

var tipo_disparo = "kunai"

func alpha():
	qtd_vidas = 3
	qtd_pontos = 0
	checkpoint = "CheckPoint1"
	morte = 0
	zombi = false
	especial = 0
	jutsu = 0

func troc_premio():
	if(tipo_premio=="moeda"):
		if qtd_vidas < 3:
			tipo_premio = "vida"
		else:
			tipo_premio = "moeda"
	elif(tipo_premio=="vida"):
		tipo_premio = "especial"
	elif(tipo_premio=="especial"):
		tipo_premio = "jutso"
	elif(tipo_premio=="jutsu"):
		tipo_premio = "moeda"

func troc_inimigo():
	if(cod_inimigo==1):
		cod_inimigo = 2
	elif(cod_inimigo==2):
		cod_inimigo = 3
	elif(cod_inimigo== 3):
		cod_inimigo = 1
