$(function() {
  "use strict";

  $("textarea").autosize();

  $("form").submit(function() {
    // in a nested field we can have several "target_id" selects with the same HTML id
    // we need to send to Rails only once attribute with the id "target_id", else Rails catches only the last one
    // for that we remove before the submit all the select dropdowns that had been hidden because they are not the target_type the user selected
    $(".nested-fields-section").find("div.form-group.select:hidden").remove();
  });

  $(".nested-fields").each(function() {
    showOnlySelectedTypeDropdown($(this));
  });

  $('.nested-fields-section').on('cocoon:after-insert', function(event, $nestedFieldsDiv) {
    showOnlySelectedTypeDropdown($nestedFieldsDiv);
    $("textarea").autosize();
  });

  $(".nested-fields-section").on("change", "[data-role=target-type-selector]", function() {
    showOnlySelectedTypeDropdown($(this).parents(".nested-fields"));
  });

  function showOnlySelectedTypeDropdown($nestedFieldsDiv) {
    var selectedTargetType = $nestedFieldsDiv.find("[data-role=target-type-selector]").val();

    $nestedFieldsDiv.find("[data-role=target-selector]").each(function() {
      if($(this).data("target-type") === selectedTargetType) {
        $(this).parent("div").show();
      } else {
        $(this).parent("div").hide();
      }
    });
  }

  $(".show-hide-reverse-relationship").click(function(event) {
    event.preventDefault();
    $(this).parent("p").next(".description").toggleClass("show hidden");
  });

  $("body").on("click", ".show-hide-options", function(event) {
    event.preventDefault();
    $(this).parent("p").next(".options").toggleClass("show hidden");
  });
});
