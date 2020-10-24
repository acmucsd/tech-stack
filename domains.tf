resource "aws_route53_zone" "acmucsd-com-public" {
  name    = "acmucsd.com"
  comment = "ACM's main domain for stuff."

  tags = {
  }
}

resource "aws_route53_zone" "acmurl-com-public" {
  name    = "acmurl.com"
  comment = "ACM's domain used for URL shortening."

  tags = {
  }
}

resource "aws_route53_record" "acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "acmucsd.com"
  type    = "A"
  records = ["104.198.14.52"]
  ttl     = "3600"
}

resource "aws_route53_record" "www-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "www.acmucsd.com"
  type    = "A"
  records = ["104.198.14.52"]
  ttl     = "3600"
}

resource "aws_route53_record" "acmucsd-com-NS" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "acmucsd.com"
  type    = "NS"
  records = ["ns-2024.awsdns-61.co.uk.", "ns-278.awsdns-34.com.", "ns-1200.awsdns-22.org.", "ns-591.awsdns-09.net."]
  ttl     = "172800"
}

resource "aws_route53_record" "acmucsd-com-SOA" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "acmucsd.com"
  type    = "SOA"
  records = ["ns-2024.awsdns-61.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
}

resource "aws_route53_record" "s1-_domainkey-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "s1._domainkey.acmucsd.com"
  type    = "CNAME"
  records = ["s1.domainkey.u17821998.wl249.sendgrid.net"]
  ttl     = "3600"
}

resource "aws_route53_record" "s2-_domainkey-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "s2._domainkey.acmucsd.com"
  type    = "CNAME"
  records = ["s2.domainkey.u17821998.wl249.sendgrid.net"]
  ttl     = "3600"
}

resource "aws_route53_record" "ai-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "ai.acmucsd.com"
  type    = "CNAME"
  records = ["acmucsd-ai.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "sendgrid-ai-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "17821998.ai.acmucsd.com"
  type    = "CNAME"
  records = ["sendgrid.net"]
  ttl     = "3600"
}

resource "aws_route53_record" "api-ai-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "api.ai.acmucsd.com"
  type    = "A"
  records = ["104.155.168.98"]
  ttl     = "3600"
}

resource "aws_route53_record" "open-ai-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "open.ai.acmucsd.com"
  type    = "CNAME"
  records = ["openai-acm-ai.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "compete-ai-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "compete.ai.acmucsd.com"
  type    = "A"
  records = ["34.120.177.157"]
  ttl     = "3600"
}

resource "aws_route53_record" "apitest-ai-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "apitest.ai.acmucsd.com"
  type    = "A"
  records = [aws_instance.ai-api-testing.public_ip]
  ttl     = "3600"
}

resource "aws_route53_record" "em4616-ai-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "em4616.ai.acmucsd.com"
  type    = "CNAME"
  records = ["u17821998.wl249.sendgrid.net"]
  ttl     = "3600"
}

resource "aws_route53_record" "url4522-ai-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "url4522.ai.acmucsd.com"
  type    = "CNAME"
  records = ["sendgrid.net"]
  ttl     = "3600"
}

resource "aws_route53_record" "api-test-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "api-test.acmucsd.com"
  type    = "CNAME"
  records = ["acmucsd-portal-testing.herokuapp.com"]
  ttl     = "3600"
}

resource "aws_route53_record" "api-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "api.acmucsd.com"
  type    = "CNAME"
  records = ["shallow-koi-v9n1nho6ee48b480cn08m1hr.herokudns.com"]
  ttl     = "3600"
}

resource "aws_route53_record" "design-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "design.acmucsd.com"
  type    = "CNAME"
  records = ["acmdesign.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "hack-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "hack.acmucsd.com"
  type    = "CNAME"
  records = ["acmhack-site.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "members-test-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "members-test.acmucsd.com"
  type    = "CNAME"
  records = ["members-nightly.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "members-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "members.acmucsd.com"
  type    = "CNAME"
  records = ["acmucsd.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "space2020-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "space2020.acmucsd.com"
  type    = "CNAME"
  records = ["space2020.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "splash-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "splash.acmucsd.com"
  type    = "CNAME"
  records = ["acmucsd-purple.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "static-template-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "static-template.acmucsd.com"
  type    = "CNAME"
  records = ["acm-static.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "tree-acmucsd-com-CNAME" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "tree.acmucsd.com"
  type    = "CNAME"
  records = ["acmucsd-tree.netlify.app"]
  ttl     = "3600"
}

resource "aws_route53_record" "vote-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "vote.acmucsd.com"
  type    = "A"
  records = ["217.156.97.70"]
  ttl     = "3600"
}

resource "aws_route53_record" "bot-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "bot.acmucsd.com"
  type    = "A"
  records = [aws_instance.breadbot.public_ip]
  ttl     = "3600"
}

resource "aws_route53_record" "acmurl-com-A" {
  zone_id = aws_route53_zone.acmurl-com-public.zone_id
  name    = "acmurl.com"
  type    = "A"
  records = [aws_instance.breadbot.public_ip]
  ttl     = "3600"
}

resource "aws_route53_record" "www-acmurl-com-A" {
  zone_id = aws_route53_zone.acmurl-com-public.zone_id
  name    = "www.acmurl.com"
  type    = "A"
  records = [aws_instance.breadbot.public_ip]
  ttl     = "3600"
}

resource "aws_route53_record" "url-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "url.acmucsd.com"
  type    = "A"
  records = [aws_instance.breadbot.public_ip]
  ttl     = "3600"
}

resource "aws_route53_record" "pass-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "pass.acmucsd.com"
  type    = "A"
  records = [aws_instance.pass.public_ip]
  ttl     = "3600"
}

resource "aws_route53_record" "mc-acmucsd-com-A" {
  zone_id = aws_route53_zone.acmucsd-com-public.zone_id
  name    = "mc.acmucsd.com"
  type    = "A"
  records = ["51.81.26.152"]
  ttl     = "3600"
}
