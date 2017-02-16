<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset='utf-8' />
<link href='/resources/fullcalendar-3.1.0/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/fullcalendar-3.1.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/resources/fullcalendar-3.1.0/lib/moment.min.js'></script>
<script src='/resources/fullcalendar-3.1.0/lib/jquery.min.js'></script>
<script src='/resources/fullcalendar-3.1.0/lib/jquery-ui.min.js'></script>
<script src='/resources/fullcalendar-3.1.0/fullcalendar.min.js'></script>
<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate: '2016-12-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2016-12-01'
				},
				{
					title: 'Long Event',
					start: '2016-12-07',
					end: '2016-12-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-12-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-12-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2016-12-11',
					end: '2016-12-13'
				},
				{
					title: 'Meeting',
					start: '2016-12-12T10:30:00',
					end: '2016-12-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2016-12-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2016-12-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2016-12-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2016-12-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2016-12-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2016-12-28'
				}
			], 
			eventRender: function (event, element) {
		        element.attr('href', 'javascript:void(0);');
		        element.click(function() {
		            $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
		            $("#endTime").html(moment(event.end).format('MMM Do h:mm A'));
		            $("#eventInfo").html(event.description);
		            $("#eventLink").attr('href', event.url);
		            $("#eventContent").dialog({ dialogClass: "no-close",
		            							modal: false,
		            							position: { my: "left top", at: "left bottom", of: element },
		            							open: function(event, ui) {
		            								$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
		            							}
		            						});
		        });
		    }
			
		});
	});
	
</script>
<style>
.ui-dialog {
	z-index: 9999999 !important;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #dcdbd5;
	width: 220px;
}

.no-close .ui-dialog-titlebar-close {
	display: none;
}

body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.layerPopup_rapper_s_con {
	font-size: 12px;
	border-bottom: 1px solid #dcdbd5;
	padding-bottom: 5px;
}

.layerPopup_rapper_s>.ui_btn_rapper {
	width: 100%;
	text-align: right;
	border-bottom: 0px solid #dcdbd5;
	padding: 10px 0 0 0;
}
</style>
</head>
<body>
	<div id="eventContent" style="display:none;">
		<div class="layerPopup_rapper_s_con">
			Start: <span id="startTime"></span><br>
	    	End: <span id="endTime"></span><br><br>
		</div>

		<div class="ui_btn_rapper">
			<table>
				<tr>
					<td style="text-align: left; padding-left: 10px;"><a
						href="javascript:profileClose()" class="btn_color2 profileClose"
						id="button_close">Delete</a></td>
					<td style="text-align: right; padding-right: 10px;"><a
						href="javascript:profileLogout()" class="btn_color3"
						id="button_logout">Modify</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	<div id='calendar'></div>

</body>
</html>