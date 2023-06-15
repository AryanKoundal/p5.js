// vertex shader to create position vector, normal vector and vertex texture coordinates

attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec2 aTexCoord;
attribute vec4 aVertexColor;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uNormalMatrix;

uniform vec4 uMaterialColor;
uniform bool uUseVertexColor;

varying vec3 vVertexNormal;
varying highp vec2 vVertTexCoord;
varying vec4 vColor;

void main(void) {
  // convert object coordinates to screen coor in clip space and put those value in built in 
  // gl_Position
  vec4 positionVec4 = vec4(aPosition, 1.0);
  gl_Position = uProjectionMatrix * uModelViewMatrix * positionVec4;
  
  // set the Normal in screen coordinates as well
  vVertexNormal = normalize(vec3( uNormalMatrix * aNormal ));
  // set the vertex texture coordinates
  vVertTexCoord = aTexCoord;
  // sets the input attribute aVertexColor to output varying vColor
  vColor = (uUseVertexColor ? aVertexColor : uMaterialColor);
}
