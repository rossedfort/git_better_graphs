function populateRepoDropdown() {
  $.ajax({
    type:    "GET",
    url:     "/users/" + userName + "/repo_data",
    success: function(data) {
      for (var i = 0; i < data.users.length; i++) {
        $("#repoSelect").append(
          "<option id=repoSelectOption value=" + data.users[i].label + ">" + data.users[i].label + "</option>"
        )
      }
    },
    error: function() {
      console.log("error")
    }
  });
}
function populateUserData() {
  $.ajax({
    type:    "GET",
    url:     "/users/" + userName + "/user_data",
    success: function(data) {
      $("#userData").append(data[0][1]);
      $("#userRepoCount").append(data[24][1]);
      $("#userFollowingCount").append(data[27][1]);
      $("#userFollowerCount").append(data[26][1]);
    },
    error: function() {
      console.log("error")
    }
  });
}

function getRepoLink() {
  $('#repoSelect').change(function() {
    var repoName = $("#repoSelect option:selected").text();
    document.location.href = "/users/" + userName + "/repos/" + repoName
  });
}
