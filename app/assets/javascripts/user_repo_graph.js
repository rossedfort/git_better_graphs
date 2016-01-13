function user_repo_graph() {
  $.getJSON(userName + "/repo_data").then(draw).fail(error);

  function draw(data) {
    var sizes = new Array();
    var names = new Array();

    for (var i = 0; i < data.length; i++) {
      sizes.push(data[i][52][1]);
      names.push(data[i][1][1]);
    }

    var color = d3.scale.category20b();

    var width = 1200,
        height = 600,
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

    chart.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
        .append("text")
        .text("Lines of Code")
        .attr("y", 40)
        .attr("x", width-100);

    chart.append("g")
        .attr("class", "y axis")
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", -6)
        .style("text-anchor", "end")
        .text("Repositories");

  }


  function error() {
    console.log("error");
  }
}
