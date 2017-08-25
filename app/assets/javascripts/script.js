$(document).ready(function() {

  $("#1-month-button").on("click", function() {
    $(".chart-container").text("<%= line_chart @user.weight_lines.map { |name, data| { name: name, data: data }}, min: nil, max: nil %>");
  });

  $("#3-month-button").on("click", function() {
    alert("working");
  });

  $("#6-month-button").on("click", function() {
    alert("working");
  });

  $("#all-time-button").on("click", function() {
    alert("working");
  });








});