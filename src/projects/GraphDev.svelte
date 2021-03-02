<script lang="ts">
    
    import Node from "../components/Node.svelte";
    import Project from "./Project.svelte";

</script>

<Project title="Tree Hierachy" date="02.03.2021" >
    
    <div class="segment">
        <h3>The goal</h3>
        <p>
            A very simple svelte component to easily build tree structures for content or data navigation.
        </p>
    </div>

    <div class="segment">
        <h3>Example</h3>
        <p>
            Click the titles to display the children
        </p>
        <Node name="cell">
            <Node name="procaryiotics">
                <Node name="bacteria"/>
                <Node name="archae"/>
            </Node>
            <Node name="eukaryotics">
                <Node name="plants"/>
                <Node name="animals">
                    <Node name="vertebrate"/>
                </Node>
                <Node name="fungi"/>
                <Node name="slime moulds"/>
                <Node name="protoza"/>
                <Node name="algae"/>
            </Node>
        </Node>
        <p>
            And the corseponding code. Note that the nodes know if they are a child or not. No need to set any parameters.
        </p>
        <div class="segment">
            <img src="/img/tree.PNG" alt="Gif of website for customer">
        </div>

        <p>
            The whole code for this isn't even 20 lines long. Pretty cool!
        </p>
        <div class="segment">
            <img src="/img/tree_code.PNG" alt="Gif of website for customer">
        </div>
    </div>



</Project>

<style>
</style>
    