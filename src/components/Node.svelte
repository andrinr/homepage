<script lang="ts">
    export let name = "node";
    let active: Boolean = false;
</script>

<div class="node">
    <h6 on:click={() => active = !active} class={$$slots.default ? 'clickable' : ''}>
        {$$slots.default ? ((active) ? '-' : '+') : ''}{name}
    </h6>
    {#if active}
    <div class="children">
        <slot>
        </slot>
    </div>
    {/if}
</div>

<style>
    .node{
        padding: 0.5em 0;
    }
    .children{
        position: relative;
        padding-left: 2em;
    }
    .clickable{
        cursor: pointer;
    }
    .clickable:hover{
        background-color: var(--primary);
    }

    .children::after{
        content: '';
        position: absolute;
        height: 100%;
        left: 0.3em;
        width: 1px;
        top: 0;
        background-color: white;
        transition: 0.1s;
    }
</style>
    