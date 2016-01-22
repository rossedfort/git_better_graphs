function getRepoData() {
  $.ajax({
    type:    "GET",
    url:     "/users/" + userName + "/repos/" + repoName + "/specific_repo_data",
    success: function(repo_data) {
      $("#repoName").append(repo_data[1][1]);
      $("#repoDescription").append(repo_data[6][1]);
      $("#repoSize").append(repo_data[53][1]);
      $("#repoLanguage").append(repo_data[56][1]);
      $("#repoWatchers").append(repo_data[54][1]);
      $("#repoForks").append(repo_data[61][1]);
      $("#repoOpenIssues").append(repo_data[63][1]);
    },
    error: function() {
      console.log("error")
    }
  })
}
