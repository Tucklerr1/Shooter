extends ParallaxBackground
@export var speed:=200
func _process(delta):
	scroll_offset.x-=speed*delta
