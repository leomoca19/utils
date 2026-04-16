#Requires AutoHotkey v2.0
#`:: {
    Send "^v.mp4{Enter}"
    Sleep(250)
    Send "^w"
}

^#1:: {
    Sleep(700)
    SendText "
(
My name is Leonardo, and I'm a software development student graduating in 2028. I am very interested in your listing.

I am looking for a long-term rental starting May 15 or June 1. I'll be the sole occupant and I keep my space clean and quiet. The rent fits comfortably within my budget. My living expenses are covered by an allowance from my parents and my job.

When would be a good time this week for me to come by and see the place?
Looking forward to hearing from you!

Leonardo,
Phone: 437-264-1908
)"
}

^#2:: {
    Sleep(1000)
    SendText "Hi X, I saw your post on Palz about a"
    Send "{Enter}{Enter}"
}
