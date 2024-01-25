document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.get-api').forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            $.ajax({
		        url: '/FM/fstv/fstv_insert',
		        type: 'POST',
		        success: function (response) {
		            alert(response);
		        }
		    });
        });
    });
});
