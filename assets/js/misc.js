/* misc.js */

window.addEventListener('DOMContentLoaded', () => {
  /* Remove heading anchor links from any headings marked .no_toc */ 
  var n = document.querySelectorAll(".no_toc");
  n.forEach(el => el.querySelector("a.anchor-heading").remove());

  /* Add nonbreaking spaces after "e.g.," */
  var m = document.querySelectorAll("#main-content p, #main-content li");
  m.forEach(a => a.innerHTML = a.innerHTML.replace("e.g., ", "e.g.,&nbsp;"));
  
  /* Add commas to .delimited numbers */
  var d = document.querySelectorAll(".delimited");
  d.forEach(a => a.innerText = a.innerText.replace(/\B(?=(\d{3})+(?!\d))/g, ','));
})
