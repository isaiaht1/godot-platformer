extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Replace with function body.


func _on_door_body_entered(body):
	if body.name=="player":
		$player.can_move=false
		$door/AnimatedSprite2D.play("open")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")
		$player.can_move=true # Replace with function body.
		 # Replace with function body.





func _on_gem_gem_collected():
	pass # Replace with function body.


func _on_gem_2_gem_collected():
	pass # Replace with function body.


func _on_gem_3_gem_collected():
	pass # Replace with function body.
