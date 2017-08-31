$(document).ready(function() {
  var displayStat = "weight";
  var displayTime = "1";

  $("#1-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "1";
    var thisButton = $(this);
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#3-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "3";
    var thisButton = $(this);
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#6-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "6";
    var thisButton = $(this);
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#all-time-button").on("click", function() {
    event.preventDefault();
    displayTime = "0";
    var thisButton = $(this);
    chartAjaxRequest(buildUrl(thisButton));
  });

  function buildUrl(thisButton) {
    return thisButton.closest("form").attr("action") + '/' + displayStat + '/' + displayTime;
  }

  function chartAjaxRequest(requestUrl) {
    console.log("getting here")
    console.log(requestUrl)
    $.ajax({
      url: requestUrl
    })
    .done(function(data) {
      $(".chart-container").html(data);
      console.log('done');
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      alert("Something went wrong.");
    })
  };

});