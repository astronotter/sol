#version 330 compatibility

flat in int f_id;

layout(location = 0) out int color;

void main() {
    color = f_id;
}