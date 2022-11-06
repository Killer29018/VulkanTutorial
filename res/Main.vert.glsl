#version 450
layout(location = 0) in vec2 i_Position;
layout(location = 1) in vec3 i_Colour;

layout(location = 0) out vec3 v_FragColour;

void main()
{
    gl_Position = vec4(i_Position, 0.0, 1.0);
    v_FragColour = i_Colour;
}
