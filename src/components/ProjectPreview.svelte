<script lang="ts">
    import { ETag } from "../projects/info";
    export let title = "Project Preview";
    export let tags: ETag[] = [];
    export let image: String = "";
    import { createEventDispatcher } from "svelte";
    import { onMount } from 'svelte';

    let tagsString: String = "";

    for (let tag of tags) {
        tagsString += ETag[tag] + " ";
    }

    const dispatch = createEventDispatcher();

    let width = 200;
    let height = 200;

    onMount(() => {
        width = document.body.clientWidth * 0.7;
        height = 100;

        if (document.body.clientWidth > 600){
            const scale = document.body.clientWidth / 11;
            width = Math.floor(Math.random() * 3) * scale + scale;
            height = Math.floor(Math.random() * 3) * scale + scale;
        }
    })
    

    function click() {
        dispatch("click", {});
    }

    function mouse(e: MouseEvent) {
        const element = document.getElementById(title);
        const box = element.getBoundingClientRect();
        const x = -(box.left - e.clientX + box.width / 2) / box.width;
        const y = -(box.top - e.clientY + box.height / 2) / box.height;
        const f = box.width/30;
        element.style.transform = `scale(2) translate(${-f * x}px,${-f * y}px`;
    }
    function leave() {
        document.getElementById(title).style.transform = '';
    }
</script>

<style>
    .project-preview {
        position: relative;
        padding: 30px;
        color: var(--white);
        transition: var(--normal);
        cursor: pointer;
        z-index: 1;
        overflow: hidden;
    }

    @media (max-width: 700px) {
        .project-preview {
            width: 80%;
        }
        .project-preview::after {
            opacity: 0;
        }
    }

    .project-preview:hover {
        color: var(--white);
        border-color: var(--white);
    }

    .project-preview::after {
        content: " ";
        position: absolute;
        top: 0;
        right: 0;
        height: 100%;
        width: 2px;
        z-index: -1;
        background-color: var(--white);
        transition: var(--normal);
        animation-direction: backwards;
    }

    .project-preview:hover::after {
        width: calc(100% - 60px);
        top: 30px; 
        right: 30px;
        height: 1.8em;
        opacity: 1;
        background-color: var(--secondary);
    }

    .project-preview-image {
        overflow: hidden;
        display: block;
    }

    img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: var(--fast);
        background-color: var(--black);
        filter: grayscale(50%);
    }

    .project-preview:hover img{
        transform: scale(2) translate(-30px);
        filter: grayscale(0%);
    }


    h3{
        position: relative;
        word-break: break-all;
    }
</style>

<div
    class={'grid-item project-preview ' + tagsString}
    on:click={click}
    on:click={click}
    on:mousemove={mouse}
    on:mouseleave={leave}>
    <h3>{title}</h3>

    <br />
    <div
        class="project-preview-image"
        style={`width: ${width}px; height:${height}px`}>
        <img src={image} alt={title + ' preview'} id={title}/>
    </div>

    <p class="tag">{tagsString}</p>
</div>
