# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function () {
  $("#item-quantity").last().change(function(){
    var code = $("#sale-upcval").val();
    $.ajax({
      url: '/sale_orders/sale_item_fields',
      type: "POST",
      data: {upc : +code}
    });
  });
});
