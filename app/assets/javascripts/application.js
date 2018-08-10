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



document.addEventListener("DOMContentLoaded", function(event){

	$('#check_name').on('keypress', function(e){
		 $.ajax({
		     url: 'search',
		     method: 'POST',
		     data: 	{search: (e.target.value + e.key)},
		     dataType: 'json',
		     success: function(data){
				console.log(data)
		     	// console.log('pass')
		       let names = document.getElementById("name");
		       // console.log()
		       names.innerHTML=''

		       data.forEach(function(therapist){
		         const option = document.createElement("option");   
		         option.value = therapist.name;
		         names.append(option);
		       })
		     }
   		})	  
	 });
});
