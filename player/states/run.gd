class_name PlayerStateRun extends PlayerState


func init() -> void:
	pass


# Что происходит, когда мы входим в это состояние
func enter() -> void:
	#Проигрываем анимации
	player.animation_player.play("run")
	pass

# Что происходит, когда мы выходим из этого состояния
func exit() -> void:
	pass


# Функция, которая обрабатывает то, что происходит при нажатии и отпускании кнопки
func handle_input( _event: InputEvent ) -> PlayerState:
	if _event.is_action_pressed("jump"):
		return jump
	return next_state



#Что происходит при каждом нажатии процесса в этом состоянии
func process( _delta: float ) -> PlayerState:
	if player.direction.x == 0:
		return idle
	elif player.direction.y > 0.5:
		return crouch
	return next_state


#Что происходит при каждом тике физического_процесса в этом состоянии
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x = player.direction.x * player.move_speed
	if player.is_on_floor() == false:
		return fall
	return next_state
