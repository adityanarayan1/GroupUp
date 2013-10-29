component {

	this.name = "GroupUp";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.mappings["/GroupUp"] = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings["/ModelGlue"] = getDirectoryFromPath(getCurrentTemplatePath()) & "ModelGlue/";
	this.mappings["/ColdSpring"] = getDirectoryFromPath(getCurrentTemplatePath()) & "ColdSpring/";

	function onSessionStart() {
	
		//Set flag letting MG know it needs to broadcast onSessionStart before onRequestStart
		request._modelglue.bootstrap.sessionStart = true;
	}

	function onSessionEnd( required struct sessionScope, struct appScope ) {

		invokeSessionEvent("modelglue.onSessionEnd", arguments.sessionScope, appScope);
	}

	function invokeSessionEvent( eventName, sessionScope, appScope ) {
	
		var mgInstances = createObject("component",
											"ModelGlue.Util.ModelGlueFrameworkLocator").findInScope(appScope);
		var values = structNew();
		values.sessionScope = arguments.sessionScope;

		//Execute event
		arrayEach( mgInstances, function( any currentObj ) {
			currentObj.executeEvent(arguments.eventName, values);
		});
	}
}