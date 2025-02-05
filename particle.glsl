#version 330 core

// Vertex Shader
#ifdef VERT

layout(location = 0) in vec3 aPos;
layout(location = 1) in float aSize;
layout(location = 2) in float aLife;

uniform mat4 projection;
uniform mat4 view;

out float vLife;

void main() {
    vLife = aLife;
    
    // Billboard calculation - always face camera
    vec3 pos = aPos;
    vec3 cameraRight = vec3(view[0][0], view[1][0], view[2][0]);
    vec3 cameraUp = vec3(view[0][1], view[1][1], view[2][1]);

    // Create billboard quad
    vec2 offset = vec2((gl_VertexID << 1) & 2, gl_VertexID & 2) - 1.0;
    pos += (cameraRight * offset.x + cameraUp * offset.y) * aSize;
    
    gl_Position = projection * view * vec4(pos, 1.0);
}

#endif

// Fragment Shader
#ifdef FRAG

in float vLife;
out vec4 FragColor;

void main() {
    // Calculate distance from center of particle
    vec2 coord = gl_PointCoord - vec2(0.5);
    float r = length(coord) * 2.0;
    
    // Soft circle shape
    float alpha = 1.0 - smoothstep(0.0, 1.0, r);
    
    // Fade out as lifetime decreases
    float fade = vLife / 2.0;  // assuming max life is 2.0
    
    // Final color - white particles that fade out
    FragColor = vec4(1.0, 1.0, 1.0, alpha * fade);
}

#endif
