<script>
    import {enhance} from "$app/forms";
    const { data } = $props();
	const articles = $derived(data.articles);
</script>

<main class="p-4">
	<header class="pb-2">
		<h1 class="text-lg font-bold">Hello World</h1>
		<p>Message: "{data.message}"</p>
	</header>
	<hr />
	<div class="container mx-auto flex max-w-3xl flex-col flex-wrap gap-3 py-4">
		<div>
			<form class="flex flex-col gap-2" method="POST" use:enhance>
				<label class="flex flex-col">
					<span>Title</span>
					<input type="text" name="title" class="rounded bg-stone-100 p-2" placeholder="title..." />
				</label>
				<label class="flex flex-col">
					<span>body</span>
					<textarea class="rounded bg-stone-100 p-2" name="body" placeholder="body..." rows="5"></textarea>
				</label>
				<div>
					<button class="flex rounded bg-blue-500 p-2 text-sm text-white">Create Article</button>
				</div>
			</form>
		</div>
		{#each articles as article, index (index)}
			<article class="rounded border p-2 hover:bg-stone-100">{article.title}</article>
		{/each}
	</div>
</main>
