#version 450
layout(location = 0) in vec3 v_FragColour;
layout(location = 0) out vec4 f_Colour;

void main()
{
    f_Colour = vec4(v_FragColour, 1.0);
}
