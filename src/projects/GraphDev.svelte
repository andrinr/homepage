<script lang="ts">
    
    import Node from "../components/Node.svelte";
    import Project from "./Project.svelte";

</script>

<Project title="Graphs" date="16.02.2021" >
    
    <Node name="root">
        <Node name="child1">
            <Node name="child2">

            </Node>
        </Node>
    
        <Node name="child3">
            <Node name="child4">
                <Node name="child3">
                    <Node name="child4">
                        
                    </Node>
                </Node>
            </Node>
            <Node name="child4">
                        
            </Node>
        </Node>
    </Node>

</Project>

<style>
</style>
    