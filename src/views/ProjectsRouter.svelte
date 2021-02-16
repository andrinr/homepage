<script lang="ts">

    import { projects } from "../projects/info";
    import Router from 'svelte-spa-router'

    const routes = {};
    for (const project of projects){
        routes[`/p/${project.slug}`] = project.component;
    }

</script>

<style>

</style>

<Router {routes}/>
