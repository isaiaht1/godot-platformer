extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_door_body_entered(body):
	if body.name=="player":
		$player.can_move=false
		print("test 1")
		$door/AnimatedSprite2D.play("open")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Levels/level_1.tscn")
		 # Replace with function body.
		 # Replace with function body.



func _on_door_2_body_entered(body):
	if body.name=="player":
		$player.can_move=false
		$door2/AnimatedSprite2D.play("open")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Levels/level_3.tscn")
