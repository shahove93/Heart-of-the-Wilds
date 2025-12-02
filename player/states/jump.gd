class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450.0


func init() -> void:
	pass


# Что происходит, когда мы входим в это состояние
func enter() -> void:
	#Проигрывать анимации
	player.animation_player.play("jump")
	player.add_debug_indicator( Color.LIME_GREEN)
	player.velocity.y = -jump_velocity
	pass

# Что происходит, когда мы выходим из этого состояния
func exit() -> void:
	player.add_debug_indicator( Color.YELLOW)
	pass


# Функция, которая обрабатывает то, что происходит при нажатии и отпускании кнопки
func handle_input( event: InputEvent ) -> PlayerState:
	if event.is_action_released("jump"):
		player.velocity.y *= 0.5
		return fall
	return next_state



#Что происходит при каждом нажатии процесса в этом состоянии
func process( _delta: float ) -> PlayerState:
	
	return next_state


#Что происходит при каждом тике физического_процесса в этом состоянии
func physics_process( _delta: float ) -> PlayerState:
	if player.is_on_floor():
		return idle
	if player.velocity.y >= 0:
		return fall
	player.velocity.x = player.direction.x * player.move_speed
	return next_state
