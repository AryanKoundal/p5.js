// a vertex shader that assigns a color to each vertex and also 
// modifies the size of the rendered point primitives

// take 2 inputs a position and a color for that position
attribute vec3 aPosition;
attribute vec4 aVertexColor;

// has 4 uniforms that will be read from the cpu
uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform float uResolution;
uniform float uPointSize;

// output to frag shader the color of each vertex position
varying vec4 vColor;

void main(void) {
  // creates a vec4.xyzw with the xyz as the aPosition.xyz and w as 1.0 which means it 
  // is a point rather than a vector
  vec4 positionVec4 = vec4(aPosition, 1.0);
  // convertes the positions into screen plane and sets the built in variable gl_position
  gl_Position = uProjectionMatrix * uModelViewMatrix * positionVec4;
  // sets the input attribute aVertexColor to output varying vColor
  vColor = aVertexColor;
  // Assigning a value to gl_PointSize in the vertex shader to control the size of points on a per-vertex basis.
  gl_PointSize = uPointSize;
}
