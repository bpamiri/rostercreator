function showDivLoader(id,text,opacity){
	wdt = $('#' + id).width();
	hgt = $('#' + id).height();
	$("#div_loader div").css( { 'padding': '8px 0 0 30px', 'margin': '0px' } ).html(text);
	$("#div_loader").prependTo('#' + id).css( { 'padding': "0px", 'margin': '0px', 'width': wdt + 'px', "height":hgt + "px" } ).fadeTo(0, opacity/100).show();
}
function hideDivLoader(){
	$("#div_loader").hide();
}
function setSections(){
	$("#tag_sections_div :last-child").html('');
	showDivLoader('tag_sections_div', 'Loading...',100);
	$.getJSON('/ajax/get-tag-sections/' + $('#tagPubs').val(),
		function(json){
			if (json.length > 0) {
				var checks = '';
				for (var i = 0; i < json.length; i++) {
					checks += '<label for"tagSections-' + json[i].id + '"><input type="checkbox" name="tagSections" id="tagSections-' + json[i].id + '" value="' + json[i].id + '"> ' + json[i].val + '</label>';
				}
				$("#tag_sections_div :last-child").html(checks);
			}else{
				alert('Site currently does not have any sections');
			}
			hideDivLoader();
		}
	)
}