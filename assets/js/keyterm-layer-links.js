/* keyterm-layer-links.js
   
   Turn keyterm/layer <span>s into links by adding <a> child
   
   !!TODO:
   For keyterms, facilitate "In context" backlinks (in doc/glossary) by adding
   keyterm-<TERM> ID to:
   - The token of <TERM> with class term-anchor (if any), OR
   - The first token of <TERM> (if none are .term-anchor)
   This facilitates pointing the backlink to a specific token.
   If >1 token of <TERM> is .term-anchor, an error is thrown
*/

function addA(node, type) {
  //Create new <a> as child of node and move text to <a>
  var nodeText = node.innerText,
      a = document.createElement("a");
  a.innerText = nodeText;
  node.innerText = '';
  node.appendChild(a);
  
  //Normalize name
  var hrefName = nodeText.replaceAll(" ", "-").toLowerCase();
  //Add href depending on type
  if (type === "keyterm") {
    var page = "/APLS/doc/glossary";
    //For keyterms, also de-pluralize
    hrefName = hrefName.replace(/s$/, '');
  } else if (type === "layer") {
    var page = "/APLS/doc/layer-reference";
  }
  a.href = page + "#" + hrefName;
}

//Add anchors once page loads
window.addEventListener('DOMContentLoaded', () => {
  var keyterms = document.querySelectorAll(".keyterm"),
      layers = document.querySelectorAll(".layer");
  keyterms.forEach(a => addA(a, "keyterm"));
  layers.forEach(a => addA(a, "layer"));
});
