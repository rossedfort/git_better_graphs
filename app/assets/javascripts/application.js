// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require d3
//= require_tree .

$(document).ready(function(){
  $('.slider').slider({full_width: true});
  $('.tooltipped').tooltip({delay: 50});
  $('select').material_select();
  userRepoData();
  populateRepoDropdown();
  populateUserData();
  getRepoLink();
  getRepoData();
  getCommitData();
  buildLanguageGraph();
  populateContributorData();
  buildContributorGraph();
  getCommitActivity();
  buildFrequencyGraph();
  $("#languageGraphButton").click(function() {
    $(".graphs").children().addClass("hidden")
    $("#languageDataGraph").toggleClass( "hidden" );
  });
  $("#commitGraphButton").click(function() {
    $(".graphs").children().addClass("hidden")
    $("#commitGraph").toggleClass( "hidden" );
  });
  $("#contributorGraphButton").click(function() {
    $(".graphs").children().addClass("hidden")
    $("#contributorDataGraph").toggleClass( "hidden" );
  });
  $("#freqeuncyGraphButton").click(function() {
    $(".graphs").children().addClass("hidden")
    $("#frequencyGraph").toggleClass( "hidden" );
  });
});
