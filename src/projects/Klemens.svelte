<script lang="ts">
import { ETag } from "./info";

import Project from "./Project.svelte";

    
</script>

<Project title="klemensrehmann.ch" date="25.11.2020" link="https://klemensrehmann.ch">
    <div class="segment">
        <img src="/img/klemensrehmann_01.gif" height="200px" alt="Gif of website for customer">
    </div>

    <div class="segment" >
        <h3>The goal</h3>
        <p>
            My client is a trumpet teacher was in need of a new website to display his musical work. He needs to be able to
            fill in the content by himself and does not have any coding skills.
        </p>
    </div>

    <div class="segment">
        <h3>Desktop song navigation</h3>
        <img src="/img/klemensrehmann_03.gif" alt="Gif displaying desktop navigation">
    </div>

    <div class="segment">
        <h3>Mobile song navigation</h3>
        <div class="row">
            <div class="col-6">
                <img src="/img/klemensrehmann_01.gif" alt="Gif displaying mobile navigation">
            </div>
            <div class="col-6">
                <img src="/img/klemensrehmann_02.gif" alt="Gif displaying mobile music player">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <img src="/img/svelte.png" alt="svelte logo">
        </div>
        <div class="col">
            <img src="/img/strapi.png" alt="strapi logo">
        </div>
        <div class="col">
            <img src="/img/pm2.png"  alt="pm2 logo">
        </div>
        <div class="col">
            <img src="/img/apache.png" alt="apache logo">
        </div>
        <div class="col">
            <img src="/img/aws.png" alt="aws logo">
        </div>
    </div>


    <div class="segment" >
        <h3>front-end tech stack</h3>
        <p>
            Over the past three years I have been working with React and Vue but was never really happy with the frameworks.
            Too big in size, missing features and outdated. Finally I stumbled upon Svelte, which has its own short comings,
            but in general creates blazing fast websites with state management but without a virtual dom. <br>
            In short: Fast, consistent and its interactive tutorial makes it really easy to get started. <br>
            Combine this with the routing and SEO of Sapper, perfect.
        </p>
    </div>
    
    <div class="segment" >
        <h3>back-end tech stack</h3>
        <p>
            Nowadays we have oncountable CMS and it seems that every second web developer company is developing its own
            system. I decided to go for strapi, since its open source, flexible and the user experience is clean and simple.
            Im hosting it on an AWS EC2 together with PM2 and Apache.
        </p>
    </div>

</Project>

<style>
    img{
        object-fit: cover;
    }

    .row{

    }

</style>
