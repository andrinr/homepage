<script lang="ts">
    export let title = "Uknown project";
    export let date = "10.10.2020";

</script>

<div class="content">
    <h6>
        {date}
    </h6>
    <h1>
        {title}
    </h1>

    <slot>

    </slot>

</div>

<style>
    h1{
        word-break: break-all;
    }
</style>
