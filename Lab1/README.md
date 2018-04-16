# EEE330 Image Processing Lab 1

## Objectives

- [x] Introduction of image processing capabilities of MATLAB and its toolbox
- [x] How to read and display **different** types of images
- [x] Basic image processing steps
- [ ] How to fold an image ???
- [x] How to crop an image
- [x] Down-sampling of images
- [x] Up-sampling of images
- [x] PSNR and Noise
- [x] Image Quantization



# MATLAB Guide

This [webpage](https://cn.mathworks.com/help/index.html) is the official document of MATLAB. We can search the usage of functions provided by MATLAB to implement desired operations. Or, alternatively, we can type following [`help`](https://cn.mathworks.com/help/search.html?qdoc=help&submitsearch=) commands to in Command Window get information, such as syntax, parameters, return values, of some functions needed.

```matlab
help
help /
help functionname
help toolboxname
help toolboxname/functionname
help functionname>subfunctionname
help classname.methodname
help classname
help syntax
t = help('topic')
```



# Read / Display Images

To read an image, we use [`imread`](https://cn.mathworks.com/help/matlab/ref/imread.html?lang=en) which has following possible syntax. This function can returns information from image in the term of matrix. 

```matlab
A = imread('lenna512.bmp')             % read image file
image(A)                               % display an image
set(gcf,'colormap',gray);              % set color mapping to grayscale
```

Unfortunately, this will give an awful result. The color of output image is meaningless and there are undesired axes around image whose aspect ratio has been distorted. Even we use the third line to convert the color mapping, the result seems still unexpected [1]. `image` is just a MATLAB command to visualize matrix regardless the meaning of elements inside it, especially confused color mapping. 

If we still want to obtain expected display with `image` , some extra commands are required: [`colormap`](https://cn.mathworks.com/help/matlab/ref/colormap.html?lang=en) , [`truesize`](https://cn.mathworks.com/help/images/ref/truesize.html?s_tid=doc_ta) (this one is from Image Processing Toolbox). 

```matlab
figure(2)
image(A)
colormap cool(256);                      % set colormap for current figure to a predefined one
truesize;                                        % adjust the display size of figure
imwrite(A, cool(256),'.\Task-1\cool-256.bmp');   % write matrix to file by specified colormap
```

Thus, it is makes our life much easier to use [`imshow`](https://cn.mathworks.com/help/images/ref/imshow.html) which is a command from [Image Processing Toolbox](https://cn.mathworks.com/help/images/index.html) of MATLAB. When use this function to show the image, we still need to concern about the color map especially in the case of quantization. 

It is speculated that function `imshow` will automatically choose color mapping based on the data type of input matrix. When data type is `uint8` , it will use `gray(256)` . Similarly, when data type is `double` , it will use the gray scale that has range of (0, 1). 

```matlab
A_1 = round(A ./ 16);             % returns a matrix of uint8
A_2 = imquantize(A, threshGray);  % returns a matrix of double
figure(2)                          
imshow(A_1);                      % uint8 in (0,15), shows a dark image with gray(256)
figure(2)
imshow(A_2);                      % double in (0,15), shos a bright image with (0,1) grayscale
```



# Write Matrix to an Image File

After processing, function [`imwrite`](https://cn.mathworks.com/help/matlab/ref/imwrite.html?lang=en) is called to save the results. The confused point is, again, the color map. **Problems occur when we change the number of levels of color.** For in stance, the original image is 8 bit-depth with `uint8`, which has a `gray(256)` color map. If we quantize an image or force to save a `gray(256)` image to a `gray(128)` one. Following image is the saved file.

![wrong-128](http://post-pic.nos-eastchina1.126.net/Image-Processing/gray-128-WRONG.bmp)

When the file format is `bmp` or `png` , there will be problems. ~~It is speculated that the number in matrix will be compressed into the range of (0, 127).~~ 



# Up/Down-sampling (Resize)

If we want to resize the image, function [`imresize`](https://cn.mathworks.com/help/images/ref/imresize.html?s_tid=doc_ta) from Image Processing Toolbox is required. Resize of images has various methods which can be specified by the second argument of `imresize`.

```matlab
I_1 = imresize(I_0, 0.5, 'nearest');
I_1 = imresize(I_0, 0.5, 'bicubic');
I_1 = imresize(I_0, 0.5, 'bilinear');
```



# Noise and PSNR

PSNR refers to ["Peak Signal Noise Ration"](https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio). It is defined via the **mean squared (MSE)**. Given a noise-free $m \times n$ image $R$ as reference and its noisy approximation $K$, the MSE is defined as
$$
MSE = \frac{1}{mn} \sum_{i=0}^{m-1} \sum_{j=0}^{n-1} [I(i,j) - K(i, j)]^2 \notag
$$
Then, the PSNR (in dB) is defined as
$$
\begin{align*}
PSNR &= 10 \cdot log_{10} \left( \frac{MAX_I^2}{MSE} \right) \\
           &= 20 \cdot log_{10}(MAX_I) - 10 \cdot log_{10}(MSE)
\end{align*}
$$
**where $MAX_I$ is the maximum possible pixel value of the image**. For instance, if we have a grayscale image with 8 bit-depth, the value of $MAX_I$ is 255. More generally, when pixels are represented using $N$ bit, the value should be $2^N - 1$. 

In MATLAB implementation, we can use function [`psnr`](https://cn.mathworks.com/help/images/ref/psnr.html?s_tid=doc_ta) as following commands: 

```matlab
peaksnr = psnr(I_1_prime, I_0);       % I_0 is original image while I_1_prime is recovered one
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
```



# Image Quantization

To quantize images, the simplest idea is to **divide original range into the number of requested levels**. In the lab case, the original image has data type `uint8` which corresponds to a grayscale mapping with 256 levels. The number of required quantized levels is 16. Each new level contains 16 levels of older one. It's just the a coincident that these two numbers are equal. Consequently, the method that **only divide original matrix by the number of levels** is totally wrong.

```matlab
A = imread('lenna512.bmp');
A_1 = uint8(floor(A ./ 16));            % actually WRONG, 
                                        % but here it works coincidently as 256/16=16
```

Instead, MATLAB has provided us interface to implement quantization of images. Following block using [`multithresh`](https://cn.mathworks.com/help/images/ref/multithresh.html?searchHighlight=multithresh&s_tid=doc_srchtitle) and [`imquantize`](https://cn.mathworks.com/help/images/ref/imquantize.html) is the procedure of image quantization.

```matlab
threshGray = multithresh(A,16);      % generate threshold of multi-levels
A_2 = imquantize(A, threshGray);     % returns quantized matrix ranging (0, 16)
figure(4)
imshow(A_2, gray(16));
title('MATLAB functions used');
imwrite(A, '.\Task-2-3\matlab_quant.bmp');
```

The returned threshold values are not linear as we intuitively think. `multithresh` uses [Otsu's Method](https://en.wikipedia.org/wiki/Otsu%27s_method) to generate such a vector. 

# Reference

1. [Difference between imshow() and image()](https://cn.mathworks.com/matlabcentral/answers/1288-what-is-the-difference-between-image-and-imshow)
2. [MathWorks - Image Processing Basic](https://cn.mathworks.com/help/images/image-import-and-export.html)
3. [Difference between SNR and PSNR](https://dsp.stackexchange.com/questions/11326/difference-between-snr-and-psnr)
4. [Nearest Interpolation](https://arxiv.org/ftp/arxiv/papers/1211/1211.1768.pdf)
5. [Interpolation Comparison](https://sisu.ut.ee/sites/default/files/imageprocessing/files/interpolation3.pdf)
6. [Crop image](https://cn.mathworks.com/help/images/ref/imcrop.html?searchHighlight=imcrop&s_tid=doc_srchtitle)


