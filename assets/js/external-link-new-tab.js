/* external-link-new-tab.js
   
   Make external links open in new tab
   Turn keyterm/layer <span>s into links by adding <a> child
   
   !!TODO:
   For keyterms, facilitate "In context" backlinks (in doc/glossary) by adding
   keyterm-<TERM> ID to:
   - The token of <TERM> with class term-anchor (if any), OR
   - The first token of <TERM> (if none are .term-anchor)
   This facilitates pointing the backlink to a specific token.
   If >1 token of <TERM> is .term-anchor, an error is thrown
*/

var selector = `
  #main-content main a[href]:not(:where(
  /* exclude hash only links */
  [href^='#'],
  /* exclude relative but not double slash only links */
  [href^='/']:not([href^='//']),
  /* domains to exclude */
  [href*='//apls.pitt.edu'],
  [href^='https://djvill.github.io/APLS'],
  [href^='https://docs.google.com/forms/'],
  /* serving locally */
  [href*='localhost']
`;

//Add anchors once page loads
window.addEventListener('DOMContentLoaded', () => {
  var extA = document.querySelectorAll(selector);
  extA.forEach(a => a.target = "_blank");
});
