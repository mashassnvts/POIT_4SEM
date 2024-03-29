var Membership;
(function (Membership) {
    Membership[Membership["Simple"] = 0] = "Simple";
    Membership[Membership["Standart"] = 1] = "Standart";
    Membership[Membership["Premium"] = 2] = "Premium";
})(Membership || (Membership = {}));
var membreship = Membership.Standart;
var membreshipReverse = Membership[2];
console.log(membreship);
console.log(membreshipReverse);
var SocialMedia;
(function (SocialMedia) {
    SocialMedia["VK"] = "VK";
    SocialMedia["TIKTOK"] = "TIKTOK";
    SocialMedia["VIBER"] = "VIBER";
})(SocialMedia || (SocialMedia = {}));
var social = SocialMedia.TIKTOK;
console.log(social);
