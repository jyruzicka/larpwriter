$(function() {

  $(".sortable-list").sortable({
    forcePlaceholderSize: true,
    placeholder:          "sortable-placeholder",
    update:               function(event, ui) {
      var newPosition        = ui.item.index();
      var changePositionPath = ui.item.data("change-position-path");

      $.post(changePositionPath, {position: newPosition});
    }
  });
  $(".sortable-list").disableSelection();
});
