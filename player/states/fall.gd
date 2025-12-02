class_name PlayerStateFall extends PlayerState

@export var fall_gravity_mulitplier : float = 1.165
@export var coyote_time : float = 0.125
@export var jump_buffer_time = 0.2

var coyote_timer : float = 0
var buffer_timer : float = 0

func init() -> void:
	pass


# Что происходит, когда мы входим в это состояние
func enter() -> void:
	#Проигрываем анимации
	player.gravity_mulitplier = fall_gravity_mulitplier
	if player.previous_state == jump:
		coyote_timer = 0
	else:
		coyote_timer = coyote_time
	pass

# Что происходит, когда мы выходим из этого состояния
func exit() -> void:
	player.gravity_mulitplier = 1.0
	pass


# Функция, которая обрабатывает то, что происходит при нажатии и отпускании кнопки
func handle_input( _event: InputEvent ) -> PlayerState:
	#handle_input
	if _event.is_action_pressed("jump"):
		if coyote_timer > 0:
			return jump
		else:
			buffer_timer = jump_buffer_time
	return next_state



#Что происходит при каждом нажатии процесса в этом состоянии
func process( _delta: float ) -> PlayerState:
	coyote_timer -= _delta
	buffer_timer -= _delta
	return next_state


#Что происходит при каждом тике физического_процесса в этом состоянии
func physics_process( _delta: float ) -> PlayerState:
	if player.is_on_floor():
		player.add_debug_indicator()
		if buffer_timer > 0:
			return jump
		return idle
	player.velocity.x = player.direction.x * player.move_speed
	return next_state
