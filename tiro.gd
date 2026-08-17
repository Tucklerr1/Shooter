extends Area2D
var velocidade=600

func _process(delta):
	position.x+=velocidade*delta
	if position.x>1200:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("inimigo"):
		var jogo=get_tree().current_scene
		jogo.pontos+=1
		jogo.atualizar_hud()
		area.explodir()
		queue_free()
