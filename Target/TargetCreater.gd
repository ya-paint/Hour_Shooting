extends Node2D

var rng = RandomNumberGenerator.new()


func _on_Timer_timeout():
	
	var target = load("res://Target/MATO.tscn").instance()
	
	target.position = Vector2( rng.randi_range(100,924) , -100 )
	
	get_parent().add_child(target)
	
	get_node("Timer").start()
