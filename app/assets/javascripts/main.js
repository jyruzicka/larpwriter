$(function() {
  "use strict";

  $("input[type=submit]").attr("data-disable-with", "please wait...");

  $(".add-asset").on("click", function(event) {
    event.preventDefault();
    var actionPath = $(this).data("action-path");
    document.location.href = actionPath;
  });

});
