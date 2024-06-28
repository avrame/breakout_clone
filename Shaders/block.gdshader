shader_type canvas_item;

uniform vec4 color : source_color;

void vertex() {
	
}

void fragment() {
	//COLOR = vec4(UV, 1, 0.75);
	COLOR.r = COLOR.r + color.r;
	COLOR.g = COLOR.g + color.g;
	COLOR.b = COLOR.b + color.b;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
