file_in = fopen('D:\\test2\\image_in.bin', 'w');

imgs{1} = imread('D:\\test2\\H1.jpg');
imgs{2} = imread('D:\\test2\\H2.jpg');
imgs{3} = imread('D:\\test2\\H3.jpg');
imgs{4} = imread('D:\\test2\\H4.jpg');
imgs{5} = imread('D:\\test2\\H5.jpg');
imgs{6} = imread('D:\\test2\\H6.jpg');
imgs{7} = imread('D:\\test2\\H7.jpg');

for i=1:length(imgs)
    for m=1:size(imgs{i}, 1)
        for n=1:size(imgs{i}, 2)
            r = imgs{i}(m,n,1);
            g = imgs{i}(m,n,2);
            b = imgs{i}(m,n,3);
            temp = sprintf('00000000%s%s%s', dec2bin(r,8), dec2bin(g,8), dec2bin(b,8));
            fwrite(file_in, bin2dec(temp), 'uint32');
        end
    end
end

fclose(file_in);