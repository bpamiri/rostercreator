<cfset myparams = structNew()>
<cfset myparams.googlemapkey = 'AIzaSyBoYGbAHhaNFkCKoC_iA6TK1igWyxym5pA'>

<cfajaximport params="#myparams#">
 
<cfmap 
	name="mainMap"
    centeraddress="#roster.address1#, #roster.address2#" 
    zoomlevel="15"
/>

<script>alert(Railo);</script>