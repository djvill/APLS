/* try-it.js 
	 
	 Make "Try it!" callouts collapsible
*/

function tryit(node) {
	var newTI = document.createElement("blockquote"),
			d = document.createElement("details"),
			s = document.createElement("summary"),
			nodeCopy = node.cloneNode(true);
		
	s.textContent = "Try it!";
	d.appendChild(s);
	if (nodeCopy.children.length === 0) {
		d.appendChild(nodeCopy);
	} else {
		Array.from(nodeCopy.children).map(c => d.appendChild(c));
	}
	newTI.appendChild(d);
	nodeCopy.classList.remove("try-it");
	newTI.classList.add("try-it");
	
	node.parentElement.replaceChild(newTI, node);
}

window.addEventListener('DOMContentLoaded', () => {
	var nodesTryIt = document.querySelectorAll(".try-it");

	nodesTryIt.forEach(tryit);
})
