extends CharacterBody2D
const SPEED = 300.0
var vidas=5
var cena_tiro
func _ready() -> void:
	cena_tiro=preload("res://tiro.tscn")
func _physics_process(delta: float) -> void:
	velocity.x=0
	velocity.y=0
	if Input.is_action_pressed("ui_left"):
		velocity.x=-0.75*SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x=1*SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y=-1*SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y=1*SPEED
	move_and_slide()

	if Input.is_action_just_pressed("ui_accept"):
		var tiro=cena_tiro.instantiate()
		tiro.position.y=position.y+8
		tiro.position.x=position.x+50
		get_parent().add_child(tiro)
