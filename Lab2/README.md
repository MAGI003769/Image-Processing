# EEE330 Image Processing Lab 2



# Add Noise to images

You need function [`imnoise`](https://cn.mathworks.com/help/images/ref/imnoise.html#d119e101975). 



# Contrast Stretching



# Histogram

Histogram is a important conception in image processing. With tool box, [`imhist`](https://cn.mathworks.com/help/images/ref/imhist.html?searchHighlight=imhist&s_tid=doc_srchtitle) can help you get the histogram of an image. Then, to save automatically save histograms, command `saveas(gcf, 'file_name.jpg')` will save the content in current window.



## Histogram Equalization

Command [`hist`](https://cn.mathworks.com/help/images/ref/histeq.html?searchHighlight=histeq&s_tid=doc_srchtitle) is ready for you to easily implement histogram equalization. 



# Image Filtering

[`imfilter`](https://cn.mathworks.com/help/images/ref/imfilter.html#btsmcj2-1-h)



## Average Filter



## Median Filter

[`medfilt2`](https://cn.mathworks.com/help/images/ref/medfilt2.html)



## Use pre-defined filter in MATLAB

[`fspecial`](https://cn.mathworks.com/help/images/ref/fspecial.html?searchHighlight=fspecial&s_tid=doc_srchtitle)





# Reference

- [MathWorks - Histogram Equalization](https://cn.mathworks.com/help/images/histogram-equalization.html?searchHighlight=histeq&s_tid=doc_srchtitle)
- [Anonymous Function](https://cn.mathworks.com/help/matlab/matlab_prog/anonymous-functions.html?lang=en)
- [Difference between conv2, filter2 and imfilter](https://cn.mathworks.com/matlabcentral/answers/17529-what-is-the-difference-between-conv2-filter2-and-imfilter)
- [histeq implementation](https://stackoverflow.com/questions/24094649/explanation-of-the-histogram-equalization-function-in-matlab)