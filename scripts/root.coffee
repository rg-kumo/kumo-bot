# ルートにgetリクエストがきたとき、404を返さないようにする
# Copyright (C) 2019 Yukio Nozawa <personal@nyanchangames.com>

module.exports = (robot) ->
    robot.router.get "/", (req, res) ->
        res.send 'Hi. Kumobot is running! If you have any problems, please contact cat.'
