/* Dark mode toggle button
 * Credit: https://github.com/just-the-docs/just-the-docs/blob/main/docs/customization.md?plain=1#L32-L46
 */
window.addEventListener('DOMContentLoaded', function () {
	var dmt = document.getElementById('dark-mode-toggle'),
			img = dmt.querySelector('img');

	setScheme = function() {
		if (img.src.endsWith('/assets/img/fa-sun.svg')) {
			jtd.setTheme('apls');
			img.src = '/assets/img/fa-moon.svg';
			img.title = 'Switch to dark color scheme';
			img.ariaLabel = 'Switch to dark color scheme';
		} else {
			jtd.setTheme('apls-dark');
			img.src = '/assets/img/fa-sun.svg';
			img.title = 'Switch to light color scheme';
			img.ariaLabel = 'Switch to light color scheme';
		}
	};

	jtd.addEvent(dmt, 'click', setScheme);
});
