export default class Node {
    adjacents : Node[];
    name: String;

    constructor(name: String){
        this.name = name;
    };

    addAdjacent(adjacent: Node): Node{
        this.adjacents.push(adjacent);
        return this;
    };

}