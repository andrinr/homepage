<script lang="ts">
    import ProjectPreview from "../components/ProjectPreview.svelte";
    import {onMount} from "svelte";
    import {ETag, projects} from "../projects/info";
    import Visuals from "../components/Visuals.svelte";

    let iso;
    onMount(async () => {
        const {default: Isotope} = await import("isotope-layout");

        const grid = document.querySelector(".grid");
        iso = new Isotope(grid, {
            itemSelector: ".grid-item",
            layoutMode: "masonry",
            stagger: 40,
            transitionDuration: "0.2s",
            hiddenStyle: {
                opacity: 0,
            },
            visibleStyle: {
                opacity: 1,
            },
        });
    });

    const tagKeys = Object.keys(ETag).filter(
        (k) => typeof ETag[k as any] === "number"
    );

    let tagStates: Object = {};
    let temporary = false;

    for (const tag of tagKeys) tagStates[tag] = false;

    const routes = {};
    for (const project of projects) {
        routes[`/${project.slug}`] = project.component;
    }

    function toggleTag(tag: String) {
        tagStates[tag] = !tagStates[tag];

        let filterString = "";
        for (const key in tagStates)
            filterString += tagStates[key] ? "." + key + "" : "";

        iso.arrange({filter: filterString});
    }

</script>

<style>
    h6 {
        margin-left: 10px;
    }
    ul {
        padding: 0;
        margin-top: 5px;
    }
    li {
        cursor: pointer;
        padding: 3px;
        margin: 3px;
        list-style-type: none;
        display: inline;
        font-size: 1em;
        transition: var(--fast);
    }
    li:hover {
        color: var(--white);
    }
    .selected {
        position: relative;
        transition: var(--fast);
        color: var(--white);
    }
    .selected::after {
        content: " ";
        background-color: var(--secondary);
        color: var(--white);
        width: 100%;
        height: 100%;
        position: absolute;
        bottom: 0;
        left: 0;
        z-index: -1;
    }

    @media (max-width: 700px) {
        .filter{
            display: none;
        }
    }
</style>
<h1>ideas and impressions</h1> 
<br><br><br>
<div class="filter">
    <h6>Filter by tags:</h6>
    <ul>
        {#each tagKeys as tag}
            <li
                    class={tagStates[tag] ? 'tag selected' : 'tag'}
                    on:click="{() => {
                if (!temporary) {
                    toggleTag(tag);
                }
                temporary = false;
            }}"
                    on:mouseenter="{() => {
                if (!tagStates[tag]) {
                    toggleTag(tag);
                    temporary = true;
                }
            }}"
                    on:mouseleave="{() => {
                if (tagStates[tag] && temporary) toggleTag(tag);
                temporary = false;
            }}">
                {tag}
            </li>
        {/each}
    </ul>
</div>

<div class="grid">
    {#each projects as project}
    <a href="{'#/p/' + project.slug}">
        <ProjectPreview
                title={project.title}
                tags={project.tags}
                image={project.image} />
    </a>

    {/each}
</div>
