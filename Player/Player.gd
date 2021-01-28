extends Node2D

#１秒間に動く距離数
export var speed = 300

#玉のシーンをロード
onready var ballet_scene : PackedScene = load("res://Ballet/Ballet.tscn")

#玉を発射できるかのフラグ
var ballet_flag : bool = false

func _process(delta):
	
	var move : Vector2 =  Vector2(0,0)
	
	if Input.is_action_pressed("ui_up"):
		move += Vector2( 0 , -speed * delta )
	if Input.is_action_pressed("ui_down"):
		move += Vector2( 0 , speed * delta )
	if Input.is_action_pressed("ui_left"):
		move += Vector2( -speed * delta , 0 )
	if Input.is_action_pressed("ui_right"):
		move += Vector2( speed * delta , 0 )
	
	if Input.is_action_pressed("shot") and ballet_flag and Stage.score > 0: 
		
		#親ノードを取得
		var parent_node = get_parent()
		
		#balletを読み込む
		var ballet = ballet_scene.instance()
		
		ballet.position = self.position + Vector2( 0 , -10 )
		
		parent_node.add_child(ballet)
		
		ballet_flag = false
		get_node("Timer").start()
		
		Stage.score -= 1
	
	self.position += move
	
	pass


func _on_Timer_timeout():
	ballet_flag = true
