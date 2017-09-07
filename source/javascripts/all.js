//= require_tree .

document.addEventListener("DOMContentLoaded", function(event) {
  var hash = window.location.hash;

  if (hash !== "") {
    filterProjects(hash.slice(1));
  }
});
