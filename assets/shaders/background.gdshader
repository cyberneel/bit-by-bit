shader_type canvas_item;

uniform vec4 bgColor = vec4(0.682, 0.898, 0.93, 1.0); // Background color
uniform vec2 grid_size = vec2(50.0, 50.0); // Grid cell size
uniform vec4 line_color = vec4(0.0, 0.0, 1.0, 1.0); // Grid line color (blue)
uniform float line_thickness = 1.0; // Grid line thickness
uniform vec2 camera_offset = vec2(0.0, 0.0); // Camera world position

void fragment() {
    // Adjust the UV coordinates based on camera offset to simulate movement without parallax
    vec2 uv = UV * grid_size - (-camera_offset / grid_size);

    // Create grid lines
    vec2 grid = fract(uv);
    float lineX = smoothstep(0.0, line_thickness / grid_size.x, grid.x) *
                  smoothstep(1.0, 1.0 - (line_thickness / grid_size.x), grid.x);
    float lineY = smoothstep(0.0, line_thickness / grid_size.y, grid.y) *
                  smoothstep(1.0, 1.0 - (line_thickness / grid_size.y), grid.y);

    float line = 1.0 - min(lineX, lineY); // Combine X and Y lines

    // Mix background and grid line colors
    COLOR = mix(bgColor, line_color, line);
}
