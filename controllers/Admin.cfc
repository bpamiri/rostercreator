<cfcomponent extends="controller">
	
	<cffunction name="init"> 
		<cfset filters(through="isLoggedIn,isAdmin")>
	</cffunction>	
	
	<cffunction name="users">
	
		<cfset users = model("user").findAll(include="rosters",returnAs="objects")>
	
	</cffunction>
	
	<cffunction name="loginAs">
	
		<cfset session.user.id = params.id>
		<cfset session.user.email = params.email>
		<cfset redirectTo(controller="Rosters")>		
		
	</cffunction>

</cfcomponent>