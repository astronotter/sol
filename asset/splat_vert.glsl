#version 300 es
precision highp float;

layout (location = 0) in vec4 pos_in;
out int v_patchid;

void main() {
    gl_Position = pos_in;
}