document.addEventListener("turbolinks:load", function() {
  // Open menu for tasks when clicking on the three dots next to the task name.
  // Close menu when clicking somewhere else.
  if (document.getElementsByClassName("threeDotsTask")) {
    let threeDots = document.querySelectorAll(".threeDotsTask");

    threeDots.forEach(threeD => {
      threeD.addEventListener("click", evt => {
        setTimeout(function() {
          document.addEventListener("click", outsideClickListenerTask);
        }, 100);
        let taskMenuContainer = document.getElementById("taskMenuContainer");
        let parent = evt.target;
        if (
          parent.id !== "taskMenuContainer" &&
          parent.id !== "editTaskLink" &&
          parent.id !== "deleteTaskLink"
        ) {
          taskMenuContainer.classList.remove("invisible");

          taskMenuContainer.dataset.taskid = threeD.dataset.taskid;
          taskMenuContainer.dataset.tasktitle = threeD.dataset.tasktitle;
          taskMenuContainer.dataset.taskprojecttitle =
            threeD.dataset.taskprojecttitle;
          taskMenuContainer.dataset.taskduedate = threeD.dataset.taskduedate;

          parent.append(taskMenuContainer);
        }
      });
    });
  }

  function outsideClickListenerTask(evt) {
    let taskMenuContainer = document.getElementById("taskMenuContainer");

    if (
      !taskMenuContainer.classList.contains("invisible") &&
      evt.target.id !== "taskMenuContainer" &&
      evt.target.id !== "editTaskLink" &&
      evt.target.id !== "deleteTaskLink"
    ) {
      if (!evt.target.classList.contains("threeDotsTask")) {
        taskMenuContainer.classList.add("invisible");
      }
      document.removeEventListener("click", outsideClickListenerTask);
    }
  }
});
