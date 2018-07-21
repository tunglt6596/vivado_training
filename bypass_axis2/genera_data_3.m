I = imread('D:\\test\\image_in.jpg');
file_out = fopen('D:\\test\\image_in.txt', 'wt');
for i=1:size(I,1)
    for j=1:size(I,2)
        fprintf(file_out, '00000000%s%s%s\n', dec2bin(I(i,j,1),8), dec2bin(I(i,j,2),8), dec2bin(I(i,j,3),8));
    end
end
fclose(file_out);