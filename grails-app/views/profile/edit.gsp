<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Edit Profile</title>
    </head>
    
    <body>
	   	<g:form method="POST">
	    	<h1>Edit Profile</h1>
	    	<div class="break"></div>
	    	<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
	    	<div class="mcontent">
	    		<h2>Account Information</h2><br/>
	    		<div class="infoleft">
	    			<p>Username:</p>
	    			<p>Email Address:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='text' class='text_' name='username' value='${userInstance?.username}'/></p>
	    			<p><input type='text' class='text_' name='email' value='${userInstance?.email}'/></p>
	    		</div>
	    	</div>
	    	<div class="break"></div>
	    	<div class="mcontent">
	    		<h2>Email Notifications</h2><br/>
	    		<div class="infoleft">
	    			<p>When I receive new messages:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><g:checkBox name="messageNotification" value="${userInstance?.messageNotification}" /></p>
	    		</div>
	    	</div>
	    	<div class="break"></div>
	    	<div class="mcontent">
	    		<h2>Change Password</h2><br/>
	    		<div class="infoleft">
	    			<p>Old Password:</p>
	    			<p>New Password:</p>
	    			<p>Confirm New Password:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='password' class='text_' name='oldPassword' /></p>
	    			<p><input type='password' class='text_' name='newPassword' /></p>
	    			<p><input type='password' class='text_' name='confirmNewPassword' /></p>
	    		</div>
	    	</div>
	    	<div class="break"></div>
	    	<p><g:actionSubmit class="submitButton" action="update" value="Update" /></p>
	    </g:form>
    </body>
</html>