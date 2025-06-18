document.addEventListener("DOMContentLoaded", function(event) {
  var hash = window.location.hash;

  if (hash !== "") {
    filterProjects(hash.slice(1));
  }
});

var filterProjects = function(tag) {
  setActiveTag(tag);

  var projects = document
    .getElementById('projects')
    .getElementsByTagName('li');

  for (i = 0; i < projects.length; i++) {
    var project = projects[i];
    project.style.display = "";
  }

  if (tag === undefined) {
    return
  }

  for (i = 0; i < projects.length; i++) {
    var project = projects[i];
    var tags = project.dataset.tags.split(" ");

    if (!tags.includes(tag)) {
      project.style.display = "none";
    }
  }

  scrollToTop();
}

var setActiveTag = function(tag) {
  var tags = document
    .getElementById('tags')
    .getElementsByTagName('li');

  for (i = 0; i < tags.length; i++) {
    tags[i].classList.remove("active");
  }

  var activeTag = document.getElementById("tag-" + tag);
  if (activeTag === null) {
    activeTag = document.getElementById("tag-all");
  }
  activeTag.classList.add("active");
}

var scrollToTop = function() {
  window.scrollTo(0, 0);
}
