<!---
	If you leave these settings commented out, Wheels will set the data source name to the same name as the folder the application resides in.
--->
<cfset set(dataSourceName="Roster")>

<!---
	If you leave this setting commented out, Wheels will try to determine the URL rewrite capabilities automatically.
	The URLRewriting setting can bet set to "On", "Partial" or "Off".
	To run with "Partial" rewriting, the "PATH_INFO" variable needs to be supported by the web server.
	To run with rewriting "On", you need to apply the necessary rewrite rules on the web server first.
	<cfset set(URLRewriting="Partial")>
--->

<cfset set(reloadPassword="ItsGerr8!")>
<cfset set(URLRewriting="On")>
<cfset set(obfuscateURLs=true)>

<!--- Form Helpers --->
<cfset set(functionName="textField",labelPlacement="before")>
<cfset set(functionName="passwordField",labelPlacement="before")>
<cfset set(functionName="fileField",labelPlacement="before")>


