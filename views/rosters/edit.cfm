<cfparam name="roster">

<cfoutput>

	<h2>Roster Details Page</h2>

	<table cellspacing="5" cellpadding="2"  summary="Roster Details">
		<tr>
			<th>Roster Name:</th>
			<td>#roster.name#</td>
		</tr>
		<tr>
			<th>Community:</th>
			<td>#roster.community#</td>
		</tr>
		<tr>
			<th>Uploaded:</th>
			<td>#DateFormat(roster.createdAt,"Short")# #TimeFormat(roster.createdAt,"Short")#</td>
		</tr>
		<tr>
			<th>Members:</th>
			<td>#roster.membercount#</td>
		</tr>
		<tr>
			<th>Head of Household Count:</th>
			<td>#roster.hohcount#</td>
		</tr>
		<tr>
			<th>Adult Count:</th>
			<td>#roster.adultcount#</td>
		</tr>
		<tr>
			<th>Youth Count:</th>
			<td>#roster.youthcount#</td>
		</tr>
		<tr>
			<th>Jr Youth Count:</th>
			<td>#roster.jryouthcount#</td>
		</tr>
		<tr>
			<th>Child Count:</th>
			<td>#roster.childcount#</td>
		</tr>
		<tr>
			<th>Sector Count:</th>
			<td>#roster.sectorcount#</td>
		</tr>
		<tr>
			<th>Roster</th>
			<td>
				<cfif roster.id GT 245>
						#linkTo(text="Full Roster", 	action="pdf", key="#roster.ID#")#
				<cfelse>
						Unable to generate roster files for older formats.
				</cfif>
				<!--- |
				#linkTo(text="Map", 	action="map", key="#roster.ID#")# |
				#linkTo(text="Adults", 			action="adultPdf", key="#roster.ID#")# |
				#linkTo(text="Youth", 			action="youthPdf", key="#roster.ID#")# |
				#linkTo(text="Jr. Youth", 		action="jrYouthPdf", key="#roster.ID#")# |
 				#linkTo(text="Children", 		action="ChildrenPdf", key="#roster.ID#")#--->
			</td>
		</tr>
		<cfif roster.sectorcount neq 0>
			<tr>
				<th>Sectors</th>
				<td>
					#linkTo(text="Roster by Sector", 	action="sectorPdf", key="#roster.ID#")#
					| #linkTo(text="Sector Stats", 	action="sectorstats", key="#roster.ID#")#
				</td> sectorstats
			</tr>
		</cfif>
		<tr>
			<th>Letters</th>
			<td>#linkTo(text="Generate Verification Letter", action="verification", key="#roster.ID#")#</td>
		</tr>
	</table>
</cfoutput>
