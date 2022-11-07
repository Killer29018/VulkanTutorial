#version 450
layout(location = 0) in vec3 v_FragColour;
layout(location = 1) in vec2 v_TexCoords;
layout(location = 2) in float v_Time;

layout(location = 0) out vec4 f_Colour;

layout(binding = 1) uniform sampler2D u_TexSampler;

void main()
{
    vec4 texColour = texture(u_TexSampler, v_TexCoords);

    float mixValue = (sin(v_Time) + 1.0) / 2.0;

    f_Colour = vec4(mix(v_FragColour, texColour.rgb, mixValue), 1.0);

    // f_Colour = vec4(v_TexCoords, 0.0, 1.0);
    // f_Colour = vec4(v_FragColour, 1.0);
}
