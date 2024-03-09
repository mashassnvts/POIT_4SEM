enum Membership{
    Simple,
    Standart,
    Premium
}

const membreship = Membership.Standart
const membreshipReverse = Membership[2]

console.log(membreship)
console.log(membreshipReverse)

enum SocialMedia{
    VK= 'VK',
    TIKTOK = 'TIKTOK',
    VIBER = 'VIBER'
}

const social = SocialMedia.TIKTOK
console.log(social)