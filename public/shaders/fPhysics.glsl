
precision highp float;
varying vec2 v_texcoord;
uniform sampler2D u_texture;
uniform vec2 gravity_center;
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

    vec2 v = gravity_center - pos;
    float d = length(v);

    if (abs(d) < 0.1){
        acc = -normalize(v) * 4. * d;
    }

    acc.x += 0.05 * (sin(pos.x*6.+time) + cos(pos.y * 12.+time) * cos(pos.x * 8.4 - time));
    acc.y += 0.05*  (cos(pos.y*9.5-time) + sin(pos.x * 15.-time) * sin(pos.x * 10.2 + time));

    vel += dt * acc;

    vel += dt * 0.5 * (gravity_center-vec2(0.5));

    vel *= 0.99 - 0.2*abs(sin(time*0.1));

    pos += dt * vel;

    if (pos.x > 1.){
        pos.x = 0.;
    }

    if (pos.x < 0.){
        pos.x = 1.;
    }

    if (pos.y > 1.){
        pos.y = 0.;
    }

    if (pos.y < 0.){
        pos.y = 1.;
    }

    gl_FragColor = vec4(pos, vel);
}