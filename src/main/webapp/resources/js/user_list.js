jQuery(document).ready(function() {

	    function preventFormSubmit(event) {
	        if (event.keyCode === 13) {
	            event.preventDefault();
	            return false;
	        }
	    }
	
        $('#searchForm').on('keypress', function (event) {
            preventFormSubmit(event);
        });

        let ascending = true;

        $('th').click(function () {
            const index = $(this).index();
            sortTable(index);
        });

        function sortTable(columnIndex) {
            const $table = $('#sortTable');
            const $tbody = $table.find('tbody');
            const $rows = $tbody.find('tr').toArray();

            $rows.sort(function (a, b) {
                const keyA = parseInt($(a).find('td').eq(columnIndex).text());
                const keyB = parseInt($(b).find('td').eq(columnIndex).text());

                if (ascending) {
                    return keyA - keyB;
                } else {
                    return keyB - keyA;
                }
            });

            $tbody.empty().append($rows);

            $('th i').removeClass('fa-caret-up fa-caret-down');
            if (ascending) {
                $('th').eq(columnIndex).find('i').addClass('fa-caret-up');
            } else {
                $('th').eq(columnIndex).find('i').addClass('fa-caret-down');
            }

            ascending = !ascending;
        }
    
});