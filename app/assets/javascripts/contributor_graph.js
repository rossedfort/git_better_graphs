function populateContributorData() {
  $.ajax({
    type:    "GET",
    url:     "/users/" + userName + "/repos/" + repoName + "/contributor_data",
    success: function(data) {
      $("#repoContributors").append(
        data.repos.length
      )
    },
    error: function() {
      console.log("error")
    }
  });
}

function buildContributorGraph(data) {
  $.getJSON("/users/" + userName + "/repos/" + repoName + "/contributor_data").then(drawContributorGraph);

  function drawContributorGraph(data) {
    var w = 400;
    var h = 200;
    var r = h/2;
    var legendRectSize = 18;
    var legendSpacing = 4;
    var color = d3.scale.category20c();
    var svg = d3.select('#contributorDataGraph')
                .append("svg:svg").data([data.repos])
                .attr("width", w)
                .attr("height", h)
                .append("svg:g")
                .attr("transform", "translate(" + r + "," + r + ")");
    var pie = d3.layout.pie().value(function(d){return d.value;});
    var arc = d3.svg.arc().outerRadius(r);
    var arcs = svg.selectAll("g.slice").data(pie).enter().append("svg:g").attr("class", "slice");

    arcs.append("svg:path")
        .attr("fill", function(d, i){
          return color(i);
        })
        .attr("d", function (d) {
          return arc(d);
        });

    var legend = svg.selectAll('.legend')
          .data(color.domain())
          .enter()
          .append('g')
          .attr('class', 'legend')
          .attr('transform', function(d, i) {
            var height = legendRectSize + legendSpacing;
            var offset =  height * color.domain().length / 2;
            var horz = 10 * legendRectSize;
            var vert = i * height - offset;
            return 'translate(' + horz + ',' + vert + ')';
          });

    legend.append('rect')
          .attr('width', legendRectSize)
          .attr('height', legendRectSize)
          .style('fill', color)
          .style('stroke', color);

    legend.append('text')
          .attr('x', legendRectSize + legendSpacing)
          .attr('y', legendRectSize - legendSpacing)
          .text(function(d, i) { return data.repos[i].label; });
  }
}