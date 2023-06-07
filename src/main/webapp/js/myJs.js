function loadPosts(catId, temp) {
	
	$('.c-link').removeClass('active')
	
	$.ajax({
		url: 'load_post.jsp',
		data: {cid: catId},
		success: function(data, textStatus, jqXHR) {
			$('#loader').hide();
			$('#post-container').html(data)
			$(temp).addClass('active')
		}
	})
}

$(document).ready(function() {
		
	$(".lognav").click(function() {
		window.location.href = 'login.jsp';
		return false;
	})

	$(".regisnav").click(function() {
		window.location.href = 'registration.jsp';
		return false;
	})

	// Submit Registration Form
	
	$("#regisForm").on('submit', function(event) {
		event.preventDefault();
		
		var formData = $(this).serialize();
		$('#submit-btn').hide();
		$('#reset-btn').hide();
		$('#loader').show()
	console.log(formData)
		$.ajax({
			url: "RegisterServlet",
			type: "POST",
			data: formData,
			success: function(data, textStatus, jqXHR) {
				$('#submit-btn').show();
				$('#reset-btn').show();
				$('#loader').hide()
				if (data.trim().indexOf('done') != -1) {
					Swal.fire({
						title: 'Are you sure?',
						text: "Do you want to save the details!",
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'Yes, Save'
					}).then((result) => {
						if (result.isConfirmed) {
							Swal.fire({
								icon: 'success',
								title: 'Done...',
								text: 'Registration Successful!',
								showConfirmButton: false,
							})
							window.location='login.jsp'
						}
					})
				} else {
					Swal.fire(
						'Oops!',
						data.trim(),
						'error'
					)
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				$('#submit-btn').hide();
				$('#reset-btn').hide();
				$('#loader').show()
			},
			processData: false
		})
	})
	
	// Edit Form
	var editStatus= false
	$('#profile-edit-btn').click(function(){
		
		if(editStatus == false) {
			$('#profile-details').hide()
			$('#profile-edit').show()
			editStatus=true
			$(this).text("Back")
		}
		else {
			$('#profile-details').show()
			$('#profile-edit').hide()
			editStatus=false
			$(this).text("Edit")
		}
	})
	
	// Add Post Form
	$('#add-post-form').on("submit",function(event){
		// this code gets called when form is submitted
		event.preventDefault();
		let formData = new FormData(this)
		$.ajax({
			url: 'AddPostServlet',
			type: 'POST',
			data: formData,
			success: function(data, textStatus, jqXHR){
				if(data.trim().indexOf('done') != -1) {
					Swal.fire("Done","Saved Post","success")
				}
				else{
					Swal.fire("Error","Could not save the post","error")
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				
			},
			processData: false,
			contentType: false
		})
		
	})
	let allPostref = $('.c-link')[0]
	loadPosts(0, allPostref)

})

