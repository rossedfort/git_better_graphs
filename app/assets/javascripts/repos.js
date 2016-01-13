function repos() {
  $.ajax({
    type:    "GET",
    url:     "http://localhost:3000/users/" + userName + "/repo_data",
    success: function(data) {
      var sizes = new Array();
      var names = new Array();

      for (var i = 0; i < data.length; i++) {
        sizes.push(data[i][52][1]);
        names.push(data[i][1][1]);
      }
      for (var i = 0; i < names.length; i++) {
        $("#repoSelect").append(
          "<option id=repoSelectOption value=" + names[i] + ">" + names[i] + "</option>"
        )
      }
      if (data.length == 30) {
        $("#userRepoCount").append(
          "30+"
        )
      }else {
        $("#userRepoCount").append(
          data.length
        )
      }
    },
    error: function() {
      console.log("error")
    }
  });
}

function getRepo() {
  $('#repoSelect').change(function() {
    var repoName = $("#repoSelect option:selected").text();
    document.location.href = "http://localhost:3000/users/" + userName + "/repos/" + repoName
  });
}