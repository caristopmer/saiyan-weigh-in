$(document).ready(function() {
  var displayStat = "weight";
  var displayTime = "1";

  $("#1-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "1"
    var url = $(this).closest("form").attr("action") + '/' + displayStat + '/' + displayTime
    $(".chart-container").html(chartAjaxRequest(url));
  });

  $("#3-month-button").on("click", function() {
    event.preventDefault();
    alert("working");
  });

  $("#6-month-button").on("click", function() {
    event.preventDefault();
    alert("working");
  });

  $("#all-time-button").on("click", function() {
    event.preventDefault();
    alert("working");
  });


  function chartAjaxRequest(requestUrl) {
    $.ajax({
      url: requestUrl
    })
    .done(function(data) {
      return data;
      console.log('done');
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      alert("Something went wrong.")
    })
  };

});