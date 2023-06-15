// ? is the glsl not indented or im missing a formatter? : not formatted as a writing style for preprocessors

// ifdef checks a macro, if the macro WEBGL2 is defined
// do the following actions
#ifdef WEBGL2

    #define IN in
    #define OUT out

    // checks if the macro FRAGMENT_SHADER is defined
    #ifdef FRAGMENT_SHADER
        // creates a vec4 and creates a macro with the name OUT_COLOR which will be replaced 
        // by out vec4 outColor
        out vec4 outColor; // ? why is not a # in the begg of this line: cause it would be part of a shader prog
        #define OUT_COLOR outColor
    #endif

    #define TEXTURE texture
#else
    // if there is a frag shader then replace all IN by varying
    #ifdef FRAGMENT_SHADER
        #define IN varying
    // else it will be a vert shader then replace all IN by attributes
    #else
        #define IN attribute
    #endif

    // replace all OUT  by varying, but we have already confirmed above that it's not a frag shader
    #define OUT varying
    #define TEXTURE texture2D

    // ? why didn't we add the line below to the frag section above
    // if there is a frag shader replace OUT_COLOR by  gl_FragColor
    #ifdef FRAGMENT_SHADER
        #define OUT_COLOR gl_FragColor
    #endif

#endif
