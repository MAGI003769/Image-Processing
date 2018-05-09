# Image Compression



## Image file sizes



## Image File Format

You can read the contents of this [link](https://en.wikipedia.org/wiki/Image_file_formats) that summarizes major image file formats. Here I just briefly discuss three types: `bmp`, `jpg` and `png`. These three are commonly used in this lab and our daily life. Above all, files in computers are stored as binary files. The visual information of images are also stored as those data. There should be some symbols at the beginning of files in order to tell machines how to interpret them. 

## JPEG

This abbreviation comes from Joint Photographic Experts Group which is well-known **lossy** image compression scheme. It has following steps in order

> 1. Transfer to suitable color space
> 2. Application of $8\times8$ blocks DCT (**No truly lossless**)
> 3. Quantization (**Lossy**)
> 4. zig-zag reading
> 5. Entropy coding (**Lossless**)

**Block-wise DCT**

Ignoring the procedure of color spacing selection,  JPEG firstly divide original image into multiple $N\times N$ blocks to apply DCT.  Then, the transformed can be shown as figure below. 

![jpeg_dct](http://post-pic.nos-eastchina1.126.net/Image-Processing/jpeg_dct.PNG)

It is quite interesting that, if we pick the DC components (coefficients) of transformed image, those values will roughly reconstruct a similar pattern as original image. This phenomenon implies the correlation of those values. 

![jpeg_dc](http://post-pic.nos-eastchina1.126.net/Image-Processing/jpeg_reorder.PNG)

**Quantization**

This is exactly the lossy stage of JPEG. It employ some more manipulations to process the DCT coefficient matrix. For this stage, we introduce several quantities: **_Quality factor_**, **_Rescale factor_**, **_Step size_** and **_Quantization matrix_**. Their conceptions and functions will be introduced in subsequent paragraphs.

$$
Q = 
\begin{bmatrix}
16 & 11 & 10 & 16 & 24 & 40 & 51 & 61 \\
12 & 12 & 14 & 19 & 26 & 58 & 60 & 55 \\
14 & 13 & 16 & 24 & 40 & 56 & 69 & 56 \\
14 & 17 & 22 & 29 & 51 & 87 & 80 & 62 \\
18 & 22 & 37 & 56 & 68 & 109 & 103 & 77 \\
24 & 35 & 55 & 64 & 81 & 104 & 113 & 92 \\
49 & 64 & 78 & 87 & 103 & 121 & 120 & 101 \\
72 & 92 & 95 & 98 & 112 & 100 & 103 & 99 \\
\end{bmatrix}
$$
The matrix above is a typical **quantization matrix** used in JPEG. The elements inside are **step sizes** which are relatively small for low frequency components (upper left part) while relative large for how frequency ones (lower right part). The procedure of quantization can be expressed as formula
$$
b_{out} = round\left(\frac{b_{in}}{Sq_{ij}}\right)
$$
$b_{in}$ and $b_{out}$ are respectively pixel value of original matrix and quantized one. If we have a larger value of step size value $q_{ij}$, the quantization results tend to more easily become 0 or relatively small value.   Such an operation is equivalent to removal of high frequency part. According to previous DCT transformation of image, the main information concentrates in low frequency part which is the upper left portion. That is why such a lossy compression will not grievously jeopardize the desire information to recover the image. 



**Zig-zag Reordering**

As figure below illustrates, we will use a zig-zag reordering to convert two dimensional matrix into a vector for sequential entropy coding. 

![zigzag](https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/JPEG_ZigZag.svg/220px-JPEG_ZigZag.svg.png)

**Entropy Coding**

After zig-zag reordering, JPEG employs Huffman coding for a lossless entropy coding. 



## Arithmetic Coding





## Lab Session

### Compression using Arithmetic Coding

This lab means to introduce a methods of image compression.  It uses a scheme that  is similar to JPEG compression () as example.  Such a compression has procedures in following list:

- Apply 2D-DCT to $N\times N$ non-overlapped blocks of the image
- Convert float point numbers in DCT coefficient matrix to integers and quantize $N\times N$ blocks.

$$
round\left(\frac{b_{ij}}{Sq_{ij}}\right)
$$



### Compare with JPEG Compression

Instead of reimplementation of JEPG compression, [`imwrite`](https://ww2.mathworks.cn/help/matlab/ref/imwrite.html?searchHighlight=imwrite&s_tid=doc_srchtitle) provides image compression with proper parameter. Following code segment is a sample to complete JPEG within one line. 

```mathematica
I = imread('lena512.bmp');
imwrite(I, 'compressed.jpeg', 'Quality', 50);
```

If we want to store a JPEG file without compression, we can set the quality factor as 100. This value won't be taken to do compression. The function is actually the same as case that parameters `'Mode', 'lossless'` are fed. 



# Reference

- [Image compression with DCT](https://ww2.mathworks.cn/help/images/discrete-cosine-transform.html)
- [Wikipedia- JPEG](https://en.wikipedia.org/wiki/JPEG)
- [Wikipedia - Arithmetic Coding](https://en.wikipedia.org/wiki/JPEG)
- [Wikipedia - Image file formats](https://stackoverflow.com/questions/12167813/how-is-data-stored-in-an-image-file)