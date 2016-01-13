function user_repo_graph() {
  $.getJSON("repo_data").then(draw).fail(error);

  function draw(data) {
    var sizes = new Array();
    var names = new Array();

    for (var i = 0; i < data.length; i++) {
      sizes.push(data[i][52][1]);
      names.push(data[i][1][1]);
    }

    var color = d3.scale.category20b();
    var width = 1200,
        height = 700,
        barHeight = 20;

    var barWidth = width / sizes.length;

    var x = d3.scale.linear()
              .range([width, 0])
              .domain([d3.max(sizes), 0]);

    var y = d3.scale.linear()
        .range([height, 0])
        .domain([d3.max(sizes), 0]);

    var chart = d3.select("#user_repo_graph")
        .attr("width", width)
        .attr("height", barHeight * sizes.length);

    var bar = chart.selectAll("g")
                   .data(sizes)
                   .enter().append("g")
                   .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; });

    bar.append("rect")
       .attr("height", barHeight)
       .attr("width", x)
       .style("fill", "steelblue");

    bar.append("text")
        .attr("x", function (d) {
                  return x(d);
              })
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .style("fill", "black")
        .text(function (d) {
                  return d + " lines";
              });


  }


  function error() {
    console.log("error");
  }
}
