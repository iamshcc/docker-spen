import { PUBLIC_API_URL } from '$env/static/public';

const API_URL = process.env.API_URL || PUBLIC_API_URL;

/** @type {import('./$types').PageLoad} */
export const load = async ({ fetch }) => {
	try {
		const res = await fetch(API_URL + '/api/articles');
		const articles = await res.json();
		return {
			message: 'From Load Constant',
			articles
		};
	} catch (error) {
		console.error(error);
	}
};

/** @satisfies {import('./$types').Actions} */
export const actions = {
	default: async ({ request, fetch }) => {
		const formData = await request.formData();
		const { title, body } = Object.fromEntries(formData);

		await fetch(API_URL + '/api/articles', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ title: title, slug: title, body: body })
		});

		console.log('Article created');

		return {
			message: 'Todo created successfully'
		};
	}
};
