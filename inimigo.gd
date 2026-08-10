extends Area2D
var velocidade=Vector2(0,0)
func _ready():
	velocidade.x=randf_range(-400,120)
	velocidade.y=randf_range(-60,120)
func _process(delta):
	position+=velocidade*delta
	if position.x<-100:
		queue_free()

var tempo_minimo = 0.5
var fator_dificuldade = 0.95
func _on_timer_timeout():
	$Timer.wait_time = $Timer.wait_time * fator_dificuldade
	if $Timer.wait_time < tempo_minimo:
		$Timer.wait_time = tempo_minimo

func explodir():
	$CorpoInimigo.disabled=true
	$ImagemInimigo.play("explodir")
	await $ImagemInimigo.animation_finished
	queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		body.vidas-=1
		explodir()
