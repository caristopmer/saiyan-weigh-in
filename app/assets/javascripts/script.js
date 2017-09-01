$(document).ready(function() {
  var displayStat = "weight";
  var displayTime = "1";

  $("#all-time-button").addClass("button-selected");
  $("#weight-button").addClass("button-selected");


  $("#1-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "1";
    var thisButton = $(this);
    $(".chart-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#3-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "3";
    var thisButton = $(this);
    $(".chart-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#6-month-button").on("click", function() {
    event.preventDefault();
    displayTime = "6";
    var thisButton = $(this);
    $(".chart-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#all-time-button").on("click", function() {
    event.preventDefault();
    displayTime = "0";
    var thisButton = $(this);
    $(".chart-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });


  $("#weight-button").on("click", function() {
    event.preventDefault();
    displayStat = "weight";
    var thisButton = $(this);
    $(".chart-selection-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#pushups-button").on("click", function() {
    event.preventDefault();
    displayStat = "push_ups";
    var thisButton = $(this);
    $(".chart-selection-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });

  $("#power-levels-button").on("click", function() {
    event.preventDefault();
    displayStat = "power_levels";
    var thisButton = $(this);
    $(".chart-selection-buttons form .chart-button").removeClass("button-selected");
    thisButton.addClass("button-selected");
    chartAjaxRequest(buildUrl(thisButton));
  });



  function buildUrl(thisButton) {
    return thisButton.closest("form").attr("action") + '/' + displayStat + '/' + displayTime;
  }

  function chartAjaxRequest(requestUrl) {
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