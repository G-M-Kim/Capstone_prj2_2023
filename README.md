# Capstone_prj2_2023
This is a project for the final presentation of the Capstone Design 2 course.

# Edge Enhancement System for Brain Images Using Sobel Method
- Aimed at making disease areas and wrinkles in the brain more distinct.

# This project includes...
- Sobel operation using 4 line buffers
- Edge extraction through convolution (adjust the threshold for specific purposes)
- Pixel enhancement/weakening for the extracted edges (use as needed)

![2023-12-18 19 03 00](https://github.com/G-M-Kim/Capstone_prj2_2023/assets/127372167/b1fe948d-d417-4499-9dcd-d940def06cb4)

# How to use
- Edge enhancement of BMP images with 512*512 pixels and 8-bit values (0~255)
- Input file names as gray_img and color_img -> output result as enhanced_img
- In Vivado, input and output 8-bit BMP files.
- When using FPGA in Vitis, file conversion in .h format is required.

### This project is a personal adaptation of the following project. ###
https://github.com/vipinkmenon/SpatialFilter

## References
# Learning Materials
- Reconfigurable Embedded Systems with Xilinx Zynq APSoC by **Vipin Kizheppatt**
- (https://www.youtube.com/playlist?list=PLXHMvqUANAFOviU0J8HSp0E91lLJInzX1)

# Images
- Computed tomography of the head (Wikipedia) for CT image
- Magnetic resonance angiography (WIkipedia) for MRA image

### Last update on December 18, 2023 - project closed.###
