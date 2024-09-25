/* try-it.js 
	 
	 Make "Try it!" callouts collapsible
*/

function tryit(node) {
  //Create new details-summary node to replace current try-it
	var newTI = document.createElement("blockquote"),
			d = document.createElement("details"),
			s = document.createElement("summary"),
			nodeCopy = node.cloneNode(true);
	d.appendChild(s);
	newTI.appendChild(d);
	
	//Move contents and class to details node
	if (nodeCopy.children.length === 0) {
		d.appendChild(nodeCopy);
	} else {
		Array.from(nodeCopy.children).map(c => d.appendChild(c));
	}
	newTI.classList = nodeCopy.classList;
	
	//Add title: either default title or from first paragraph
	if (!newTI.classList.contains("try-it-title")) {
	  s.textContent = "Try it!";
	} else {
	  titleNode = d.querySelector("p");
	  s.textContent = titleNode.innerText;
	  titleNode.remove();
	}
	
	//Remove copy of original node
	nodeCopy.remove();
	
	//Add new node in place of original
	node.parentElement.replaceChild(newTI, node);
}

window.addEventListener('DOMContentLoaded', () => {
	var nodesTryIt = document.querySelectorAll(":is(.try-it, .try-it-title)");
	nodesTryIt.forEach(tryit);
});
