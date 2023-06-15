// include lighting.glgl

// its shader is light_texture frag

attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec2 aTexCoord;
attribute vec4 aVertexColor;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uNormalMatrix;

uniform bool uUseVertexColor;
uniform vec4 uMaterialColor;

varying highp vec2 vVertTexCoord;
varying vec3 vDiffuseColor;
varying vec3 vSpecularColor;
varying vec4 vColor;

void main(void) {

  // convert object coordinates to screen coor in clip space and put those value in built in 
  // gl_Position
  vec4 viewModelPosition = uModelViewMatrix * vec4(aPosition, 1.0);
  gl_Position = uProjectionMatrix * viewModelPosition;

  // set the Normal in screen coordinates as well
  vec3 vertexNormal = normalize(uNormalMatrix * aNormal);
  // set the vVertTexCoord to pass into frag
  vVertTexCoord = aTexCoord;

  // ? where is the function definition
  totalLight(viewModelPosition.xyz, vertexNormal, vDiffuseColor, vSpecularColor);

  for (int i = 0; i < 8; i++) {
    if (i < uAmbientLightCount) { // ? where is this uAmbientLightCount since there is no such attribute
      vDiffuseColor += uAmbientColor[i]; // ? where is this uAmbientColor since there is no such attribute
    }
  }
  
  // sets the vertex color according to the bool val uUseVertexColor
  vColor = (uUseVertexColor ? aVertexColor : uMaterialColor);
}
