# GitHubから来た通知をSlackに飛ばす
# 
# 参考: Hubot経由でGitHubのイベントを通知する | SPACEMARKET BLOG
#       http://blog.spacemarket.com/code/hubot-github-webhook-1/
#
# Thanks
# ここのコードコピぺした (shuya)
# https://blog.ueda.tech/?p=7668
crypto = require 'crypto'

module.exports = (robot) ->
    robot.router.post "/github/webhook", (req, res) ->
        event_type = req.get 'X-Github-Event'
        signature = req.get 'X-Hub-Signature'

        unless isCorrectSignature signature, req.body
            res.status(401).send 'unauthorized'
            return

        switch event_type
            when 'gollum'
                message = atWiki req.body
                robot.messageRoom 'kumo', message

        res.status(200).send 'ok'

    atWiki = (body) ->
        switch body.pages[0].action
            when 'edited'
                message = "*Edit GitHub Wiki Page*\n"
                message += body.pages[0].html_url
                return message
            when 'created'
                message = "*Create GitHub Wiki Page*\n"
                message += body.pages[0].html_url
                return message

    isCorrectSignature = (signature, body) ->
        pairs = signature.split '='
        digest_method = pairs[0]
        hmac = crypto.createHmac digest_method, process.env.HUBOT_GITHUB_SECRET
        hmac.update JSON.stringify(body), 'utf-8'
        hashed_data = hmac.digest 'hex'
        generated_signature = [digest_method, hashed_data].join '='
        return signature is generated_signature
