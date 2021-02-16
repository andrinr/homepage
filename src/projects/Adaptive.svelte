<script lang="ts">
import { ETag } from "./info";

import Project from "./Project.svelte";

    
</script>

<Project title="Adaptive CPU Renderer" date="5.01.2020" >
    <div class="segment">
        <img src="/img/points.png" alt="Mandelbrot fractal">
    </div>

    <div class="segment">
        <h3>Prime groups</h3>
        <p>
            In discrete mathematics a group with a prime size, every number is generator.
            In Example, given a group size 5 and a generator 3 we have following sequence:
        </p>
        <ul>
            <li>
                0*3 % 5 = 0
            </li>
            <li>
                1*3 % 5 = 3
            </li>
            <li>
                2*3 % 5 = 1
            </li>
            <li>
                3*3 % 5 = 4
            </li>
            <li>
                4*3 % 5 = 2
            </li>
            <li>
                5*3 % 5 = 0
            </li>
            ...
        </ul>
        <p>
            This means each number between 0 and 5 will be reached exactly once when the generator is multiplied
            by the numbers between 0 and 5, but the advantage is, the numbers dont have a fixed difference inbetween them. 
        </p>
    </div>

    <div class="segment">
        <h3>Mandelbrot</h3>
        <p>
            In this case we are making use of this property to display a mandelbrot fractal. In order to render this, 
            for each pixel a cumputationally costly calcualtions have to be made. Therefore a CPU will struggle to keep up with this. 
            This renderer uses the exact nummerical concepts described above to partially render an image for each frame. 
            Since the pattern of the selection process of the pixels is less easy to spot, it will appear as a certain noise or blur.
        </p>
    
    </div>


    <div class="segment">
        <img class="img-wide" src="/img/points_2.png" alt="mandelbrot fractal with motion noise">
    </div>


    <div class="segment">
        <p>
            <a href="https://github.com/andrinr/random-packing">Get this project on Gihtub</a>
        </p>
    </div>

</Project>

<style>
</style>
