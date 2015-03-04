
(function($) {
	$.fn.vTable = function(data, title) {
		var html = "<table class='table table-condensed table-bordered table-hover'>";
		html += "<thead><tr class='success'>"
		for ( var param in title) {
			html += "<th>" + title[param] + "</th>";
		}
		html += "</tr></thead><tbody>";
		for (i = 0; i < data.length; i++) {
			html += "<tr>";
			for ( var param in title) {
				var node = data[i][param];
				// 替换可能的undifined
				if (!node) {
					node = "";
				}
				html += "<td>" + node + "</td>";
			}
			html += "</tr>";
		}
		html += "</tbody></table>";
		$(this).html(html);
	};
})(jQuery);