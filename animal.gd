extends StaticBody2D
var tween:Tween
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var x : bool
var num : int
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	num = rng.randi() % 50 + 200
	tween = get_tree().create_tween().set_loops()
	tween.tween_callback(animation_player.play.bind("right"))
	tween.tween_property(self,"position:x",num,8).as_relative()
	tween.tween_callback(animation_player.play.bind("left"))
	tween.tween_property(self,"position:x",-num,8).as_relative()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
