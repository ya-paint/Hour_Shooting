extends Node2D

#１秒間に動く距離数
export var speed = 500

func _process(delta):
	
	var move : Vector2 =  Vector2(0,0)
	
	move += Vector2( 0 , -speed * delta )
	
	self.position += move
	
	pass


func _on_Area2D_area_entered(_area):
	
	#削除
	queue_free()
	
	pass # Replace with function body.
