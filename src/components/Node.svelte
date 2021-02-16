<script lang="ts">
    import { fade } from 'svelte/transition';
    import { cubicInOut } from 'svelte/easing';
    export let name = "node";
    let active: Boolean = false;

    import {onMount} from "svelte";

    onMount(async () => {
        console.log($$slots.default)
    });

    function spin(node, { duration }) {
		return {
			duration,
			css: t => {
				const eased = cubicInOut(t);
                console.log(100*eased);
				return `
                    height: ${eased}%;
                    `
			}
		};
	}

</script>

<div class="node">
    <h6 on:click={() => active = !active}>
        {($$slots.default) ? ((active) ? '-' : '+') : ''}{name}
    </h6>
    {#if active}
    <div class="children" transition:spin="{{duration: 9000}}">
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
    