function getCommitData() {
  $.ajax({
    type:    "GET",
    url:     "/users/" + userName + "/repos/" + repoName + "/commit_data",
    success: function(commit_data) {
      if (commit_data == null) {
        getCommitData();
      } else {
        $("#commitCount").append(
          commit_data
        );
      }
    },
    error: function(xhr) {
      console.log(xhr.error)
    }
  })
}

function getCommitActivity() {
  $.getJSON("/users/" + userName + "/repos/" + repoName + "/commit_activity").then(drawCommitGraph);
  function drawCommitGraph(data) {
    if (data.repos[0] == undefined) {
      getCommitActivity();
    }else {
      var margin = {top: 30, right: 20, bottom: 30, left: 50},
      width = 500 - margin.left - margin.right,
      height = 220 - margin.top - margin.bottom;

      var x = d3.time.scale().range([0, width]);
      var y = d3.scale.linear().range([height, 0]);

      var xAxis = d3.svg.axis().scale(x)
      .orient("bottom").ticks(5);

      var yAxis = d3.svg.axis().scale(y)
      .orient("left").ticks(5);

      var valueline = d3.svg.line()
      .x(function(d) { return x(d.week); })
      .y(function(d) { return y(d.amount); });

      var svg = d3.select("#commitGraph")
      .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform",
      "translate(" + margin.left + "," + margin.top + ")");

      x.domain(d3.extent(data.repos, function(d) { return d.week; }));
      y.domain([0, d3.max(data.repos, function(d) { return d.amount; })]);

      svg.append("path")
      .attr("class", "line")
      .attr("d", valueline(data.repos));

      svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

      svg.append("g")
      .attr("class", "y axis")
      .call(yAxis);
    }
  }
}
