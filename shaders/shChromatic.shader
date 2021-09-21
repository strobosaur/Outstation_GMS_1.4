//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// X & Y INPUT
uniform float x_dist;
uniform float y_dist;
uniform float r_dist;
uniform float gb_dist;

// CHAOS INPUT
uniform float chaos1;
uniform float saturation1;

// COLOR MIX
uniform float contrast1;

// GAUSSIAN BLUR STRENGTH
uniform vec3 gblur1;//width,height,radius

const int Quality = 4;
const int Directions = 16;
const float Pi = 6.28318530718;//pi * 2

// SHADER
void main() 
{
    // SEPARATE R & GB TEX COORDS
    vec2 r_xy = vec2( v_vTexcoord);
    vec2 gb_xy = vec2( v_vTexcoord);
    // R
    r_xy.x += 0.002 * r_dist * x_dist;
    r_xy.y += 0.002 * r_dist * y_dist;
    // GB
    gb_xy.x -= 0.002 * gb_dist * x_dist;
    gb_xy.y -= 0.002 * gb_dist * y_dist;
    
    // MAKE COLORMODDED SHEETS
    vec4 Color1 = texture2D( gm_BaseTexture, v_vTexcoord ) / (3.0);
    vec4 Color2 = texture2D( gm_BaseTexture, r_xy ) / (3.0 / saturation1);
    vec4 Color3 = texture2D( gm_BaseTexture, gb_xy ) / (3.0 / saturation1);
    
    vec4 Color2_base = Color2;
    vec4 Color3_base = Color3;
    
    // CRANKED SATURATION
    Color1 *= chaos1;
    // NULLIFY COLOR CHANNELS
    Color2.g = 0.0;
    Color2.b = 0.0;
    Color3.r = 0.0;
    
    // CONTRASTING
    Color2 = mix(Color2_base, Color2, contrast1);
    Color3 = mix(Color3_base, Color3, contrast1);
    
    // MIX COLORS TO ONE
//    vec4 gbColor = (Color1 + Color2 + Color3)
    
    // GAUSSIAN BLUR
/*    vec2 radius = gblur1.z/gblur1.xy;
    vec4 gbColor = texture2D( gm_BaseTexture, v_vTexcoord);
    for( float d=0.0;d<Pi;d+=Pi/float(Directions) )
    {
        for( float i=1.0/float(Quality);i<=1.0;i+=1.0/float(Quality) )
        {
            gbColor += texture2D( gm_BaseTexture, v_vTexcoord+vec2(cos(d),sin(d))*radius*i);
        }
    }
    
    gbColor /= float(Quality)*float(Directions)+1.0;*/
    
    // ALL TOGETHER
    gl_FragColor = v_vColour * (Color1 + Color2 + Color3);
    
}
