#version 450
#extension GL_ARB_shading_language_include : require
#pragma include "../common.glsl"

layout(location = 0) in vec2 texCoord;

out vec4 fragColor;

uniform Uniforms uniforms;

void main() {
    vec4 rgba = texture(texImage, texCoord);
    rgba.rgb *= rgba.a;
    rgba += max(vec4(0.0), vec4(uniforms.bg_color.rgb, 1.0)) * (1.0 - rgba.a);
    rgba.a *= uniforms.bg_color.a;
    fragColor = rgba;
}
