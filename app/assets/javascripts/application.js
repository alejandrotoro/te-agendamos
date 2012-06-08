// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require jquery.jgrowl_minimized.js
//= require facebox.js
//= require jquery-ui-1.8.20.custom.min.js
//= require jquery-ui-timepicker-addon.js

jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox();
  $('.datetimepicker').live('click', function () {
    $('#schedule_reminder_date').attr('disabled', false)
    $(this).removeClass('hasDatepicker').datetimepicker({
      dateFormat: "yy-mm-dd",
      addSliderAccess: true,
      sliderAccessArgs: { touchonly: false },
      minDate: new Date()
    }).focus();
  });
  $('.datetimepicker-reminder').live('click', function () {
    date = $('#schedule_date').val()
    $(this).removeClass('hasDatepicker').datetimepicker({
      dateFormat: "yy-mm-dd",
      addSliderAccess: true,
      sliderAccessArgs: { touchonly: false },
      minDate: new Date(),
      maxDate: new Date(date)
    }).focus();
  });
})
