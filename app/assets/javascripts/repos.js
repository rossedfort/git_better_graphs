function repos() {
  $.ajax({
    type:    "GET",
    url:     userName + "/repo_data",
    success: function(repos) {
      $("#userRepoCount").append(
        repos.length
      )
    },
    error: function() {
      console.log("error")
    }
  })
}
