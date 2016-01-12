function followers() {
  $.ajax({
    type:    "GET",
    url:     "https://api.github.com/users/" + userName + "/followers",
    success: function(followers) {
      $("#userFollowerCount").append(
        followers.length
      )
    },
    error: function() {
      console.log("error")
    }
  })
}
