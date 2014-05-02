<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">

	<cffunction name="isLoggedIn">
		<cfif NOT StructKeyExists(session,"user")>
			<cfset flashInsert(error="You are not currently logged in. Please log in and try again.")>
			<cfset redirectTo(route="login")>
		</cfif>
	</cffunction>
	
	<cffunction name="isAdmin">
		<cfif NOT session.user.admin>
			<cfset flashInsert(error="You do not have priviliges to perfrom that action.")>
			<cfset redirectTo(route="home")>
		</cfif>
	</cffunction>

</cfcomponent>