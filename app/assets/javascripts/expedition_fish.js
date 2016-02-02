$(function() {
  $("#select_all").click(function() {
    $('.table_checkbox').not(this).prop('checked', this.checked);
  });
});