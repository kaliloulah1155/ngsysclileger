/** 
 *------------------------------------------------------------------------------
 * @package       T3 Framework for Joomla!
 *------------------------------------------------------------------------------
 * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.
 * @license       GNU General Public License version 2 or later; see LICENSE.txt
 * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github 
 *                & Google group to become co-author)
 * @Google group: https://groups.google.com/forum/#!forum/t3fw
 * @Link:         http://t3-framework.org 
 *------------------------------------------------------------------------------
 */


 jQuery(function($) {
	"use strict";

	/* ----------------------------------------------------------- */
	 /*  Fixed header
	 /* ----------------------------------------------------------- */

	$(window).on('scroll', function(){
		if ( $(window).scrollTop() > 100 ) {
			$('#t3-mainnav').addClass('navbar-fixed');
		} else {
			$('#t3-mainnav').removeClass('navbar-fixed');
		}
	});


	/* ----------------------------------------------------------- */
	/*  Counter
	/* ----------------------------------------------------------- */

		$('.counterUp').counterUp({
		 delay: 10,
		 time: 1000
		});


     /* ----------------------------------------------------------- */
	/*  Team
	/* ----------------------------------------------------------- */
      $("#team-carousel").owlCarousel({

	      loop:false,
	      nav:true,
	      dots:false,
	      navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
	      responsive:{
	           0:{
	               items:1
	           },
	           600:{
	               items:3
	           },
	           1000:{
	               items:4
	               }
	      }

	   });

  });



