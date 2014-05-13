<cfcomponent extends="controller">
	
	<cffunction name="init"> 
	
		<cfset filters(through="isLoggedIn")>
	
	</cffunction>	
	
	<cffunction name="add">
	
		<cfset roster = model("roster").New()>
		<cfset default = model("roster").findOne(where="userid=#session.user.id#",order="id desc")>
		
		<cfif IsObject(default)>
			<cfset roster.name = default.name>
			<cfset roster.community = default.community>
			<cfset roster.phone = default.phone>
			<cfset roster.address1 = default.address1>
			<cfset roster.address2 = default.address2>
			<cfset roster.address3 = default.address3>
			<cfset roster.email1 = default.email1>
			<cfset roster.email2 = default.email2>
			<cfset roster.email3 = default.email3>
		<cfelse>
			<cfset roster.name = "Community Roster">
		</cfif>
	</cffunction>
	
	<cffunction name="process">
			
		<cfset roster = model("roster").new(params.roster)>
		<cfset roster.userid = session.user.id>
		<cfset roster.save()>
		
		<cfif roster.hasErrors()>
			<cfset RenderPage(action="upload")>
		<cfelse>
			<cffile action="read" file="#roster.rosterFile#" variable="csvfile">

			<cfset qResults = QueryNew("Number, Status, Data", "Integer, Varchar, Varchar")> 
 
 			<cfset linenumber = 0>
			<cfloop index="line" list="#csvfile#" delimiters="#chr(10)##chr(13)#">
				
				<cfset status = "">
				<cfset linenumber = linenumber + 1>
				<cfset elementCount = listLen(line)>
				<cfset sectorArray = arrayNew(1)>

				<cfif (elementCount eq 26) or (elementCount eq 27)>
					<cfif Replace(listgetAt(line,1),'"','','all') neq "IDN">
						<cfset member=model("member").new()>
						<cfset member.rosterid = roster.id>
						<cfset key = 1><cfset member.bid = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.LastName = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.FirstName = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.MiddleName = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.Suffix = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.NickName = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.AgeGroup = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.Gender = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.MailStatus = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.HeadofHousehold = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.HouseholdName = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.careof = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.AddressLine1 = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.AddressLine2 = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.AddressLine3 = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.City = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.State = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.ZipCode = Replace(listgetAt(line,key),'"','','all')>
						<cfif (listLen(line) eq 27)>
							<cfset key = key + 1><cfset member.Sector = Replace(listgetAt(line,key),'"','','all')>
							<!---<cfif not ArrayContains(sectorArray, member.Sector)>--->
								<cfset temp = arrayAppend(sectorArray, member.Sector)>
							<!---</cfif>--->
						</cfif>
						<cfset key = key + 1><cfset member.PhoneHome = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.PhoneWork = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.PhoneCell = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.Email = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.Email2 = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.language = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.Roles = Replace(listgetAt(line,key),'"','','all')>
						<cfset key = key + 1><cfset member.DeceasedStatus = Replace(listgetAt(line,key),'"','','all')>
						<cfset member.save()>
						<cfset status = "Processed: #listLen(line)# elements">
					<cfelse>
						<cfset status = "Skipped: Header row">
					</cfif>
				<cfelse>
					<cfset status = "Skipped: Wrong element count (#elementCount#)">
				</cfif>	
				<cfset newRow = QueryAddRow(qResults)>
				<cfset temp = QuerySetCell(qResults, "Number", linenumber)> 
				<cfset temp = QuerySetCell(qResults, "Status", status)> 
				<cfset temp = QuerySetCell(qResults, "Data", line)> 
			</cfloop>
			
			<cfset roster.membercount = model("member").count(where="rosterid=#roster.id#")>
			<cfset roster.hohcount = model("member").count(where="rosterid=#roster.id# AND HeadofHousehold='yes'")>
			<cfset roster.adultcount = model("member").count(where="rosterid=#roster.id# AND agegroup='Adult'")>
			<cfset roster.youthcount = model("member").count(where="rosterid=#roster.id# AND agegroup='Youth'")>
			<cfset roster.jryouthcount = model("member").count(where="rosterid=#roster.id# AND agegroup='Jr Youth'")>
			<cfset roster.childcount = model("member").count(where="rosterid=#roster.id# AND agegroup='Child'")>
			<cfset roster.sectorcount = ArrayLen(sectorArray)>
			<cfset roster.save()>
			
			<cfset flashInsert(success="You've successfully uploaded a roser file.")>
			<!---<cfset redirectTo(action="edit",key=roster.id)>--->		
		</cfif>
	
	</cffunction>
	
	<cffunction name="index">
	
		<cfset rosters = model("roster").findAll(where="userid = #session.user.id#")>
		<cfif rosters.recordcount eq 0>
			<cfset flashInsert(error="There are no roster files to display. Use the Add Roster link to upload a new roster.")>
		</cfif>	
	</cffunction>
	
	<cffunction name="delete">
		
		<cfset roster = model("roster").findOne(where="id=#params.key# AND userid=#session.user.id#")>

		<cfif IsObject(roster)>
			<cfset roster.deleteAllMembers()>
			<cfset roster.delete()>

			<cfset flashInsert(success="You've successfully delete the roster and associated member records.")>
		<cfelse>
			<cfset flashInsert(error="Unable to delete the selected roster file. Please try again later.")>
		</cfif>	

		<cfset redirectTo(action="index")>		
	
	</cffunction>

	<cffunction name="edit">
		
		<cfset roster = model("roster").findOne(where="id=#params.key# AND userid=#session.user.id#")>

		<cfif not IsObject(roster)>
			<cfset flashInsert(error="Unable to find the specified roster file. Please try again later.")>
			<cfset redirectTo(action="index")>		
		</cfif>	
	
	</cffunction>
	
	<cffunction name="map">
	
		<cfset roster = model("roster").findOne(where="id=#params.key# AND userid=#session.user.id#")>

		<cfif IsObject(roster)>
