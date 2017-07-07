# Description:
#   Remind Me "10 minutes later, Meeting Time !! " Thursday, at PM18:15

# test

cronJob = require('cron').CronJob # cronJobのの読み込み

module.exports = (robot) ->
  testJob = new cronJob('00 43 10 * * 5', () ->
    envelope = room: "#shuya_private"
    robot.send envelope, "Hungry...!!!"
  )

  meetingJob = new cronJob('00 5 18 ** 4', () ->
    envelope = room: "#general"
    mention = "@channel: "
    robot.send envelope, mention + "10 minutes later, Meeting Time !!"
  )

  testJob.start() # cronJobの実行
  meetingJob.start()

