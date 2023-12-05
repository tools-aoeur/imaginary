
IM_CONVERT="/usr/bin/convert"
WR_CONVERT="bash convert"

# convert all using image magick
${IM_CONVERT} "flyio-button.svg"  -thumbnail 160x160 "png:result_flyio-button_im.png"
${IM_CONVERT} "bmp_24.bmp"        -thumbnail 160x160 "png:result_bmp_24_im.png"
${IM_CONVERT} "sample.pdf"        -thumbnail 160x160 "png:result_sample_im.png"
${IM_CONVERT} "occult.gif"        -thumbnail 160x160 "png:result_occult_im.png"
${IM_CONVERT} "static_gif.gif"    -thumbnail 160x160 "png:result_static_gif_im.png"
${IM_CONVERT} "imaginary.jpg"     -thumbnail 160x160 "png:result_imaginary_im.png"
${IM_CONVERT} "large image.jpg"   -thumbnail 160x160 "png:result_large_im.png"
${IM_CONVERT} "medium.jpg"        -thumbnail 160x160 "png:result_medium_im.png"
${IM_CONVERT} "smart-crop.jpg"    -thumbnail 160x160 "png:result_smart-crop_im.png"
${IM_CONVERT} "test.png"          -thumbnail 160x160 "png:result_test_im.png"
${IM_CONVERT} "test.webp"         -thumbnail 160x160 "png:result_test_im.png"

# convert all using imaginary
${WR_CONVERT} "flyio-button.svg"  -thumbnail 160x160 "result_flyio-button_wr.png"
${WR_CONVERT} "bmp_24.bmp"        -thumbnail 160x160 "result_bmp_24_wr.png"
${WR_CONVERT} "sample.pdf"        -thumbnail 160x160 "result_sample_wr.png"
${WR_CONVERT} "occult.gif"        -thumbnail 160x160 "result_occult_wr.png"
${WR_CONVERT} "static_gif.gif"    -thumbnail 160x160 "result_static_gif_wr.png"
${WR_CONVERT} "imaginary.jpg"     -thumbnail 160x160 "result_imaginary_wr.png"
${WR_CONVERT} "large image.jpg"   -thumbnail 160x160 "result_large_wr.png"
${WR_CONVERT} "medium.jpg"        -thumbnail 160x160 "result_medium_wr.png"
${WR_CONVERT} "smart-crop.jpg"    -thumbnail 160x160 "result_smart-crop_wr.png"
${WR_CONVERT} "test.png"          -thumbnail 160x160 "result_test_wr.png"
${WR_CONVERT} "test.webp"         -thumbnail 160x160 "result_test_wr.png"
