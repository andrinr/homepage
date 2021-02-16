<script lang="ts">
    const size = 2;
    const count = 6;
    let coords = [];

    for (let i = 0; i <= count; i++) {
        coords.push([i * size, i * size]);
    }

    for (let i = 0; i <= count; i++) {
        coords.push([i * size, (count - i) * size]);
    }
</script>

<div class="window">
    <slot />
    <div class="close">
    {#each coords as coord}
    
        <div
        class="square"
        style={'transform: translate(' + coord[0] + 'px,' + coord[1] + 'px)'} />
    {/each}
</div>
</div>

<style>
    .window {
        position: relative;
    }
    .close {
        width: 15px;
        height: 15px;
        position: absolute;
        top: 0;
        right: 0;
        cursor: pointer;
    }
    .square {
        position: absolute;
        top: 0;
        left: 0;
        width: 2px;
        height: 2px;
        background-color: var(--white);
    }
    .close:hover .square{
        transform: translate(0);
    }
</style>

