<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<title>eMembership Roster Creator</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<cfoutput>#styleSheetLinkTag("appstyle,tablestyle,main")#</cfoutput>
		<cfoutput>#javaScriptIncludeTag("jquery,main")#</cfoutput>
	</head>
	<body>

		<!--- Google Analytics Code --->
		<script type="text/javascript">
		
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-484502-9']);
		  _gaq.push(['_trackPageview']);
		
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		
		</script>

		<div id="wrapper">
			<div id="topnav">
				<cfoutput>
					<cfif StructKeyExists(session, "user")>
						<strong>#session.user.email#</strong> |
						#linkTo(text="My Account", controller="userManager", action="myaccount")# |
						#linkTo(text="Logout", route="logout")#
						<br/>
						<a href="http://gravatar.com" target="_blank">#gravatarTag(email=session.user.email,style="border: 1px solid black;")#</a>
					<cfelse>
						#linkTo(text="Login", route="login")#
						| #linkTo(text="Password Reset", route="reset")#
						| #linkTo(text="Register", route="register")#
					</cfif>
				</cfoutput>
			</div>
			<div id="masthead">
				<h1>eMembership Roster Creator</h1>
				<!---<p>from csv export to pdf roster...</p>--->
			</div>
			<div id="mainnav">
				<cfoutput>
					<strong>
					<cfif StructKeyExists(session, "user")>
							#linkTo(text="Rosters", controller="rosters")# 
							| #linkTo(text="Add New Roster", controller="rosters", action="add")# 
							| 
					</cfif>
					
					#linkTo(text="About Us",    route="home")#
					<!---| <a href="http://blog.amiri.net/category/roster-creator/" target="_blank">Blog</a>--->
					
					<cfif StructKeyExists(session, "user") and session.user.admin> 
						| #linkTo(text="Users", controller="admin", action="users")# <!---
						| #linkTo(text="admin2", controller="adminPages", action="admin2")#
						| #linkTo(text="admin3", controller="adminPages", action="admin3")#
						| #linkTo(text="admin4", controller="adminPages", action="admin4")#
						| #linkTo(text="admin5", controller="adminPages", action="admin5")# --->
					</cfif>
					</strong>
				</cfoutput>
				<br/><br/>
			</div>
			<div id="content">
				<div id="div_loader"><div></div></div>
				<cfoutput>
					#contentForLayout()#
				</cfoutput>
			</div>
		</div>
		<div id="footer">
			Copyright &copy; 2010 Peter Amiri, All Rights Reseved.
		</div>
		<script type="text/javascript">
			var _urq = _urq || [];
			_urq.push(['initSite', 'e2d930b5-75cd-45cf-8dfc-00908ddc2c18']);
			(function() {
			var ur = document.createElement('script'); ur.type = 'text/javascript'; ur.async = true;
			ur.src = ('https:' == document.location.protocol ? 'https://cdn.userreport.com/userreport.js' : 'http://cdn.userreport.com/userreport.js');
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ur, s);
			})();
		</script>
	</body>
</html>