<cfparam name="user">

<cfoutput>

	<h2>Password Reset</h2>
	
	<cfif len(flash("error"))>
		<p class="error-messages">#flash("error")#</p>
	</cfif>

	<p>Use this form to request a password reset.
	Enter your email address that you use to log into your account with. 
	Your password will be reset and the new password will be sent to you 
	via email. If you no longer have access to the email account you used 
	when you signed up for your account you will have to contact our support 
	team by sending a message to roster@1844.net.</p>

	#startFormTag(action="processreset")#
				
		#textField(label="Email", objectName="user", property="email", size=50)#
		
		<div>
			#submitTag(value="Process Reset")#
		</div>
		
	#endFormTag()#


</cfoutput>