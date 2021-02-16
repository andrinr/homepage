<script lang="ts">
    import Carousel from '@beyonk/svelte-carousel'
    import { ChevronLeftIcon, ChevronRightIcon } from 'svelte-feather-icons'
    import Lazy from 'svelte-lazy';

    const imgs = [
        "/img/gallery/02.png",
        "/img/gallery/03.png",
        "/img/gallery/05.png",
        "/img/gallery/06.PNG",
        "/img/gallery/07.png",
        "/img/gallery/08.png",
        "/img/gallery/09.png",
        "/img/gallery/10.png",
        "/img/gallery/11.png",
        "/img/gallery/12.png",
        "/img/gallery/13.jpg",
        "/img/gallery/14.jpg",
        "/img/gallery/17.png",
        "/img/gallery/18.jpg",
        "/img/gallery/20.png",
        "/img/gallery/21.png",
        "/img/gallery/24.png",
        "/img/gallery/25.png",
        "/img/gallery/26.jpg",
        "/img/gallery/28.png",
        "/img/gallery/29.png",
        "/img/gallery/27.png"
    ]
</script>

<div class="content">
    <h1> Gallery </h1>
    <Carousel perPage=1 dots={false}>
        <span class="control" slot="left-control">
          <ChevronLeftIcon />
        </span>
        {#each imgs as img}
        <div class="slide-content">
            <img src="{img}">
        </div>
        {/each}
        <span class="control" slot="right-control">
          <ChevronRightIcon />
        </span>
      </Carousel>
    <br><br><br>
</div>

<style>
    .slide-content{
        height: 70vh;
    }

    img{
        height: 100%;
        object-fit: cover;
    }

    .control{
        color: var(--gray);
    }

</style>