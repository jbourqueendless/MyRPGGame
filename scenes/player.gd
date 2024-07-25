@tool
class_name Player
extends CharacterBody2D

const Types = preload("res://addons/block_code/types/types.gd")

func get_custom_class():
	return "Player"

static func get_custom_blocks() -> Array[Block]:
	var b: Block
	var block_list: Array[Block] = []
	
	b = CategoryFactory.BLOCKS["parameter_block"].instantiate()
	b.variant_type = TYPE_VECTOR2
	b.block_format = "Get input vector {negative_x: STRING} {positive_x: STRING} {negative_y: STRING} {positive_y: STRING}"
	b.statement = "Input.get_vector({negative_x}, {positive_x}, {negative_y}, {positive_y})"
	b.category = "Player"
	block_list.append(b)
	
	b = CategoryFactory.BLOCKS["statement_block"].instantiate()
	b.block_type = Types.BlockType.EXECUTE
	b.block_format = "Add movement input {input_vector: VECTOR2} and {speed: FLOAT}"
	b.statement = "velocity = {input_vector}*{speed}\nmove_and_slide()"
	b.category = "Player"
	block_list.append(b)
	
	return block_list
