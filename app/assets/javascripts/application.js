// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap
//= require quagga
//= require jquery.observe_field
//= require cocoon
//= require select2
//= require select2_locale_es
//= require sale_orders
//= require_tree .
//= require filterrific/filterrific-jquery

$( ".dropdown" ).select2({
  theme: "bootstrap"
});

$(document).on('turbolinks:load', function (e, added_task) {
  $(".dropdown").select2();
});

$(document).on('turbolinks:load', function () {
  $("form").on('cocoon:after-insert', function() {
    $("select.dropdown").select2();
  });
});

$(document).on('turbolinks:load', function () {

  $('#sidebarCollapse').on('click', function () {
    $('#sidebar').toggleClass('active');
  });

});

$(document).on('turbolinks:load', function() {

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass("btn-default");
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }
        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
});

$(document).on('turbolinks:load', function () {
  $('nextBtn').on('click', function () {
    $('.upcval').focus();
  });
});

$(document).on('turbolinks:load', function () {
  $("#sale-upcval").change(function(){
    var code = $("#sale-upcval").val();
    $.ajax({
      url: '/sale_orders/sale_item_fields',
      type: "POST",
      data: {upc : +code}
    });
  });
});

$(document).on('turbolinks:load', function () {
  $("#purchase-upcval").change(function(){
    var code = $("#purchase-upcval").val();
    $.ajax({
      url: '/purchase_orders/purchase_item_fields',
      type: "POST",
      data: {upc : +code}
    });
  });
});

$(document).on('turbolinks:load', function() {
  $(".calculate-purchase").click(function() {
    $.ajax({
      url: '/purchase_orders/purchase_results',
      type: 'POST'
    });
  });
});

$(document).on('turbolinks:load', function() {
  $("#pay-with").change(function() {
    $.ajax({
      url: '/sale_orders/sale_results',
      type: 'POST'
    });
  });
});
