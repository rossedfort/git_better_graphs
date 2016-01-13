function repoData() {
  $.ajax({
    type:    "GET",
    url:     "http://localhost:3000/users/" + userName + "/repos/" + repoName + "/specific_repo_data",
    success: function(repo_data) {
      $("#repoName").append(repo_data[1][1]);
      $("#repoDescription").append(repo_data[6][1]);
      $("#repoSize").append(repo_data[52][1] + " lines");
      $("#repoLanguage").append(repo_data[55][1]);
      $("#repoWatchers").append(repo_data[54][1]);
      getLanguageData();
    },
    error: function() {
      console.log("error")
    }
  })

  function getLanguageData() {
    $.getJSON("http://localhost:3000/users/" + userName + "/repos/" + repoName + "/language_data").then(buildGraph)
  }

  function buildGraph(data) {
    var w = 500;
    var h = 300;
    var r = h/2;
    var legendRectSize = 18;
    var legendSpacing = 4;
    var color = d3.scale.category20c();
    var svg = d3.select('#languageDataGraph')
                .append("svg:svg").data([data])
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
      .text(function(d, i) { return data[i].label; });
      }
}