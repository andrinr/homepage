<script lang="ts">

import Project from "./Project.svelte";

    
</script>

<Project title="Cellular folding" date="26.03.2019" >
    <div class="segment">
        <img src="/img/folding.png" alt="particles simulating cell folding">
    </div>

    <div class="segment">
        <h3>Attraction and Retraction</h3>
        <p>
            All particles are positioned along a circle and following algorithm is executed on each time:
        </p>
        <ol>
            <li>
               Keep fixed distance to n neighbours to the left and right
            </li>
            <li>
                Avoid particles other than neighbours as good as possible
            </li>
            <li>
                Spwan new particles between a n random paris of particles
            </li>
        </ol>
    </div>

    <div class="segment">
        <h3>Improving efficiency</h3>
        <p>
            As we are dealing with a n-body simulation, efficiency is key to be able to run this code with 
            an acceptable amount of particles. In this code a very naive approach is used, where each particle
            only checks its distance to n random other particles instead of all of them. This works suprisingly well. 
        </p>
    
    </div>


    <div class="segment">
        <h3>Stronger Retraction:</h3>
        <img class="img-wide" src="/img/folding_2.png" alt="particles following sinoid patterns">
    </div>

    <div class="segment">
        <h3>weaker retraction:</h3>
        <img class="img-wide" src="/img/folding_4.png" alt="particles following sinoid patterns">
    </div>


    <div class="segment">
        <p>
            <a href="https://github.com/andrinr/cell-growth">Get this project on Gihtub</a>
        </p>
    </div>

</Project>

<style>
</style>
