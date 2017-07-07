# Description:
#   Remind Me "10 minutes later, Meeting Time !! " Thursday, at PM18:15

# test

cronJob = require('cron').CronJob # cronJobのの読み込み

module.exports = (robot) ->
 new cronJob('00 40 11 * * 5', () ->
    envelope = room: "#shuya_private"
    robot.send envelope, "Hungry...!!!"
  ).start()

  new cronJob('00 05 18 * * 4', () ->
    envelope = room: "#kumo"
    mention = "@channel: "
    robot.send envelope, mention + "10 minutes later, Meeting Time !!"
  ).start()