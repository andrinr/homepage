<script lang="ts">
import Project from "./Project.svelte";

    
</script>

<Project title="Frequency Driven, GPU accelerated Audio Analysis" date="15.09.2020" >
    <div class="segment">
        <img src="/img/frequency.png" alt="colorfull particles">
    </div>

    <div class="segment">
        <h3>Reacting to sound</h3>
        <p>
            I’m always trying to improve sound reactivity in my projects. 
            Usually I'd use peak values for some frequency ranges, 
            for example one value would be driven by the frequencies between 20 and 100 Hz. 
            While this does react well to rhythm and changes in loudness of the song, it fails to make use of the melody.
        </p>
        <img class="img-wide" src="/img/frequency_3.png" alt="huge number of colorful particles">
    </div>

    <div class="segment">
        <h3>Extracting melodies</h3>
        <p>
            In this approach we are calculating the frequency values of peak values and project them on a 3D sphere in order to
            spwan particles.
        </p>
    </div>

    <div class="segment">
        <h3>GPU Accelerated particles</h3>
        <p>
            Since the GPU is much more capable of processing a large number of calculations simultaneously, all position
            and velocity calcualtions are done on the CPU using a compute shader.
        </p>

        <br>
        <img class="img-wide" src="/img/frequency_4.gif" alt="huge number of colorful particles">
        <p>
            In this animation we can see the position data of the particles where R=X, G=Y and B=Z positions.
        </p>
        <br>
        <img class="img-wide" src="/img/frequency_5.gif" alt="huge number of colorful particles">
        <p>
            The position data shader is then feed into a vertex shader which displaces vertex positions according to
            the coresponding x,y,z values.
        </p>
        <br>
        <img src="/img/frequency_6.png" alt="huge number of colorful particles">
        <p>The final shader for the particle physics</p>

        <br>
        <img src="/img/frequency_7.png" alt="huge number of colorful particles">
        <p>And the vertex shader</p>
    </div>





    <div class="segment">
        <h3>1638400 particles</h3>
        <img class="img-wide" src="/img/frequency_2.png" alt="huge number of colorful particles">
    </div>

    <div class="segment">
        <p>
            <a href="https://github.com/andrinr/frequency-gpu-particles">Get this project on Gihtub</a>
        </p>
    </div>

</Project>

<style>
    img{
        width: 100%;
    }
</style>
