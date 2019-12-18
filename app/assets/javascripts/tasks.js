document.addEventListener("turbolinks:load", function() {
  // Open form for adding a new task
  if (document.getElementById("addTask")) {
    let addTask = document.getElementById("addTask");
    addTask.addEventListener("click", () => {
      let addNewTask = document.getElementById("addNewTask");
      addNewTask.classList.remove("invisible");
    });
  }

  // Close form when clicking "Abort"
  if (document.getElementById("abortNewTask")) {
    abortButtonTask("abortNewTask", "addNewTask");
  }

  // Open form for editing a task
  if (document.getElementById("editTaskLink")) {
    let editTaskLink = document.getElementById("editTaskLink");
    editTaskLink.addEventListener("click", () => {
      let taskMenuContainer = document.getElementById("taskMenuContainer");

      let taskId = taskMenuContainer.dataset.taskid;
      let taskTitle = taskMenuContainer.dataset.tasktitle;
      let taskProjectTitle = taskMenuContainer.dataset.taskprojecttitle;
      let taskDuedate = taskMenuContainer.dataset.taskduedate;

      taskMenuContainer.classList.add("invisible");

      let locationEditTask = findAncestor(taskMenuContainer, "task");

      let editTask = document.getElementById("editTask");
      locationEditTask.append(editTask);
      editTask.classList.remove("invisible");

      let editTaskForm = document.getElementById("editTaskForm");
      let path = "/tasks/" + taskId;
      editTaskForm.setAttribute("action", path);

      let editTitleFieldTask = document.getElementById("editTitleFieldTask");
      editTitleFieldTask.value = taskTitle;
      let editProjectField = document.getElementById("editProjectField");
      editProjectField.value = taskProjectTitle;
      let editDuedateField = document.getElementById("editDuedateField");
      editDuedateField.value = taskDuedate;
    });
  }

  // Close form when clicking "Abort"
  if (document.getElementById("abortEditTask")) {
    abortButtonTask("abortEditTask", "editTask");
  }

  // Delete task when clicking the corresponding link
  if (document.getElementById("deleteTaskLink")) {
    let deleteTaskLink = document.getElementById("deleteTaskLink");
    deleteTaskLink.addEventListener("click", () => {
      let taskMenuContainer = document.getElementById("taskMenuContainer");
      let taskId = taskMenuContainer.dataset.taskid;
      let deleteTaskLink = document.getElementById("deleteTaskLink");
      let href = "/tasks/" + taskId;
      deleteTaskLink.href = href;
    });
  }

  function findAncestor(el, cls) {
    while ((el = el.parentElement) && !el.classList.contains(cls));
    return el;
  }

  function abortButtonTask(abortButtonName, formNameToClose) {
    let abortButton = document.getElementById(abortButtonName);
    abortButton.addEventListener("click", () => {
      let formToClose = document.getElementById(formNameToClose);
      formToClose.classList.add("invisible");
    });
  }
});
