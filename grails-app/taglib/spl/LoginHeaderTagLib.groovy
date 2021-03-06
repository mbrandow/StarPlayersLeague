package spl
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class LoginHeaderTagLib {
	def springSecurityService
	
	def loginHeader = {
		def currentUser = springSecurityService.currentUser
		def auth = springSecurityService.authentication
		if (!currentUser) {
			out << g.link(controller:"login", "Log In")
			out << " | "
			out << g.link(controller:"navigation", action:"createAccount", "Create Account")
		} else {
			def messageCount = currentUser.unreadMessageCount()
			out << "Welcome ${currentUser.username.encodeAsHTML()}! "
			if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
				out << g.link(controller:"administration", action:"index", "Admin")
				out << " | "
			}
			out << g.link(controller:"profile", action:"account", "Account")
			out << " | "
			out << g.link(controller:"navigation", action:"myProfile", "Profile")
			out << " | " 
			out << g.link(controller:"profile", action:"matches", "Matches")
			out << " | "
			out << g.link(controller:"profile", action:"listThreads", "Messages (${messageCount})")
			out << " | "
			out << g.link(controller:"logout", "Log Out")
		}
	}
}
