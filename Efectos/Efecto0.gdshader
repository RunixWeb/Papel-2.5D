shader_type canvas_item;

// Captura la pantalla que está detrás del ColorRect
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

// Variables que modificaremos desde el script
uniform float intensidad_rgb : hint_range(0.0, 0.05) = 0.0;
uniform float intensidad_scanline : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    
    // 1. DISTORSIÓN RGB (Chromatic Aberration)
    // Desfasamos ligeramente las coordenadas X para el rojo y el azul
    float r = texture(screen_texture, uv + vec2(intensidad_rgb, 0.0)).r;
    float g = texture(screen_texture, uv).g;
    float b = texture(screen_texture, uv - vec2(intensidad_rgb, 0.0)).b;
    
    vec3 color_final = vec3(r, g, b);
    
    // 2. SCANLINES
    // Usamos el seno sobre la coordenada Y para hacer líneas horizontales
    // Multiplicamos por 800.0 para la cantidad de líneas (ajustable)
    float scanline = sin(uv.y * 800.0) * 0.04 * intensidad_scanline;
    color_final -= scanline; // Oscurecemos las líneas
    
    COLOR = vec4(color_final, 1.0);
}