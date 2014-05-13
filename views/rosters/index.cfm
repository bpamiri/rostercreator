<cfparam name="rosters">

<h2>Rosters on File</h2>

<cfoutput>

	<cfif len(flash("success"))>
		<p class="success-messages">#flash("success")#</p>
	</cfif>
	<cfif len(flash("error"))>
		<p class="error-messages">#flash("error")#</p>
	</cfif>

	<table cellspacing="5" cellpadding="2" width="100%" id="hor-minimalist-b" summary="List of Rosters">
		<thead>
			<tr>
				<th>Name</th>
				<th>Uploaded</th>
				<th>Members</th>
				<th>HoH</th>
				<th>Adults</th>
				<th>Youth</th>
				<th>Jr. Youth</th>
				<th>Children</th>
				<th>Sectors</th>
				<th align="right">#linkTo(text="ADD", action="add")#</th>
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
			<cfloop query="rosters">
				<tr>
					<td>#rosters.name#</td>
					<td>#DateFormat(rosters.createdAt,"Short")# #TimeFormat(rosters.createdAt,"Short")#</td>
					<td>#rosters.membercount#</td>
					<td>#rosters.hohcount#</td>
					<td>#rosters.adultcount#</td>
					<td>#rosters.youthcount#</td>
					<td>#rosters.jryouthcount#</td>
					<td>#rosters.childcount#</td>
					<td>#rosters.sectorcount#</td>
					<td align="right">
						#linkTo(text="EDIT", action="edit", key="#rosters.ID#")# | 
						#linkTo(text="DELETE", action="delete", key="#rosters.ID#", confirm="Are you sure you wish to delete this roster?")#
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	
</cfoutput>