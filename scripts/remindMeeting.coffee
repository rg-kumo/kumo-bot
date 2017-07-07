# Description:
#   Remind Me "10 minutes later, Meeting Time !! " Thursday, at PM18:15

# test

cronJob = require('cron').CronJob # cronJobのの読み込み

module.exports = (robot) ->
 new cronJob('00 30 11 * * 5', () ->
    send '#shuya_private', "Hungry...."
  ).start()

  new cronJob('00 05 18 * * 4', () ->
    send '#kumo', "@here 10 minutes later, Meeting Time !!"
  ).start()