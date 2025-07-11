<script lang="ts">
	let timeline = [
		{
			date: '2016',
			place: 'Artificial Rome',
			text: 'Intern motion design, web devlopment and creative direction',
			url: 'http://www.artificialrome.com/'
		},
		{
			date: '2018-2020',
			place: 'FrameFactory',
			text: '(Intern) Fullstack web developer',
			url: 'https://www.framefactory.ch/'
		},
		{
			date: '2018-2022',
			place: 'UZH',
			text: 'Computer and Computational science Bachelor Student at University of Zürich',
			url: 'https://uzh.ch/'
		},
		{
			date: '2020-2022',
			place: 'jkweb',
			text: 'Fullstack web developer',
			url: 'https://jkweb.ch/en/'
		},
		{
			date: '2021',
			place: 'MAXON',
			text: 'Summer Intern in the simulations team of Cinema4D',
			url: 'https://www.maxon.net/en/'
		},
		{
			date: '2022',
			place: 'UZH',
			text: 'Teach Assistant Database Systems',
			url: 'https://www.ifi.uzh.ch/en/dbtg.html'
		},
		{
			date: '2022-2024',
			place: 'UZH',
			text: 'Specialized Master in Computational Science',
			url: 'https://www.uzh.ch/de/studies/programs/master/computational_science.html'
		},
		{
			date: '2022-2023',
			place: 'UZH',
			text: 'Research Internship Complex Networks / GNNs',
			url: 'https://dm3l.uzh.ch/bovet'
		},
		{
			date: '2024-now',
			place: 'Pasteur Labs',
			text: 'Simulation Intelligence Engineer',
			url: 'https://pasteurlabs.ai/'
		},

	];

	// TODO add skill overview

	timeline = timeline.reverse();
</script>

<div class="content">
	<div class="row">
		<p>Having a strong background in digital arts and 3D design I gradually progressed my skills to coding,
			software engineering and computational science. In the past I have worked on numerous art projects 
			and installations as well as gained professional experience in software engineering during internships, 
			employments and university projects. During my Masters and my current exmployment I am exploring the
			intersection between simulations and machine learning.
		</p>
		<img src="/img/andrin.png" alt="andrin rehmann face">
	</div>

	<br><br>
	<h3>Timeline</h3>
	<br><br>
	<div class="timeline">
		{#each timeline as entry }
		<a href={entry.url}>
			<div class="entry">
				<div class="left entry-content">
					<div class="timeframe">
						<h2>{entry.date}</h2>
					</div>
					<div class="place">
						<h4>{entry.place}</h4>
					</div>
				</div>
				<div class="right entry-content">
					<p>
						{entry.text}
					</p>
				</div>
			</div>
		</a>
		{/each}
	</div>
</div>

<style>
	.entry{
		width: 100%;
		display: flex;
		flex-flow: row;
		position: relative;
	}
	.left::after, .right::after{
		transition: var(--normal);
		position: absolute;
		content: '';
		top: 0;
		width: 0;
		height: 100%;
		background-color: var(--white);
		z-index: -1;
	}
	.left::after{
		width: 1px;
		right: 0;
	}
	.right::after{
		left: 0;
	}
	.entry:hover .left::after, .entry:hover .right::after{
		background-color: var(--secondary);
		width: 100%;
	}
	.entry-content{
		padding:  20px 0px;
	}
	.left{
		position: relative;
		width: 40%;
		text-align: right;
		padding-right: 15px;
	}
	.right{
		position: relative;
		padding-left: 15px;
		width: 60%;
	}
	h2{
		color: var(--white);
		margin-bottom: 1em;
	}
	h4{
		color: var(--white);
	}
	h4{
		font-size: 1em;
	}
	.row{
		display: flex;
		flex-flow: row;
	}
	p{
		width: 70%;
		display: inline-block;
	}
	img{
		padding-left: 30px;
		object-fit: cover;
		width: 30%;
		display: inline-block;
		max-width: 200px;
	}
	@media (max-width: 500px){
		.row{
			display: block;
		}
		p{
			width: 100%;
		}
		img{
			margin-top: 1em;
			padding-left: 0;
			width: 100%;
			max-height: 200px;
		}
	}

</style>
