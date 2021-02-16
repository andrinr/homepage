<script lang="ts">
    import About from "./views/About.svelte";
    import Contact from "./views/Contact.svelte";
    import Projects from "./views/Projects.svelte";
    import Gallery from "./views/Gallery.svelte";
    import Welcome from "./views/Welcome.svelte";
    import ProjectsRouter from "./views/ProjectsRouter.svelte";
    import Router from 'svelte-spa-router';
    import {location} from 'svelte-spa-router';

    const items = [
        {id: 0, name: "/projects", component: Projects},
        {id: 2, name: "/gallery", component: Gallery},
        {id: 1, name: "/about", component: About},
    ];

    const routes = {
        // Exact path
        '/': Welcome,
        '/projects': Projects,
        '/p/*': ProjectsRouter,

        // Using named parameters, with last being optional
        '/about': About,
        '/gallery': Gallery,
        '/contact': Contact,

        // Catch-all
        // This is optional, but if present it must be the last
        '*': Welcome,
    };


    let active_location = '';

    location.subscribe(value => {
        active_location = value;
    })
</script>

<style>
    .content {
        padding: 1em;
    }

    .current {
        color: var(--white);
        /*background-color: var(--secondary);*/
    }

    .header {
        margin-bottom: 50px;
        z-index: 5;
    }

    .nav {
        display: flex;
        flex-flow: row;
    }

    h1 {
        cursor: pointer;
    }

    h2 {
        color: var(--gray);
        display: inline-block;
        padding: 0.5em 0.5em;
        cursor: pointer;
        transition: var(--fast) ease-in-out;
    }

    .current h2:after{
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 2px;
        background-color: var(--secondary);
        z-index: 2;
    }

    .social-media{
        position: absolute;
        top: 20px;
        right: 20px;
    }

    .social-media i{
        font-size: 2em;
        margin-left: 0.5em;
        margin-bottom: 0.6em;
        text-align: right;
    }

    .footer{
        background-color: var(--black);
        width: 100%;
        height: 200px;
    }
    
    @media (max-width: 700px) {
        h2{
            font-size: 1.5em;
        }

        .social-media{
            width: 3em;
        }
    }
</style>

<main>
    <div class="content">
        <div class="header">
            <a href="/">
                <h3>
                    andrinrehmann.ch
                </h3>
            </a>
            <div class="nav">
                {#each items as item}
                    <a href="{'#' + item.name}">
                        <h2
                                class={active_location === item.name ? 'current' : ''}
                                style={active_location === item.name ? 'order: -1' : 'order:' + item.id}>
                            {item.name}
                        </h2>
                    </a>
    
                {/each}
            </div>
        </div>
    
        <div class="social-media">
            <a href="https://www.youtube.com/c/RedXPoison">
                <i class="fab fa-youtube"></i>
            </a>
            <a href="https://www.instagram.com/andrinrehmann/">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="https://github.com/andrinr/">
                <i class="fab fa-github"></i>
            </a>
            <a href="mailto:andrinrehmann@gmail.ch">
                <i class="fas fa-at"></i>
            </a>
        </div>
    
        <Router {routes}/>
        <!--<svelte:component this={view}/>-->
    </div>

</main>
