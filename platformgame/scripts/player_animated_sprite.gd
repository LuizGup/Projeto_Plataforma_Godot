extends AnimatedSprite2D

class_name PlayerAnimatedSprite

var direcao: float = 0.2

func trigger_animation(velocity: Vector2, direction: int, player_mode: player.playerMode):
	var animation_prefix = player.playerMode.keys()[player_mode].to_snake_case()

	if not get_parent().is_on_floor():
		play("%s_jump" % animation_prefix)
		
	elif sign(velocity.x) != sign(direction) && velocity.x != 0 && direction != 0:
		if direction == -1:
			direcao = -0.2
		else:
			direcao = 0.2
		play("%s_slide" % animation_prefix)
		scale.x = direcao
		
		print("a direction é: ", direction)
		
	else:
		#print("a direcao é: ", direcao)
		#print("a velocity é: ", velocity.x)
		#print("a scale é: ", scale.x)

		if scale.x >= (0.2) && sign(velocity.x) < 0:
			scale.x = -0.2
		elif scale.x <= (0.2) && sign(velocity.x) > 0:
			scale.x = 0.2
			
		if velocity.x != 0:
			play("%s_run" % animation_prefix)
		else:
			play("%s_idle" % animation_prefix)
