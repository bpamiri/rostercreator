<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfset addRoute(name="home", pattern="", controller="publicPages", action="aboutus")>

<cfset addRoute(name="login",  pattern="login",  controller="userManager", action="login")>
<cfset addRoute(name="logout", pattern="logout", controller="userManager", action="logout")>
<cfset addRoute(name="register", pattern="register", controller="userManager", action="register")>
<cfset addRoute(name="signin",  pattern="signin",  controller="userManager", action="signin")>
<cfset addRoute(name="activate",  pattern="activate/[uuid]",  controller="userManager", action="activate")>
<cfset addRoute(name="reset",  pattern="reset",  controller="userManager", action="reset")>
<cfset addRoute(name="processreset",  pattern="processreset",  controller="userManager", action="processreset")>
<cfset addRoute(name="myaccount",  pattern="myaccount",  controller="userManager", action="myaccount")>

<cfset addRoute(name="loginAs",  pattern="loginAs/[id]/[email]",  controller="admin", action="loginAs")>

