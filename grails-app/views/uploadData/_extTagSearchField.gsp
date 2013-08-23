<g:javascript>

jQuery(document).ready(function() {	
	
	var escapedFieldName = '${fieldName}'.replace(".", "\\.");
	jQuery("#" + escapedFieldName + "-input").autocomplete({
		source: function( request, response ) {
			jQuery.ajax({
				url: '${createLink([action:searchAction,controller:searchController])}',
				data: {
					type: ANALYSIS_TYPE,
					term: request.term
				},
				success: function( data ) {
					response( jQuery.map( data, function(item) {
						return {
							category: item.category,
							keyword: item.keyword,
							sourceAndCode: item.sourceAndCode,
							id: item.id,
							display: item.display
						}
					}));
				}
			});
		},
			
		minLength:0,
		
		select: function(event, ui) {
			var sourceAndCode = ui.item.sourceAndCode;
			var diseaseName = ui.item.keyword;
			jQuery("#" + escapedFieldName + "-input").val('').focus();
			$j('#' + escapedFieldName).append($j('<option></option>').val(sourceAndCode).text(diseaseName).attr('selected', 'selected'));
			var newTag = $j('<span/>', {
				id: '${fieldName}-tag-' + sourceAndCode,
				'class': 'tag',
				name: sourceAndCode
			}).text(diseaseName);
			$j('#' + escapedFieldName + '-tags').append(newTag);
			newTag.hide().fadeIn('slow');
			
			return false;
		}
	}).data("autocomplete")._renderItem = function( ul, item ) {
		return jQuery('<li></li>')		
		  .data("item.autocomplete", item )
		  .append('<a><span class="category-' + item.category.toLowerCase() + '">' + item.category + '&gt;</span>&nbsp;<b>' + item.keyword + '</b></a>')
		  .appendTo(ul);
	};
});
</g:javascript>
<%-- Tag box (visual display of tags) --%>
<div id="${fieldName}-tags" class="tagBox" name="${fieldName}">
	<g:each in="${values}" var="value">
		<span class="tag" id="${fieldName}-tag-${value.key}" name="${value.key}">${value.value}</span>
	</g:each>
</div>

<%-- Hidden select field, keeps actual selected values --%>
<select id="${fieldName}" name="${fieldName}" multiple="multiple" style="display: none;">
	<g:each in="${values}" var="value">
		<option selected="selected" value="${value.key}">${value.value}</option>
	</g:each>
</select>

<%-- Visible input --%>
<div style="background-color: #E4E4E4; float:left; padding: 8px; border-radius: 8px;">
	<div style="float: left; line-height: 24px; font-style: italic; margin-right: 8px;">Add new: </div>
	<input id="${fieldName}-input" style="float: left; width: 600px;"/>
</div>