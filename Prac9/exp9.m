%huffman encoding of images
pkg load communications
clear;

% Read image data
image_data =imread("D:\\sem6\\DIP\\dip_Images\\high_contrast_bw.jpg");
image_data = uint8(image_data); % Convert to uint8 for byte-wise processing
% Calculate byte frequencies
pixel_values_unique = unique(image_data(:));
freq = histc(image_data(:), pixel_values_unique);

probabilities = freq/sum(freq);
probabilities = probabilities';

pxl_vals = 1:256;
dict = huffmandict(pxl_vals,probabilities);
image_data_flat = image_data(:)';
compressed = huffmanenco(image_data_flat+1,dict);

image_data_bits = length(image_data_flat)*8;
compressed_bits = length(compressed);

compression_ratio = image_data_bits/compressed_bits;

disp(["Compression ratio using Huffman encoding is ", num2str(compression_ratio)]);
