// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$('th.Logo').on('click', function (event) {

  // make th object active
  $(this).siblings('th').removeClass('active');
  $(this).addClass('active');

  // update the form
  var predicted_contestant = $(this).children(
    "div.contestant")[0]["textContent"];

  var input_to_change = $(this).siblings("input")[0];
  input_to_change["value"] = predicted_contestant;

  // enable button
  button = $(this).parents("table").
    siblings("div.submitmatch").
    children("input");

  button.prop('disabled', false);

});


$("form.form").on('ajax:success', function(data, status, xhr) {

    button = $(this).parents("table.responsive").
      siblings("div.submitmatch").
        children("input")[0];

    if (!button["disabled"]) {
      button["value"] = "UPDATE";
      button["disabled"] = true;
    }

});

$("form.form").on('ajax:error', function(xhr, status, error) {

    button = $(this).parents("table.responsive").
      siblings("div.submitmatch").
        children("input")[0];

    button["value"] = "ERROR";
    button["disabled"] = false;

});