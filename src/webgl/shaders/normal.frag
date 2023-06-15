// sets the built in variable gl_FragColor

precision mediump float;
varying vec3 vVertexNormal;
void main(void) {
  gl_FragColor = vec4(vVertexNormal, 1.0);
}