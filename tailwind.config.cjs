/** @type {import('tailwindcss').Config} */

const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
	darkMode: "class",
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		fontFamily:{
			'sans': ['"JetBrains Mono"', defaultTheme.fontFamily.sans]
		},
		extend: {},
	},
	plugins: [],
}
