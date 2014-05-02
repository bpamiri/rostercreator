<cfparam name="users">

<h2>Registered Users</h2>

<cfoutput>

	<cfif len(flash("success"))>
		<p class="success-messages">#flash("success")#</p>
	</cfif>
	<cfif len(flash("error"))>
		<p class="error-messages">#flash("error")#</p>
	</cfif>

	<table cellspacing="5" cellpadding="2" width="100%" id="hor-minimalist-b" summary="List of Users">
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Admin</th>
				<th>Active</th>
				<th>Created</th>
				<th>Updated</th>
				<th>Rosters</th>
			</tr>
		</thead>
		<!---
		<tfoot>
			<tr>
				<td colspan="5" align="left">
				</td>
				<td align="right">Page: 
					<cfif paginationLinks(route="publishers_page") eq "">
						1
					<cfelse>
						#paginationLinks(route="publishers_page")#
					</cfif>
				</td>
			</tr>
		</tfoot>
		--->
		<tbody>
			<cfloop array=#users# index="user">
				<tr>
					<td>#linkTo(text="#user.firstname# #user.lastname#", route="loginAs", id=user.ID, email=user.email)#</td>
					<td>#user.email#</td>
					<td>#user.admin#</td>
					<td>#user.activated#</td>
					<td>#DateFormat(user.createdAt,"Short")# #TimeFormat(user.createdAt,"Short")#</td>
					<td>#DateFormat(user.updatedAt,"Short")# #TimeFormat(user.updatedAt,"Short")#</td>
					<td>#user.rosterCount()#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	
</cfoutput>