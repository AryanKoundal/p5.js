precision mediump float;
// varying comes from the vertex shader, it is color vector of 4 values rgba
varying vec4 vColor;

void main(void) {
  // the built in variable gl_FragColor is cerated using vColors rgb value and setting alpha to 1
  // the  resultant is multiplied by the alpha then seperately
  gl_FragColor = vec4(vColor.rgb, 1.) * vColor.a;
}