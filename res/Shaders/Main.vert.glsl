#version 450
layout(location = 0) in vec2 i_Position;
layout(location = 1) in vec3 i_Colour;
layout(location = 2) in vec2 i_TexCoords;

layout(location = 0) out vec3 v_FragColour;
layout(location = 1) out vec2 v_TexCoords;
layout(location = 2) out float v_Time;

layout (binding = 0) uniform Uniforms
{
    float time;
    mat4 model;
    mat4 view;
    mat4 proj;
} obj;

void main()
{
    gl_Position = obj.proj * obj.view * obj.model * vec4(i_Position, 0.0, 1.0);
    v_TexCoords = i_TexCoords;
    v_FragColour = i_Colour;
    v_Time = obj.time;
}
