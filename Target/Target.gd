extends Node2D

var speed = 100

func _process(delta):
	
	var move : Vector2 =  Vector2(0,0)
	
	move += Vector2( 0 , speed * delta )
	
	self.position += move
	
	pass


func _on_Area2D_area_entered(_area):
	
	Stage.score += 10
	
	queue_free()
	
	pass # Replace with function body.
