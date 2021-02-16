import Frequency from "./Frequency.svelte";
import Force from "./Force.svelte";
import Folding from "./Folding.svelte";
import Packing from "./Packing.svelte";
import Adaptive from "./Adaptive.svelte";
import Klemens from "./Klemens.svelte";

export interface IProject {
    title: string;
    slug: string;
    tags: ETag[];
    component: any;
    image: string;
}

export enum ETag {
    "GPU",
    "web",
    "processing",
    "biology",
    "creative",
    "particles",
    "academic",
    "audio",
}


export const projects: IProject[] = [
    {
        title: "klemensrehmann.ch",
        slug: 'klemens',
        tags: [ETag.web, ETag.audio, ETag.creative],
        component: Klemens,
        image: '/img/klemensrehmann_01.gif'
    },
    {
        title: "frequency driven gpu particles",
        slug: 'frequency-driven-particles',
        tags: [ETag.GPU, ETag.audio, ETag.particles, ETag.creative],
        component: Frequency,
        image: '/img/frequency.png'
    },
    {
        title: "Force Visualisation",
        slug: 'force-visualisation',
        tags: [ETag.particles, ETag.processing, ETag.creative],
        component: Force,
        image: '/img/force.png'
    },
    {
        title: "Cellular Folding",
        slug: 'cellular-folding',
        tags: [ETag.particles, ETag.processing, ETag.biology, ETag.creative],
        component: Folding,
        image: '/img/folding.png'
    },
    {
        title: "Packing Problem",
        slug: 'packing-problem',
        tags: [ETag.processing, ETag.creative],
        component: Packing,
        image: '/img/packing.png'
    },
    {
        title: "Adaptive CPU Renderer",
        slug: 'adaptive-cpu-renderer',
        tags: [ETag.academic, ETag.processing],
        component: Adaptive,
        image: '/img/points.png'
    },
];