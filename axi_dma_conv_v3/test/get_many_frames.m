file_out = fopen('D:\\test2\\image_out_ml.bin', 'w');

imgs{1} = imread('D:\\test2\\H1.jpg');
imgs{2} = imread('D:\\test2\\H2.jpg');
imgs{3} = imread('D:\\test2\\H3.jpg');
imgs{4} = imread('D:\\test2\\H4.jpg');
imgs{5} = imread('D:\\test2\\H5.jpg');
imgs{6} = imread('D:\\test2\\H6.jpg');
imgs{7} = imread('D:\\test2\\H7.jpg');

for i=1:length(imgs)
    i_r = imgs{i}(:,:,1);
    i_g = imgs{i}(:,:,2);
    i_b = imgs{i}(:,:,3);
    h = sfi(1/9*[1 1 1;1 1 1;1 1 1],24,15);
    r_r = filter2(h,i_r,'valid');
    r_g = filter2(h,i_g,'valid');
    r_b = filter2(h,i_b,'valid');
    
    for p=1:size(r_r,1)
        for q=1:size(r_r,2)
            r = sfi(r_r(p,q),24,15);
            rb = r.bin(2:9);
            g = sfi(r_g(p,q),24,15);
            gb = g.bin(2:9);
            b = sfi(r_b(p,q),24,15);
            bb = b.bin(2:9);
            temp = sprintf('00000000%s%s%s', rb, gb, bb);
            fwrite(file_out, bin2dec(temp), 'uint32');
        end
    end

end

fclose(file_out);