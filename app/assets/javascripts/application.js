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
//= require jquery
//= require activestorage
//= require turbolinks
//= require_tree .
$(function() {
	$(document).on("ajax:success", ".follow", function(e) {
		var id = e.target.attributes[1].value;
		$('.'+id).html(e.detail[2]["response"]);
		// マイページの表示変更
		$.ajax({
			url: '/count',
			type: 'get',
			async: true,
			beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
		})
		.done(function(f) {
			$('.my_follow').text(f);
		})
		.fail(function() {
		})
	})

	// $('.this_follow, .this_follower').one('click', function() {
	// $(document).on('click', '.this_follow, .this_follower', function(e) {
	// 	$('.table_right').addClass('active');
	// 	$('.table_right').text('');
	// 	if ($(this).hasClass('my_follow')) {
	// 		$('.table_right').append('私のフォロー一覧')
	// 	} else if ($(this).hasClass('my_follower')) {
	// 		$('.table_right').append('私のフォロワー一覧')
	// 	}
	// })

	$('html').click(function(e) {
		if (!$(e.target).closest('.table_right, .this_follow, .this_follower').length) {
			$('.table_right').removeClass('active');
			$('.table_right').html('');
		}
	})

	$(document).on("ajax:success", ".forf", function(e) {
		$('.table_right').html(e.detail[2]["response"]);
		if ($('.table_right').html() != '') {
			$('.table_right').addClass('active');
		}
	})











})