function user_repo_graph() {
  $.getJSON('data').then(draw).fail(error);

  function draw(data) {
      var color = d3.scale.category20b();
      var width = 1200,
          barHeight = 20;

      var x = d3.scale.linear()
          .range([0, width])
          .domain([0, d3.max(data)]);

      var chart = d3.select("#user_repo_graph")
          .attr("width", width)
          .attr("height", barHeight * data.length);

      var bar = chart.selectAll("g")
          .data(data)
          .enter().append("g")
          .attr("transform", function (d, i) {
                    return "translate(0," + i * barHeight + ")";
                });

      bar.append("rect")
          .attr("width", x)
          .attr("height", barHeight - 1)
          .style("fill", function (d) {
                     return color(d)
                 })

      bar.append("text")
          .attr("x", function (d) {
                    return x(d);
                })
          .attr("y", barHeight / 2)
          .attr("dy", ".35em")
          .style("fill", "black")
          .text(function (d) {
                    return d;
                });
  }

  function error() {
      console.log("error")
  }

}
