extends Area2D

# 加分值，可在检查器里调，不同金币可以不一样
@export var score_value: int = 100

func _ready():
	# 信号驱动：玩家进入碰撞范围时触发
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	# 只对玩家生效（用分组判断，不写死节点名）
	if not body.is_in_group("player"):
		return

	# 加分
	Global.add_score(score_value)

	# 防止重复触发
	set_deferred("monitoring", false)

	# 消失动画 + 删除自己
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.2)
	tween.tween_property(self, "modulate:a", 0.0, 0.2)
	await tween.finished
	queue_free()
