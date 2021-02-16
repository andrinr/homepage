
precision highp float;
varying vec2 v_texcoord;
uniform sampler2D u_texture;
uniform vec2 mouse_pos;
uniform float off_gravity;
uniform float restore_colors;
uniform float dt;
uniform float time;

vec2 n2rand() {
    return vec2(fract(sin(dot(v_texcoord.xy + vec2(time/100.), vec2(12.9898, 78.233))) * 43758.5453),
    fract(sin(dot(v_texcoord.xy * 1.61803 + vec2(time/100.), vec2(12.9898, 78.233))) * 43758.5453));
}
void main() {
    vec4 particle = texture2D(u_texture, v_texcoord);
    vec2 acc, pos, vel;
    pos = particle.xy;
    vel = particle.zw;
    acc = vec2(0.);


    acc.x += 0.03 * (sin(pos.x*6.+time) + cos(pos.y * 12.+time) * cos(pos.x * 8.4 - time));
    acc.y += 0.03*  (cos(pos.y*9.5-time) + sin(pos.x * 15.-time) * sin(pos.x * 10.2 + time));

    vel += dt * acc;

    //vel += dt * 0.5 * (gravity_center-vec2(0.5));

    vel *= 0.97;

    pos += dt * vel;

    if (float(fract(v_texcoord.y - time*0.05)) < 0.1){
        pos.x = mouse_pos.x;
        pos.y = mouse_pos.y;
        vel.x = 0.1* cos(mouse_pos.x*40. + v_texcoord.x*6.3);

        vel.y = 0.1*sin(mouse_pos.y*40. + v_texcoord.x *6.3);
    }

    if (pos.x > 1.){
        vel.x = -vel.x * 4.;
    }

    if (pos.x < 0.){
        vel.x = -vel.x * 4.;
    }

    if (pos.y > 1.){
        vel.y = -vel.y * 4.;
    }

    if (pos.y < 0.){
        vel.y = -vel.y * 4.;
    }

    gl_FragColor = vec4(pos, vel);
}