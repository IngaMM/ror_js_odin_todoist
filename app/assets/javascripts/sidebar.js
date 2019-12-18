document.addEventListener("turbolinks:load", function() {
  // Open and close listing of projects and turn arrow next to "Projects"
  if (document.getElementById("projects")) {
    let projects = document.getElementById("projects");
    let projectList = document.getElementById("projectListContainer");
    let projectArrow = document.getElementById("projectArrow");
    projects.addEventListener("click", () => {
      projectList.classList.toggle("invisible");
      projectArrow.innerHTML === "v "
        ? (projectArrow.innerHTML = "> ")
        : (projectArrow.innerHTML = "v ");
    });
  }

  // Open menu for projects when clicking on the three dots next to the project name.
  // Close menu when clicking somewhere else.
  if (document.getElementsByClassName("threeDots")) {
    let threeDots = document.querySelectorAll(".threeDots");

    threeDots.forEach(threeD => {
      threeD.addEventListener("click", evt => {
        setTimeout(function() {
          document.addEventListener("click", outsideClickListener);
        }, 100);
        let projectMenuContainer = document.getElementById(
          "projectMenuContainer"
        );
        let parent = evt.target;
        if (
          parent.id !== "projectMenuContainer" &&
          parent.id !== "editProjectLink" &&
          parent.id !== "deleteProjectLink"
        ) {
          projectMenuContainer.classList.remove("invisible");

          projectMenuContainer.dataset.projectid = threeD.dataset.projectid;
          projectMenuContainer.dataset.projecttitle =
            threeD.dataset.projecttitle;
          projectMenuContainer.dataset.projectcolor =
            threeD.dataset.projectcolor;

          parent.append(projectMenuContainer);
        }
      });
    });
  }

  function outsideClickListener(evt) {
    let projectMenuContainer = document.getElementById("projectMenuContainer");

    if (
      !projectMenuContainer.classList.contains("invisible") &&
      evt.target.id !== "projectMenuContainer" &&
      evt.target.id !== "editProjectLink" &&
      evt.target.id !== "deleteProjectLink"
    ) {
      if (!evt.target.classList.contains("threeDots")) {
        projectMenuContainer.classList.add("invisible");
      }
      document.removeEventListener("click", outsideClickListener);
    }
  }
});
