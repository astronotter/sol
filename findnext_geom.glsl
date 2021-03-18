#version 330 compatibility

layout (triangles_adjacency) in;
layout (triangle_strip, max_vertices=5) out;

flat out int   f_patchid;
flat out float f_area;

void emit(int idx) {
  const vec2 quad[] = {
    vec2(-1,-1),
    vec2(1,-1),
    vec2(1,1),
    vec2(-1,1)
  };
  gl_Position = vec4(quad[idx], 0, 1);
  EmitVertex();
}

void main() {
  vec3 a = vec3(gl_in[1].gl_Position - gl_in[0].gl_Position);
  vec3 b = vec3(gl_in[5].gl_Position - gl_in[0].gl_Position);
  f_area = length(cross(a, b));
  f_patchid = gl_PrimitiveIDIn;

  emit(0); emit(1); emit(3); emit(2);
  EndPrimitive();
}