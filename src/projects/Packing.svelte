<script lang="ts">

import Project from "./Project.svelte";

    
</script>

<Project title="Random Packing" date="13.07.2019" >
    <div class="segment">
        <img src="/img/packing.png" alt="packing random shapes into a finite domain">
    </div>

    <div class="segment">
        <h3>Brute Force</h3>
        <p>
            This algorithm is rather stupid, it simply tries to fit randomly shaped squares into the domain. 
            If it fails it will try again until it succeeds.
        </p>
    </div>

    <div class="segment">
        <h3>Improving efficiency</h3>
        <p>
            The only improvment on efficiency is to reduce the site of the squares over time, since the avaible space
            will logically become smaller.
        </p>
    
    </div>


    <div class="segment">
        <img class="img-wide" src="/img/packing_2.png" alt="particles following sinoid patterns">
    </div>

    <div class="segment">
        <img class="img-wide" src="/img/packing_3.png" alt="particles following sinoid patterns">
    </div>

    <div class="segment">
        <p>
            <a href="https://github.com/andrinr/random-packing">Get this project on Gihtub</a>
        </p>
    </div>

</Project>

<style>
</style>
