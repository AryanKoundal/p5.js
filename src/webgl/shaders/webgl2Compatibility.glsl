// ? is the glsl not indented or im missing a formatter?
// ? i can't understand the flow of this program

// ifdef checks a macro, if the macro WEBGL2 is defined
// do the following actions
#ifdef WEBGL2

    #define IN in
    #define OUT out

    // checks if the macro FRAGMENT_SHADER is defined
    #ifdef FRAGMENT_SHADER
        // creates a vec4 and creates a macro with the name OUT_COLOR which will be replaced 
        // by out vec4 outColor
        out vec4 outColor; // ? why is not a # in the begg of this line
        #define OUT_COLOR outColor
    #endif

    #define TEXTURE texture
    #else
        // if there is a frag shader then replace all varying by IN
        #ifdef FRAGMENT_SHADER
            #define IN varying
        // else it will be a vert shader then replace all attributes by IN
        #else
            #define IN attribute
        #endif

    // replace all varying by OUT, but we have already confirmed above that it's not a frag shader
    #define OUT varying

    // ? why didn't we add the line below to the frag section above
    #define TEXTURE texture2D
    // if there is a frag shader replace gl_FragColor by OUT_COLOR
    #ifdef FRAGMENT_SHADER
        #define OUT_COLOR gl_FragColor
    #endif

#endif
