<cfparam name="roster">

<cfoutput>

	<h2>Upload a New Roster File</h2>
	
	#errorMessagesFor("roster")#
	
	<p>Use this form to upload a new roster file. You can keep multiple files online, 
	this is helpful when creating your annual report and you need to know the state of
	your roster at some point in the past.</p>
	
	#startFormTag(action="process", multipart="true")#

	#textField(label="Roster Name",objectName="roster", property="name", size="40")#
	#textField(label="Community Name", objectName="roster", property="community", size="40")#
	#textField(label="Community Phone", objectName="roster", property="phone", size="40")#
	#textField(label="Address Line 1", objectName="roster", property="address1", size="40")#
	#textField(label="Address Line 2", objectName="roster", property="address2", size="40")#
	#textField(label="Address Line 3", objectName="roster", property="address3", size="40")#
	#textField(label="Email 1", objectName="roster", property="email1", size="40")#
	#textField(label="Email 2", objectName="roster", property="email2", size="40")#
	#textField(label="Email 3", objectName="roster", property="email3", size="40")#
	#fileField(label="Roster File", objectName="roster", property="rosterFile", size="80")#
	
	<div>
		#submitTag(value="Upload Now")#
	</div>
	
	#endFormTag()#

</cfoutput>

<script type="text/javascript">
  var focusHere = document.getElementById("roster-name");
  focusHere = focusHere.focus();
</script>
