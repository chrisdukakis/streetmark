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
//= require_tree .

window.onload = function() {
  var navButton = document.querySelector('#nav-button'),
      nav = document.querySelector('#nav'),
      navHidden = true;
  navButton.addEventListener('click', function() {
    if (navHidden) {
      nav.classList.remove('hidden-nav');
      navHidden = false;
    }
  });
  window.addEventListener('click', function() {
    if (!navHidden) {
      nav.classList.add('hidden-nav');
      navHidden = true;
    }
  });
  nav.addEventListener('click', function(e) {
    e.stopPropagation();
  });
  navButton.addEventListener('click', function(e) {
    e.stopPropagation();
  });
  if ( document.getElementById('post_lat') ) {
    navigator.geolocation.getCurrentPosition(function (pos) {
      document.getElementById('post_lat').value = pos.coords.latitude;
      document.getElementById('post_lng').value = pos.coords.longitude;
      //alert(pos.coords.accuracy);
    }, function () { alert( 'Geolocation error' ); }, {enableHighAccuracy: true});
  }
  var highlight = document.getElementById('highlight-post');
  if ( highlight ) {
    highlight.addEventListener( 'click', function() {
      if ( this.classList.contains('inactive') ){
        return false;
      }
      document.getElementById( 'rate-form' ).submit();
    } );
  }
  var register_lat = document.getElementById('register-lat');
  if ( register_lat ) {
    var register_lng = document.getElementById('register-lng');
    navigator.geolocation.getCurrentPosition(function (pos) {
      register_lat.value = pos.coords.latitude;
      register_lng.value = pos.coords.longitude;
    } );
  }
  var snap = document.getElementById('snap');
  if ( snap ) {
    var video = document.getElementById('camera');
    video.autoplay = true;
    video.style.width = '610px';
    video.style.height = '458px';

    var canvas = document.createElement('canvas');
    canvas.width = 610;
    canvas.height = 458;
    var ctx = canvas.getContext( '2d' );
    
    var input = document.getElementById('post_photo');

    navigator.getUserMedia = (navigator.getUserMedia ||
      navigator.webkitGetUserMedia ||
      navigator.mozGetUserMedia ||
      navigator.msGetUserMedia );
    window.URL = (webkitURL || URL);
    
    navigator.getUserMedia({
      audio: false,
      video: true
    },
    function(stream) {
      video.src = URL.createObjectURL(stream);
    },
    function(err) {
    });

    var pause = false;
    
    snap.addEventListener('click', function(e) {
      if (pause) {
        video.play();
        pause = false;
      }
      else {
        e.preventDefault();
        ctx.drawImage(video, 0, 0);
        input.value = canvas.toDataURL('image/jpg');
        video.pause();
        pause = true;
      }
    });
  }
}