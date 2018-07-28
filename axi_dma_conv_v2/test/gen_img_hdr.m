I = imread('E:\Source\\image_in_640_480.jpg');
file_out = fopen('E:\Source\\img_inp.h', 'wt');
fprintf(file_out, 'unsigned int img_inp[] = {');
for i=1:size(I,1)
    for j=1:size(I,2)
        temp = sprintf('00000000%s%s%s', dec2bin(I(i,j,1),8), dec2bin(I(i,j,2),8), dec2bin(I(i,j,3),8));
        fprintf(file_out, '%d,', bin2dec(temp));
    end
end
fprintf(file_out, '}');
fclose(file_out);
