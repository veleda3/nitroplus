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
//= require turbolinks
//= require jquery
//= require bootstrap
//= require jquery_ujs
//Bizwrap 3.0 Jquery custom file

    //sticky header on scroll
    $(window).on("scroll", function () {
        var scroll = $(window).scrollTop();

        if (scroll >= 1) {
            $(".sticky-nav").addClass("fixed-top");
        } else {
            $(".sticky-nav").removeClass("fixed-top");
        }
    });
    /**back to top**/
    $(window).on("scroll", function () {
        if ($(this).scrollTop() > 300) {
            $('.scrollToTop').fadeIn();
        } else {
            $('.scrollToTop').fadeOut();
        }
    });
    /**Click event to scroll to top**/
    $('.scrollToTop').on("click", function () {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });


    //search trigger
    jQuery('.icon-search, .search-close').on("click", function () {
        jQuery('.search-form-nav').animate({height: 'toggle'}, 500);
    });

    /**smooth scroll**/
    $('.smooth-scroll a[href*="#"]:not([href="#"])').on("click", function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });




    //masonry blog post

    /*****maginific popup **/
    $('.popup-container').each(function () {
        $(this).magnificPopup({
            delegate: 'a',
            type: 'image',
            mainClass: 'mfp-with-zoom',
            gallery: {
                enabled: true
            },
            zoom: {
                enabled: true,
                duration: 300,
                easing: 'ease-in-out',
                opener: function (openerElement) {
                    return openerElement.is('img') ? openerElement : openerElement.find('img');
                }
            }
        });
    });


//transparent header onepage
    $(document).on("scroll", function () {
        if
                ($(document).scrollTop() > 100) {
            $(".transparent-header").addClass("shrink");
        } else
        {
            $(".transparent-header").removeClass("shrink");
        }
    });