<!---
			<cfset hoh = model("member").findAll(where="rosterid=#roster.id# AND headofhousehold='yes'",order="lastname")>
			<cfset renderPartial(partial="roster1")>
--->
		<cfelse>
			<cfset flashInsert(error="Unable to find the specified roster file. Please try again later.")>
			<cfset redirectTo(action="index")>		
		</cfif>	

	</cffunction>

	<cffunction name="pdf">
	
		<cfset roster = model("roster").findOne(where="id=#params.key# AND userid=#session.user.id#")>

		<cfif IsObject(roster)>
			<cfset hoh = model("member").findAll(where="rosterid=#roster.id# AND headofhousehold='yes'",order="lastname")>
			<cfset renderPartial(partial="roster1")>
		<cfelse>
			<cfset flashInsert(error="Unable to find the specified roster file. Please try again later.")>
			<cfset redirectTo(action="index")>		
		</cfif>	

	</cffunction>

	<cffunction name="sectorPdf">
	
		<cfset roster = model("roster").findOne(where="id=#params.key# AND userid=#session.user.id#")>

		<cfif IsObject(roster)>
			<cfset hoh = model("member").findAll(where="rosterid=#roster.id# AND headofhousehold='yes'",order="sector,lastname")>
			<cfset renderPartial(partial="roster2")>
		<cfelse>
			<cfset flashInsert(error="Unable to find the specified roster file. Please try again later.")>
			<cfset redirectTo(action="index")>		
		</cfif>	

	</cffunction>

	<cffunction name="verification">
	
		<cfset user = model("user").findByKey(session.user.id)>
		<cfset roster = model("roster").findOne(where="id=#params.key# AND userid=#session.user.id#")>

		<cfif IsObject(roster)>
			<cfset hoh = model("member").findAll(where="rosterid=#roster.id# AND headofhousehold='yes'",order="lastname")>
			<cfset renderPartial(partial="verification")>
		<cfelse>
			<cfset flashInsert(error="Unable to find the specified roster file. Please try again later.")>
			<cfset redirectTo(action="index")>		
		</cfif>	

	</cffunction>

</cfcomponent>
