// Based on this amazing tutorial: https://www.youtube.com/watch?v=vm9Sdvhq6ho

shader_type spatial;

uniform vec2 amplitude = vec2(0.3, 0.2);
uniform vec2 frequency = vec2(3.0, 2.5);
uniform float time_factor = 1;

uniform sampler2D albedo : hint_albedo;
uniform vec2 albedoScale = vec2(6.0, 2.0);

// Computes the height of each vertex in the water mesh
float height(in vec2 pos, in float time) {
	return amplitude.x * sin(frequency.x * pos.x + time * time_factor) + amplitude.y * sin(pos.y * frequency.y + time * time_factor);
}

void vertex() {
	vec2 pos = VERTEX.xz;
	VERTEX.y += height(pos, TIME);

	// Recompute these vectors to ensure correct lighting
	TANGENT = normalize(vec3(0.0, height(pos + vec2(0.0, 0.2), TIME) - height(pos + vec2(0.0, -0.2), TIME), 0.4));
	BINORMAL = normalize(vec3(0.4, height(pos + vec2(0.2, 0.0), TIME) - height(pos + vec2(-0.2, 0.0), TIME), 0.0));
	NORMAL = cross(TANGENT, BINORMAL);
}

void fragment() {
	ALBEDO = texture(albedo, UV * albedoScale).rgb;

	// Make certain parts of the texture have different levels of opacity
	if (ALBEDO.b > 0.85) {
		ALPHA = 0.8;
	} else {
		ALPHA = 0.5;
	}

	METALLIC = 0.5;
	ROUGHNESS = 0.3;
}