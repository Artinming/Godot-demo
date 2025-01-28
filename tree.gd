extends StaticBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal in_tree
signal out_tree
var inthetree : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("def")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		animation_player.play("nodef")
		in_tree.emit()
		print(body.name)
		inthetree = true
		get_tree().call_group("player", "tree_in")

func _on_area_2d_body_exited(body: Node2D) -> void:
	animation_player.play("def")
	out_tree.emit()
	inthetree = false
