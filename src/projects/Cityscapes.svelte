<script lang="ts">
import Project from "./Project.svelte";

    
</script>

<Project title="cityscapes" date="3.3.2021" link="https://scapes.andrinrehmann.ch">
    <div class="segment">
        <img src="/img/city.gif" height="200px" alt="Gif of website for customer">
    </div>

    <div class="segment" >
        <h3>Anatomy of a skyline</h3>
        <p>
            A friend of mine passionately creates virtual cities inside a game called cities skylines.
            For his web presence, I decided to generatively generate a infinite city. 
            For the sake of simplicity I am using three.js.
        </p>
        <p>
            The road layout is a simple grid, where all blocks and roads are of the same size.
            Each block then hosts a number of boxes of different shapes, which creates the illusion of a city.
        </p>
    </div>

    <div class="segment">
        <h3>Generating a block</h3>
        <img src="/img/city_plan.png"/>
        <p>
            Each block is recursively divided into a random number of equally sized subblocks. 
            The random number ranges between 1 and 4. Furthermore the maximum recursion depth is set to 3.

        </p>
        <img src="/img/city_wire.PNG"/>
        <p>
            As soon as the maximum recursion depth is reached, a three.js mesh is generated with a random height.
        </p>
    </div>

    <div class="segment">
        <img src="/img/city_2.gif">
    </div>


</Project>

<style>
    img{
        object-fit: cover;
    }

    .row{

    }

</style>
