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
//= require jquery
//= require cocoon
//= require rails-ujs
//= require_tree .

// Toggle on menu
toggleHeight = function(menu_wrapper_selector) {
  var menu_wrapper = document.querySelector(menu_wrapper_selector);
  var menu_button = document.querySelector('[data-toggle="menu"]');
  if ( menu_wrapper.classList.contains('menu-wrapper-open') ) {
    menu_wrapper.classList.remove('menu-wrapper-open');
    menu_button.classList.remove('active');
  } else {
    menu_wrapper.classList.add('menu-wrapper-open');
    menu_button.classList.add('active');
  }
};


// Open or hide search window
openOrHide = function(page_id, btn_id) {
  var page = document.getElementById(page_id);
  var button = document.getElementById(btn_id);
  if (page.classList.contains('hide-it')) {
    page.classList.remove('hide-it');
    if (btn_id == "searchButton") {document.querySelector('[data-search="input"]').focus();} // Kun for search
    button.classList.add('active');
  } else {
    page.classList.add('hide-it');
    button.classList.remove('active');
  }
};

// Newsline
animateLeft = function(obj, from, to){
   if(from >= to){
     animateLeft(obj, (Math.abs(obj.clientWidth) * -1), to);
   }
   else {
       var box = obj;
       box.style.left = from + "px";
       setTimeout(function(){
           animateLeft(obj, from + 3, to);
       }, 25)
   }
}

window.onload = function() {
  // document.querySelector('[data-toggle="menu"]').addEventListener('click', function() {
  //   toggleHeight('[data-slide="open"]');
  // });
  //
  // Page show/hide
  document.querySelectorAll('[data-openpage]').forEach(function(item) {
    item.addEventListener('click', function() {
      openOrHide(item.dataset.openpage, item.dataset.btn);
    });
  });

// Newsline
  newsline_obj = document.querySelector('[data-newsline="moving"]');
  if (newsline_obj) {
    width = newsline_obj.clientWidth;
    animateLeft(newsline_obj, -Math.abs(width), screen.width + width);
  }
  

// Theme overview div adapts to image size
  var images = document.querySelectorAll('[data-size="image"]');
    images.forEach(function(image) {
      div_id = image.dataset.div;
      var box = document.getElementById('box' + div_id);
      if (box.clientHeight < image.height + 100) {
        box.style.height = (image.height + 140) + 'px';
      }
        box.classList.add("theme-show");
    });
};
