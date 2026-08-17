extends Node2D
@export var vidas_node:Label
@export var pontos_node:Label
@export var Player:CharacterBody2D
var pontos=0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://cenas/menu.tscn")
	

func atualizar_hud():
	if Player.vidas>0:
		vidas_node.text="Vidas: "+str(Player.vidas)
		pontos_node.text="Pontos: "+str(pontos)
	elif Player.vidas==0:
		$MensagemMorte.visible = true
		
