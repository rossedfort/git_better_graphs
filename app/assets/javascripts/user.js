function user() {
  $.ajax({
    type:    "GET",
    url:     "http://localhost:3000/users/" + userName + "/user_data",
    success: function(user_data) {
      $("#userData").append(
        user_data[0][1]
      );
    },
    error: function() {
      console.log("error")
    }
  })
}
