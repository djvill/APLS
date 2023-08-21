/* misc.js */

/* Remove heading anchor links from any headings marked .no_toc */
window.addEventListener('DOMContentLoaded', () => {
	var n = document.querySelectorAll(".no_toc");
	n.forEach(el => el.querySelector("a.anchor-heading").remove());
})
