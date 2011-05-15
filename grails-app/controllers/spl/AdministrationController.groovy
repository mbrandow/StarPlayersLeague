package spl

import grails.plugins.springsecurity.Secured
@Secured(['ROLE_ADMIN'])
class AdministrationController {

    def index = {
		
	}
	
	def modifyMatchResult = {
		if (params.modifyMatchId) {
			redirect(controller: 'profile', action: 'reportScore', id: params.modifyMatchId)
		} else {
			flash.message = "Please specify match ID to modify"
			redirect(action: 'index')
		}
	}
	
	def resetMatchResult = {
		def match = Match.get(params.resetMatchId)
		if (params.resetMatchId) {
			match.winner = null
			match.loserScore = null
			match.played = false
			for (_game in match.games) {
				_game.winner = null
			}
			match.save(flush: true)
		
			for (_entry in match.entries) {
				_entry.updateMatchGameStats()
				_entry.save(flush: true)
			}
			flash.message = "Reset result of match ID ${params.resetMatchId} successful"
			redirect(action: 'index')
		} else {
			flash.message = "Please specify match ID to reset"
			redirect(action: 'index')
		}
	}
	
}
