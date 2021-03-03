<script lang="ts">
    export let title = "Uknown project";
    export let date = "10.10.2020";
    export let link = null;

</script>

<div class="content">
    <h6>
        {date}
    </h6>
    <h1>
        {title}
    </h1>
    {#if link}
        <a class="project-link" href={link}><i class="fas fa-link"></i> link to project</a>
    {/if}
    

    <slot>

    </slot>

</div>

<style scoped={false}>
    h1{
        margin-top: 0.2em;
        word-break: break-all;
    }
    h6{
        color: var(--gray);
    }

    .content{
        position: relative;
    }

    .project-link{
        padding: 2px 5px;
        font-style: 1.4em;
        position: absolute;
        top: 0;
        right: 0;
        border-style: solid;
        color: var(--gray);
        border-color: var(--gray);
    }

    
    .project-link:hover{
        border-color: var(--white);
        color: var(--white);
    }

</style>
