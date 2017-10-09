jQuery(document).ready(function($) {

"use strict";

	/***************************************************************************/
	//MAIN MENU SUB MENU TOGGLE
	/***************************************************************************/
	$('.nav.navbar-nav > li.menu-item-has-children > a').on('click', function(event){
		event.preventDefault();
		$(this).parent().find('.sub-menu').toggle();
		$(this).parent().find('.sub-menu li .sub-menu').hide();
	});

	$('.nav.navbar-nav li .sub-menu li.menu-item-has-children > a ').on('click', function(event){
		event.preventDefault();
		$(this).parent().find('.sub-menu').toggle();
	});

	/***************************************************************************/
	//TABS
	/***************************************************************************/
	$( function() {
	    $( ".tabs" ).tabs({
			create: function(event, ui) { 
				$(this).fadeIn(); 
			}
		});
	});

	/***************************************************************************/
	//ACTIVATE CHOSEN 
	/***************************************************************************/
	$("select").chosen({disable_search_threshold: 11});

	/***************************************************************************/
	//ACCORDIONS
	/***************************************************************************/
	$(function() {
	    $( "#accordion" ).accordion({
	    	heightStyle: "content",
	    	closedSign: '<i class="fa fa-minus"></i>',
  			openedSign: '<i class="fa fa-plus"></i>'
	    });
	});
	
	/***************************************************************************/
	//SLICK SLIDER - SIMPLE SLIDER
	/***************************************************************************/
	$('.slider.slider-simple').slick({
		prevArrow: $('.slider-nav-simple-slider .slider-prev'),
		nextArrow: $('.slider-nav-simple-slider .slider-next'),
		adaptiveHeight: true,
		fade: true
	});

	/***************************************************************************/
	//SLICK SLIDER - FEATURED PROPERTIES
	/***************************************************************************/
	$('.slider.slider-featured').slick({
		prevArrow: $('.slider-nav-properties-featured .slider-prev'),
		nextArrow: $('.slider-nav-properties-featured .slider-next'),
		slidesToShow: 4,
		slidesToScroll: 1,
		responsive: [
			{
			  breakpoint: 990,
			  settings: {
				slidesToShow: 3,
				slidesToScroll: 1
			  }
			},
			{
			  breakpoint: 767,
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			  }
			},
			{
			  breakpoint: 589,
			  settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			  }
			}
		]
	});

	/***************************************************************************/
	//SLICK SLIDER - TESTIMONIALS 
	/***************************************************************************/
	$('.slider.slider-testimonials').slick({
		prevArrow: $('.slider-nav-testimonials .slider-prev'),
		nextArrow: $('.slider-nav-testimonials .slider-next'),
		adaptiveHeight: true
	});

	/***************************************************************************/
	//SLICK SLIDER - PROPERTY GALLERY 
	/***************************************************************************/
	$('.slider.slider-property-gallery').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		adaptiveHeight: true,
		arrows: false,
		fade: true,
		infinite:false,
		asNavFor: '.property-gallery-pager'
	});

	$('.property-gallery-pager').on('init', function(event, slick){
		$('.slide-counter').text('1 / ' + slick.slideCount);
	});

	$('.property-gallery-pager').slick({
		prevArrow: $('.slider-nav-property-gallery .slider-prev'),
		nextArrow: $('.slider-nav-property-gallery .slider-next'),
		slidesToShow: 5,
		slidesToScroll: 1,
		asNavFor: '.slider.slider-property-gallery',
		dots: false,
		focusOnSelect: true,
		infinite:false
	});

	$('.property-gallery-pager').on('afterChange', function(event, slick, currentSlide, nextSlide){
		currentSlide = currentSlide + 1;
		var counter = currentSlide + ' / ' + slick.slideCount;
		$('.slide-counter').text(counter);
	});

	//INITIATE SLIDES
	$('.slide').addClass('initialized');

	/***************************************************************************/
	//FIXED HEADER
	/***************************************************************************/
	if ($(window).scrollTop() > 140) { 
		$('.header-default .navbar-toggle').addClass('fixed'); 
		$('.header-default .main-menu-wrap').addClass('fixed');
	}


	$(window).bind('scroll', function () {
		if ($(window).scrollTop() > 140) {
		    $('.header-default .navbar-toggle').addClass('fixed');
		    $('.header-default .main-menu-wrap').addClass('fixed');
		} else {
		    $('.header-default .navbar-toggle').removeClass('fixed');
		    $('.header-default .main-menu-wrap').removeClass('fixed');
		}
	});

	
	/***************************************************************************/
	//INITIALIZE BLOG CREATIVE
	/***************************************************************************/
	$('.grid-blog').isotope({
	  itemSelector: '.col-lg-4'
	});
	
	/***************************************************************************/
	//INITIALIZE PRICE RANGE SLIDER
	/***************************************************************************/
	var sliders = document.getElementsByClassName('price-slider');
	var count = 0;

	for ( var i = 0; i < sliders.length; i++ ) {

		noUiSlider.create(sliders[i], {
			connect: true,
			start: [ 150000, 600000 ],
			step: 1000,
			margin:1000,
			range: {
				'min': [  2000 ],
				'max': [ 1000000 ]
			},
			tooltips: true,
			format: wNumb({
				decimals: 0,
				thousand: ',',
				prefix: '$',
			})
		});

		count = count + 1;
	}

	/***************************************************************************/
	//FILTER TOGGLE (ON GOOGLE MAPS)
	/***************************************************************************/
	$('.filter-toggle').on('click', function() {
		$(this).parent().find('form').stop(true, true).slideToggle();
	});

	/***************************************************************************/
	//MULTIPAGE FORM
	/***************************************************************************/
	$('.multi-page-form .form-next').on('click', function() {

		//validate required fields
		var errors = [];
		$('.multi-page-form').find('.error').remove();
		$( ".multi-page-form .multi-page-form-content.active input.required" ).each(function( index ) {
			if(!$(this).val()) {
				$(this).parent().find('label').append('<span class="error"> This field is required</span>');
				errors.push(index);
			}
		});

		//if no errors
		if (errors.length === 0) {

			var active = $(this).parent().parent().find('.multi-page-form-content.active');

			$(this).parent().parent().find('.form-nav .form-nav-item.completed').next().addClass('completed');
			$(this).parent().parent().find('.form-nav .form-nav-item.completed span').html('<i class="fa fa-check"></i>');

			if(active.next('.multi-page-form-content').next('.multi-page-form-content').length > 0) {
			    active.removeClass('active');
				active.next().addClass('active');
			}
			else {
				active.removeClass('active');
				active.next().addClass('active');
			}
		}
	});

	$('.multi-page-form .form-prev').on('click', function() {
		var active = $(this).parent().parent().find('.multi-page-form-content.active');

		var lastCompleted = $(this).parent().parent().find('.form-nav .form-nav-item.completed').last();
		lastCompleted.removeClass('completed');
		lastCompleted.find('span').html(lastCompleted.index() + 1);

		if(active.prev('.multi-page-form-content').prev('.multi-page-form-content').length > 0) {
		    active.removeClass('active');
			active.prev().addClass('active');
		}
		else {
			active.removeClass('active');
			active.prev().addClass('active');
		 	$(this).addClass('show-none');
		 	$(this).parent().find('.disabled').show();
		}
	});

	/******************************************************************************/
	/** SUBMIT PROPERTY - ADDITIONAL IMAGES  **/
	/******************************************************************************/
	var files_count = $('.additional-img-container .additional-image').length + 1;
    $('.add-additional-img').on('click', function() {
        files_count++;
        $('.additional-img-container').append('<table><tr><td><div class="media-uploader-additional-img"><input type="file" class="additional_img" name="additional_img'+ files_count +'" value="" /><span class="delete-additional-img appended right"><i class="fa fa-trash"></i> Delete</span></div></td></tr></table>');
    });

    $('.additional-img-container').on("click", ".delete-additional-img", function() {
        $(this).parent().parent().parent().parent().parent().remove();
    });

    /******************************************************************************/
	/** SUBMIT PROPERTY - OWNER INFO **/
	/******************************************************************************/
	$('#owner-info input[type="radio"]').on('click', function() {
		var input = $(this).val();
		$('#owner-info .form-block-agent-options').hide();
		if(input === 'agent') {
			$('#owner-info .form-block-select-agent').slideDown('fast');
		}
		if(input === 'custom') {
			$('#owner-info .form-block-custom-agent').slideDown('fast');
		}
	});
	
	/***************************************************************************/
	//AJAX CONTACT FORM
	/***************************************************************************/
	<!--//--><![CDATA[//><!--
    $(document).on('submit', 'form#contact-us', function() {
            $('form#contact-us .error').remove();
            var hasError = false;
            $('.requiredField').each(function() {
                if($.trim($(this).val()) === '') {
                    $(this).parent().find('label').append('<span class="error">This field is required!</span>');
                    $(this).addClass('inputError');
                    hasError = true;
                } else if($(this).hasClass('email')) {
                    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                    if(!emailReg.test($.trim($(this).val()))) {
                        $(this).parent().find('label').append('<span class="error">Sorry! You\'ve entered an invalid email.</span>');
                        $(this).addClass('inputError');
                        hasError = true;
                    }
                }
            });
            if(!hasError) {
                var formInput = $(this).serialize();
                $.post($(this).attr('action'),formInput, function(data){
                    $('form#contact-us').slideUp("fast", function() {                  
                        $(this).before('<p class="alert-box success"><i class="fa fa-check icon"></i><strong>Thanks!</strong> Your email has been delivered!</p>');
                    });
                });
            }
            
            return false;   
    });
    //-->!]]>

});
