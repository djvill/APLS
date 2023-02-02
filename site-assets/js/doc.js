/* Add " | APLS" suffix to page title */
document.title += " | APLS"

/* Open external links in new tab */
Array.from($("a:not(.anchor-section)"))
	.filter(a => !a.href.startsWith("file:///"))
	.filter(a => !a.href.startsWith(window.location.href + "#"))
	.map(a => a.target="_blank");

/* Add nonbreaking spaces after "e.g.," */
Array.from($("p, li"))
	.map(a => a.innerHTML = a.innerHTML.replace("e.g., ", "e.g.,&nbsp;"))
