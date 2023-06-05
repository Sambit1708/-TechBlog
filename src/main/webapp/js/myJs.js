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
			processData: false,
			currentType: false
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
	
})

