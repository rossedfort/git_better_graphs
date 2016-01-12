function repos() {
  $.ajax({
    type:    "GET",
    url:     "https://api.github.com/users/" + userName + "/repos",
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
