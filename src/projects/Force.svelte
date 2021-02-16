<script lang="ts">
import { ETag } from "./info";

import Project from "./Project.svelte";

    
</script>

<Project title="Force visualisation" date="11.05.2019" >
    <div class="segment">
        <img src="/img/force.png" alt="particles following sinoid patterns">
    </div>

    <div class="segment">
        <h3>A basic setup</h3>
        <p>
            The setup of this project is very simple: A few thousand particles are spawned around a centered circle. 
            Each particle has following properties:
        </p>
        <ul>
            <li>
               <code>age</code>
            </li>
            <li>
                <code>position</code>
            </li>
            <li>
                <code>velocity</code>
            </li>
        </ul>
        <p>
            Where the position is calculated as follows:
        </p>
        <code>
            pos += vel * dt
        </code>
    </div>

    <div class="segment">
        <h3>Some magic</h3>
        <p>
            The magic happens at the calculation of the velocity which looks something like this:
        </p>
        <code>
            velocity += f * sin(position / r1 ) + cos(position / r2 ) + sin(position / r3)
        </code>
        <p>Where <code>r1-r3</code> are parameters which can be choosen to your liking</p>
    </div>

    <div class="segment">
        <h3>Diferrent parameters:</h3>
        <img class="img-wide" src="/img/force_2.png" alt="particles following sinoid patterns">
    </div>

    <div class="segment">
        <h3>Line as initial shape:</h3>
        <img class="img-wide" src="/img/force_3.png" alt="particles following sinoid patterns">
    </div>

    <div class="segment">
        <p>
            <a href="https://github.com/andrinr/frequency-gpu-particles">Get this project on Gihtub</a>
        </p>
    </div>

</Project>

<style>
</style>
