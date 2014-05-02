<cfparam name="user">

<cfoutput>

	<h2>Login</h2>
	
	<cfif len(flash("success"))>
		<p class="success-messages">#flash("success")#</p>
	</cfif>
	<cfif len(flash("error"))>
		<p class="error-messages">#flash("error")#</p>
	</cfif>
	
	#startFormTag(route="signin")#
				
		#textField(label="Email", objectName="user", property="email", size=40)#
		#passwordField(label="Password", objectName="user", property="password", size=40)#
		
		<div>
			#submitTag(value="Sign In")#
		</div>
		
	#endFormTag()#
</cfoutput>

<script type="text/javascript">
  var focusHere = document.getElementById("user-email");
  focusHere = focusHere.focus();
</script>

