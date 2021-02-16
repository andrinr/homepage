<script lang="ts">
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
        "/img/gallery/14.png",
        "/img/gallery/17.png",
        "/img/gallery/18.jpg",
        "/img/gallery/20.png",
        "/img/gallery/21.png",
        "/img/gallery/22.png",
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
    <div class="row">
        {#each imgs as img}
        <div class="col-md-4 col-12 item">
            <div class="img-wrapper">
                <img src="{img}" alt="">
            </div>
        </div>
        {/each}
    </div>
    <br><br><br>
</div>

<style>
    img{
        height: 300px;
        width: 100%;
        object-fit: cover;
        z-index: 1;
        transition: var(--normal);
        filter: grayscale(50%);
        transform: scale(1.5);
        background-color: var(--black);
    }

    .item{
        transition: var(--fast);
        overflow: hidden;
        padding: 0;
        z-index: 1;
    }
    
    @media (max-width: 700px) {
        .item{
            width: 100px;
            position: relative;
        }

        .img-wrapper{
            overflow: hidden;
            position: relative;
            margin: 2em;
        }

        img{
            height: 100%;
            width: 100%;
            filter: grayscale(0%);
        }
    }
    @media (min-width: 700px) {

        img:hover{
            transform: scale(1);
            z-index: 10;
            filter: grayscale(0%);
        }

        .item:hover{
            transform: scale(1.5);
            z-index: 2;
            box-shadow:
                    0 2.8px 2.2px rgba(0, 0, 0, 0.034),
                    0 6.7px 5.3px rgba(0, 0, 0, 0.048),
                    0 12.5px 10px rgba(0, 0, 0, 0.06),
                    0 22.3px 17.9px rgba(0, 0, 0, 0.072),
                    0 41.8px 33.4px rgba(0, 0, 0, 0.086),
                    0 100px 80px rgba(0, 0, 0, 0.12)
        }
    }


</style>