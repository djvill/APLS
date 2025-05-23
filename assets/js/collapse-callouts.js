/* collapse-callouts.js 
	 
	 Make "Try it!", "Under the hood", and "Note" callouts collapsible
   
   If callout has additional class no-collapse, just adds title
*/

function collapsible(node) {
  //Get title: either default title or from first paragraph
  var cl = node.classList,
      title;
	if (cl.contains("try-it-title")) {
	  title = node.querySelector("p").innerText;
	} else if (cl.contains("try-it")) {
	  title = "Try it!";
	} else if (cl.contains("under-the-hood")) {
	  title = "Under the hood";
	} else if (cl.contains("note")) {
	  title = "Note";
	}
  
  //If not collapsible, just add title as first p element
  if (cl.contains("no-collapse")) {
    var newTitle = document.createElement("p");
    newTitle.innerText = title;
    node.prepend(newTitle);
  } else {
    //If collapsible...
  
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
    
    //If original node has an ID, move it to new blockquote
    if (node.id) {
      newCallout.id = node.id;
    }
    
    //Add title
    s.textContent = title;
    
    //For try-it-title, remove first paragraph (old title)
    if (cl.contains("try-it-title")) {
      d.querySelector("p").remove();
    }
    
    //Remove copy of original node
    nodeCopy.remove();
    
    //Add new node in place of original
    node.parentElement.replaceChild(newCallout, node);
  }
}

window.addEventListener('DOMContentLoaded', () => {
	var callouts = document.querySelectorAll(":is(.try-it, .try-it-title, .under-the-hood, .note)");
	callouts.forEach(collapsible);
});
