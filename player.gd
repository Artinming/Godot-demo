extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var	movedir
var sth : String = "down_idle"
const SPEED = 2
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	movedir = Input.get_vector("a","d","w","s")
	move()
	move_and_slide()
	#print(position)
	
func  move():
	
	if movedir.y < 0 and movedir.x == 0:
		animated_sprite_2d.play("up_move")
		position += Vector2(0,-SPEED)
		sth = "up_idle"
	if movedir.y > 0 and movedir.x == 0:
		animated_sprite_2d.play("down_move")
		position += Vector2(0,SPEED)
		sth = "down_idle"
	if movedir.x < 0:
		animated_sprite_2d.play("left_move")
		position += Vector2(-SPEED,0)
		sth = "left_idle"
	if movedir.x > 0:
		animated_sprite_2d.play("right_move")
		position += Vector2(SPEED	,0)
		sth = "right_idle"
	if movedir.x == 0 and movedir.y == 0:
		animated_sprite_2d.play(sth)
	pass
	
func treein():
	print(778)
