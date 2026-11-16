shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float warp_intensity : hint_range(0.0, 0.1) = 0.03; 
uniform float time_scale : hint_range(0.1, 10.0) = 1.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    float warpx = sin(uv.x * 10.0 + (TIME * time_scale)) * warp_intensity;
	float warpy = cos(uv.y * 10.0 + (TIME * time_scale)) * warp_intensity;
    
    uv.y += warpx;
	uv.x += warpy;
    
    COLOR = texture(SCREEN_TEXTURE, uv);
}
