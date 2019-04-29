module.exports = (robot) ->
  robot.respond /who are you/i, (msg) ->
    msg.send "I'm hubot! Hello, #{msg.message.user.name}"

  robot.respond /what are you doing/i, (msg) ->
    msg.send "I will remind meeting time :)"

  robot.respond /sendtokumo (.*)/i, (res) ->
    msg= res.match[1]
    robot.messageRoom 'kumo', msg
