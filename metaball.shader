shader_type canvas_item;
render_mode unshaded;

uniform int blurSize : hint_range(0,45) = 35;

void fragment() {
	// this blur depends on the zoom of the screen, so not perfect for getting the right results all the time
	COLOR = textureLod(SCREEN_TEXTURE, SCREEN_UV, float(blurSize)/10.0);
	
	float alpha = 1.0;
	vec3 color = texture(TEXTURE, UV).rgb;
	float average = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
	// outside of everything, no balls
	// set alpha to 0.0 to set a sharp outer edge
	if(average < 0.3) {
		alpha = 0.0;
	}
	// outer edges of balls, where there's very little pixels
	// alpha is 1.0 by default, we can adjust the color here
	// color starts at full white (r/g/b = 1.0), so we can reduce channels to get color
	if(average > 0.2 && average < 0.4) {
		color.r = 0.3;
		color.g = 0.6;
		color.b = 0.8;
	}
	// center of balls, most coverage of pixels
	// alpha is 1.0 by default, we can adjust the color here
	// color starts at full white (r/g/b = 1.0), so we can reduce channels to get color
	if(average > 0.4) {
		color.r = 0.2;
		color.g = 0.8;
		color.b = 1.0;
	}
	COLOR = vec4(color, alpha);
}