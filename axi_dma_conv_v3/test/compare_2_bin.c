#include <stdio.h>
#define PIXEL_PF  638*478
#define NUM_PIXEL 638*478*7

int main()
{
    FILE *f1, *f2;
    if( (f1 = fopen("D:\\test2\\image_out.bin", "rb")) == NULL ) {
        printf("Error open image_out.bin\n");
        return -1;
    };
    if ( (f2 = fopen("D:\\test2\\image_out_ml.bin", "rb")) == NULL ) {
        printf("Error open image_out_ml.bin\n");
        return -1;
    };

    printf("Open 2 files successfully!!!\n");

    unsigned int a, b;
    unsigned int count = 0;

    for(int i = 0; i < NUM_PIXEL; i++) {
        fread(&a, sizeof(unsigned int), 1, f1);
        fread(&b, sizeof(unsigned int), 1, f2);
        if(a == b) continue;
        else {
            printf("Error occured at index %d, %x and %x!!!\n", i+1, a, b);
            count++;
            if(count == 100)
                break;
        }
    }

    printf("Done!!!");
    fclose(f1);
    fclose(f2);
    return 0;
}
