<!---
LICENSE INFORMATION:

Copyright 2010, Joe Rinehart, Dan Wilson

Licensed under the Apache License, Version 2.0 (the "License"); you may not 
use this file except in compliance with the License. 

You may obtain a copy of the License at 

	http://www.apache.org/licenses/LICENSE-2.0 
	
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.

VERSION INFORMATION:

This file is part of Model-Glue 'Gesture' 3.1 Maintenance Release Candidate (3.1.299).

The version number in parentheses is in the format versionNumber.subversion.revisionNumber.
--->

<cfcomponent extends="modelglue.gesture.test.ModelGlueAbstractTestCase">
	
<cfset this.coldspringPath = "/ModelGlue/gesture/loading/test/ColdSpring.xml">

<cffunction name="testStoreModelGlue" returntype="void" access="public">
	<cfset var boot = createBootstrapper(this.coldspringPath) />
	<cfset var mg = createObject("component", "ModelGlue.gesture.ModelGlue") />
	
	<cfset boot.storeModelGlue(mg) />
	<cfset assertTrue(getMetadata(request._modelglue.bootstrap.framework).name eq "ModelGlue.gesture.ModelGlue", "ModelGlue instance not stored in request scope.") />
</cffunction>

</cfcomponent>


