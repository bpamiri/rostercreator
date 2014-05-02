<html>
<head>
  <style>
	body
	{
		line-height: 1.6em;
	}
	
	#hor-minimalist-a
	{
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
		border-collapse: collapse;
		text-align: left;
	}
	#hor-minimalist-a th
	{
		padding-top: 15px;
		font-size: 14px;
		font-weight: normal;
		color: #039;
		border-bottom: 2px solid #6678b1;
	}
	#hor-minimalist-a td
	{
		color: #669;
		padding: 9px 8px 0px 8px;
	}
	#hor-minimalist-a tbody tr:hover td
	{
		color: #009;
	}
	.header
	{
		font-family:  Sans-Serif;
		font-size: 16px;
		background: #fff;
		color: #039;
	    text-align: center;
	    font-weight: bold;
	}

  
  </style>
</head>
<body>

<cfcontent type="application/pdf"><cfheader name="Content-Disposition" value="inline; filename=letter.pdf"><cfdocument format="pdf" bookmark="true" htmlbookmark="true">
<cfdocumentitem type = "header">
	<p class="header" style='
		padding-bottom: 10px;
		font-family:  Sans-Serif;
		font-size: 16px;
		background: #fff;
	    text-align: center;
	    font-weight: bold;
		border-bottom: 2px solid #000000;
		'>Spiritual Assembly of the Baha'is of <cfoutput>#roster.community#</cfoutput></p>
</cfdocumentitem>

<cfloop query="hoh">
	<cfset family = model("member").findAll(where="rosterid=#roster.id# AND HouseholdName='#hoh.HouseholdName#' AND AddressLine1='#hoh.AddressLine1#'",order="HeadofHousehold desc, AgeGroup")>
	<br />
	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'><cfoutput>#dateformat(now(),"mmm dd, yyyy")#</cfoutput></p>

	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>
		<cfoutput>
		To the #hoh.LastName# Residence<br />
		#hoh.AddressLine1#<br />
		<cfif hoh.AddressLine2 neq "">
			#hoh.AddressLine2#<br />	
		</cfif>
		#hoh.City#, #hoh.State# #hoh.ZipCode#<br />
		</cfoutput>
	</p>
	
	
	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>Dearly loved Friends,</p>
	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>We are conducting a survey to verify the information on our community roster. Please take a moment and review the enclosed 
	information and let us know if
	any of the information needs to be updated. In particular, please verify the phone number on record since that is currently used as the 
	primary means of communication for announcements regarding activities in our community. In addition we would appreciate it, if you could
	provide an	email address for each member of your household that could be used to send out announcements and to email contribution receipts.</p>
	
	<table align="center" cellpadding="3" cellspacing="0">
		<tr>
			<td colspan="2" align="center" style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: bold;
	  	border-bottom: 1px solid #000000;
		'>Household Information</td>
		</tr>
		<tr>
			<td valign="top" align="right" style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>Address:</td>
			<td style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>
				<cfoutput>
				#hoh.AddressLine1#<br />
				<cfif hoh.AddressLine2 neq "">
					#hoh.AddressLine2#<br />	
				</cfif>
				#hoh.City#, #hoh.State# #hoh.ZipCode#<br />
				</cfoutput>
			</td>
		</tr>
		<tr>
			<td align="right" style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>Phone:</td>
			<td style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'><cfoutput>#hoh.PhoneHome#</cfoutput></td>
		</tr>
		<cfif hoh.sector neq "">
			<tr>
				<td align="right" style='
			font-family:  Sans-Serif;
			font-size: 12px;
			background: #fff;
		    font-weight: normal;
			'>Sector:</td>
				<td style='
			font-family:  Sans-Serif;
			font-size: 12px;
			background: #fff;
		    font-weight: normal;
			'><cfoutput>#hoh.sector#</cfoutput></td>
			</tr>
		</cfif>
	</table>
	
	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>Please review the household membership information below. If any members listed below are no longer residing with you please
	let us know so we can properly move them to their current community. Additionally if any members of your household are not listed
	below please let us know so we can begin the process of registering them or moving them into our community.</p>
		
	<table align="center" cellspacing="0" cellpadding="3">
		<tr>
			<td style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: bold;
	  	border-bottom: 1px solid #000000;
		'>Name</td>
			<td align="center" style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: bold;
	  	border-bottom: 1px solid #000000;
		'>Cell Phone</td>
			<td align="center" style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: bold;
	  	border-bottom: 1px solid #000000;
		'>Email</td>
			<td align="right" style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: bold;
	  	border-bottom: 1px solid #000000;
		'>Age Group</td>
		</tr>
		<cfloop query="family">
			<tr>
				<td width="30%" style='
					font-family: Sans-Serif;
					font-size: 12px;
					font-weight: normal;
					'><cfoutput>#family.FirstName# #family.MiddleName# #family.LastName#</cfoutput></td>
				<td width="35%" align="center" style='
					font-family: Sans-Serif;
					font-size: 12px;
					font-weight: normal;
					'><cfoutput>#family.phonecell#</cfoutput></td>
				<td width="35%" align="center" style='
					font-family: Sans-Serif;
					font-size: 12px;
					font-weight: normal;
					'><cfoutput>#family.Email#</cfoutput></td>
				<td width="30%" align="right" style='
					font-family: Sans-Serif;
					font-size: 12px;
					font-weight: normal;
					'><cfoutput>#family.AgeGroup#</cfoutput></td>
			</tr>
		</cfloop>
	</table>
	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>Thank you for your assistance in this matter. To change or add any information, please contact the LSA via email at <cfoutput>#roster.email1#</cfoutput> or via phone at <cfoutput>#roster.phone#</cfoutput>.</p>
	<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>With loving Baha'i greetings,</p>

		<p style='
		font-family:  Sans-Serif;
		font-size: 12px;
		background: #fff;
	    font-weight: normal;
		'>SPIRITUAL ASSEMBLY OF THE<br />
		BAHA'IS OF <cfoutput>#ucase(roster.community)#</cfoutput><br />
 		<br /><br />
		<cfoutput>#user.firstname# #user.lastname#</cfoutput></p>
	<cfdocumentitem type = "pagebreak">			
</cfloop>
</cfdocument>
</body>
</html>
