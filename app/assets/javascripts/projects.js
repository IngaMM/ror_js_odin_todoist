document.addEventListener("turbolinks:load", function() {
  // Open form for adding a new project and make background "grey" and irresponsive
  if (document.getElementById("addProject")) {
    let addProject = document.getElementById("addProject");
    addProject.addEventListener("click", () => {
      let addNewProject = document.getElementById("addNewProject");
      addNewProject.classList.remove("invisible");
      addGreyScreen();
    });
  }

  // Close form when clicking "Abort"
  if (document.getElementById("abortNewProject")) {
    abortButtonProject("abortNewProject", "addNewProject");
  }

  // Open form for editing a project and make background "grey" and irresponsive
  if (document.getElementById("editProjectLink")) {
    let editProjectLink = document.getElementById("editProjectLink");
    editProjectLink.addEventListener("click", () => {
      let projectMenuContainer = document.getElementById(
        "projectMenuContainer"
      );
      let projectId = projectMenuContainer.dataset.projectid;
      let projectTitle = projectMenuContainer.dataset.projecttitle;
      let projectColor = projectMenuContainer.dataset.projectcolor;

      projectMenuContainer.classList.add("invisible");

      let editProject = document.getElementById("editProject");
      editProject.classList.remove("invisible");

      let editProjectForm = document.getElementById("editProjectForm");
      let path = "/projects/" + projectId;
      editProjectForm.setAttribute("action", path);

      let editTitleField = document.getElementById("editTitleField");
      editTitleField.value = projectTitle;
      let editColorField = document.getElementById("editColorField");
      editColorField.value = projectColor;

      addGreyScreen();
    });
  }

  // Close form when clicking "Abort"
  if (document.getElementById("abortEditProject")) {
    abortButtonProject("abortEditProject", "editProject");
  }

  // Delete project when clicking the corresponding link
  if (document.getElementById("deleteProjectLink")) {
    let deleteProjectLink = document.getElementById("deleteProjectLink");
    deleteProjectLink.addEventListener("click", () => {
      let projectMenuContainer = document.getElementById(
        "projectMenuContainer"
      );
      let projectId = projectMenuContainer.dataset.projectid;
      let deleteProjectLink = document.getElementById("deleteProjectLink");
      let href = "/projects/" + projectId;
      deleteProjectLink.href = href;
    });
  }

  function addGreyScreen() {
    let greyScreen = document.getElementById("greyScreen");
    let body = document.body;
    let html = document.documentElement;
    let height = Math.max(
      body.scrollHeight,
      body.offsetHeight,
      html.clientHeight,
      html.scrollHeight,
      html.offsetHeight
    );
    let width = document.body.clientWidth;
    greyScreen.style.height = height + "px";
    greyScreen.style.width = width + "px";
    greyScreen.classList.remove("invisible");
  }

  function abortButtonProject(abortButtonName, formNameToClose) {
    let abortButton = document.getElementById(abortButtonName);
    abortButton.addEventListener("click", () => {
      let formToClose = document.getElementById(formNameToClose);
      formToClose.classList.add("invisible");
      let greyScreen = document.getElementById("greyScreen");
      greyScreen.classList.add("invisible");
    });
  }
});
