class_name PlayerStateCrouch extends PlayerState

@export var deceleration_rate : float = 10


func init() -> void:
	pass


# Что происходит, когда мы входим в это состояние
func enter() -> void:
	#Проигрывать анимации
	player.animation_player.play("crouch")
	player.collision_stand.disabled = true
	player.collision_crouch.disabled = false
	pass

# Что происходит, когда мы выходим из этого состояния
func exit() -> void:
	player.collision_stand.disabled = false
	player.collision_crouch.disabled = true
	pass


# Функция, которая обрабатывает то, что происходит при нажатии и отпускании кнопки
func handle_input( _event: InputEvent ) -> PlayerState:
	#handle_input
	if _event.is_action_pressed("jump"):
		player.one_way_platform_shape_cast.force_shapecast_update()
		if player.one_way_platform_shape_cast.is_colliding() == true:
			player.position.y += 4
			return fall
		return jump
	return next_state



#Что происходит при каждом нажатии процесса в этом состоянии
func process( _delta: float ) -> PlayerState:
	if player.direction.y <= 0.5 :
		return idle
	return next_state


#Что происходит при каждом тике физического_процесса в этом состоянии
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x -= player.velocity.x * deceleration_rate * _delta
	if player.is_on_floor() == false:
		return fall
	return next_state
