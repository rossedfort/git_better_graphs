function repos() {
  $.ajax({
    type:    "GET",
    url:     "http://localhost:3000/users/" + userName + "/repo_data",
    success: function(repos) {
      if (repos.length == 30) {
        $("#userRepoCount").append(
          "30+"
        )
      }else {
        $("#userRepoCount").append(
          repos.length
        )
      }
    },
    error: function() {
      console.log("error")
    }
  })
}
