$(function() {
  "use strict";

  $("textarea").autosize();


  // see http://www.tinymce.com/wiki.php/Configuration
  // http://www.tinymce.com/wiki.php/Controls
  // and http://www.tinymce.com/wiki.php/Inline
  // we don't use tinymce-rails `tinymce` view helper and config/tinymce.yml
  // as it requires loading tinymce in the header and does not give as much
  // config flexibility
  tinyMCE.init({
    selector: 'textarea.tinymce',
    menubar: false,
    statusbar: false,
    plugins: "textcolor table autoresize",
    toolbar: "undo redo removeformat | formatselect | bold italic underline | alignleft aligncenter alignright alignjustify | forecolor backcolor | bullist numlist outdent indent | blockquote | table",
    block_formats: "Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3",
    content_css: "/assets/bootstrap-flatly.css, /assets/tinymce.css",
  });

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

  $("#see-tags").popover({
    placement: "bottom",
    html: true,
  });

  $(".colorpicker-input").colorpicker();
});
