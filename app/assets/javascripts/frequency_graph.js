function buildFrequencyGraph() {
  $(".frequencyLoader").show();
  $.getJSON("/users/" + userName + "/repos/" + repoName + "/code_frequency").then(drawFrequencyGraph).always(function() {
    $(".frequencyLoader").hide();
  });

  function drawFrequencyGraph(data) {
    if (data.repos[0] == undefined) {
      buildFrequencyGraph();
    }else {
      var neg = new Array();
      var pos = new Array();

      for (var i = 0; i < data.repos.length; i++) {
        pos.push(data.repos[i].value);
        neg.push(data.repos[i].value2)
      }
      var margin = {
        top: 30,
        right: 10,
        bottom: 10,
        left: 10
      },
      width = 800 - margin.left - margin.right,
      height = 400 - margin.top - margin.bottom;

      var x = d3.scale.linear()
      .range([0, width])
      .domain([d3.max(pos), 0]);

      var y = d3.scale.ordinal()
      .rangeRoundBands([0, height], .2);

      var xAxis = d3.svg.axis()
      .scale(x)
      .orient("top");

      var svg = d3.select("#frequencyGraph").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

      x.domain([d3.min(neg), d3.max(pos)])
      y.domain(data.repos.map(function (d) {
        return d.name;
      }));

      svg.selectAll(".bar")
      .data(data.repos)
      .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function (d) {
        return x(Math.min(0, d.value));
      })
      .attr("y", function (d) {
        return y(d.name);
      })
      .attr("width", function (d) {
        return Math.abs(x(d.value) - x(0));
      })
      .attr("height", y.rangeBand());

      svg.selectAll(".bar2")
      .data(data.repos)
      .enter().append("rect")
      .attr("class", "bar2")
      .attr("x", function (d) {
        return x(Math.min(0, d.value2));
      })
      .attr("y", function (d) {
        return y(d.name);
      })
      .attr("width", function (d) {
        return Math.abs(x(d.value2) - x(0));
      })
      .attr("height", y.rangeBand());


      svg.append("g")
      .attr("class", "x axis")
      .call(xAxis);

      svg.append("g")
      .attr("class", "y axis")
      .append("line")
      .attr("x1", x(0))
      .attr("x2", x(0))
      .attr("y2", height);


      function type(d) {
        d.value = +d.value;
        return d;
      }
    }
  }
}
