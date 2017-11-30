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
//= require_tree .

toggleHeight = function(menu_wrapper_selector) {
  var menu_wrapper = document.querySelector(menu_wrapper_selector);
  if ( menu_wrapper.classList.contains('menu-wrapper-open') ) {
    menu_wrapper.classList.remove('menu-wrapper-open'); 
  } else {
    menu_wrapper.classList.add('menu-wrapper-open'); 
  }
};

openOrHide = function() {
  var search_page = document.querySelector('[data-search="page"]');
  var button = document.getElementById("searchButton");
  if (search_page.classList.contains('hide-it')) {
    search_page.classList.remove('hide-it');
    document.querySelector('[data-search="input"]').focus();
    button.classList.add('active');
  } else {
    search_page.classList.add('hide-it');
    button.classList.remove('active');
  }
};

window.onload = function() {
  document.querySelector('[data-toggle="menu"]').addEventListener('click', function() {
    toggleHeight('[data-slide="open"]');
  });
  // Search page show/hide
  document.querySelectorAll('[data-search="openOrHide"]').forEach(function(item) {
    item.addEventListener('click', function() {
      openOrHide();
    });
  });
};
