function commits() {
  $.ajax({
    type:    "GET",
    url:     "http://localhost:3000/users/" + userName + "/repos/" + repoName + "/commit_data",
    success: function(commit_data) {
      $("#commitCount").append(
        commit_data.length
      );
    },
    error: function() {
      console.log("error")
    }
  })
}
