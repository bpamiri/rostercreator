<cfcomponent extends="Model" output="false">

	<cffunction name="init">
	
		<cfset validatesPresenceOf("firstName,lastName,email,password")>
		<cfset validatesFormatOf(property="email",type="email")>
		<cfset validatesLengthOf(property="firstName", maximum="50")>
		<cfset validatesLengthOf(property="lastName", maximum="50")>
		<cfset validatesLengthOf(property="email", maximum="100")>
		<cfset validatesLengthOf(property="password", maximum="100")>
		<cfset validatesUniquenessOf("email")>
		<cfset validatesConfirmationOf("password")>
		
		<cfset hasMany("rosters")>
	
	</cffunction>
	
</cfcomponent>