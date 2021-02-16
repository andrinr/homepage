<script lang="ts">
    import {onMount, onDestroy} from "svelte";
    import vInit from "../../public/shaders/vInit.glsl"
    import fInit from "../../public/shaders/fInit.glsl"
    import vPhysics from "../../public/shaders/vPhysics.glsl"
    import fPhysics from "../../public/shaders/fPhysics.glsl"
    import vDraw from "../../public/shaders/vDraw.glsl"
    import fDraw from "../../public/shaders/fDraw.glsl"

    let requestId = undefined;

    onMount( async() => {
        const twgl = await import('twgl.js');
        const mousepos = [0.5, 0.5];
        const canvas = document.getElementById('canvas');
        let gl = canvas.getContext('webgl');
        let gl2 = true;
        let linear_float = null;
        let float = null;
        if (!gl){
            gl2 = false;
            gl = canvas.getContext('webgl');
            twgl.addExtensionsToContext(gl);
            linear_float = gl.getExtension("OES_texture_float_linear");
            float = gl.getExtension("OES_texture_float");
        }
        else{
            twgl.addExtensionsToContext(gl);
            linear_float = gl.getExtension("OES_texture_float_linear");
        }


        const programInit = twgl.createProgramInfo(gl, [vInit, fInit]);
        const programPhysics = twgl.createProgramInfo(gl, [vPhysics, fPhysics]);
        const programDraw = twgl.createProgramInfo(gl, [vDraw, fDraw]);
        let attachments = [];

        // Fallbacks
        if (gl2 && linear_float) {
            attachments = [
                { format: gl.RGBA32F, type: gl.FLOAT,  min: gl.LINEAR}
            ];
        }
        else if (linear_float && float){
            attachments = [
                {format: gl.RGBA,  type: gl.FLOAT, min: gl.LINEAR},
                {format: gl.DEPTH_STENCIL}
            ];
        }
        else{
            attachments = [
                {format: gl.RGBA,  type: gl.UNSIGNED_BYTE, min: gl.LINEAR},
                {format: gl.DEPTH_STENCIL}
            ];
        }

        const n = 512;
        const m = 512;

        let fb1 = twgl.createFramebufferInfo(gl, attachments, n, m);
        let fb2 = twgl.createFramebufferInfo(gl, attachments, n, m);
        const positionObject = { position: { data: [1, 1, 1, -1, -1, -1, -1, 1], numComponents: 2 } };
        const positionBuffer = twgl.createBufferInfoFromArrays(gl, positionObject);

        const pointData = [];
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < m; j++) {
                pointData.push(i / (n - 1));
                pointData.push(j / (m - 1));
            }
        }

        const pointsObject = { v_texcoord: { data: pointData, numComponents: 2 } };
        const pointsBuffer = twgl.createBufferInfoFromArrays(gl, pointsObject);

        // particle initialization
        gl.useProgram(programInit.program);
        twgl.setBuffersAndAttributes(gl, programInit, positionBuffer);
        twgl.bindFramebufferInfo(gl, fb1);
        twgl.drawBufferInfo(gl, positionBuffer, gl.TRIANGLE_FAN);

        let dt;
        let prevTime;
        let temp;
        let offGravity = 0;
        let restoreColors = 0;

        function draw(time) {
            twgl.resizeCanvasToDisplaySize(gl.canvas);
            gl.viewport(0, 0, gl.canvas.width, gl.canvas.height);
            dt = (prevTime) ? time - prevTime : 0;
            prevTime = time;

            // particle physics
            gl.useProgram(programPhysics.program);
            twgl.setBuffersAndAttributes(gl, programPhysics, positionBuffer);
            twgl.setUniforms(programPhysics, {
                u_texture: fb1.attachments[0],
                mouse_pos: mousepos,
                off_gravity: offGravity,
                restore_colors: restoreColors,
                time: prevTime,
                dt: 2.5 * dt,
            });
            twgl.bindFramebufferInfo(gl, fb2);
            twgl.drawBufferInfo(gl, positionBuffer, gl.TRIANGLE_FAN);

            // drawing particles
            gl.useProgram(programDraw.program);
            twgl.setBuffersAndAttributes(gl, programDraw, pointsBuffer);
            twgl.setUniforms(programDraw, { u_texture: fb2.attachments[0] });
            twgl.bindFramebufferInfo(gl, null);
            twgl.drawBufferInfo(gl, pointsBuffer, gl.POINTS);

            // ping-pong buffers
            temp = fb1;
            fb1 = fb2;
            fb2 = temp;
        }

        (function animate(now) {
            draw(now / 1000);
            requestId = requestAnimationFrame(animate);
        })(0);

        function setMousePos(e) {
            const box = document.getElementById("canvas").getBoundingClientRect();
            mousepos[0] = (e.clientX - box.left) / box.width;
            mousepos[1] = 1- ((e.clientY - box.top) / box.height);
        }

        canvas.addEventListener('mousemove', setMousePos);
        


        function handleTouch(e) {
            e.preventDefault();
            setMousePos(e.touches[0]);
        }

        canvas.addEventListener('contextmenu', e => e.preventDefault());
        canvas.addEventListener('touchstart', handleTouch, {passive: false});
        canvas.addEventListener('touchmove', handleTouch, {passive: false});
    });

    onDestroy(() => {
        if (requestId) {
            window.cancelAnimationFrame(requestId);
            requestId = undefined;
        }
    });

</script>

<style>

    #canvas{
        width: 100vw;
        height: 100vh;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 10;
        background-color: var(--black);
    }

    .text{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        z-index: 12;
        color: var(--white);
        padding: 0.1em  0.2em;
        background-color: var(--black);
    }

    h1{
        font-size: 5em;
    }

    h1:hover{
        background-color: var(--secondary);
    }
</style>

<canvas id="canvas"></canvas>


<div class="text">
    <h3>
        andrinrehmann
    </h3>
    <a href="#/projects">
    <h2>
        /explore
    </h2>
    </a>
</div>


