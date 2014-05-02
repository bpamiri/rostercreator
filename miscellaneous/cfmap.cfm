<cfset myparams = structNew()>
<cfset myparams.googlemapkey = 'AIzaSyBoYGbAHhaNFkCKoC_iA6TK1igWyxym5pA'>

<cfinclude template="/mapping-tag/railo/core/ajax/js/RailoAjax.js">

<cfajaximport params="#myparams#">
 
<cfmap 
	name="mainMap"
    centeraddress="925 Tiverton Lane, Johns Creek, GA 30022" 
    zoomlevel="15"
/>
