I = imread('D:\\test2\\image_in_640_480.jpg');
I_R = I(:,:,1);
I_G = I(:,:,2);
I_B = I(:,:,3);
H = sfi(1/9*[1 1 1;1 1 1;1 1 1],24,15);
R_R = filter2(H,I_R,'valid');
R_G = filter2(H,I_G,'valid');
R_B = filter2(H,I_B,'valid');

%file_out = fopen('D:\\test2\\image_out_ml.txt', 'wt');
file_out = fopen('D:\\test2\\image_out_ml.bin', 'w');

for i=1:size(R_R,1)
    for j=1:size(R_R,2)
        r = sfi(R_R(i,j),24,15);
        r_b = r.bin(2:9);
        g = sfi(R_G(i,j),24,15);
        g_b = g.bin(2:9);
        b = sfi(R_B(i,j),24,15);
        b_b = b.bin(2:9);
        temp = sprintf('00000000%s%s%s', r_b, g_b, b_b);
        fwrite(file_out, bin2dec(temp), 'uint32');
        %fprintf(file_out, '00000000%s%s%s\n', r_b, g_b, b_b);
    end
end

fclose(file_out);