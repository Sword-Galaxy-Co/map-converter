extends Control


@onready var inputTE: TextEdit = $MarginContainer/VBoxContainer/HSplitContainer2/EditorPanel/VBoxContainer/Input
@onready var outputTE: CodeEdit = $MarginContainer/VBoxContainer/HSplitContainer2/EditorPanel2/VBoxContainer/Output
@onready var Convert: Button = $MarginContainer/VBoxContainer/HBoxContainer/Button


const X = 10.0
var layout = ""

const CHAR ={
	"a":"─", 
	"b":"│",
	"c":"┌", 
	"d":"┐",
	"e":"└", 
	"f":"┘", 
	"g":"├", 
	"h":"┤", 
	"i":"┬", 
	"j":"┴", 
	"k":"┼", 
	"l":"═",
	"m":"║", 
	"n":"╒", 
	"o":"╓", 
	"p":"╔", 
	"q":"╕", 
	"r":"╖", 
	"s":"╗", 
	"t":"╘", 
	"u":"╙", 
	"v":"╚", 
	"w":"╛", 
	"x":"╜", 
	"y":"╝", 
	"z":"╞", 
	"A":"╟", 
	"B":"╠", 
	"C":"╡", 
	"D":"╢", 
	"E":"╣", 
	"F":"╤", 
	"G":"╥", 
	"H":"╦", 
	"I":"╧", 
	"J":"╨", 
	"K":"╩", 
	"L":"╪", 
	"M":"╫", 
	"N":"╬", 
	"O":"░", 
	"P":"▒", 
	"Q":"▓", 
	"R":"█", 
	"S":"▌",
	"T":"▐",
	"U":" ",
	"V":"X",
	"W":"X",
	"X":"X",
	"Y":"X",
	"Z":"X",
	"1":"Bedroom",
	"2":"Lobby",
	"3":"Bathroom",
	"4":"Kitchen",
	"5":"Dinning",
	"6":"Hall",
	"7":"Living",
	"8":"storage",
	"9":"X",
	"0":"X"
}

func _ready() -> void:
	var outline :String ="abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	inputTE.placeholder_text = outline
	outputTE.placeholder_text= Map_from_Char(outline)
	
	pass

func Map_from_Char(text: String) -> String:
	var result = ""
	var v = true
	for letter in text:
		if CHAR.has(letter) and v == true:
			result = CHAR[letter]
			v = false
		elif CHAR.has(letter) and v == false:
			result += CHAR[letter]
		else:
			result += letter
	return result
func _on_button_pressed() -> void:
	layout = Map_from_Char(inputTE.text)
	outputTE.text = layout
	pass
func _on_button_3_pressed() -> void:
	if true:
		var ip:String = inputTE.text
		var op:String = outputTE.text
		inputTE.text = str(CHAR)
		inputTE.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
		inputTE.editable = false
		inputTE.text += "Press Hint again after"
		Convert.visible = false
		await get_tree().create_timer(X).timeout
		inputTE.wrap_mode = TextEdit.LINE_WRAPPING_NONE
		Convert.visible = true
		inputTE.text = ip
		outputTE.text = op
		inputTE.editable = true


func _on_input_text_changed() -> void:
	layout = Map_from_Char(inputTE.text)
	outputTE.text = layout
	pass


func _on_button_2_pressed() -> void:
	print("WIP")
	var hell = str(outputTE.text)
	print(hell)
	
	FileAccess.open("user://help.txt",FileAccess.WRITE).store_string(hell)
	
pass # Replace with function body.
