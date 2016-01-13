function followers() {
  $.ajax({
    type:    "GET",
    url:     "follower_data",
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
