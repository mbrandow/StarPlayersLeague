

<%@ page import="spl.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${matchInstance}">
            <div class="errors">
                <g:renderErrors bean="${matchInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${matchInstance?.id}" />
                <g:hiddenField name="version" value="${matchInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="matchNumber"><g:message code="match.matchNumber.label" default="Match Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'matchNumber', 'errors')}">
                                    <g:textField name="matchNumber" value="${fieldValue(bean: matchInstance, field: 'matchNumber')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mapPack"><g:message code="match.mapPack.label" default="Map Pack" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'mapPack', 'errors')}">
                                    <g:select name="mapPack.id" from="${spl.MapPack.list()}" optionKey="id" value="${matchInstance?.mapPack?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bestOf"><g:message code="match.bestOf.label" default="Best Of" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'bestOf', 'errors')}">
                                    <g:textField name="bestOf" value="${fieldValue(bean: matchInstance, field: 'bestOf')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="winner"><g:message code="match.winner.label" default="Winner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'winner', 'errors')}">
                                    <g:select name="winner.id" from="${spl.Registration.list()}" optionKey="id" value="${matchInstance?.winner?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="loserScore"><g:message code="match.loserScore.label" default="Loser Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'loserScore', 'errors')}">
                                    <g:textField name="loserScore" value="${fieldValue(bean: matchInstance, field: 'loserScore')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="forfeit"><g:message code="match.forfeit.label" default="Forfeit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'forfeit', 'errors')}">
                                    <g:checkBox name="forfeit" value="${matchInstance?.forfeit}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entries"><g:message code="match.entries.label" default="Entries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'entries', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="games"><g:message code="match.games.label" default="Games" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'games', 'errors')}">
                                    
<ul>
<g:each in="${matchInstance?.games?}" var="g">
    <li><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="game" action="create" params="['match.id': matchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'game.label', default: 'Game')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="leagueGroup"><g:message code="match.leagueGroup.label" default="League Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'leagueGroup', 'errors')}">
                                    <g:select name="leagueGroup.id" from="${spl.Group.list()}" optionKey="id" value="${matchInstance?.leagueGroup?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="played"><g:message code="match.played.label" default="Played" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'played', 'errors')}">
                                    <g:checkBox name="played" value="${matchInstance?.played}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
