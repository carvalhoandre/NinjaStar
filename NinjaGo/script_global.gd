extends Node

#Personagem
var cod_personagem = 1
var qtd_vidas = 3
var atacando = false
var morrendo = false
var checkpoint = "CheckPoint1"
var tipo_disparo = "kunai"
var morte = 0
var chacra = 0

#Variantes
var valor_ponto = 10
var tipo_premio = "moeda"
var qtd_pontos = 0
var tutorial = true
var especial = 0
var jutsu = 0

#Inimigo
var cod_inimigo = 1
var zombi = false

#Config
var status_musica = true
var status_efeitos_sonoros = true
#Chefao
var qtd_vidas_chefe = 100

#Funções
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
		tipo_premio = "jutsu"
	elif(tipo_premio=="jutsu"):
		tipo_premio = "moeda"

func troc_inimigo():
	if(cod_inimigo==1):
		cod_inimigo = 2
	elif(cod_inimigo==2):
		cod_inimigo = 3
	elif(cod_inimigo== 3):
		cod_inimigo = 1
