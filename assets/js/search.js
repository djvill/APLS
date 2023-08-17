/* search.js */

/* Users can press / to trigger search bar
 * Credit to: https://justincypret.com/blog/adding-a-keyboard-shortcut-for-global-search
 */
document.addEventListener("keyup", e => {
  if (e.key !== "/" || e.ctrlKey || e.metaKey) return;
  if (/^(?:input|textarea|select|button)$/i.test(e.target.tagName)) return;

  e.preventDefault();
  document.getElementById("search-input").focus();
});



/* Set placeholder text responsively
 * Credit to: https://codepen.io/bencentra/pen/ogyZBp
 */

// variables
var delay = 250, // delay between calls
    throttled = false; // are we currently throttled?

// just-the-docs uses @media (min-width: 50rem) as responsive cutoff
// https://github.com/just-the-docs/just-the-docs/blob/main/_sass/support/_variables.scss#L104
function convertRemToPixels(rem) {
	// Credit to: https://stackoverflow.com/a/42769683
  return rem * parseFloat(getComputedStyle(document.documentElement).fontSize);
}
var pxCutoff = convertRemToPixels(50);

// window.resize callback function
function setSearchText() {
	var t = (window.innerWidth >= pxCutoff) ? 'Type / to search documentation' : 'Search documentation'
	document.querySelector("#search-input").placeholder = t;
}

// window.resize event listener
window.addEventListener('resize', function() {
	// only run if we're not throttled
  if (!throttled) {
    // actual callback action
    setSearchText();
    // we're throttled!
    throttled = true;
    // set a timeout to un-throttle
    setTimeout(function() {
      throttled = false;
    }, delay);
  }  
});

// call once to initialize page
window.addEventListener('DOMContentLoaded', setSearchText);

/* N.B.
 * If I want to style the / as <code> like GitHub does, I'd need to add some JS & CSS:
 * https://jsfiddle.net/Vbnj2/55/
 */
