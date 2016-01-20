function userRepoData() {
  $(".repoLoader").show();
  $.getJSON("/users/" + userName + "/repo_data").then(draw).fail(error).always(function () {
    $(".repoLoader").hide();
  });

  function draw(data) {
    var sizes = new Array();
    var names = new Array();

    for (var i = 0; i < data.users.length; i++) {
      names.push(data.users[i].label);
      sizes.push(data.users[i].value);
    }

    var color = d3.scale.category20b();

    var width = 900,
        height = names.length * 20,
        barHeight = 20;

    var barWidth = width / sizes.length;

    var x = d3.scale.linear()
              .range([width, 0])
              .domain([d3.max(sizes), 0]);

    var y = d3.scale.linear()
        .range([height, 0])
        .domain([d3.max(sizes), 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .orient("left");

    var chart = d3.select("#user_repo_graph")
        .attr("width", barWidth * sizes.length + 250)
        .attr("height", barHeight * sizes.length + 250);

    var bar = chart.selectAll("g")
                   .data(sizes)
                   .enter().append("g")
                   .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; });

    bar.append("rect")
        .attr("fill", function(d, i){
          return color(i);
        })
       .attr("height", barHeight)
       .attr("width", x);

    bar.append("text")
        .attr("x", -10)
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .attr("text-anchor", "end")
        .style("fill", "black")
        .style("font-size", "12px")
        .text(function(d, i) { return data.users[i].label; });

    chart.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
        .append("text")
        .text("Lines of Code")
        .attr("y", 40)
        .attr("x", 0);

  }


  function error() {
    console.log("error");
  }
}
