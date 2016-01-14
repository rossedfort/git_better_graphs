function commits() {
  $.ajax({
    type:    "GET",
    url:     "http://git-better-graphs.herokuapp.com/users/" + userName + "/repos/" + repoName + "/commit_data",
    success: function(commit_data) {
      $("#commitCount").append(
        commit_data.repos.length
      );
    },
    error: function() {
      console.log("error")
    }
  })
}
