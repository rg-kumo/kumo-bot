# Description:
#   Remind Me "10 minutes later, Meeting Time !! " Thursday, at PM18:15
#   Remind wiriting status update for wiki
# test

cronJob = require('cron').CronJob # cronJobのの読み込み

module.exports = (robot) ->
 new cronJob('00 40 01 * * 4', () ->
    envelope = room: "#kumo"
    mention = "@here "
    robot.send envelope, mention + "You've already written?? https://github.com/rg-kumo/docs/wiki"
  ).start()

  new cronJob('00 00 09 * * 4', () ->
    envelope = room: "#kumo"
    mention = "@channel: "
    robot.send envelope, mention + "Meeting starts in 15 minutes!"
  ).start()
