function getRepoData() {
  $.ajax({
    type:    "GET",
    url:     "/users/" + userName + "/repos/" + repoName + "/specific_repo_data",
    success: function(repo_data) {
      $("#repoName").append(repo_data[1][1]);
      $("#repoDescription").append(repo_data[6][1]);
      $("#repoSize").append(repo_data[52][1] + " lines");
      $("#repoLanguage").append(repo_data[55][1]);
      $("#repoWatchers").append(repo_data[54][1]);
      $("#repoForks").append(repo_data[60][1]);
      $("#repoOpenIssues").append(repo_data[62][1]);
    },
    error: function() {
      console.log("error")
    }
  })
}
