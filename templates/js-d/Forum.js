function tintuc(){
	var url="http://forum.mudailong.com/showthread.php?t=";
	var date = new Date();
	var month = date.getMonth()+1;
	var today = date.getDate() + '.'+ month;
	if(!threads.length == 0){
		var max = 7;
		if(threads.length < max) max = threads.length;
		for (i = 0; i < max; i++){
			if (threads[i].title.length > 60){ 
				threads[i].title = threads[i].title.substring(0, 60) + '...'; threads[i].alt = threads[i].title; }
				document.write('<tr>');
				document.write('	<td><span class="ticket open">'+ threads[i]['threaddate'].replace("-2012", "") + '</span></td>');
				document.write('	<td class="full"><a target="_blank" href="'+ url + threads[i]['threadid'] + '">' + threads[i]['title'] + '</a></td>');
				document.write('<td class="who">	</td>')
				document.write('</tr>');
		}
	}
}