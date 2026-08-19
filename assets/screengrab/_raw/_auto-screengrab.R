# TEST CASE 1 ----------------------------------------------------------------
# - screengrab: transcript/imported-layers.png
#   instructions:
#     - Log in as test-student
#     - Set browser zoom to 100%
#     - Load https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf
#     - Select noise, comment, pronounce
#     - "`window.scrollTo(0, 11315);"
#     - Save
#   offset_x: offset_x$transcript_content_left ##190
#   offset_y: offset_y$page_top                ##130
#   width: 1065
#   height: 155

library(chromote)

##Create session w/ correct dimensons & login to APLS
b <- ChromoteSession$new(width = 1280, height = 665)
##https://rstudio.github.io/chromote/articles/example-authentication.html#method-1-manually-interact-with-the-page
b$Network$setCookies(cookies = readRDS("~/apls-cookies.Rds")$cookies)

##Load page
page <- "https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf"
b$go_to(page)
##Wait somehow

##Load layers
b$Runtime$evaluate("document.querySelector('#attributes .tab-label:nth-child(3)').click();")
##Wait somehow
b$Runtime$evaluate("document.querySelector('.active input.category[value=imported]').click()")
##Wait somehow
b$Runtime$evaluate("document.querySelector('.active input.layer[value=pronounce]').click()")
##Wait somehow

##https://rstudio.github.io/chromote/reference/ChromoteSession.html#method-screenshot-

##The following doesn't work--too much of left side cut off, not the right turn
# b$screenshot("~/Downloads/tmp.png", cliprect=c(190, 11315, 1065, 165))
##When scrolled to top of page, $0.getBoundingClientRect() yields:
##left ~= 135
##top ~= 11863
##width ~= 990
##height ~= 89
##But the captured raw screenshot is 1920x1008, a 1.5 scale
##The following is just the same but more pixels
# b$screenshot("~/Downloads/tmp.png", cliprect=c(190, 11315, 1065, 165), scale=1.5)
##The following is a lot closer to the left margin (a little different, but it's tolerable I guess), but still wrong turn
# b$screenshot("~/Downloads/tmp.png", cliprect=c(190 / 1.5, 11315, 1065 / 1.5, 165 / 1.5))
##The getBoundingClientRect() top doesn't cut it either. The best top is 11675, a difference of ~200px
# b$screenshot("~/Downloads/tmp.png", cliprect=c(190 / 1.5, 11865, 1065 / 1.5, 165 / 1.5))
##Instead of futzing around with these numbers, why not use chromote's ability to ID a selector?
##But the following times out (Error: Chromote: timed out waiting for response to command Page.captureScreenshot)
# b$screenshot("~/Downloads/tmp.png", selector=".block:has(> #em_12_109441)")

##Currently, there are very few screenshots that require scrolling. Maybe these can be manual.
##And for all the others, maybe the best thing is to just capture the whole window w/ a 1.5 scale, then let the current manip script do the cropping

# TEST CASE 2 ----------------------------------------------------------------
# - screengrab: transcript/layer-picker-lemma-layout.png
#   elements: [layer-picker]
#   instructions:
#     - Log in as test-student
#     - Set browser zoom to 100%
#     - Load https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf
#     - Click the Layers tab
#     - Select lemma, deselect lexicon
#     - Save
# (Leaving off everything else since I'll let the other script do the cropping)

##Create session w/ correct dimensons & login to APLS
b <- ChromoteSession$new(width = 1280, height = 665)
b$Network$setCookies(cookies = readRDS("~/apls-cookies.Rds")$cookies)

page <- "https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf"
b$go_to(page)
##Wait somehow

##Load layers
b$Runtime$evaluate("document.querySelector('#attributes .tab-label:nth-child(3)').click();")
##Wait somehow
b$Runtime$evaluate("document.querySelector('.active input.category[value=lexicon]').click()")
##Wait somehow
b$Runtime$evaluate("document.querySelector('.active input.layer[value=lemma]').click()")
##Wait somehow
b$Runtime$evaluate("document.querySelector('.active input.category[value=lexicon]').click()")
##Wait somehow


##The address bar is missing, which isn't too terrible (just subtract height of bar when calculating crop)
##But the scale is off - the resulting image is 1898x987, not 1920x1008, or 1.48x
##Obviously, that's enough to screw up the crop calculation. Gross.
##(I repeated this and each time after the first it was 1920x987. What.)
##Oh, and there's also the little Chrome window-resizing popup that is often captured, if I'm using b$view().
b$screenshot("~/Downloads/tmp.png", scale=1.5)
##Delay doesn't help at all.
b$screenshot("~/Downloads/tmp.png", scale=1.5, delay=1)

##Maybe this is workable if I don't need the full page. Urgh.
