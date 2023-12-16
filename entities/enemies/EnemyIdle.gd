extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed: = 10.0

var move_direction: int
var wander_time: float


func randomize_wander():
	move_direction = randi()%2
	if move_direction == 0:
		move_direction = -1
	else:
		move_direction = 1
		
	wander_time = randf_range(1,3)
	
func enter():
	randomize_wander()

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func physics_update(delta: float):
	if enemy:
		enemy.velocity.x = move_direction * move_speed
