/* collapse-callouts.js 
	 
	 Make "Try it!" and "Design decisions" callouts collapsible
*/

function collapsible(node) {
  //Create new details-summary node to replace current try-it
	var newCallout = document.createElement("blockquote"),
			d = document.createElement("details"),
			s = document.createElement("summary"),
			nodeCopy = node.cloneNode(true);
	d.appendChild(s);
	newCallout.appendChild(d);
	
	//Move contents and class to details node
	if (nodeCopy.children.length === 0) {
		d.appendChild(nodeCopy);
	} else {
		Array.from(nodeCopy.children).map(c => d.appendChild(c));
	}
	newCallout.classList = nodeCopy.classList;
	
	//Add title: either default title or from first paragraph
	if (newCallout.classList.contains("try-it-title")) {
	  titleNode = d.querySelector("p");
	  s.textContent = titleNode.innerText;
	  titleNode.remove();
	} else if (newCallout.classList.contains("try-it")) {
	  s.textContent = "Try it!";
	} else if (newCallout.classList.contains("design-decisions")) {
	  s.textContent = "Design decisions";
	}
	
	//Remove copy of original node
	nodeCopy.remove();
	
	//Add new node in place of original
	node.parentElement.replaceChild(newCallout, node);
}

window.addEventListener('DOMContentLoaded', () => {
	var callouts = document.querySelectorAll(":is(.try-it, .try-it-title, .design-decisions)");
	callouts.forEach(collapsible);
});
