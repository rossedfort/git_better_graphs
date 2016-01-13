function followers() {
  $.ajax({
    type:    "GET",
    url:     "http://localhost:3000/users/" + userName + "/follower_data",
    success: function(followers) {
      if (followers.length == 30) {
        $("#userFollowerCount").append(
          "30+"
        )
      }else {
        $("#userFollowerCount").append(
          followers.length
        )
      }
    },
    error: function() {
      console.log("error")
    }
  })
}
